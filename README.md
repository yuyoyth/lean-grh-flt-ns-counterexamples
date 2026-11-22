# 千万行 Lean 4 形式化（GRH 1,737 万行 / FLT 1,300 万行）与 79 页 NS 方程爆破论文：结构性悖论、闭式反例与形式化源码核查
**Counterexamples, Structural Paradoxes & Formal Source-Code Verification for the 17.37M-Line GRH Lean 4 Proof, 13.00M-Line FLT Lean 4 Proof, and 79-Page Navier–Stokes Blow-Up Paper**

> **快速导航 / Quick Navigation**: [**一、中文总览**](#zh-overview) | [**II. English Overview**](#en-overview) | [**III. 一分钟复现指南 / 1-Minute Reproduction**](#quick-reproduction) | [**IV. 目录结构 / Directory Tree**](#repo-structure) | [独立中文版 (`README_ZH.md`)](README_ZH.md) | [Standalone English (`README_EN.md`)](README_EN.md)

---

<a id="zh-overview"></a>

## 一、 核心结论与总目录（中文导览）

当自动化定理证明或计算机辅助偏微分方程（PDE）工程扩展至**上千万行 Lean 4 代码**或**近百页分片坐标加权不等式与外部数值证书**时，若仅核对“顶层定理的表层语句签名”或“开区域内部的光滑体积导数”，容易忽略中间定义与坐标接缝处的算子核包含条件（表示商空间核条件： $\ker q \subseteq \ker f$ ）。一旦起始定义或跨坐标接缝遗漏了核心守恒约束（即发生算子核泄漏： $\ker q \not\subseteq \ker f$ ），后续推导所作用的便不再是原数学对象，而是退化商空间上的投影命题。

| 编号 | 核查对象 | 上游规模与固定版本 | 中文版完整专著 (`zh/`) | 英文版完整专著 (`en/`) | 可复现验证套件 (`reproduction/`) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **01** | **广义黎曼猜想** (GRH) Lean 4 形式化 | 原版 `17,374,215` 行 (`40e56bab`) / 社区版 `16,571,342` 行 (`f1f6d654`) | [01_GRH 中文专著](zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md) | [01_GRH English](en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md) | [01_grh_17m_lean](reproduction/01_grh_17m_lean/) |
| **02** | **费马大定理** (FLT) Lean 4 形式化 | `13,004,119` 行 (`anthropics/fermats-last-theorem`) | [02_FLT 中文专著](zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md) | [02_FLT English](en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md) | [02_flt_13m_lean](reproduction/02_flt_13m_lean/) |
| **03** | **纳维-斯托克斯 (NS) 有限时爆破** 79 页论文 | `79` 页 PDF (`ad53419d`, `tristanbuckmaster/navier-stokes`) | [03_NS 中文专著](zh/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md) | [03_NS English](en/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md) | [03_ns_79p_paper](reproduction/03_ns_79p_paper/) |

---

### 1. 第一部分（01_GRH）：1,737 万行广义黎曼猜想 Lean 4 证明的四项核心结构核查结论

#### 1.1 全库 270 万声明节点的最小有向顶点割容量为 8（45.27% 为依赖锥外未引用声明）

- 在实机导出的 `Main` 全环境声明图（共 `2,701,132` 个节点、`170,706,224` 条有向依赖边）中，五大顶层主定理的联合依赖锥包含 `1,478,243` 个节点，其余 `1,222,889` 个节点（占全库 `45.27%`）不处于任何顶层主定理的依赖路径上。
- 从素数乘性／欧拉乘积源集到五大主定理汇集的 `1,072,980` 个活动节点，被容量严格等于 **`8`** 的最小有向顶点割完全分离：
 `DirichletCharacter.FactorsThrough`、`Formalism.VW.critLine`、`Formalism.VW.rh_of_every`、`HurwitzZeta.hurwitzZetaEven`、`UpperTheory.FinalTheorems.everyCharacter`、`ZMod.LFunction`、`claimAll`、`starRingEnd._proof_2`。

#### 1.2 62 个入锥核心模块调用自定义元编程策略 `kexactB` 绕过前端期望类型合一核对

- 原版仓库在 `Formalism/LocalToGlobal/IndefiniteReal/HeckeNonvanishing/Imports.lean` 中定义了自定义元编程策略 `kexactB`（以 `expectedType := none` 关闭前端期望类型合一核对，直接执行 `g.assign` 对目标元变量赋值）。
- 全库 `66` 个调用文件中有 **`62` 个模块（共 `1,816` 个声明）直接位于五大主定理的依赖锥内部**。

#### 1.3 独立内核验证器 `con-leche` 与 `con-ron` 报错退出码 2 后被从校验配置中移除

- 位于主定理依赖锥内的互归纳证书块 `PrincipalizationCertificate`（`11` 个入锥声明）与 `OrderCertificate`（`12` 个入锥声明）含有自反构造子参数，导致独立验证器 `con-leche` 与 `con-ron` 均以 `exit code 2 (reflexive member)` 拒绝通过。
- 上游仓库随后在 `comparator.json` 中移除了上述两个报错的独立验证器。

#### 1.4 底层 `ZMod.LFunction` 退化为无乘性约束的加法 Hurwitz 组合，社区精简版改写 10 个入锥模块

- 临界带内的 `DirichletCharacter.LFunction` 归约为接收任意周期函数的纯加法 Hurwitz 线性组合 `ZMod.LFunction`。任何仅经由该加法商与函数方程反射对称因子化的弱排零规则，均被同一商纤维内的 **Davenport–Heilbronn 非乘性反模型**与代数多项式 $P(s) = (s - 1/2)^2 - 1/16$ 在 $s = 3/4$ 处直接证伪（Lean 4 实机验证 `weak_rule_refuted : ¬WeakRule`）。
- 社区精简版（`f1f6d654`）除删去 `10,724` 个模块（`785,224` 行）外，还改写了 `10` 个入锥 `CapelliIdentities/` 核心模块的证明体与类型类参数（例如 `FixPiIff.lean` 由 `8,029` 行改写为 `45` 行）。

---

### 2. 第二部分（02_FLT）：1,300 万行费马大定理 Lean 4 证明的四项核心结构核查结论

#### 2.1 小素数 Mazur 无共不动同源线引理未作椭圆曲线推导，直接由预设费马定理触发 `False.elim` 短路

- `Defs_FreyPackage.lean` 将反事实丢番图等式 `hFLT : a^p + b^p = c^p` 直接内置于底空间结构体 `FreyPackage`。
- 在 `S_FreyPackage_frey_no_cofixed_small.lean`（对应 $p = 5, 7, 13$ ）与 `S_FreyPackage_frey_no_cofixed_eleven.lean`（对应 $p = 11$ ）中，证明体**未涉及椭圆曲线同源或伽罗瓦表示推理**，而是直接调用外部导入的固定指数费马定理 `fermatLastTheoremFive / Seven / Eleven / Thirteen` 与结构体字段 `P.hFLT` 产生矛盾 `False`，再由爆炸原理 `False.elim` 导出目标结论。在完全相同的结构前提下，可在 Lean 4.33.1 内核中以相同方式证出 `∀ P : FreyPackage, P.p = 11 → (0 = 1)`。

#### 2.2 主降水平定理关闭未用变量警告，未引用传入的模块化假设 `hmod : IsModular P.freyCurve`

- `Defs_ModularityPrep.lean` 中的 `IsModular(E)` 用存在量词消去了水平 $N$ 与导子根基 $\mathrm{Supp}(abc)$ 的绑定关系（使得新形式水平 $N _ 1 = 15$ 与旧形式倍增水平 $N _ 2 = 105$ 在该谓词下不可区分）。
- 由于该弱存在性谓词无法提供降水平所需的水平上界，`S_FreyPackage_level_lowering_to_two.lean` 第 129 行显式设置 `set_option linter.unusedVariables false`，**在证明项中对模块化假设形参 `hmod` 的引用次数为 `0`**。

#### 2.3 在降水平引理内部提前调用终局零空间定理，经由 `False.elim` 非构造性地导出水平 2 尖点形式

- 在 `S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean` 第 113–170 行中，奇素数归纳仅消去奇素因子得到 $M \mid 2$ （即 $M \in \lbrace 1, 2\rbrace$ ，缺少 $2 \mid M$ 的下界保持），无法直接构造出水平 $2$ 的模形式。
- 代码在第 156–170 行**提前在降水平引理内部调用** $S _ 2(\Gamma _ 0(1)) = 0$ 与 $S _ 2(\Gamma _ 0(2)) = 0$ 导出 `False`，再通过 `False.elim` 非构造性地生成存在性见证 $\exists f \in S _ 2(\Gamma _ 0(2)), f \neq 0$ 并返回给顶层主定理。

#### 2.4 裸整系数半稳定定义在导子 11 椭圆曲线的有理同构缩放下发生真值退化

- `IsSemistableModel(W)` 直接定义于裸整系数 Weierstrass 元组而未对极小模型商空间规范化：对于导子为 $11$ 的半稳定椭圆曲线 $E _ {11} : y^2 + y = x^3 - x^2 - 10x - 20$ （其中 $c _ 4 = 496, \Delta = -11^5$ ），施加尺度因子 $u = 2$ 的有理同构缩放 $(x, y) \mapsto (4x, 8y)$ 后，其半稳定谓词真值即由 `1`（真）变为 `0`（假）。

---

### 3. 第三部分（03_NS）：同作者 79 页纳维-斯托克斯有限时爆破论文的四项核心分析结论与闭式反例

#### 3.1 附录 B（第 47–57 页）命题 B.1 不等式 (B.20) 遗漏赤道平面上的狄拉克奇异面测度

- 论文将乘子权函数 $D, Z$ 表示为上下半空间 $y _ 3 > 0$ 与 $y _ 3 < 0$ 在紧化坐标 $\sigma = \frac{|y|}{1+|y|}$ 与 $\eta = \frac{y _ 3}{|y|}$ 下的分片样条。
- 在对无散场作两次分部积分时，不等式 (B.20) 仅以开集内部的体积海森算子范数控制二次型，遗漏了跨赤道零测度平面 $\Sigma = \lbrace y _ 3 = 0\rbrace$ 的法向一阶导数跳变奇异面测度：

$$
D^2 W = H _ {W,\mathrm{bulk}}\thinspace dy + [\partial _ z W] _ \Sigma (e _ 3 \otimes e _ 3)\thinspace dS _ {z=0}
$$

#### 3.2 两族显式闭式无散反例场直接违反命题 B.1 不等式 (B.20)

- **闭式反例族 A**（紧支轴对称无散场在二阶权接缝上的精确有理违反裕量）：取 $a(t) = (1 - t^2) _ +^4$ （精确有理矩 $A = \frac{131072}{45045}$ 、梯度上界 $K = \frac{43936}{81}$ ）与 $\varepsilon = 2^{-16} = \frac{1}{65536}$ ，原命题要求 $\le 0$ 的泛函给出严格为正的有理下界：

$$
E _ {D _ +}(v _ \varepsilon) \ge \frac{\pi}{65536} \cdot \frac{633509743}{432432000} > 0
$$

- **闭式反例族 B**（施瓦茨高斯无散场在一阶权接缝上的解析违反下界）：取 $v = g(-2zyC _ 6, 2zxC _ 6, -S _ 6)$ ，赤道奇异面积分 $\frac{10395}{64}\pi^{3/2}c$ 严格大于外部体积海森损失 $80\pi^{3/2}c$ ，给出纯解析正下界：

$$
\frac{\mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}}}{c} > \frac{26311}{64} > 400 > 0
$$

#### 3.3 薄层曲率税守恒律与仅给出 SHA-256 哈希摘要的未公开数值证人

- 若在赤道薄层 $|\eta| \le \delta$ 内用四次偶样条 $s _ \delta(\eta)$ 磨平法向一阶导数跳变，薄层内法向二阶导数峰值必以 $\frac{3}{2\delta}$ 增长，且总曲率质量严格守恒：

$$
\int _ {-\delta}^{\delta} s _ \delta''(\eta)\thinspace d\eta = 2, \qquad \max _ {|\eta| \le \delta} s _ \delta''(\eta) = \frac{3}{2\delta}
$$

- 同时，79 页论文最上游的存在性证人 $d \in \mathcal{D} _ B$ （第 1、4、38–39、70 页）**未公开具体数值或数据文件，仅给出 64 位 SHA-256 哈希摘要** `3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5`。

#### 3.4 静态分片乘子框架下的补充材料不变性定理（为何公开 SHA-256 数据或继续追加补充材料均无法消除该缺陷）

专著第 5.3 节（定理 5.4）与 `verify_ns_counterexamples.py` 第六套有理数核验套件（`suite_6`）严格证明了以下**补证三难结构定理**：在当前静态分片乘子底座下，无论后续公开 SHA-256 原始文件还是继续追加任何外围证明材料，均面临三条互斥且穷尽的结构性约束：

- **分支一**（公开 SHA-256 有限维系数表 $d \in \mathcal{D} _ B$ 无法改变无穷维分布微积分恒等式）： $d \in \mathcal{D} _ B$ 仅为有限维样条系数表，其通向无穷维无散场全空间 $\mathcal{D} _ S^\Gamma$ 的唯一桥梁正是命题 B.1 / (B.20)。只要赤道任意非空开环域上单侧法向斜率非零，反例族 A 与 B 即在该环域上违反 (B.20)，与系数表内其它网格数值无关。
- **分支二**（追加“薄层 $C^2$ 磨平修正”将使奇异质量等量转移为薄层纯体积海森正残差，并导致梯度主系数 $I _ 1$ 退化为负）：若在薄层 $|z| \le \delta = \lambda\varepsilon$ （取 $\lambda = \frac{1}{8}, \varepsilon = 2^{-16}, \delta = 2^{-19}$ ）内用全局 $C^2$ 四次样条磨平接缝（使 $[\partial _ z D _ \delta] _ \Sigma = 0$ ），薄层曲率转移因子满足精确有理下界 $I _ {\mathrm{collar}}(1/8) = \frac{2787617180779875667}{3000241776758882304} > \frac{37}{40} = 0.925 > 0$ ，同一紧支无散场 $v _ \varepsilon$ 在**纯体积海森读口**下依然违反 (B.20)：

$$
\frac{E _ {D _ \delta}^{\mathrm{cert}}(v _ \varepsilon)}{\pi\varepsilon} \ge \frac{2147573301937507667}{1611064563204096000} > \frac{13}{10} > 0
$$

同时，若将薄层内激增的二阶导数峰值 $\Vert H _ {D _ \delta}(1,0)\Vert _ {\mathrm{op}} \ge \frac{3}{8\delta} = 196608$ 如实计入第 54 页公式 (B.16)，梯度系数将直接退化为 $I _ 1(1,0) \le \frac{1}{4} - 196608 = -\frac{786431}{4} < 0$ 。
- **分支三**（追加外围引理无法消除同域反例，缩减无散扰动空间则破坏第 70 页非线性自举闭合）：由全称量词对理论扩充的单调性，在不缩减定义域 $\mathcal{D} _ S^\Gamma$ 时，追加任何外围辅助引理均不能改变同一闭式证人 $v _ \varepsilon \in \mathcal{D} _ S^\Gamma$ 对命题 B.1 的证伪；而若人为在 $\mathcal{D} _ S^\Gamma$ 上附加赤道零迹限制以排除 $v _ \varepsilon$ ，第 70 页非线性涡拉伸自举闭合条件将不再成立。

---

<a id="en-overview"></a>

## II. Executive Summary & Monograph Index (English Overview)

When automated formalization or computer-assisted PDE campaigns scale to **10M+ lines of Lean 4 code** or **79 pages of multi-chart weighted inequalities backed by an undisclosed numerical certificate**, verifying only the *top-level theorem statement* or the *open-set smooth bulk formulas* leaves a critical structural gap: **representation-quotient kernel leakage** ( $\ker q \not\subseteq \ker f$ ). Once an initial carrier definition or coordinate-chart seam drops a load-bearing conservation constraint, downstream deductions no longer establish the original mathematical claim, but instead operate on a degenerated quotient projection.

| Part | Verified Target | Upstream Scale & Commit | English Monograph (`en/`) | Chinese Monograph (`zh/`) | Reproduction Suite (`reproduction/`) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **01** | **Generalized Riemann Hypothesis** (GRH) Lean 4 Proof | `17,374,215` lines (`40e56bab`) / community `16,571,342` lines (`f1f6d654`) | [01_GRH Monograph (EN)](en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md) | [01_GRH 中文专著](zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md) | [01_grh_17m_lean](reproduction/01_grh_17m_lean/) |
| **02** | **Fermat's Last Theorem** (FLT) Lean 4 Proof | `13,004,119` lines (`anthropics/fermats-last-theorem`) | [02_FLT Monograph (EN)](en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md) | [02_FLT 中文专著](zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md) | [02_flt_13m_lean](reproduction/02_flt_13m_lean/) |
| **03** | **Navier–Stokes (NS) Finite-Time Blow-Up** 79p Paper | `79` pages PDF (`ad53419d`, `tristanbuckmaster/navier-stokes`) | [03_NS Monograph (EN)](en/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md) | [03_NS 中文专著](zh/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md) | [03_ns_79p_paper](reproduction/03_ns_79p_paper/) |

---

### 1. Part 01 (`01_GRH`): Four Principal Structural Findings in the 17.37M-Line GRH Lean 4 Repository

#### 1.1 8-Vertex Minimum Directed Cut Across 2,701,132 Declarations (45.27% Unreferenced Out-of-Cone Declarations)

- Exporting the full checked declaration graph of `Main` (`2,701,132` nodes, `170,706,224` directed edges) shows that the joint dependency cone of the five top-level GRH theorems contains `1,478,243` nodes, while `1,222,889` nodes (`45.27%`) lie outside the dependency cone of all five main theorems.
- Across all `1,072,980` active nodes connecting the prime-multiplicativity / Euler-product source set to the five main theorems, the **minimum internal directed vertex cut has capacity strictly equal to `8`**:
 `DirichletCharacter.FactorsThrough`, `Formalism.VW.critLine`, `Formalism.VW.rh_of_every`, `HurwitzZeta.hurwitzZetaEven`, `UpperTheory.FinalTheorems.everyCharacter`, `ZMod.LFunction`, `claimAll`, `starRingEnd._proof_2`.

#### 1.2 62 In-Cone Modules Invoke Custom Metaprogramming Tactic `kexactB` Bypassing Frontend Expected-Type Unification

- Defined in `Formalism/LocalToGlobal/IndefiniteReal/HeckeNonvanishing/Imports.lean`, `kexactB` elaborates terms with `expectedType := none` and assigns directly to the target metavariable via `g.assign`.
- Out of `66` calling files in the repository, **`62` modules (`1,816` declarations) lie directly inside the dependency cone of the five main theorems**.

#### 1.3 Standalone Kernel Checkers `con-leche` and `con-ron` Exit with Code 2 and Are Removed from `comparator.json`

- The in-cone mutual inductive blocks `PrincipalizationCertificate` (`11` in-cone declarations) and `OrderCertificate` (`12` in-cone declarations) contain reflexive constructor parameters that cause standalone checkers `con-leche` and `con-ron` to reject with `exit code 2 (reflexive member)`.
- Both checkers were subsequently removed from `comparator.json`.

#### 1.4 Additive Hurwitz Carrier Degeneration (`ZMod.LFunction`) & Community Edition In-Cone Proof Rewrites

- In the critical strip, `DirichletCharacter.LFunction` reduces to `ZMod.LFunction`, a pure additive Hurwitz linear combination accepting arbitrary periodic functions without multiplicative constraints. Any zero-exclusion functional factoring through this additive quotient and functional-equation symmetry is refuted in Lean 4 (`weak_rule_refuted : ¬WeakRule`) by the **Davenport–Heilbronn countermodel** and the algebraic polynomial $P(s) = (s - 1/2)^2 - 1/16$ vanishing at $s = 3/4$ .
- The community pruned edition (`f1f6d654`) deletes `10,724` modules (`785,224` lines) and rewrites the internal proof bodies and typeclass parameters of `10` in-cone `CapelliIdentities/` modules (e.g., rewriting `FixPiIff.lean` from `8,029` lines to `45` lines).

---

### 2. Part 02 (`02_FLT`): Four Principal Structural Findings in the 13.00M-Line FLT Lean 4 Repository

#### 2.1 Small-Prime Mazur Isogeny Exclusion Proved Without Elliptic-Curve Geometry via Counterfactual `False.elim` Short-Circuit

- `Defs_FreyPackage.lean` directly embeds the counterfactual equation `hFLT : a^p + b^p = c^p` into the base carrier structure `FreyPackage`.
- In `S_FreyPackage_frey_no_cofixed_small.lean` (for $p = 5, 7, 13$ ) and `S_FreyPackage_frey_no_cofixed_eleven.lean` (for $p = 11$ ), the proof of "no cofixed isogeny line on the Frey curve" performs **no elliptic-curve or Galois-representation deduction**; instead, it invokes pre-imported fixed-exponent Fermat theorems (`fermatLastTheoremFive / Seven / Eleven / Thirteen`) against `P.hFLT` to obtain `False` and conclude by `False.elim` (which identically proves `∀ P : FreyPackage, P.p = 11 → (0 = 1)` in Lean 4.33.1).

#### 2.2 Top-Level Modularity Premise `hmod : IsModular P.freyCurve` Unreferenced Under `set_option linter.unusedVariables false`

- In `Defs_ModularityPrep.lean`, `IsModular(E)` existentially quantifies out the level $N$ without binding it to the conductor radical $\mathrm{Supp}(abc)$ (rendering newform level $N _ 1 = 15$ and oldform multiple level $N _ 2 = 105$ indistinguishable under the predicate).
- Consequently, `S_FreyPackage_level_lowering_to_two.lean` (line 129) sets `set_option linter.unusedVariables false` and **never references its explicit modularity premise `hmod`** (`0` occurrences in the proof term).

#### 2.3 Premature Invocation of Terminal Zero-Space Theorems Inside Level-Lowering via `False.elim`

- In `S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean` (lines 113–170), odd-prime elimination yields only $M \mid 2$ (so $M \in \lbrace 1, 2\rbrace$ , without preserving the lower divisibility guard $2 \mid M$ ).
- Unable to construct a level-2 cusp form directly, lines 156–170 prematurely invoke $S _ 2(\Gamma _ 0(1)) = 0$ and $S _ 2(\Gamma _ 0(2)) = 0$ *inside* the level-lowering lemma to trigger `False.elim` and non-constructively produce $\exists f \in S _ 2(\Gamma _ 0(2)), f \neq 0$ .

#### 2.4 Raw Integer `IsSemistableModel` Degenerates on Conductor-11 Curve Under Rational Isomorphic Scaling

- Defined on raw integer Weierstrass tuples without minimal-model quotient normalization, `IsSemistableModel` changes truth value from `True (1)` to `False (0)` on the semistable curve $E _ {11} : y^2 + y = x^3 - x^2 - 10x - 20$ (with $c _ 4 = 496, \Delta = -11^5$ ) under the rational isomorphism $(x, y) \mapsto (4x, 8y)$ ( $u = 2$ ).

---

### 3. Part 03 (`03_NS`): Four Principal Analytical Findings & Closed-Form Counterexamples for the 79-Page Navier–Stokes Paper

#### 3.1 Equatorial Seam Dirac Surface-Measure Omission in Proposition B.1 / Inequality (B.20) (Pages 47–57)

- Multiplier weights $D, Z$ are represented as piecewise splines on half-spaces $y _ 3 > 0$ and $y _ 3 < 0$ in compactified coordinates $\sigma = \frac{|y|}{1+|y|}$ and $\eta = \frac{y _ 3}{|y|}$ .
- Bounding the twice-integrated divergence-free quadratic form solely by open-set bulk Hessian norms omits the singular Dirac surface measure across the equatorial plane $\Sigma = \lbrace y _ 3 = 0\rbrace$ :

$$
D^2 W = H _ {W,\mathrm{bulk}}\thinspace dy + [\partial _ z W] _ \Sigma (e _ 3 \otimes e _ 3)\thinspace dS _ {z=0}
$$

#### 3.2 Two Explicit Closed-Form Divergence-Free Counterexample Families Violating (B.20)

- **Counterexample Family A** (compactly supported axisymmetric field on second-order weight seam): With $a(t) = (1 - t^2) _ +^4$ (exact rational moment $A = \frac{131072}{45045}$ , gradient bound $K = \frac{43936}{81}$ ) and $\varepsilon = 2^{-16} = \frac{1}{65536}$ , Inequality (B.20) (which requires $E _ D(v) \le 0$ ) is violated with exact rational lower bound:

$$
E _ {D _ +}(v _ \varepsilon) \ge \frac{\pi}{65536} \cdot \frac{633509743}{432432000} > 0
$$

- **Counterexample Family B** (Schwartz Gaussian divergence-free field on first-order weight seam): The equatorial surface integral $\frac{10395}{64}\pi^{3/2}c$ strictly exceeds the exterior bulk Hessian contribution $80\pi^{3/2}c$ , yielding the analytical violation bound:

$$
\frac{\mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}}}{c} > \frac{26311}{64} > 400 > 0
$$

#### 3.3 Collar Curvature-Tax Conservation Law & Undisclosed SHA-256 Witness

- Smoothing the seam across $|\eta| \le \delta$ via an even $C^2$ quartic spline $s _ \delta(\eta)$ causes the normal second derivative to peak at $\frac{3}{2\delta}$ with strictly conserved total curvature mass:

$$
\int _ {-\delta}^{\delta} s _ \delta''(\eta)\thinspace d\eta = 2, \qquad \max _ {|\eta| \le \delta} s _ \delta''(\eta) = \frac{3}{2\delta}
$$

- Meanwhile, the paper's upstream existence witness $d \in \mathcal{D} _ B$ (pp. 1, 4, 38–39, 70) is not published as a numerical file, appearing only as the 64-character SHA-256 digest `3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5`.

#### 3.4 Structural Invariance Under Supplementary Proof Materials & Certificate Unsealing (Theorem 5.4 & `suite_6`)

Section 5.3 (Theorem 5.4) of the monograph and `suite_6` of `verify_ns_counterexamples.py` establish a **three-branch structural trilemma** showing why neither releasing the file behind the SHA-256 hash nor appending supplementary lemmas/smoothing certificates within the paper's static piecewise-multiplier framework can resolve the defect:

- **Branch I** (Unsealing the finite-dimensional table $d \in \mathcal{D} _ B$ cannot alter the distributional integration-by-parts identity): $d \in \mathcal{D} _ B$ is a finite spline-coefficient table whose sole analytical bridge to the infinite-dimensional solenoidal space $\mathcal{D} _ S^\Gamma$ is Proposition B.1 / Inequality (B.20). Whenever the one-sided normal slope is non-zero on any open equatorial annulus, Counterexample Families A and B violate (B.20) on that annulus regardless of the remaining grid coefficients.
- **Branch II** (Appending a $C^2$ equatorial collar smoothing transfers the singular surface integral into an equivalent positive pure-bulk Hessian violation while driving $I _ 1$ negative): Replacing $|z|$ across $|z| \le \delta = \lambda\varepsilon$ (with $\lambda = \frac{1}{8}, \varepsilon = 2^{-16}, \delta = 2^{-19}$ ) by the global $C^2$ quartic spline $s _ \delta(z)$ eliminates the surface jump ( $[\partial _ z D _ \delta] _ \Sigma = 0$ ) but transfers the curvature mass into the collar bulk integral with transfer factor $I _ {\mathrm{collar}}(1/8) = \frac{2787617180779875667}{3000241776758882304} > \frac{37}{40} = 0.925 > 0$ . Consequently, the exact same solenoidal field $v _ \varepsilon$ violates (B.20) under the **pure-bulk Hessian readout**:

$$
\frac{E _ {D _ \delta}^{\mathrm{cert}}(v _ \varepsilon)}{\pi\varepsilon} \ge \frac{2147573301937507667}{1611064563204096000} > \frac{13}{10} > 0
$$

Simultaneously, accounting for the collar Hessian peak $\Vert H _ {D _ \delta}(1,0)\Vert _ {\mathrm{op}} \ge \frac{3}{8\delta} = 196608$ in Equation (B.16) (p. 54) drives the leading gradient coefficient to $I _ 1(1,0) \le \frac{1}{4} - 196608 = -\frac{786431}{4} < 0$ .
- **Branch III** (Appending peripheral lemmas cannot overturn an in-domain universal counterexample, while restricting $\mathcal{D} _ S^\Gamma$ breaks the Section 7 nonlinear bootstrap): By monotonicity of universal falsification, no added lemma can make (B.20) hold on $\mathcal{D} _ S^\Gamma$ while $v _ \varepsilon \in \mathcal{D} _ S^\Gamma$ remains in the domain; conversely, restricting $\mathcal{D} _ S^\Gamma$ at $y _ 3 = 0$ breaks the nonlinear vortex-stretching bootstrap closure on page 70.

---

<a id="quick-reproduction"></a>

## III. 一分钟复现指南 / 1-Minute Quick Reproduction Guide

### 1. 第一部分 / Part 01 (17.37M-Line GRH 8-Vertex Min-Cut Certificate & Lean 4 Probes)```bash
# [ZH] 零外部依赖校验 270 万节点声明图的 8 顶点最小有向割证书（仅需 Python 3 标准库，< 0.2 秒）：
# [EN] Zero-dependency verification of the 8-vertex minimum directed cut across 2.70M declarations (Python 3 stdlib only, < 0.2s):
python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py

# [ZH] 若本地装有 Lean 4 + Mathlib v4.33.1，可直接编译反模型与核查探针：
# [EN] If Lean 4 + Mathlib v4.33.1 is installed locally, compile the countermodel verification probes directly:
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme1.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme5.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme6.lean```

### 2. 第二部分 / Part 02 (13.00M-Line FLT Zero-Dependency Lean 4 Kernel Probe)```bash
# [ZH] 零外部依赖（无需下载 Mathlib，0 sorry / 0 axiom）直接用 Lean 4 内核复现 FLT 核心结构断层：
# [EN] Zero-dependency Lean 4 kernel verification (no Mathlib required, 0 sorry / 0 axiom) reproducing the FLT structural gaps:
lean reproduction/02_flt_13m_lean/lean4_flt_real_kernel_verification.lean
```

### 3. 第三部分 / Part 03 (79-Page Navier–Stokes Paper Exact Rational Counterexamples & Collar Transfer)```bash
# [ZH] 零外部依赖（仅用 fractions.Fraction，< 0.1 秒）精确复算 NS 论文全部 6 套有理数反例与薄层曲率转移定理：
# [EN] Zero-dependency exact rational verification (fractions.Fraction only, < 0.1s) of all 6 NS counterexample & collar-transfer suites:
python3 -B reproduction/03_ns_79p_paper/verify_ns_counterexamples.py```

---

<a id="repo-structure"></a>

## IV. 仓库目录结构 / Repository Structure```text
.
├── README.md                                                     # 中英双语顶层总览 / Bilingual Top-Level Overview
├── README_ZH.md                                                  # 独立中文总览 / Standalone Chinese Overview
├── README_EN.md                                                  # 独立英文总览 / Standalone English Overview
├── CITATION.cff                                                  # GitHub / Zenodo 学术引用元数据 / Academic Citation Metadata
├── .zenodo.json                                                  # Zenodo 永久 DOI 归档配置 / Zenodo DOI Archival Metadata
├── SHA256SUMS                                                    # 全仓库 50 文件 SHA-256 校验总表 / Full Repository SHA-256 Manifest
├── zh/                                                           # 中文完整纯闭式专著（共三卷） / Complete Chinese Monographs (3 Volumes)
│   ├── 01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md                 # 第一部分：1,737 万行 GRH Lean 4 结构分析与实机核查专著
│   ├── 02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md                 # 第二部分：1,300 万行 FLT Lean 4 结构分析与内核核查专著
│   └── 03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md     # 第三部分：79 页 NS 论文算子核分析、闭式反例与补证三难定理专著
├── en/                                                           # Complete English Monographs (3 Volumes)
│   ├── 01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md                 # Part 01: 17.37M-Line GRH Lean 4 Structural & Graph Verification Monograph
│   ├── 02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md                 # Part 02: 13.00M-Line FLT Lean 4 Structural & Kernel Verification Monograph
│   └── 03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md     # Part 03: 79-Page NS Paper Kernel Analysis, Counterexamples & Trilemma Monograph
└── reproduction/                                                 # 中英双语一键复现套件 / Bilingual One-Command Reproduction Suites
    ├── 01_grh_17m_lean/                                          # GRH: 12 Lean 4 probes, 10 graph JSONs & 8-vertex min-cut verifier (Bilingual)
    ├── 02_flt_13m_lean/                                          # FLT: Zero-dependency Lean 4 kernel probe & source-code verification report (Bilingual)
    └── 03_ns_79p_paper/                                          # NS: 6 exact rational verification suites & 6 bilingual analytical reports (Bilingual)
```
