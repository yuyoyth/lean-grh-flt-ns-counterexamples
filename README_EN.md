# Counterexamples, Structural Paradoxes & Source-Code Autopsies for the 17.37M-Line GRH Lean 4 Proof, 13.00M-Line FLT Lean 4 Proof, and 79-Page Navier–Stokes Blow-Up Paper

> **Language**: **[Bilingual README (`README.md`)](README.md)** | **[中文独立导览 (`README_ZH.md`)](README_ZH.md)**

---

## II. Executive Summary & Monograph Index (English Overview)

When automated formalization or computer-assisted PDE campaigns scale to **10M+ lines of Lean 4 code** or **79 pages of multi-chart weighted inequalities backed by an undisclosed numerical certificate**, verifying only the *top-level theorem statement* or the *open-set smooth bulk formulas* leaves a fatal vulnerability: **representation-quotient kernel leakage** ( $\ker q \not\subseteq \ker f$ ). Once an initial carrier definition or chart seam drops a load-bearing conservation constraint, the remaining millions of lines or dozens of pages no longer prove the original mathematical problem, but instead operate on a collapsed quotient artifact.

| Part | Audited Work | Upstream Scale & Commit | English Monograph (`en/`) | Chinese Monograph (`zh/`) | Reproduction Suite (`reproduction/`) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **01** | **Generalized Riemann Hypothesis (GRH)** Lean 4 Proof | `17,374,215` lines (`40e56bab`) / community `16,571,342` lines (`f1f6d654`) | [01_GRH Monograph (EN)](en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md) | [01_GRH 中文专著](zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md) | [01_grh_17m_lean](reproduction/01_grh_17m_lean/) |
| **02** | **Fermat's Last Theorem (FLT)** Lean 4 Proof | `13,004,119` lines (`anthropics/fermats-last-theorem`) | [02_FLT Monograph (EN)](en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md) | [02_FLT 中文专著](zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md) | [02_flt_13m_lean](reproduction/02_flt_13m_lean/) |
| **03** | **Navier–Stokes (NS) Finite-Time Blow-Up** 79p Paper | `79` pages PDF (`ad53419d`, `tristanbuckmaster/navier-stokes`) | [03_NS Monograph (EN)](en/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md) | [03_NS 中文专著](zh/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md) | [03_ns_79p_paper](reproduction/03_ns_79p_paper/) |

---

### 1. Part 01 (`01_GRH`): Four Verified Faults in the 17.37M-Line GRH Lean 4 Repository

#### 1.1 8-Vertex Minimum Directed Cut Across 2,701,132 Declarations (45.27% Unreachable Dead Bloat)

- Exporting the full checked declaration graph of `Main` (`2,701,132` nodes, `170,706,224` directed edges) reveals that the joint dependency cone of the five top-level GRH theorems contains `1,478,243` nodes, leaving `1,222,889` nodes (`45.27%`) as unreachable dead code.
- Across all `1,072,980` active nodes connecting the prime-multiplicativity / Euler-product source set to the five main theorems, the **minimum internal directed vertex cut has capacity strictly equal to `8`**:
  `DirichletCharacter.FactorsThrough`, `Formalism.VW.critLine`, `Formalism.VW.rh_of_every`, `HurwitzZeta.hurwitzZetaEven`, `UpperTheory.FinalTheorems.everyCharacter`, `ZMod.LFunction`, `claimAll`, `starRingEnd._proof_2`.

#### 1.2 62 In-Cone Modules Invoke Custom Metaprogramming Backdoor `kexactB` Bypassing Frontend Elaboration

- Defined in `Formalism/LocalToGlobal/IndefiniteReal/HeckeNonvanishing/Imports.lean`, `kexactB` elaborates terms with `expectedType := none` and assigns directly to the goal metavariable via `g.assign`.
- Out of `66` calling files in the repository, **`62` modules (`1,816` declarations) sit directly inside the dependency cone of the five main theorems**.

#### 1.3 Independent Kernel Checkers `con-leche` and `con-ron` Reject with Exit Code 2 and Are Removed

- The in-cone mutual inductive blocks `PrincipalizationCertificate` (`11` in-cone declarations) and `OrderCertificate` (`12` in-cone declarations) contain reflexive constructor parameters that cause standalone checkers `con-leche` and `con-ron` to fail with `exit code 2 (reflexive member)`.
- Both failing checkers were subsequently removed from `comparator.json`.

#### 1.4 Additive Hurwitz Carrier Collapse (`ZMod.LFunction`) & Community Edition In-Cone Proof Rewrites

- In the critical strip, `DirichletCharacter.LFunction` reduces to `ZMod.LFunction`, a pure additive Hurwitz linear combination accepting arbitrary periodic functions without multiplicative guards. Any zero-exclusion rule factoring through this additive quotient and functional-equation symmetry is refuted in Lean 4 (`weak_rule_refuted : ¬WeakRule`) by the **Davenport–Heilbronn countermodel** and the algebraic Trojan polynomial $P(s) = (s - 1/2)^2 - 1/16$ vanishing at $s = 3/4$.
- The community pruned edition (`f1f6d654`) deletes `10,724` modules (`785,224` lines) and rewrites the internal proof bodies and typeclass parameters of `10` in-cone `CapelliIdentities/` modules (e.g., compressing `FixPiIff.lean` from `8,029` lines to `45` lines).

---

### 2. Part 02 (`02_FLT`): Four Verified Faults in the 13.00M-Line FLT Lean 4 Repository

#### 2.1 Zero Elliptic-Curve Geometry in Small-Prime Mazur Isogeny Exclusion via `False.elim` Short-Circuit

- `Defs_FreyPackage.lean` welds the counterfactual equation `hFLT : a^p + b^p = c^p` directly into the base carrier structure `FreyPackage`.
- In `S_FreyPackage_frey_no_cofixed_small.lean` (for $p = 5, 7, 13$ ) and `S_FreyPackage_frey_no_cofixed_eleven.lean` (for $p = 11$ ), the proof of "no cofixed isogeny line on the Frey curve" performs **zero elliptic-curve or Galois-representation reasoning**; instead, it invokes pre-imported fixed-exponent Fermat theorems (`fermatLastTheoremFive / Seven / Eleven / Thirteen`) against `P.hFLT` to derive `False` and conclude by `False.elim` (which identically proves `∀ P : FreyPackage, P.p = 11 → (0 = 1)` in Lean 4.33.1).

#### 2.2 Top-Level Modularity Premise `hmod : IsModular P.freyCurve` Completely Ignored

- In `Defs_ModularityPrep.lean`, `IsModular(E)` existentially quantifies out the level $N$ without binding it to the conductor radical $\mathrm{Supp}(abc)$ (conflating newform level $N_1 = 15$ with oldform multiple level $N_2 = 105$).
- Consequently, `S_FreyPackage_level_lowering_to_two.lean` (line 129) sets `set_option linter.unusedVariables false` and **never references its explicit modularity argument `hmod` (`0` occurrences in the proof term)**.

#### 2.3 Premature Import of Terminal Zero-Space Theorems Inside Level-Lowering to Fabricate a Level-2 Cusp Form

- In `S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean` (lines 113–170), odd-prime elimination yields only $M \mid 2$ (so $M \in \{1, 2\}$ , losing the lower guard $2 \mid M$ ).
- Unable to construct a level-2 form directly, lines 156–170 prematurely import $S_2(\Gamma_0(1)) = 0$ and $S_2(\Gamma_0(2)) = 0$ *inside* the level-lowering lemma to trigger `False.elim` and fabricate a fake witness $\exists f \in S_2(\Gamma_0(2)), f \neq 0$.

#### 2.4 Raw Integer `IsSemistableModel` Collapses on Conductor-11 Curve Under Isomorphic Scaling

- Defined on raw integer Weierstrass tuples without minimal-model quotienting, `IsSemistableModel` flips from `True (1)` to `False (0)` on the genuine semistable curve $E_{11} : y^2 + y = x^3 - x^2 - 10x - 20$ (with $c_4 = 496, \Delta = -11^5$ ) under the rational isomorphism $(x, y) \mapsto (4x, 8y)$ ($u = 2$).

---

### 3. Part 03 (`03_NS`): Three Fatal Kernel Leaks in the 79-Page Navier–Stokes Blow-Up Paper

#### 3.1 Equatorial Seam Dirac Surface-Measure Leak in Proposition B.1 / Inequality (B.20) (Pages 47–57)

- Multiplier weights $D, Z$ are defined as piecewise splines on half-spaces $y_3 > 0$ and $y_3 < 0$ in compactified coordinates $\sigma = \frac{|y|}{1+|y|}$ and $\eta = \frac{y_3}{|y|}$.
- Bounding the twice-integrated divergence-free quadratic form solely by open-set bulk Hessian norms drops the singular Dirac surface measure across the zero-volume plane $\Sigma = \{y_3 = 0\}$:

$$
D^2 W = H_{W,\mathrm{bulk}}\,dy + [\partial_z W]_\Sigma\,(e_3 \otimes e_3)\,dS_{z=0}
$$

#### 3.2 Two Explicit Closed-Form Divergence-Free Counterexample Families Violating (B.20)

- **Counterexample Family A (compactly supported axisymmetric field on second-order weight seam)**: With $a(t) = (1 - t^2)_+^4$ (exact rational moment $A = \frac{131072}{45045}$ , gradient bound $K = \frac{43936}{81}$ ) and $\varepsilon = 2^{-16} = \frac{1}{65536}$ , Inequality (B.20) (which requires $E_D(v) \le 0$ ) fails with exact rational margin:

$$
E_{D_+}(v_\varepsilon) \ge \frac{\pi}{65536} \cdot \frac{633509743}{432432000} > 0
$$

- **Counterexample Family B (Schwartz Gaussian divergence-free field on first-order weight seam)**: The equatorial surface integral $\frac{10395}{64}\pi^{3/2}c$ strictly dominates the exterior bulk Hessian loss $80\pi^{3/2}c$ , yielding:

$$
\frac{\mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}}}{c} > \frac{26311}{64} > 400 > 0
$$

#### 3.3 Collar Curvature-Tax Conservation Law & Undisclosed SHA-256 Witness

- Smoothing the seam across $|\eta| \le \delta$ via an even $C^2$ quartic spline $s_\delta(\eta)$ spikes the normal second derivative to $\frac{3}{2\delta}$ with strictly conserved total curvature mass:

$$
\int_{-\delta}^{\delta} s_\delta''(\eta)\,d\eta = 2, \qquad \max_{|\eta| \le \delta} s_\delta''(\eta) = \frac{3}{2\delta}
$$

- Meanwhile, the paper's upstream existence witness $d \in \mathcal{D}_B$ (pp. 1, 4, 38–39, 70) is unpublished, given only as the 64-character SHA-256 hash `3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5`.

---

<a id="quick-reproduction"></a>

## III. 一分钟极速复现指南 / 1-Minute Quick Reproduction Guide

### 1. 第一部分 / Part 01 (17.37M-Line GRH 8-Vertex Min-Cut Certificate & Lean 4 Probes)

```bash
# 零外部依赖校验 270 万节点声明图的 8 顶点最小有向割证书 (Python 3 stdlib only):
python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py

# 若本地装有 Lean 4 + Mathlib v4.33.1，可直接编译反模型探针:
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme1.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme5.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme6.lean
```

### 2. 第二部分 / Part 02 (13.00M-Line FLT Zero-Dependency Lean 4 Kernel Probe)

```bash
# 零外部依赖（无需下载 Mathlib，0 sorry / 0 axiom）直接用 Lean 4 内核复现 FLT 核心断层:
lean reproduction/02_flt_13m_lean/lean4_flt_real_kernel_verification.lean
```

### 3. 第三部分 / Part 03 (79-Page Navier–Stokes Paper Exact Rational Counterexamples)

```bash
# 零外部依赖（仅用 fractions.Fraction，< 0.1 秒）精确复算 NS 论文五大反例与曲率税恒等式:
python3 -B reproduction/03_ns_79p_paper/verify_ns_counterexamples.py
```

---

<a id="repo-structure"></a>

## IV. 仓库目录结构 / Repository Structure

```text
.
├── README.md                                                     # 中英双语顶层导览 (Bilingual Top-Level Overview)
├── README_ZH.md                                                  # 独立中文导览 (Standalone Chinese README)
├── README_EN.md                                                  # 独立英文导览 (Standalone English README)
├── CITATION.cff                                                  # GitHub / Zenodo 标准引用元数据
├── .zenodo.json                                                  # Zenodo 永久学术 DOI 归档配置
├── SHA256SUMS                                                    # 全仓库 50 文件 SHA-256 校验总表
├── zh/                                                           # 中文完整纯闭式专著（共三卷）
│   ├── 01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md                 # 第一部分：1,737 万行 GRH Lean 4 悖论与真机验尸
│   ├── 02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md                 # 第二部分：1,300 万行 FLT Lean 4 悖论与真机验尸
│   └── 03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md     # 第三部分：79 页 NS 爆破纸面证明核漏与闭式反例
├── en/                                                           # Complete English Monographs (3 Volumes)
│   ├── 01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md                 # Part 01: 17.37M-Line GRH Lean 4 Paradox & Autopsy
│   ├── 02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md                 # Part 02: 13.00M-Line FLT Lean 4 Paradox & Autopsy
│   └── 03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md     # Part 03: 79-Page NS Paper Kernel Leak & Counterexamples
└── reproduction/                                                 # 一键真机复现探针与取证档案包
    ├── 01_grh_17m_lean/                                          # GRH 12 个 Lean 探针、10 个真机 JSON 与 8 节点最小割校验器
    ├── 02_flt_13m_lean/                                          # FLT 199 行零依赖 Lean 4 内核复现探针与源码断层总账
    └── 03_ns_79p_paper/                                          # NS 精确有理数 5 套反例一键核验脚本与分面解析推导
```
