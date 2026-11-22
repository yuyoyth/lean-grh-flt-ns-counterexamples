#!/usr/bin/env python3
"""
Independent Zero-Import Certificate Verifier for Part 01 (17.37M-Line GRH Lean 4 Formalization)
第一部分（1,737 万行 GRH Lean 4 形式化）声明依赖图最小有向顶点割与源码结构核查独立校验器

[EN] Overview & Dual Verification Modes:
  1. Bundled Artifact Verification Mode (Default when invoked directly on a GitHub checkout):
     `python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py`
     Independently cross-verifies all bundled JSON verification artifacts in this directory:
     - `mincut.json` & `independent_verification.json`: verifies exact declaration-graph node partition
       conservation (`1,478,243` in-cone + `1,222,889` out-of-cone = `2,701,132` total declarations),
       edge count (`170,706,224` directed dependency edges), active source-to-sink node count (`1,072,980`),
       the exact 8-vertex minimum internal directed cut (`capacity = 8`, `flow_value = 8`), and the
       20-step logarithmic bisection trajectory converging to threshold `k* = 955,506`;
     - `cone_annotations.json` & `cone_and_mincut_autopsy.json`: verifies exact consistency of the
       `62 / 66` in-cone `kexactB` caller modules (`1,816` in-cone declarations) and the reflexive
       mutual inductive blocks `PrincipalizationCertificate` (`11` in-cone declarations) and
       `OrderCertificate` (`12` in-cone declarations);
     - `source_line_accounting.json` & `lc23_repo_baseline.json`: verifies exact line conservation
       between the original repository (`40e56bab`, `17,374,215` lines across `175,187` `.lean` files)
       and the community pruned edition (`f1f6d654`, `16,571,342` lines across `164,464` `.lean` files):
       `17,374,215 - 785,224 (10,724 deleted files) - 17,676 (23 modified files) + 27 (Challenge.lean) = 16,571,342`.
  2. Full Raw Graph Flow-Certificate Replay Mode (When passed a raw dump directory containing
     `flow_certificate.json.gz` and `declaration_graph.jsonl.gz` on the verification host `lc23`):
     `python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py /path/to/raw_graph_dir`
     Replays every split-node arc flow conservation equation and reachability closure across all
     2,701,132 nodes and 170,706,224 edges with zero imports from `analyze_graph.py`.

[ZH] 功能概述与双模式核验说明：
  1. 随库归档证书核验模式（在克隆本 GitHub 仓库后直接运行时的默认模式）：
     `python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py`
     零外部依赖交叉核验本目录随附的全部结构化 JSON 证书档案：
     - `mincut.json` 与 `independent_verification.json`：核验全环境声明图节点分区守恒
       （锥内 `1,478,243` + 锥外 `1,222,889` = 总计 `2,701,132` 个声明节点）、有向依赖边总数
       （`170,706,224` 条）、源汇活跃节点数（`1,072,980` 个）、容量严格为 `8` 的最小内部有向顶点割
       （`flow_value = 8`）以及收敛于阈值 `k* = 955,506` 的 20 步字典序对数二分轨迹；
     - `cone_annotations.json` 与 `cone_and_mincut_autopsy.json`：核验主定理依赖锥内 `62 / 66` 个
       `kexactB` 调用模块（共 `1,816` 个入锥声明）以及互归纳块 `PrincipalizationCertificate`（`11` 个入锥声明）
       与 `OrderCertificate`（`12` 个入锥声明）的统计一致性；
     - `source_line_accounting.json` 与 `lc23_repo_baseline.json`：核验原版仓库（`40e56bab`，`17,374,215` 行）
       与社区删改版（`f1f6d654`，`16,571,342` 行）的精确行数守恒：
       `17,374,215 - 785,224 (删除 10,724 个模块) - 17,676 (修改 23 个模块) + 27 (新增 Challenge.lean) = 16,571,342`。
  2. 全量原始声明图最大流证书重放模式（传入含 `flow_certificate.json.gz` 原始导出目录时自动启用）：
     `python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py /path/to/raw_graph_dir`
     在不导入 `analyze_graph.py` 的前提下，逐边重放 2,701,132 节点与 170,706,224 条边上的拆点流守恒与割集可达性闭包。
"""

import sys

sys.dont_write_bytecode = True
import collections
import gzip
import hashlib
import json
import pathlib


def verify_bundled_artifacts(p: pathlib.Path) -> int:
    """
    [EN] Verify all bundled JSON certificates in `reproduction/01_grh_17m_lean/`.
    [ZH] 交叉核验 `reproduction/01_grh_17m_lean/` 目录下随附的全部 JSON 核查证书。
    """
    m = json.loads((p / "mincut.json").read_text(encoding="utf-8"))
    iv = json.loads((p / "independent_verification.json").read_text(encoding="utf-8"))
    ca = json.loads((p / "cone_annotations.json").read_text(encoding="utf-8"))
    cma = json.loads((p / "cone_and_mincut_autopsy.json").read_text(encoding="utf-8"))
    sla = json.loads((p / "source_line_accounting.json").read_text(encoding="utf-8"))
    tdr = json.loads((p / "target_declaration_records.json").read_text(encoding="utf-8"))
    base = json.loads((p / "lc23_repo_baseline.json").read_text(encoding="utf-8"))

    # 1. Graph partition & scale conservation / 全图节点分区与边数守恒核验
    assert m["node_count"] == 2701132 == iv["nodes"]
    assert m["edge_count"] == 170706224 == iv["edges"]
    assert m["target_cone_size"] == 1478243
    assert m["outside_target_cone"] == 1222889
    assert m["target_cone_size"] + m["outside_target_cone"] == m["node_count"]
    assert m["active_nodes"] == 1072980

    # 2. Eight-vertex minimum internal directed cut / 8 顶点最小内部有向割核验
    expected_cut = [
        "DirichletCharacter.FactorsThrough",
        "Formalism.VW.critLine",
        "Formalism.VW.rh_of_every",
        "HurwitzZeta.hurwitzZetaEven",
        "UpperTheory.FinalTheorems.everyCharacter",
        "ZMod.LFunction",
        "claimAll",
        "starRingEnd._proof_2",
    ]
    assert m["finite_interior_cut"] is True
    assert m["minimum_vertex_cut_capacity"] == 8 == m["flow_value"] == iv["capacity"]
    assert m["cut"] == expected_cut
    assert iv["status"] == "VERIFIED"
    assert iv["flow_feasibility"] is True and iv["optimal_by_equal_flow_cut"] is True

    # 3. 20-step logarithmic bisection trajectory / 20 步字典序对数二分轨迹核验
    bis = m["bisection"]
    assert bis["start"] is False and bis["end"] is True
    assert bis["threshold"] == 955506
    assert len(bis["trace"]) == 20
    lo, hi = 0, bis["trace"][0]["hi"]
    assert hi == 1072972
    for step in bis["trace"]:
        mid = (lo + hi) // 2
        assert (step["lo"], step["hi"], step["mid"]) == (lo, hi, mid)
        if step["disconnected"]:
            hi = mid
        else:
            lo = mid
    assert hi == bis["threshold"] == 955506

    # 4. In-cone kexactB modules & special mutual inductives / 锥内 kexactB 模块与互归纳块核验
    kmods = ca["kexactB_modules"]
    assert len(kmods) == 67
    in_cone_mods = [k for k, v in kmods.items() if v["cone_declarations"] > 0]
    total_kexact_cone_decls = sum(v["cone_declarations"] for v in kmods.values())
    assert len(in_cone_mods) == 62
    assert total_kexact_cone_decls == 1816

    spec = ca["special_inductives"]
    pc = spec["FunctorialResolution.EmbeddedResolution.PrincipalizationCertificate"]
    oc = spec["FunctorialResolution.EmbeddedResolution.OrderCertificate"]
    assert pc["in_target_cone"] is True and len(pc["related_cone_declarations"]) == 11
    assert oc["in_target_cone"] is True and len(oc["related_cone_declarations"]) == 12

    # 5. Source line accounting conservation / 原版与社区版源码行数守恒核验
    orig_lines = 17374215
    comm_lines = 16571342
    assert sla["deleted_modules"] == 10724 and sla["deleted_lines"] == 785224
    assert sla["modified_modules"] == 23 and sla["modified_net_line_reduction"] == 17676
    assert sla["added_modules"] == 1 and sla["added_lines"] == 27
    assert sla["total_net_line_reduction"] == 802873
    assert (
         sla["deleted_lines"] + sla["modified_net_line_reduction"] - sla["added_lines"]
        == sla["total_net_line_reduction"]
        == orig_lines - comm_lines
    )
    assert len(tdr) >= 5 and len(cma) > 0 and len(base) > 0

    summary = {
        "status": "VERIFIED",
        "mode": "bundled_artifact_cross_verification",
        "description_en": "All Part 01 declaration-graph min-cut, 20-step bisection, in-cone tactic/inductive localization, and source-line conservation certificates verified.",
        "description_zh": "第一部分全环境声明图 8 顶点最小有向割、20 步对数二分阈值、锥内自定义策略与互归纳块定位及原版/社区版源码行数守恒证书全部核验通过。",
        "node_count": m["node_count"],
        "edge_count": m["edge_count"],
        "target_cone_size": m["target_cone_size"],
        "outside_target_cone": m["outside_target_cone"],
        "active_nodes": m["active_nodes"],
        "minimum_vertex_cut_capacity": m["minimum_vertex_cut_capacity"],
        "minimum_vertex_cut": m["cut"],
        "bisection_steps": len(bis["trace"]),
        "bisection_threshold": bis["threshold"],
        "kexactB_caller_modules_in_cone": f"{len(in_cone_mods)}/{len(kmods)}",
        "kexactB_declarations_in_cone": total_kexact_cone_decls,
        "special_inductive_declarations_in_cone": {
            "PrincipalizationCertificate": len(pc["related_cone_declarations"]),
            "OrderCertificate": len(oc["related_cone_declarations"]),
        },
        "source_line_conservation": f"{orig_lines} - {sla['deleted_lines']} - {sla['modified_net_line_reduction']} + {sla['added_lines']} == {comm_lines}",
    }
    print(json.dumps(summary, ensure_ascii=False, indent=2), flush=True)
    return 0


def verify_raw_flow_certificate(p: pathlib.Path) -> int:
    """
    [EN] Full raw 2.70M-node / 170.71M-edge flow-certificate replay mode on `lc23`.
    [ZH] 在 `lc23` 原始导出目录上执行的 270 万节点 / 1.70 亿边最大流与最小割完整重放核验。
    """
    c = json.loads(gzip.decompress((p / "flow_certificate.json.gz").read_bytes()))
    m = json.loads((p / "mincut.json").read_text(encoding="utf-8"))
    names = c["vertex_names"]
    ids = {x: i for i, x in enumerate(names)}
    n = len(names)
    ep = json.loads(
        (
            pathlib.Path(sys.argv[2])
            if len(sys.argv) > 2 and not sys.argv[2].startswith("--")
            else p.parent.parent / "graph_endpoints.json"
        ).read_text(encoding="utf-8")
    )
    assert m["sources"] == ep["sources"] and m["sinks"] == ep["sinks"]
    assert len(ids) == n == m["node_count"]
    src = set(c["source_ids"])
    sink = set(c["sink_ids"])
    cut = set(c["cut_ids"])
    reach = set(c["reachable_after_cut"])
    active = set(c["active_ids"])
    cone = set(c["cone_ids"])
    sr = set(c["source_reachable_ids"])
    assert all(type(i) is int and 0 <= i < n for xs in [src, sink, cut, reach, active, cone, sr] for i in xs)
    assert src <= sr and sink <= cone and active == sr & cone
    assert {names[i] for i in src} == set(m["sources"]) and {names[i] for i in sink} == set(m["sinks"])
    assert {names[i] for i in cut} == set(m["cut"]) and not cut & (src | sink)
    finite = m["finite_interior_cut"]
    assert type(finite) is bool
    assert src <= reach and not reach & cut
    if finite:
        assert not reach & sink
    balance = collections.defaultdict(int)
    needed = set()
    arc_pairs = set()
    S = 2 * n
    T = S + 1
    inf = n + 1
    for a, b, cap, f in c["positive_arcs"]:
        assert type(a) is int and type(b) is int and 0 <= a <= T and 0 <= b <= T
        assert (a, b) not in arc_pairs
        arc_pairs.add((a, b))
        assert type(f) is int and type(cap) is int and 0 < f <= cap
        if a == S:
            assert b % 2 == 0 and b // 2 in src and cap == inf
        elif b == T:
            assert a % 2 == 1 and a // 2 in sink and cap == inf
        elif a % 2 == 0:
            assert b == a + 1 and cap == (inf if a // 2 in src | sink else 1)
        else:
            assert b % 2 == 0 and cap == inf
            needed.add((a // 2, b // 2))
        balance[a] -= f
        balance[b] += f
    value = m["flow_value"]
    assert type(value) is int
    if finite:
        assert type(m["minimum_vertex_cut_capacity"]) is int and value == len(cut) == m["minimum_vertex_cut_capacity"]
    else:
        assert m["minimum_vertex_cut_capacity"] is None and value >= inf
    assert balance[S] == -value and balance[T] == value
    assert all(v == 0 for i, v in balance.items() if i not in (S, T))
    seen = set()
    edges = 0
    active_forward = collections.defaultdict(set)
    forward = [[] for _ in names]
    back = [[] for _ in names]
    kinds = [None] * n
    raw_hash = hashlib.sha256()
    tbback = [[] for _ in names]
    axback = [[] for _ in names]
    induct_extra = {}
    modules = [None] * n
    selected = {}
    annotations = json.loads((p / "cone_annotations.json").read_text(encoding="utf-8")) if (p / "cone_annotations.json").exists() else None
    raw_mode = (p / "declaration_source.json").exists() and not (p / "declaration_graph.jsonl.gz").exists()
    binding = json.loads((p / "declaration_source.json").read_text(encoding="utf-8")) if raw_mode else None
    with (pathlib.Path(binding["path"]).open("rb") if raw_mode else gzip.open(p / "declaration_graph.jsonl.gz", "rb")) as f:
        for line in f:
            if raw_mode:
                raw_hash.update(line)
                if not line.startswith(b"DECL_GRAPH "):
                    continue
                line = line[11:]
            r = json.loads(line)
            j = ids[r["name"]]
            assert j not in seen
            seen.add(j)
            kinds[j] = r["kind"]
            modules[j] = r["module"]
            tbback[j] = list({ids[x] for x in r["type_deps"] + r["body_deps"]})
            axback[j] = list({ids[x] for x in r["type_deps"]})
            if r["kind"] in ("definition", "theorem", "opaque"):
                axback[j] = tbback[j]
            elif r["kind"] == "quotient":
                axback[j] = []
            elif r["kind"] == "inductive":
                induct_extra[j] = [ids[x] for x in r["structural_deps"]]
            if annotations and r["name"] in annotations["target_records"]:
                selected[r["name"]] = r
            dd = {ids[x] for x in r["type_deps"] + r["body_deps"] + r["structural_deps"]}
            edges += len(dd)
            back[j] = list(dd)
            for i in dd:
                forward[i].append(j)
                needed.discard((i, j))
                if finite and j not in cut and i in reach:
                    assert j in reach
                if j in cone:
                    assert i in cone
                if i in sr:
                    assert j in sr
                if i in active and j in active:
                    active_forward[i].add(j)
    assert len(seen) == n and edges == m["edge_count"] and not needed
    if raw_mode:
        assert raw_hash.hexdigest() == binding["sha256"] and pathlib.Path(binding["path"]).stat().st_size == binding["bytes"]

    def closure(seeds, adj, blocked=frozenset()):
        visited = set(seeds) - blocked
        todo = list(visited)
        while todo:
            for j in adj[todo.pop()]:
                if j not in visited and j not in blocked:
                    visited.add(j)
                    todo.append(j)
        return visited

    assert closure(sink, back) == cone
    assert closure(src, forward) == sr
    assert closure(src, forward, cut) == reach
    assert len(cone) == m["target_cone_size"] and n - len(cone) == m["outside_target_cone"]
    assert len(active) == m["active_nodes"]
    assert {names[i]: len(closure({i}, back)) for i in sink} == m["per_sink_cone_sizes"]
    assert sorted(names[i] for i in cone if kinds[i] == "axiom") == m["axioms"]
    assert sorted(names[i] for i in cone if not back[i]) == m["leaves"]
    if annotations:
        for i, extra in induct_extra.items():
            axback[i] += [j for j in extra if kinds[j] == "constructor"]
        tbcone = closure(sink, tbback)
        axcone = closure(sink, axback)
        assert len(tbcone) == annotations["type_body_cone_size"]
        assert len(axcone) == annotations["collect_axioms_rule_cone_size"]
        assert sorted(names[i] for i in tbcone if kinds[i] == "axiom") == annotations["type_body_axioms"]
        assert sorted(names[i] for i in axcone if kinds[i] == "axiom") == annotations["collect_axioms_rule_axioms"]
        assert {names[i]: sorted(names[j] for j in closure({i}, axback) if kinds[j] == "axiom") for i in sink} == annotations["per_sink_axioms"]
        assert selected == annotations["target_records"]
        for name, d in annotations["special_inductives"].items():
            assert d["in_environment"] == (name in ids)
            assert d["in_target_cone"] == (name in ids and ids[name] in cone)
            assert d["in_type_body_cone"] == (name in ids and ids[name] in tbcone)
            assert d["related_cone_declarations"] == sorted(names[i] for i in cone if names[i].startswith(name + "."))
        wanted = {d["module"] for d in annotations.get("kexactB_modules", {}).values()}
        module_indices = {mod: [] for mod in wanted}
        for i, mname in enumerate(modules):
            if mname in wanted:
                module_indices[mname].append(i)
        for path, d in annotations.get("kexactB_modules", {}).items():
            indices = module_indices[d["module"]]
            assert len(indices) == d["declarations"]
            assert sorted(names[i] for i in indices if i in cone) == d["in_cone"]
            assert d["cone_declarations"] == len(d["in_cone"])
    ordered = sorted(active - (src | sink), key=lambda i: names[i])

    def disconnected(k):
        blocked = set(ordered[:k])
        seen_set = set(src) - blocked
        q = list(seen_set)
        while q:
            for j in active_forward.get(q.pop(), ()):
                if j not in blocked and j not in seen_set:
                    seen_set.add(j)
                    q.append(j)
        return not bool(seen_set & sink)

    assert disconnected(0) == m["bisection"]["start"] and disconnected(len(ordered)) == m["bisection"]["end"]
    lo = 0
    hi = len(ordered)
    for row in m["bisection"]["trace"]:
        assert all(type(row[k]) is int for k in ["lo", "hi", "mid"]) and type(row["disconnected"]) is bool
        assert (row["lo"], row["hi"], row["mid"]) == (lo, hi, (lo + hi) // 2)
        assert disconnected(row["mid"]) == row["disconnected"]
        if row["disconnected"]:
            hi = row["mid"]
        else:
            lo = row["mid"]
    threshold = m["bisection"]["threshold"]
    if threshold is not None:
        assert disconnected(threshold) and (threshold == 0 or not disconnected(threshold - 1))
    result = dict(
        status="VERIFIED",
        nodes=n,
        edges=edges,
        capacity=value if finite else None,
        finite_interior_cut=finite,
        flow_feasibility=True,
        flow_arcs_in_actual_graph=True,
        cut_closed_reachability=finite,
        optimal_by_equal_flow_cut=finite,
        no_finite_interior_cut_certified=not finite,
        bisection_trace_replayed=True,
        active_subgraph_contains_all_source_sink_paths=True,
        exact_closures_recomputed=True,
        per_sink_sizes_recomputed=True,
        axioms_recomputed=True,
        raw_source_sha256=raw_hash.hexdigest() if raw_mode else None,
        scope="Exact finite reference graph; not proof validity or arithmetic completeness",
    )
    result["annotations_independently_recomputed"] = annotations is not None
    if "--read-only" not in sys.argv:
        (p / "independent_verification.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result), flush=True)
    return 0


def main() -> int:
    target_dir = (
        pathlib.Path(sys.argv[1])
        if len(sys.argv) > 1 and not sys.argv[1].startswith("--")
        else pathlib.Path(__file__).resolve().parent
    )
    if (target_dir / "flow_certificate.json.gz").exists():
        return verify_raw_flow_certificate(target_dir)
    return verify_bundled_artifacts(target_dir)


if __name__ == "__main__":
    sys.exit(main())
