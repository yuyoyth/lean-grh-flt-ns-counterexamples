# 千万行 Lean 4 形式化（GRH 1,737 万行 / FLT 1,300 万行）与 79 页 NS 方程爆破证明：原理性悖论、闭式反例与真机源码验尸
**Counterexamples, Structural Paradoxes & Source-Code Autopsies for the 17.37M-Line GRH Lean 4 Proof, 13.00M-Line FLT Lean 4 Proof, and 79-Page Navier–Stokes Blow-Up Paper**

> **快速导航 / Quick Navigation**: **[一、中文总览](#zh-overview)** | **[II. English Overview](#en-overview)** | **[III. 一分钟真机复现 / 1-Minute Reproduction](#quick-reproduction)** | **[IV. 目录结构 / Directory Tree](#repo-structure)** | [独立中文版 (`README_ZH.md`)](README_ZH.md) | [Standalone English (`README_EN.md`)](README_EN.md)

---

<a id="zh-overview"></a>

## 一、 核心结论与总目录（中文导览）

当自动化定理证明或计算机辅助数学工程膨胀至**上千万行 Lean 4 代码**或**近百页分片坐标偏微分方程（PDE）不等式加外部数值证书**时，仅核查“顶层定理的表层语句签名”或“开集内部的光滑体积导数”，会漏掉中间定义与坐标接缝处的致命缺陷（表示商空间核漏： $\ker q \not\subseteq \ker f$ ）。一旦起始定义或跨坐标接缝丢失了核心守恒约束，后续上千万行代码或几十页推导证明的便不再是原数学问题，而是坍缩商空间上的伪影命题。

| 编号 | 审计标的 | 上游规模与固定版本 | 中文版完整专著 (`zh/`) | 英文版完整专著 (`en/`) | 真机复现包 (`reproduction/`) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **01** | **广义黎曼猜想 (GRH)** Lean 4 形式化 | 原版 `17,374,215` 行 (`40e56bab`) / 社区版 `16,571,342` 行 (`f1f6d654`) | [01_GRH 中文专著](zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md) | [01_GRH English](en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md) | [01_grh_17m_lean](reproduction/01_grh_17m_lean/) |
| **02** | **费马大定理 (FLT)** Lean 4 形式化 | `13,004,119` 行 (`anthropics/fermats-last-theorem`) | [02_FLT 中文专著](zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md) | [02_FLT English](en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md) | [02_flt_13m_lean](reproduction/02_flt_13m_lean/) |
| **03** | **纳维-斯托克斯 (NS) 有限时爆破** 79 页论文 | `79` 页 PDF (`ad53419d`, `tristanbuckmaster/navier-stokes`) | [03_NS 中文专著](zh/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md) | [03_NS English](en/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md) | [03_ns_79p_paper](reproduction/03_ns_79p_paper/) |

---

### 1. 第一部分（01_GRH）：1,737 万行广义黎曼猜想 Lean 4 证明的四大真机实锤

#### 1.1 全库 270 万声明节点的最小有向顶点割容量仅为 8（45.27% 为锥外死代码）

- 在真机导出的 `Main` 全环境声明图（共 `2,701,132` 个节点、`170,706,224` 条有向依赖边）中，五大顶层主定理的联合依赖锥仅含 `1,478,243` 个节点，其余 `1,222,889` 个节点（占全库 `45.27%`）均为不可达死代码。
- 从素数乘性／欧拉乘积源集到五大主定理汇集的 `1,072,980` 个活动节点，被容量严格等于 **`8`** 的最小有向顶点割完全截断：
  `DirichletCharacter.FactorsThrough`、`Formalism.VW.critLine`、`Formalism.VW.rh_of_every`、`HurwitzZeta.hurwitzZetaEven`、`UpperTheory.FinalTheorems.everyCharacter`、`ZMod.LFunction`、`claimAll`、`starRingEnd._proof_2`。

#### 1.2 62 个入锥核心模块调用元编程后门 `kexactB` 绕过前端类型检查器

- 原版在 `Formalism/LocalToGlobal/IndefiniteReal/HeckeNonvanishing/Imports.lean` 中定义了自定义元编程策略 `kexactB`（以 `expectedType := none` 关闭前端期望类型合一核对，直接执行 `g.assign`）。
- 全库 `66` 个调用文件中有 **`62` 个模块（共 `1,816` 个声明）直接位于五大主定理的依赖锥内部**。

#### 1.3 独立内核验证器 `con-leche` 与 `con-ron` 报错退出码 2 后被从配置中剔除

- 位于主定理依赖锥内的互归纳证书块 `PrincipalizationCertificate`（`11` 个入锥声明）与 `OrderCertificate`（`12` 个入锥声明）含有自反构造子参数，导致独立验证器 `con-leche` 与 `con-ron` 均以 `exit code 2 (reflexive member)` 拒绝通过。
- 上游仓库随后在 `comparator.json` 中直接将报错的独立验证器删去。

#### 1.4 底层 `ZMod.LFunction` 退化为无乘性守卫的纯加法 Hurwitz 组合，社区版重写 10 个入锥模块

- 临界带内的 `DirichletCharacter.LFunction` 直接退化为接收任意周期函数的纯加法 Hurwitz 组合 `ZMod.LFunction`。任何仅经由该加法商与函数方程反射对称因子化的弱排零规则，均被同一商纤维内的 **Davenport–Heilbronn 非乘性反例**与代数特洛伊多项式 $P(s) = (s - 1/2)^2 - 1/16$ 在 $s = 3/4$ 处直接击穿（Lean 4 真机证出 `weak_rule_refuted : ¬WeakRule`）。
- 所谓“社区精简版”除删去 `10,724` 个模块（`785,224` 行）外，直接重写了 `10` 个入锥 `CapelliIdentities/` 核心模块的证明体与类型类参数（例如 `FixPiIff.lean` 从 `8,029` 行被改写压缩为 `45` 行）。

---

### 2. 第二部分（02_FLT）：1,300 万行费马大定理 Lean 4 证明的四大真机实锤

#### 2.1 小素数 Mazur 无共不动同源线定理零几何推导，靠预设费马定理触发 `False.elim` 短路

- `Defs_FreyPackage.lean` 将反证假设 `hFLT : a^p + b^p = c^p` 死焊进底空间结构体 `FreyPackage`。
- 在 `S_FreyPackage_frey_no_cofixed_small.lean`（对应 $p = 5, 7, 13$ ）与 `S_FreyPackage_frey_no_cofixed_eleven.lean`（对应 $p = 11$ ）中，证明体**未做任何椭圆曲线同源或伽罗瓦表示推导**，而是直接调用外部导入的 `fermatLastTheoremFive / Seven / Eleven / Thirteen` 与结构体自带的 `P.hFLT` 对撞得出 `False`，再用 `False.elim` 导出结论。同一模式下可一字不改地在 Lean 4.33.1 中证出 `∀ P : FreyPackage, P.p = 11 → (0 = 1)`。

#### 2.2 主降水平定理显式关闭未用变量警告，完全弃用模块化假设 `hmod : IsModular P.freyCurve`

- `Defs_ModularityPrep.lean` 中的 `IsModular(E)` 用存在量词擦除了水平 $N$ 与导子根基 $\mathrm{Supp}(abc)$ 的绑定（使新形式水平 $N_1 = 15$ 与旧形式倍增水平 $N_2 = 105$ 混同）。
- 因该弱谓词无法用于降水平，`S_FreyPackage_level_lowering_to_two.lean` 第 129 行显式写入 `set_option linter.unusedVariables false`，**对顶层传入的模块化假设形参 `hmod` 完全不予引用（出现次数为 `0`）**。

#### 2.3 在降水平引理内部提前导入终局零空间定理触发 `False.elim` 凭空伪造水平 2 尖点形式

- 在 `S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean` 第 113–170 行中，奇素数归纳仅消去奇素因子得到 $M \mid 2$ （即 $M \in \{1, 2\}$ ，遗漏了 $2 \mid M$ 的下界保持），无法直接构造水平 $2$ 的模形式。
- 代码随即在第 156–170 行**提前在降水平引理内部导入** $S_2(\Gamma_0(1)) = 0$ 与 $S_2(\Gamma_0(2)) = 0$ 撞出 `False`，再用 `False.elim` 凭空捏造出 $\exists f \in S_2(\Gamma_0(2)), f \neq 0$ 返回给顶层主定理。

#### 2.4 裸整系数半稳定定义在导子 11 真椭圆曲线的同构缩放下当场坍缩

- `IsSemistableModel(W)` 未对极小 Weierstrass 模型商规范化：对导子 $11$ 的真半稳定椭圆曲线 $E_{11} : y^2 + y = x^3 - x^2 - 10x - 20$ （其中 $c_4 = 496, \Delta = -11^5$ ）仅施加 $u = 2$ 的有理同构缩放 $(x, y) \mapsto (4x, 8y)$ ，其半稳定门即从 `1`（真）坍缩为 `0`（假）。

---

### 3. 第三部分（03_NS）：同作者 79 页纳维-斯托克斯有限时爆破纸面证明的三大致命核漏

#### 3.1 附录 B（第 47–57 页）命题 B.1 核心不等式 (B.20) 漏掉赤道平面上的狄拉克奇异面测度

- 论文将乘子权函数 $D, Z$ 表示为上下半空间 $y_3 > 0$ 与 $y_3 < 0$ 在紧化坐标 $\sigma = \frac{|y|}{1+|y|}$ 与 $\eta = \frac{y_3}{|y|}$ 下的分片样条。
- 在做无散场两次分部积分时，论文仅用开区域体积海森算子范数控制二次型，漏掉了跨赤道平面 $\Sigma = \{y_3 = 0\}$ 的法向一阶导数跳变奇异面测度：

$$
D^2 W = H_{W,\mathrm{bulk}}\,dy + [\partial_z W]_\Sigma\,(e_3 \otimes e_3)\,dS_{z=0}
$$

#### 3.2 两族显式全闭式无散反例直接击穿命题 B.1 不等式 (B.20)

- **闭式反例族 A（紧支轴对称无散扰动场击穿二阶权接缝）**：取 $a(t) = (1 - t^2)_+^4$ （精确有理矩 $A = \frac{131072}{45045}$ 、梯度界 $K = \frac{43936}{81}$ ）与 $\varepsilon = 2^{-16} = \frac{1}{65536}$ ，原式要求 $\le 0$ 的泛函给出严格正向违反裕量：

$$
E_{D_+}(v_\varepsilon) \ge \frac{\pi}{65536} \cdot \frac{633509743}{432432000} > 0
$$

- **闭式反例族 B（施瓦茨高斯无散模态场击穿一阶权接缝）**：取 $v = g(-2zyC_6, 2zxC_6, -S_6)$ ，赤道奇异面积分 $\frac{10395}{64}\pi^{3/2}c$ 严格压倒外部体积海森损失 $80\pi^{3/2}c$ ，给出纯解析违反下界：

$$
\frac{\mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}}}{c} > \frac{26311}{64} > 400 > 0
$$

#### 3.3 薄层曲率税守恒律与未公开数据的 SHA-256 哈希黑盒

- 即便在赤道薄层 $|\eta| \le \delta$ 内用四次偶样条 $s_\delta(\eta)$ 强行抹平法向跳变，薄层内法向二阶导数峰值必以 $\frac{3}{2\delta}$ 激增，且总曲率质量严格守恒（当 $\delta \downarrow 0$ 时体积海森积分恒收敛回同一非零奇异面积分，绝不消失）：

$$
\int_{-\delta}^{\delta} s_\delta''(\eta)\,d\eta = 2, \qquad \max_{|\eta| \le \delta} s_\delta''(\eta) = \frac{3}{2\delta}
$$

- 同时，79 页纸面论文最上游的存在性证人 $d \in \mathcal{D}_B$ （第 1、4、38–39、70 页）**未公开任何具体数值或数据文件，仅印有一串 64 位 SHA-256 哈希码** `3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5`。

---

<a id="en-overview"></a>

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
