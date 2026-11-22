import sys
sys.dont_write_bytecode=True
import pathlib,json,gzip,collections,hashlib
# Independent verifier: no imports from the search implementation.
p=pathlib.Path(sys.argv[1]);c=json.loads(gzip.decompress((p/'flow_certificate.json.gz').read_bytes()))
m=json.loads((p/'mincut.json').read_text());names=c['vertex_names'];ids={x:i for i,x in enumerate(names)};n=len(names)
ep=json.loads((pathlib.Path(sys.argv[2]) if len(sys.argv)>2 and not sys.argv[2].startswith('--') else p.parent.parent/'graph_endpoints.json').read_text())
assert m['sources']==ep['sources'] and m['sinks']==ep['sinks']
assert len(ids)==n==m['node_count']
src=set(c['source_ids']);sink=set(c['sink_ids']);cut=set(c['cut_ids']);reach=set(c['reachable_after_cut']);active=set(c['active_ids'])
cone=set(c['cone_ids']);sr=set(c['source_reachable_ids'])
assert all(type(i) is int and 0<=i<n for xs in [src,sink,cut,reach,active,cone,sr] for i in xs)
assert src<=sr and sink<=cone and active==sr&cone
assert {names[i] for i in src}==set(m['sources']) and {names[i] for i in sink}==set(m['sinks'])
assert {names[i] for i in cut}==set(m['cut']) and not cut&(src|sink)
finite=m['finite_interior_cut'];assert type(finite) is bool
assert src<=reach and not reach&cut
if finite:assert not reach&sink
balance=collections.defaultdict(int);needed=set();arc_pairs=set();S=2*n;T=S+1;inf=n+1
for a,b,cap,f in c['positive_arcs']:
    assert type(a) is int and type(b) is int and 0<=a<=T and 0<=b<=T
    assert (a,b) not in arc_pairs;arc_pairs.add((a,b))
    assert type(f) is int and type(cap) is int and 0<f<=cap
    if a==S:assert b%2==0 and b//2 in src and cap==inf
    elif b==T:assert a%2==1 and a//2 in sink and cap==inf
    elif a%2==0:
        assert b==a+1 and cap==(inf if a//2 in src|sink else 1)
    else:
        assert b%2==0 and cap==inf
        needed.add((a//2,b//2))
    balance[a]-=f;balance[b]+=f
value=m['flow_value'];assert type(value) is int
if finite:assert type(m['minimum_vertex_cut_capacity']) is int and value==len(cut)==m['minimum_vertex_cut_capacity']
else:assert m['minimum_vertex_cut_capacity'] is None and value>=inf
assert balance[S]==-value and balance[T]==value
assert all(v==0 for i,v in balance.items() if i not in (S,T))
seen=set();edges=0;active_forward=collections.defaultdict(set);sink_back=collections.defaultdict(set)
forward=[[] for _ in names];back=[[] for _ in names];kinds=[None]*n;raw_hash=hashlib.sha256()
tbback=[[] for _ in names];axback=[[] for _ in names];induct_extra={};modules=[None]*n;selected={}
annotations=json.loads((p/'cone_annotations.json').read_text()) if (p/'cone_annotations.json').exists() else None
raw_mode=(p/'declaration_source.json').exists() and not (p/'declaration_graph.jsonl.gz').exists()
binding=json.loads((p/'declaration_source.json').read_text()) if raw_mode else None
with (pathlib.Path(binding['path']).open('rb') if raw_mode else gzip.open(p/'declaration_graph.jsonl.gz','rb')) as f:
    for line in f:
        if raw_mode:
            raw_hash.update(line)
            if not line.startswith(b'DECL_GRAPH '):continue
            line=line[11:]
        r=json.loads(line);j=ids[r['name']];assert j not in seen;seen.add(j)
        kinds[j]=r['kind']
        modules[j]=r['module']
        tbback[j]=list({ids[x] for x in r['type_deps']+r['body_deps']})
        axback[j]=list({ids[x] for x in r['type_deps']})
        if r['kind'] in ('definition','theorem','opaque'):axback[j]=tbback[j]
        elif r['kind']=='quotient':axback[j]=[]
        elif r['kind']=='inductive':induct_extra[j]=[ids[x] for x in r['structural_deps']]
        if annotations and r['name'] in annotations['target_records']:selected[r['name']]=r
        dd={ids[x] for x in r['type_deps']+r['body_deps']+r['structural_deps']};edges+=len(dd)
        back[j]=list(dd)
        for i in dd:
            forward[i].append(j)
            needed.discard((i,j))
            if finite and j not in cut and i in reach:assert j in reach
            if j in cone:assert i in cone
            if i in sr:assert j in sr
            if i in active and j in active:active_forward[i].add(j)
assert len(seen)==n and edges==m['edge_count'] and not needed
if raw_mode:assert raw_hash.hexdigest()==binding['sha256'] and pathlib.Path(binding['path']).stat().st_size==binding['bytes']
def closure(seeds,adj,blocked=frozenset()):
    visited=set(seeds)-blocked;todo=list(visited)
    while todo:
        for j in adj[todo.pop()]:
            if j not in visited and j not in blocked:visited.add(j);todo.append(j)
    return visited
assert closure(sink,back)==cone
assert closure(src,forward)==sr
assert closure(src,forward,cut)==reach
assert len(cone)==m['target_cone_size'] and n-len(cone)==m['outside_target_cone']
assert len(active)==m['active_nodes']
assert {names[i]:len(closure({i},back)) for i in sink}==m['per_sink_cone_sizes']
assert sorted(names[i] for i in cone if kinds[i]=='axiom')==m['axioms']
assert sorted(names[i] for i in cone if not back[i])==m['leaves']
if annotations:
    for i,extra in induct_extra.items():axback[i]+= [j for j in extra if kinds[j]=='constructor']
    tbcone=closure(sink,tbback);axcone=closure(sink,axback)
    assert len(tbcone)==annotations['type_body_cone_size']
    assert len(axcone)==annotations['collect_axioms_rule_cone_size']
    assert sorted(names[i] for i in tbcone if kinds[i]=='axiom')==annotations['type_body_axioms']
    assert sorted(names[i] for i in axcone if kinds[i]=='axiom')==annotations['collect_axioms_rule_axioms']
    assert {names[i]:sorted(names[j] for j in closure({i},axback) if kinds[j]=='axiom') for i in sink}==annotations['per_sink_axioms']
    assert selected==annotations['target_records']
    for name,d in annotations['special_inductives'].items():
        assert d['in_environment']==(name in ids)
        assert d['in_target_cone']==(name in ids and ids[name] in cone)
        assert d['in_type_body_cone']==(name in ids and ids[name] in tbcone)
        assert d['related_cone_declarations']==sorted(names[i] for i in cone if names[i].startswith(name+'.'))
    wanted={d['module'] for d in annotations.get('kexactB_modules',{}).values()}
    module_indices={m:[] for m in wanted}
    for i,mname in enumerate(modules):
        if mname in wanted:module_indices[mname].append(i)
    for path,d in annotations.get('kexactB_modules',{}).items():
        indices=module_indices[d['module']]
        assert len(indices)==d['declarations']
        assert sorted(names[i] for i in indices if i in cone)==d['in_cone']
        assert d['cone_declarations']==len(d['in_cone'])
ordered=sorted(active-(src|sink),key=lambda i:names[i])
def disconnected(k):
    blocked=set(ordered[:k]);seen=set(src)-blocked;q=list(seen)
    while q:
        for j in active_forward.get(q.pop(),()):
            if j not in blocked and j not in seen:seen.add(j);q.append(j)
    return not bool(seen&sink)
assert disconnected(0)==m['bisection']['start'] and disconnected(len(ordered))==m['bisection']['end']
lo=0;hi=len(ordered)
for row in m['bisection']['trace']:
    assert all(type(row[k]) is int for k in ['lo','hi','mid']) and type(row['disconnected']) is bool
    assert (row['lo'],row['hi'],row['mid'])==(lo,hi,(lo+hi)//2)
    assert disconnected(row['mid'])==row['disconnected']
    if row['disconnected']:hi=row['mid']
    else:lo=row['mid']
threshold=m['bisection']['threshold']
if threshold is not None:assert disconnected(threshold) and (threshold==0 or not disconnected(threshold-1))
result=dict(status='VERIFIED',nodes=n,edges=edges,capacity=value if finite else None,finite_interior_cut=finite,flow_feasibility=True,flow_arcs_in_actual_graph=True,cut_closed_reachability=finite,optimal_by_equal_flow_cut=finite,no_finite_interior_cut_certified=not finite,bisection_trace_replayed=True,active_subgraph_contains_all_source_sink_paths=True,exact_closures_recomputed=True,per_sink_sizes_recomputed=True,axioms_recomputed=True,raw_source_sha256=raw_hash.hexdigest() if raw_mode else None,scope='Exact finite reference graph; not proof validity or arithmetic completeness')
result['annotations_independently_recomputed']=annotations is not None
if '--read-only' not in sys.argv:
    (p/'independent_verification.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result),flush=True)
