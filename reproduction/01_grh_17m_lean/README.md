# Part 01 Reproduction Bundle: 17.37M-Line GRH Lean 4 Formalization Source-Code & Dependency-Graph Verification
# 第一部分可复现证据包：1,737 万行 GRH Lean 4 形式化证明源码结构与全环境声明依赖图实机核查档案

---

## I. Overview / 概述

**English**:
This directory contains the self-contained Lean 4 verification probes, full-environment declaration dependency graph analysis scripts, minimum directed vertex cut certificates, and structured JSON verification artifacts produced on the compute host `lc23` (`DESKTOP-YUYO2`, 64-bit Linux, pinned toolchain `Lean 4 v4.33.1`, `Mathlib` commit `0df444a360eaa60ab8c11dca51a86af692955474`) for both the original `17,374,215`-line Generalized Riemann Hypothesis (GRH) repository (commit `40e56bab026552e089d7afcfeff08d2defb9c005`, matching the 14-part archive `lean.tar.gz` byte-for-byte across all `175,190 / 175,190` files) and the community pruned edition (commit `f1f6d65420dbbf36d6cfdac1af8d79511a855a5b`, `16,571,342` lines across `164,464` `.lean` files).

- **English Monograph**: [`../../en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md`](../../en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md)
- **Chinese Monograph**: [`../../zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md`](../../zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md)

**中文**：
本目录收录在远程验证主机 `lc23`（主机名 `DESKTOP-YUYO2`，64 位 Linux，精确锁定目标仓库工具链 `Lean 4 v4.33.1` 与 `Mathlib` 提交 `0df444a360eaa60ab8c11dca51a86af692955474`）上，针对原版 `17,374,215` 行广义黎曼猜想（GRH）形式化代码库（提交 `40e56bab026552e089d7afcfeff08d2defb9c005`，与原始 14 卷分卷归档 `lean.tar.gz` 全部 `175,190 / 175,190` 个文件逐字节全同）与社区精简版（提交 `f1f6d65420dbbf36d6cfdac1af8d79511a855a5b`，`164,464` 个 `.lean` 文件共 `16,571,342` 行）执行的**六大结构化形式化核查探针源码**、**全环境 `2,701,132` 节点 / `170,706,224` 边最小有向顶点割求解与独立证书核验脚本**及**实机编译与源码结构对账 JSON 档案**。

- **英文版专著**：[`../../en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md`](../../en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md)
- **中文版专著**：[`../../zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md`](../../zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md)

---

## II. One-Minute Reproduction Guide / 一分钟实机复现指南

### 1. Zero-Dependency Python 3 Certificate Verification (`< 0.2s`) / 零依赖 Python 3 声明图最小割与源码对账证书核验（`< 0.2` 秒）

**English**:
Using only the Python 3 standard library, run `verify_graph_certificate.py` to cross-verify the `2,701,132`-node / `170,706,224`-edge declaration-graph partition (`1,478,243` in-cone + `1,222,889` out-of-cone), the exact `8`-vertex minimum internal directed cut (`capacity = 8`), the `20`-step lexicographical bisection trajectory (`threshold = 955,506`), the in-cone localization of the `62 / 67` `kexactB` modules (`1,816` in-cone declarations) and reflexive mutual inductive blocks (`11 + 12 = 23` declarations), and the exact source-line conservation (`17,374,215 - 785,224 - 17,676 + 27 = 16,571,342`):

**中文**：
仅需 Python 3 标准库，直接运行 `verify_graph_certificate.py` 即可交叉核验全环境 `2,701,132` 节点 / `170,706,224` 边声明图分区守恒（锥内 `1,478,243` + 锥外 `1,222,889`）、容量严格为 `8` 的最小内部有向顶点割、20 步字典序对数二分轨迹（阈值 `955,506`）、主定理依赖锥内 `62 / 67` 个 `kexactB` 模块（`1,816` 个入锥声明）与互归纳块（`11 + 12 = 23` 个入锥声明）定位，以及原版与社区版源码行数守恒（`17,374,215 - 785,224 - 17,676 + 27 = 16,571,342`）：
```bash
python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py
```

*(Note: When passed a directory containing `flow_certificate.json.gz` and `declaration_graph.jsonl.gz` exported by `AutopsyProbe_Scheme4.lean` and `analyze_graph.py`, `verify_graph_certificate.py` automatically switches to full 2.70M-node / 170.71M-edge raw arc-flow and reachability-closure replay mode.)*

*（注：若向 `verify_graph_certificate.py` 传入包含 `AutopsyProbe_Scheme4.lean` 与 `analyze_graph.py` 生成的 `flow_certificate.json.gz` 与 `declaration_graph.jsonl.gz` 的原始导出目录，脚本将自动切换至 270 万节点 / 1.70 亿边完整拆点流守恒与可达性闭包重放模式。）*

### 2. Lean 4 (`v4.33.1` + Mathlib `0df444a360ea`) Verification Probes / Lean 4 形式化核查探针实机编译

**English**:
In any environment with `Lean 4 v4.33.1` and `Mathlib` commit `0df444a360eaa60ab8c11dca51a86af692955474` (the exact toolchain pinned by the target GRH repository), compile the self-contained mathematical and countermodel probes:

**中文**：
在配置有目标仓库锁定的 `Lean 4 v4.33.1` 与 `Mathlib` 提交 `0df444a360eaa60ab8c11dca51a86af692955474` 的环境中，可直接编译自足数学与反模型核查探针：
```bash
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme1.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme2.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme5.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme6.lean
```

To inspect the target GRH repository's top-level theorem signatures, axiom cones, and full declaration graph (`2,701,132` nodes) inside a built checkout of the target GRH repository:

在已构建的目标 GRH 仓库根目录下，可进一步运行针对 `Main` 环境的签名、公理锥与全环境声明图提取探针：
```bash
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme3.lean
lake env lean --run reproduction/01_grh_17m_lean/AutopsyProbe_Scheme4.lean > decl_graph.jsonl
python3 -B reproduction/01_grh_17m_lean/analyze_graph.py decl_graph.jsonl out_dir endpoints.json
```

---

## III. Complete Bilingual File Inventory / 目录文件完整中英双语清单

### 1. Lean 4 Verification Probes / 六大方案与目标库 Lean 4 核查探针

- `AutopsyProbe_Scheme1.lean`:
 * **EN**: Scheme 1 carrier and boundary-guard verification probe (exit code `0`, `2.399s`). Proves `raw_zero` ( $\operatorname{Re}(s) \le 1 \implies \operatorname{LSeries}(1, s) = 0$ ), `raw_three_quarters` ( $\operatorname{LSeries}(1, 3/4) = 0$ ), `functions_differ` ( $(s \mapsto \operatorname{LSeries}(1, s)) \neq \operatorname{riemannZeta}$ via $0 \neq -1/2$ at $s=0$ ), `axis_principal_zero` (the modulo- $2$ principal character vanishes on the imaginary axis at $s _ 0 = \frac{2\pi i}{\log 2}$ ), and `removing_guard_is_false` (omitting the left boundary guard $0 < \operatorname{Re}(s)$ makes the universal critical-line statement provably false in Lean 4).
 * **ZH**：方案一载体与边界守卫实机核查探针（退出码 `0`，耗时 `2.399` 秒）。机器形式化证明 `raw_zero`、`raw_three_quarters`、`functions_differ`、模 $2$ 主特征虚轴零点 `axis_principal_zero`，以及省略左边界守卫 $0 < \operatorname{Re}(s)$ 后的全称临界线命题在 Lean 4 内直接为假 `removing_guard_is_false`。
- `AutopsyProbe_Scheme2.lean` & `DefinitionProbe.lean`:
 * **EN**: Scheme 2 carrier definition and continuation-bridge probe (exit code `0`, `1.595s`). Prints the underlying definitions of `DirichletCharacter.LFunction` and `ZMod.LFunction` (additive Hurwitz zeta linear combination) and verifies the convergence-guarded right-half-plane bridge `dirichlet_bridge` ( $\operatorname{Re}(s) > 1$ ).
 * **ZH**：方案二底层载体定义与延拓桥核查探针（退出码 `0`，耗时 `1.595` 秒）。输出 `DirichletCharacter.LFunction` 与 `ZMod.LFunction` 的纯加法 Hurwitz 线性组合定义，并核验带 $\operatorname{Re}(s) > 1$ 收敛域守卫的级数桥 `dirichlet_bridge`。
- `AutopsyProbe_Scheme3.lean`:
 * **EN**: Scheme 3 recursive axiom and signature inspection probe for the five top-level target theorems in `Main`.
 * **ZH**：方案三针对 `Main` 中五大顶层目标定理的形式化签名与递归公理集合核查探针。
- `AutopsyProbe_Scheme4.lean` & `GraphHarness.lean`:
 * **EN**: Scheme 4 full-environment declaration dependency graph extractor (`original_scheme4`, exit code `0`, `3,268.004s`). Traverses `env.checked` of `Main` to export all `2,701,132` declarations and `170,706,224` directed dependency edges (`type_deps`, `body_deps`, and `structural_deps`).
 * **ZH**：方案四全环境声明依赖图提取器（`original_scheme4`，退出码 `0`，耗时 `3,268.004` 秒）。遍历原版 `Main` 已检查环境 `env.checked`，完整导出 `2,701,132` 个声明节点与 `170,706,224` 条有向依赖边。
- `AutopsyProbe_Scheme5.lean`:
 * **EN**: Scheme 5 same-fiber Trojan countermodel probe (exit code `0`, `5.856s`). Certifies the symmetric Trojan polynomial $P(s) = (s-1/2)^2 - 1/16$ , Davenport–Heilbronn non-multiplicativity at $n=6$ (`dh_not_multiplicative`), even-channel reciprocal root at $s=3/4$ (`even_root`), and completed functional-equation reflection (`even_completed_reflection`), formally refuting `WeakRule` (`weak_rule_refuted : ¬WeakRule`) and deriving `WeakRule → (3/4 : ℝ) = 1/2` and `WeakRule → (0 : ℤ) = 1`.
 * **ZH**：方案五同商纤维特洛伊反模型验证探针（退出码 `0`，耗时 `5.856` 秒）。在 Lean 4 内证成代数对称特洛伊多项式、Davenport–Heilbronn 复合数 $n=6$ 乘性破缺、偶通道 $s=3/4$ 互反根与完备化对称反射，形式证伪弱排零规则 `WeakRule` 并导出 `WeakRule → (3/4 : ℝ) = 1/2` 与 `WeakRule → (0 : ℤ) = 1`。
- `AutopsyProbe_Scheme6.lean`:
 * **EN**: Scheme 6 finite arithmetic, imprimitive Gauss-sum vanishing, and positive-definite Gram matrix probe (exit code `0`, `3.990s`). Certifies modulus-zero exclusion `¬Nonempty (NeZero 0)`, Rouché rational margin $(1/8)^2 - (1/16)^2 = 3/256 > 0$ , modulo- $4$ principal Gauss-sum vanishing `principal_mod4_gauss = 0`, prime-basis $\{17, 19, 23\}$ rational Gram $LDL^{\mathsf{T}}$ decomposition `gram_ldlt`, positivity `gram_positive`, and zero-moment positive energy `gram_moment_vector = 39`.
 * **ZH**：方案六有限模数边界、非本原 Gauss 和退化与有理正定 Gram 矩阵核查探针（退出码 `0`，耗时 `3.990` 秒）。
- `TailMirrorOriginal.lean`, `TargetValueProbe.lean`, `KexactNegativeControl.lean`, `FirstZeroProbe.lean`:
 * **EN**: Target repository tail-substitution control probe, off-axis point $s=3/4$ non-vanishing instantiation probe, first-zero existential lookup probe, and custom metaprogramming assignment tactic control probe (`kexactB`, which elaborates with expected type `none` and calls `g.assign` directly).
 * **ZH**：原版顶层证明项结论替换对照探针、离轴点 $s=3/4$ 非零性实例化探针、首零点存在性检索探针，以及自定义元编程直接赋值策略 `kexactB` 对照实验探针。

### 2. Full-Graph Min-Cut Scripts & Structured JSON Verification Artifacts / 全图最小割核验脚本与结构化 JSON 核查档案

- `mincut.json` & `independent_verification.json`:
 * **EN**: Complete declaration-graph metrics (`2,701,132` nodes, `170,706,224` edges, `1,478,243`-node joint target cone, `1,072,980` active nodes), the exact **`8`-vertex minimum internal directed cut** (`["DirichletCharacter.FactorsThrough", "Formalism.VW.critLine", "Formalism.VW.rh_of_every", "HurwitzZeta.hurwitzZetaEven", "UpperTheory.FinalTheorems.everyCharacter", "ZMod.LFunction", "claimAll", "starRingEnd._proof_2"]`), the `20`-step logarithmic bisection trajectory converging to `k* = 955,506`, and independent flow-certificate verification receipt (`VERIFIED`).
 * **ZH**：全环境声明图规模、五大主定理 `1,478,243` 节点联合依赖锥、**容量严格为 `8` 的最小内部有向顶点割**、20 步字典序对数二分轨迹（阈值 `955,506`）及独立最大流证书校验回执（`VERIFIED`）。
- `cone_annotations.json` & `cone_and_mincut_autopsy.json`:
 * **EN**: Exact in-cone localization of the `62` in-cone `kexactB` caller modules out of `67` total `kexactB`-related files (`1,816` in-cone declarations) and the reflexive mutual inductive blocks `PrincipalizationCertificate` (`11` in-cone declarations) and `OrderCertificate` (`12` in-cone declarations).
 * **ZH**：主定理依赖锥内 `62` 个 `kexactB` 调用模块（全库共 `67` 个相关文件，含 `1` 个定义文件与 `66` 个调用文件，入锥声明共 `1,816` 个）以及互归纳块 `PrincipalizationCertificate`（`11` 个入锥声明）与 `OrderCertificate`（`12` 个入锥声明）的精确位置清单。
- `source_findings.json`, `source_line_accounting.json`, `lc23_repo_baseline.json`, `target_declaration_records.json`, `run_manifest.json`:
 * **EN**: Complete module-by-module differential between original (`40e56bab`, `17,374,215` lines) and community (`f1f6d654`, `16,571,342` lines) repositories (`10,724` deleted modules / `785,224` lines; `23` modified modules / `17,676` net removed lines including `10` rewritten `CapelliIdentities` modules; `1` added module `Challenge.lean` / `27` lines; `802,873` net lines removed), plus live compilation receipts.
 * **ZH**：原版与社区精简版全量模块差分对账（删除 `10,724` 个模块共 `785,224` 行、修改 `23` 个模块净减 `17,676` 行含 `10` 个重写证明体的 `CapelliIdentities` 模块、新增 `Challenge.lean` 共 `27` 行、全库净减 `802,873` 行）及全部探针实机编译回执。
- `analyze_graph.py` & `verify_graph_certificate.py`:
 * **EN**: Standalone Python 3 split-node maximum-flow / minimum-vertex-cut solver and zero-import independent certificate verifier.
 * **ZH**：全环境声明依赖图拆点最大流／最小有向顶点割求解器与零导入独立证书核验器。

---

## IV. Bilingual Interpretation of Verification Output Fields / 核验输出字段中英双语对照说明

When `python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py` finishes with exit code `0`, it outputs a JSON object with the following fields:

当 `python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py` 以退出码 `0` 完成核验时，输出的 JSON 各字段含义如下：

| Output Field / 输出字段 | Verified Value / 核验值 | Bilingual Explanation / 中英双语说明 |
| :--- | :--- | :--- |
| `status` | `"VERIFIED"` | **EN**: All assertions and cross-certificate invariants passed.<br>**ZH**：全部断言与跨证书守恒不变量核验通过。 |
| `node_count` | `2701132` | **EN**: Total checked declarations in `Main` (`env.checked`).<br>**ZH**：目标仓库 `Main` 已检查环境中的声明节点总数。 |
| `edge_count` | `170706224` | **EN**: Total directed dependency edges (`type_deps` + `body_deps` + `structural_deps`).<br>**ZH**：全环境有向依赖边总数（类型依赖＋证明体依赖＋归纳结构依赖）。 |
| `target_cone_size` | `1478243` | **EN**: Upstream dependency cone size of the five top-level GRH theorems.<br>**ZH**：五大顶层 GRH 定理的联合上游依赖锥节点数。 |
| `outside_target_cone` | `1222889` | **EN**: Unreachable declarations outside the joint target dependency cone (`45.27%`).<br>**ZH**：位于五大顶层定理依赖锥之外的不可达声明节点数（占比 `45.27%`）。 |
| `active_nodes` | `1072980` | **EN**: Active nodes lying simultaneously in the forward closure of the sources and backward cone of the sinks.<br>**ZH**：同时位于源点前向闭包与汇点反向依赖锥内的活跃节点数。 |
| `minimum_vertex_cut_capacity` | `8` | **EN**: Exact capacity of the minimum internal directed vertex cut separating arithmetic/Euler-product sources from top-level GRH sinks.<br>**ZH**：分隔底层乘性/Euler 乘积源点与顶层 GRH 汇点的最小内部有向顶点割容量。 |
| `bisection_threshold` | `955506` | **EN**: Exact lexicographical active-node index located in `20` binary-search steps where source-to-sink connectivity transitions from connected to disconnected.<br>**ZH**：经 `20` 步对数二分精确定位的源汇连通性临界断开阈值。 |
| `kexactB_declarations_in_cone` | `1816` | **EN**: Declarations inside the top-level target dependency cone belonging to the `62` in-cone `kexactB` caller modules.<br>**ZH**：坐落在主定理依赖锥内的 `62` 个 `kexactB` 调用模块所包含的入锥声明总数。 |
| `source_line_conservation` | `"17374215 - 785224 - 17676 + 27 == 16571342"` | **EN**: Exact line-accounting identity between the original and community repositories.<br>**ZH**：原版与社区版源码行数的精确线性守恒恒等式。 |
