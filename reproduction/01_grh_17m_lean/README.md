# Part 01 Reproduction Bundle: 17.37M-Line GRH Lean 4 Formalization Autopsy Probes & Full-Graph Min-Cut Evidence / 第一部分可复现证据包：1,737 万行 GRH Lean 4 形式化证明真机验尸探针与全图最小割档案

---

## I. Overview / 概述

**English**:
This directory contains the self-contained Lean 4 verification probes, full-environment declaration dependency graph analysis scripts, minimum directed vertex cut certificates, and forensic audit JSON artifacts produced on the verification host $\mathtt{lc23}$ ( $\mathtt{DESKTOP\text{-}YUYO2}$ , 64-bit Linux, pinned toolchain $\operatorname{Lean\ 4}\ \mathtt{v4.33.1}$ , $\operatorname{Mathlib}$ commit $\mathtt{0df444a360eaa60ab8c11dca51a86af692955474}$ ) against both the original $17\,374\,215$ -line GRH repository (commit $\mathtt{40e56bab026552e089d7afcfeff08d2defb9c005}$ , matching the 14-part original archive $\mathtt{lean.tar.gz}$ byte-for-byte across all $175\,190 / 175\,190$ files) and the community pruned edition (commit $\mathtt{f1f6d65420dbbf36d6cfdac1af8d79511a855a5b}$ , $16\,571\,342$ lines across $164\,464$ $\mathtt{.lean}$ files).

**中文**：
本目录收录在远程验证主机 $\mathtt{lc23}$ （主机名 $\mathtt{DESKTOP\text{-}YUYO2}$ ，64 位 Linux，精确锁定目标仓库工具链 $\operatorname{Lean\ 4}\ \mathtt{v4.33.1}$ 与 $\operatorname{Mathlib}$ 提交 $\mathtt{0df444a360eaa60ab8c11dca51a86af692955474}$ ）上，针对原版 $17\,374\,215$ 行广义黎曼猜想（GRH）证明库（提交 $\mathtt{40e56bab026552e089d7afcfeff08d2defb9c005}$ ，与原始 14 卷分卷归档 $\mathtt{lean.tar.gz}$ 全部 $175\,190 / 175\,190$ 个文件逐字节全同）与社区删改版（提交 $\mathtt{f1f6d65420dbbf36d6cfdac1af8d79511a855a5b}$ ， $164\,464$ 个 $\mathtt{.lean}$ 文件共 $16\,571\,342$ 行）执行的全部 **六大最简零通读查错探针源码**、**全环境** $2\,701\,132$ **节点 /** $170\,706\,224$ **边最小有向顶点割分析与独立校验脚本** 及 **真机编译与源码对账 JSON 证据档案**。

---

## II. File Inventory / 文件清单

### 1. Lean 4 Verification Probes / 六大方案与目标库 Lean 4 真机验证探针
- `AutopsyProbe_Scheme1.lean`:
  * **EN**: Scheme 1 mathematical probe (exit code `0`, `2.399s`). Proves `raw_zero` ( $\operatorname{Re}(s) \le 1 \implies \operatorname{LSeries}(1, s) = 0$ ), `raw_three_quarters` ( $\operatorname{LSeries}(1, 3/4) = 0$ ), `functions_differ` ( $(s \mapsto \operatorname{LSeries}(1, s)) \neq \operatorname{riemannZeta}$ via $0 \neq -1/2$ at $s=0$ ), `axis_principal_zero` (the modulo- $2$ principal character vanishes on the imaginary axis at $s_0 = \frac{2\pi i}{\log 2}$ ), and `removing_guard_is_false` (stripping the left boundary guard $0 < \operatorname{Re}(s)$ makes the universal critical-line statement provably false in Lean 4).
  * **ZH**：方案一真机探针（退出码 `0`，耗时 `2.399` 秒）。机器形式化证成 `raw_zero`、`raw_three_quarters`、`functions_differ`、模 $2$ 主特征虚轴零点 `axis_principal_zero` 以及剥离左边界守卫 $0 < \operatorname{Re}(s)$ 后的全称命题直接为假 `removing_guard_is_false`。
- `AutopsyProbe_Scheme2.lean` & `DefinitionProbe.lean`:
  * **EN**: Scheme 2 carrier definition and bridge audit probe (exit code `0`, `1.595s`). Prints the exact underlying definitions of `DirichletCharacter.LFunction` and `ZMod.LFunction` (purely additive Hurwitz zeta linear combination) and verifies the convergence-guarded bridge `dirichlet_bridge` ( $\operatorname{Re}(s) > 1$ ).
  * **ZH**：方案二底层载体定义与延拓桥核查探针（退出码 `0`，耗时 `1.595` 秒）。打印 `DirichletCharacter.LFunction` 与 `ZMod.LFunction` 的纯加法 Hurwitz 线性组合定义，并核验带 $\operatorname{Re}(s) > 1$ 收敛域守卫的级数桥 `dirichlet_bridge`。
- `AutopsyProbe_Scheme3.lean`:
  * **EN**: Scheme 3 recursive axiom and dependency cone audit probe for the five top-level target theorems.
  * **ZH**：方案三针对五大顶层主定理的公理集合与依赖锥审计探针。
- `AutopsyProbe_Scheme4.lean` & `GraphHarness.lean`:
  * **EN**: Scheme 4 full-environment declaration dependency graph extractor (`original_scheme4`, exit code `0`, `3,268.004s`). Traverses `env.checked` of `Main` to export all `2,701,132` declarations and `170,706,224` directed dependency edges (`type_deps`, `body_deps`, and `structural_deps`).
  * **ZH**：方案四全环境声明依赖图提取器（`original_scheme4`，退出码 `0`，耗时 `3,268.004` 秒）。遍历原版 `Main` 已检查环境 `env.checked`，完整导出 `2,701,132` 个声明节点与 `170,706,224` 条有向依赖边。
- `AutopsyProbe_Scheme5.lean`:
  * **EN**: Scheme 5 Trojan countermodel injection probe (exit code `0`, `5.856s`). Certifies the symmetric Trojan polynomial $P(s) = (s-1/2)^2 - 1/16$ , Davenport–Heilbronn non-multiplicativity at $n=6$ (`dh_not_multiplicative`), even-channel reciprocal root at $s=3/4$ (`even_root`), and completed functional-equation reflection (`even_completed_reflection`), formally refuting `WeakRule` (`weak_rule_refuted : ¬WeakRule`) and deriving `WeakRule → (3/4 : ℝ) = 1/2` and `WeakRule → (0 : ℤ) = 1`.
  * **ZH**：方案五同商纤维特洛伊反模型注入探针（退出码 `0`，耗时 `5.856` 秒）。在 Lean 4 内证成代数特洛伊多项式、Davenport–Heilbronn 复合数 $n=6$ 乘性破缺、偶通道 $s=3/4$ 互反根与完备化对称反射，形式证伪弱排零规则 `WeakRule` 并导出 `(3/4 : ℝ) = 1/2` 与 `(0 : ℤ) = 1`。
- `AutopsyProbe_Scheme6.lean`:
  * **EN**: Scheme 6 finite arithmetic and positive-definite Gram matrix probe (exit code `0`, `3.990s`). Certifies modulus-zero exclusion `¬Nonempty (NeZero 0)`, Rouché rational margin $(1/8)^2 - (1/16)^2 = 3/256 > 0$ , modulo- $4$ principal Gauss-sum vanishing `principal_mod4_gauss = 0`, prime-basis $\{17, 19, 23\}$ rational Gram $LDL^{\mathsf{T}}$ decomposition `gram_ldlt`, positivity `gram_positive`, and zero-moment positive energy `gram_moment_vector = 39`.
  * **ZH**：方案六有限模数、Gauss 和退化与有理正定 Gram 矩阵对撞探针（退出码 `0`，耗时 `3.990` 秒）。
- `TailMirrorOriginal.lean`, `TargetValueProbe.lean`, `KexactNegativeControl.lean`, `FirstZeroProbe.lean`:
  * **EN**: Target repository tail-insertion probes and metaprogramming bypass negative control (`kexactB` elaborating with expected type `none` and calling `g.assign` directly).
  * **ZH**：原版顶层定理尾部插入镜像测试、 $s=3/4$ 实例化测试、首零点检索测试与 `kexactB` 绕过前端阐述器负控实验。

### 2. Full-Graph Min-Cut Scripts & Forensic JSON Artifacts / 全图最小割核验脚本与真机取证 JSON 档案
- `mincut.json` & `independent_verification.json`:
  * **EN**: Complete graph metrics (`2,701,132` nodes, `170,706,224` edges, `1,478,243`-node joint target cone, `1,072,980` active nodes), the exact **`8`-vertex minimum internal directed cut** (`["DirichletCharacter.FactorsThrough", "Formalism.VW.critLine", "Formalism.VW.rh_of_every", "HurwitzZeta.hurwitzZetaEven", "UpperTheory.FinalTheorems.everyCharacter", "ZMod.LFunction", "claimAll", "starRingEnd._proof_2"]`), the `20`-step logarithmic bisection trajectory converging to `k* = 955,506`, and independent flow-certificate verification (`VERIFIED`).
  * **ZH**：全环境图规模、五大主定理 `1,478,243` 节点联合依赖锥、**容量严格为 `8` 的最小内部有向顶点割**、20 步对数二分轨迹（阈值 `955,506`）及独立最大流证书校验回执（`VERIFIED`）。
- `cone_annotations.json` & `cone_and_mincut_autopsy.json`:
  * **EN**: Exact in-cone localization of the `62 / 66` `kexactB` caller modules (`1,816` in-cone declarations) and the reflexive mutual inductive block `PrincipalizationCertificate` (`11` in-cone declarations) and `OrderCertificate` (`12` in-cone declarations).
  * **ZH**：`62 / 66` 个 `kexactB` 调用模块（`1,816` 个入锥声明）以及触发 `con-leche / con-ron` 退出码 `2` 的互归纳块 `PrincipalizationCertificate`（`11` 个入锥声明）与 `OrderCertificate`（`12` 个入锥声明）在主定理依赖锥内的精确位置清单。
- `source_findings.json`, `source_line_accounting.json`, `lc23_repo_baseline.json`, `target_declaration_records.json`, `run_manifest.json`:
  * **EN**: Complete module-by-module differential between original (`40e56bab`, `17,374,215` lines) and community (`f1f6d654`, `16,571,342` lines) repositories (`10,724` deleted modules / `785,224` lines; `23` modified modules / `17,676` lines including `10` rewritten `CapelliIdentities` modules; `802,873` net lines removed), plus compilation receipts.
  * **ZH**：原版与社区版全量模块差分（删除 `10,724` 个模块 `785,224` 行、修改 `23` 个模块净减 `17,676` 行含 `10` 个重写证明体的 `CapelliIdentities` 模块、全库净减 `802,873` 行）及全部探针真机编译回执。
- `analyze_graph.py` & `verify_graph_certificate.py`:
  * **EN**: Standalone Python 3 solver and zero-import independent certificate verifier for the declaration graph and minimum vertex cut.
  * **ZH**：全环境声明图拆点最大流／最小有向顶点割求解器与零导入独立图证书核验器。
