import sys
sys.dont_write_bytecode=True
import pathlib,json,gzip,collections,array,time,hashlib,contextlib

def records(path, digest=None):
    with path.open('rb') as f:
        for line in f:
            if digest is not None: digest.update(line)
            if line.startswith(b'DECL_GRAPH '):yield json.loads(line[11:])

class Network:
    def __init__(self,n):
        self.head=array.array('i',[-1])*n;self.to=array.array('i');self.nxt=array.array('i');self.cap=array.array('q');self.original=array.array('q')
    def add(self,a,b,c):
        k=len(self.to)
        self.to.extend([b,a]);self.cap.extend([c,0]);self.original.extend([c,0]);self.nxt.extend([self.head[a],self.head[b]]);self.head[a]=k;self.head[b]=k+1
    def reach(self,s):
        seen={s};q=collections.deque([s])
        while q:
            a=q.popleft();e=self.head[a]
            while e!=-1:
                b=self.to[e]
                if self.cap[e]>0 and b not in seen:seen.add(b);q.append(b)
                e=self.nxt[e]
        return seen
    def maxflow(self,s,t,stop):
        # Edmonds-Karp: each augmentation supplies an independently checkable integral flow.
        # Expected cuts here are small; no theorem about cut size is assumed.
        total=0
        while total<stop:
            parent=array.array('i',[-1])*len(self.head);parent[s]=-2;q=collections.deque([s])
            while q and parent[t]==-1:
                a=q.popleft();e=self.head[a]
                while e!=-1:
                    b=self.to[e]
                    if self.cap[e]>0 and parent[b]==-1:parent[b]=e;q.append(b)
                    e=self.nxt[e]
            if parent[t]==-1:break
            d=stop-total;b=t
            while b!=s:e=parent[b];d=min(d,self.cap[e]);b=self.to[e^1]
            b=t
            while b!=s:e=parent[b];self.cap[e]-=d;self.cap[e^1]+=d;b=self.to[e^1]
            total+=d
        return total

def main():
    inp=pathlib.Path(sys.argv[1]);out=pathlib.Path(sys.argv[2]);out.mkdir(exist_ok=True)
    endpoints=json.loads(pathlib.Path(sys.argv[3]).read_text());names=[];ids={};kinds=[];modules=[]
    started=time.monotonic(); first_hash=hashlib.sha256()
    for r in records(inp, first_hash):
        assert r['name'] not in ids
        ids[r['name']]=len(names);names.append(r['name']);kinds.append(r['kind']);modules.append(r['module'])
    print(json.dumps(dict(phase='names',nodes=len(names),seconds=time.monotonic()-started)),flush=True)
    assert names,'No declaration records; a failed extraction is not an empty graph.'
    missing=[x for x in endpoints['sources']+endpoints['sinks'] if x not in ids]
    if missing:raise ValueError('Unknown endpoint names: '+repr(missing))
    src={ids[x] for x in endpoints['sources']};sink={ids[x] for x in endpoints['sinks']};n=len(names)
    deps=[[] for _ in names];forward=[[] for _ in names];unresolved=set()
    tbdeps=[[] for _ in names];axdeps=[[] for _ in names];selected={};second_hash=hashlib.sha256()
    selected_names=set(endpoints['sinks'])|{'RiemannHypothesis','RiemannZetaZerosOnLine','DirichletLNonvanishingRightOfHalf','DirichletLZerosOnLine','PrimitiveDirichletLZerosOnLine'}
    raw_mode='--raw-source' in sys.argv
    with (contextlib.nullcontext(None) if raw_mode else gzip.open(out/'declaration_graph.jsonl.gz','wt',compresslevel=1)) as dst:
        for r in records(inp, second_hash):
            consumer=ids[r['name']]
            dd=set(r['type_deps']+r['body_deps']+r['structural_deps'])
            for d in sorted(dd):
                if d not in ids:unresolved.add(d);continue
                dependency=ids[d];deps[consumer].append(dependency);forward[dependency].append(consumer)
            tbdeps[consumer]=[ids[d] for d in set(r['type_deps']+r['body_deps']) if d in ids]
            ad=set(r['type_deps'])
            if r['kind']=='inductive':ad.update(d for d in r['structural_deps'] if d in ids and kinds[ids[d]]=='constructor')
            elif r['kind'] in ('definition','theorem','opaque'):ad.update(r['body_deps'])
            elif r['kind']=='quotient':ad=set()
            axdeps[consumer]=[ids[d] for d in ad if d in ids]
            if r['name'] in selected_names:selected[r['name']]=r
            if dst is not None:dst.write(json.dumps(r,ensure_ascii=False,separators=(',',':'))+'\n')
    assert not unresolved,('Graph has unresolved references',sorted(unresolved)[:20])
    assert first_hash.hexdigest()==second_hash.hexdigest(),'Input changed across passes'
    assert set(selected)==selected_names.intersection(ids)
    binding=dict(path=str(inp.resolve()),bytes=inp.stat().st_size,sha256=second_hash.hexdigest(),format='DECL_GRAPH-prefixed JSON lines',two_pass_digest_equal=True)
    (out/'declaration_source.json').write_text(json.dumps(binding,indent=2)+'\n')
    print(json.dumps(dict(phase='edges',seconds=time.monotonic()-started)),flush=True)
    def closure(initial,adj,blocked=frozenset()):
        seen=set(initial)-blocked;q=list(seen)
        while q:
            for b in adj[q.pop()]:
                if b not in seen and b not in blocked:seen.add(b);q.append(b)
        return seen
    cone=closure(sink,deps);source_reachable=closure(src,forward);active=source_reachable&cone
    tbcone=closure(sink,tbdeps);axcone=closure(sink,axdeps)
    annotation=dict(target_records=selected,type_body_cone_size=len(tbcone),type_body_axioms=sorted(names[i] for i in tbcone if kinds[i]=='axiom'),
      collect_axioms_rule_cone_size=len(axcone),collect_axioms_rule_axioms=sorted(names[i] for i in axcone if kinds[i]=='axiom'),
      per_sink_axioms={names[i]:sorted(names[j] for j in closure({i},axdeps) if kinds[j]=='axiom') for i in sink},
      axiom_scope='Raw type/body closure and Lean CollectAxioms recursion are separately computed; inductive constructor types are included in the latter. No cached #print replay is claimed.')
    special=['FunctorialResolution.EmbeddedResolution.PrincipalizationCertificate','FunctorialResolution.EmbeddedResolution.OrderCertificate']
    annotation['special_inductives']={name:dict(in_environment=name in ids,in_target_cone=name in ids and ids[name] in cone,in_type_body_cone=name in ids and ids[name] in tbcone,related_cone_declarations=sorted(names[i] for i in cone if names[i].startswith(name+'.'))) for name in special}
    sf=inp.parent.parent/'resume/source/source_findings.json'
    if sf.exists():
        source=json.loads(sf.read_text());paths=sorted({r['path'] for key in ('literal_lines','macro_usage_lines') for r in source['kexactB'][key]});by_module={p.removeprefix('src/').removesuffix('.lean').replace('/','.'):p for p in paths}
        member={p:dict(module=m,declarations=0,in_cone=[]) for m,p in by_module.items()}
        for i,m in enumerate(modules):
            if m in by_module:
                d=member[by_module[m]];d['declarations']+=1
                if i in cone:d['in_cone'].append(names[i])
        for d in member.values():d['in_cone'].sort();d['cone_declarations']=len(d['in_cone'])
        annotation['kexactB_modules']=member
    (out/'cone_annotations.json').write_text(json.dumps(annotation,ensure_ascii=False,indent=2)+'\n')
    leaves=sorted(names[i] for i in cone if not deps[i]);axioms=sorted(names[i] for i in cone if kinds[i]=='axiom')
    protected=src|sink;inf=n+1;net=Network(2*n+2);s=2*n;t=s+1
    for i in active:
        net.add(2*i,2*i+1,inf if i in protected else 1)
        for j in forward[i]:
            if j in active:net.add(2*i+1,2*j,inf)
    for i in src&active:net.add(s,2*i,inf)
    for i in sink&active:net.add(2*i+1,t,inf)
    value=net.maxflow(s,t,inf);reach=net.reach(s)
    cut={i for i in active-protected if 2*i in reach and 2*i+1 not in reach}
    finite=value<inf
    if finite:
        assert len(cut)==value
        assert not (closure(src,forward,cut)&sink)
    balance=collections.defaultdict(int);flow_rows=[]
    for e in range(0,len(net.to),2):
        f=net.original[e]-net.cap[e];assert 0<=f<=net.original[e]
        if f:
            a=net.to[e^1];b=net.to[e];balance[a]-=f;balance[b]+=f;flow_rows.append([a,b,int(net.original[e]),int(f)])
    assert all(v==(-value if i==s else value if i==t else 0) for i,v in balance.items())
    ordered=sorted(active-protected,key=lambda i:names[i]);trace=[]
    # This predicate is monotone graph disconnection, not mathematical proof validity.
    def disconnected(k):return not bool(closure(src,forward,set(ordered[:k]))&sink)
    lo=0;hi=len(ordered)
    start=disconnected(lo);end=disconnected(hi)
    if not start and end:
        while hi-lo>1:
            mid=(lo+hi)//2;v=disconnected(mid);trace.append(dict(lo=lo,hi=hi,mid=mid,disconnected=v))
            if v:hi=mid
            else:lo=mid
    data=dict(scope='Exact extracted declaration-reference graph; graph cuts do not certify proof errors',
      node_count=n,edge_count=sum(map(len,deps)),target_cone_size=len(cone),outside_target_cone=n-len(cone),outside_fraction=(n-len(cone))/n,
      per_sink_cone_sizes={names[i]:len(closure({i},deps)) for i in sorted(sink)},
      sources=endpoints['sources'],sinks=endpoints['sinks'],axioms=axioms,leaves=leaves,active_nodes=len(active),
      finite_interior_cut=finite,minimum_vertex_cut_capacity=value if finite else None,cut=sorted(names[i] for i in cut),
      flow_value=value,flow_value_kind='exact maximum' if finite else 'lower bound proving no finite interior cut',flow_certificate_verified=True,cut_disconnection_verified=finite,
      bisection=dict(predicate='No source-to-sink path after deleting the first k nonterminal active names in lexical order',
        proves='A graph reachability threshold only; not a faulty proof line',start=start,end=end,trace=trace,threshold=0 if start else hi if end else None))
    (out/'mincut.json').write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')
    with gzip.open(out/'flow_certificate.json.gz','wt',compresslevel=1) as f:json.dump(dict(vertex_names=names,split_rule='in=2*i; out=2*i+1; super_source=2*n; super_sink=2*n+1',positive_arcs=flow_rows,source_ids=sorted(src),sink_ids=sorted(sink),cut_ids=sorted(cut),reachable_after_cut=sorted(closure(src,forward,cut)),active_ids=sorted(active),cone_ids=sorted(cone),source_reachable_ids=sorted(source_reachable)),f)
    print(json.dumps({k:v for k,v in data.items() if k not in ['leaves','bisection']},ensure_ascii=False))
if __name__=='__main__':main()
