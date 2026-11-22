# Source-Code Structure and Kernel Verification Report on the 13-Million-Line Fermat's Last Theorem (FLT) Lean 4 Repository
# 千万行级费马大定理（FLT）Lean 4 形式化库源码结构与内核复现核查报告

---

## I. Audit Scope and Verification Environment / 核查范围与验证环境

- **Audited Repository / 核查目标仓库**: `https://github.com/anthropics/fermats-last-theorem` (Upstream reported scale: `60,475` modules / `4,598` `.lean` files in the release snapshot, `13,004,119` lines, `29,511` theorems, `1,450` definition modules).
- **Core Upstream Source Files Audited / 重点核查的核心上游源码文件数**: `46` core definition and proof modules along the main Frey–Ribet–Mazur deduction chain.
- **Standalone Lean 4.33.1 Kernel Verification Script / 独立 Lean 4.33.1 内核复现核验脚本**: `lean4_flt_real_kernel_verification.lean` (zero external dependencies, `0 sorry`, `0 axiom`, exit code `0`).

---

## II. Three Structural Phenomena Verified in the Upstream Source Code / 上游源码中核实确认的三大结构现象

### 1. Phenomenon I: Unreferenced Explicit Modularity Parameter (`hmod`) and Internal Contradiction Elimination Inside the Conductor-Level Descent Lemma / 现象一：显式模性假设形参未被消费与导子水平下降引理内部的提前矛盾消去

- **Source Locations / 源码定位**:
  * `P2M/Sol/S_FreyPackage_no_frey_package.lean:139-142`
  * `P2M/Sol/S_FreyPackage_level_lowering_to_two.lean:129-134`
  * `P2M/Sol/S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean:163-170`
  * `Definitions/Def_FLTPrelim_Modularity.lean:98-102`
- **Verified Structural Finding (English)**:
  In `S_FreyPackage_level_lowering_to_two.lean` (lines 129–134), the explicit modularity hypothesis `(hmod : P.freyCurve.IsModular)` passed from `frey_isModular` is preceded by `set_option linter.unusedVariables false in` and has zero free occurrences inside the proof term. Because the existential definition of `IsModular` does not retain the conductor-level radical coupling `P.IsConductorLevel N`, the proof bypasses `hmod` and instead invokes the internal theorem `P.modularRepOfConductorLevel`. Furthermore, inside `S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean` (lines 163–170), strong induction eliminates odd prime factors from the squarefree level $N$ to obtain only $M \mid 2$ ($M \in \{1, 2\}$) without preserving the lower divisibility bound $2 \mid M$. Rather than embedding $S_2(\Gamma_0(1))$ into $S_2(\Gamma_0(2))$, lines 156–170 import both terminal vanishing theorems $S_2(\Gamma_0(1)) = 0$ and $S_2(\Gamma_0(2)) = 0$ inside the level-lowering lemma, derive a local contradiction against $f \neq 0$, and apply `absurd` (ex falso quodlibet) to populate the declared return type `∃ f : CuspForm (Gamma0 2) 2, f ≠ 0`.
- **核实结构结论（中文）**：
  在 `S_FreyPackage_level_lowering_to_two.lean`（第 129–134 行）中，从上游 `frey_isModular` 传入的显式模性假设 `(hmod : P.freyCurve.IsModular)` 通过 `set_option linter.unusedVariables false in` 抑制了未使用变量告警，在证明项中的自由出现次数为 `0`。由于 `IsModular` 的存在量词定义未保留见证水平 $N$ 与导子根基的耦合谓词 `P.IsConductorLevel N`，证明绕开了 `hmod`，转而调用保留导子水平约束的内部定理 `P.modularRepOfConductorLevel`。进一步地，在 `S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean`（第 163–170 行）内部，强归纳在消去奇素因子后仅得到 $M \mid 2$（即 $M \in \{1, 2\}$）而未保持下界条件 $2 \mid M$；为满足水平 $2$ 的声明返回类型，第 156–170 行直接在降水平引理内部提前导入 $S_2(\Gamma_0(1)) = 0$ 与 $S_2(\Gamma_0(2)) = 0$ 两条终局消没定理，与 $f \neq 0$ 构成局部矛盾后调用 `absurd`（爆炸原理）非构造性地导出 `∃ f : CuspForm (Gamma0 2) 2, f ≠ 0`。

### 2. Phenomenon II: Counterfactual Equation Embedded in the Base Structure (`FreyPackage`) and Ex-Falso Discharge of Small-Prime Cofixed-Line Lemmas / 现象二：基础载体结构体内置反事实等式与小素数共不动线引理的爆炸原理消去

- **Source Locations / 源码定位**:
  * `Definitions/Def_FLTPrelim_FreyPackage.lean:12-34`
  * `P2M/Sol/S_FreyPackage_frey_no_cofixed_eleven.lean:14-24`
  * `P2M/Sol/S_FreyPackage_frey_no_cofixed_small.lean:16-29`
  * `P2M/Sol/S_FreyPackage_Mazur_Frey.lean:68-91`
- **Verified Structural Finding (English)**:
  The base structure `FreyPackage` embeds the counterfactual Fermat equality `hFLT : a^p + b^p = c^p` (with $p \ge 5$ and $a,b,c \neq 0$) directly as a structure field, making the carrier type inhabited if and only if a counterexample to Fermat's Last Theorem exists (hence mathematically isomorphic to the empty type $\varnothing$). In `S_FreyPackage_frey_no_cofixed_eleven.lean` (lines 14–24) and `S_FreyPackage_frey_no_cofixed_small.lean` (lines 16–29), the exclusion of a Galois-stable cofixed line (`¬ HasGaloisStableCofixedLine P`) for prime exponents $p \in \{5, 7, 11, 13\}$ is proved not via modular curve isogeny analysis, but by importing standalone fixed-exponent theorems `fermatLastTheoremEleven/Five/Seven/Thirteen`, deducing `P.p ≠ p_0` from `P.hFLT`, and applying `absurd hp` against the branch hypothesis `hp : P.p = p_0`.
- **核实结构结论（中文）**：
  基础载体结构体 `FreyPackage` 将反事实费马等式 `hFLT : a^p + b^p = c^p`（其中 $p \ge 5$ 且 $a,b,c \neq 0$）直接定义为结构体字段，使得该载体类型在数学上同构于空类型 $\varnothing$。在 `S_FreyPackage_frey_no_cofixed_eleven.lean`（第 14–24 行）与 `S_FreyPackage_frey_no_cofixed_small.lean`（第 16–29 行）中，针对小素数指数 $p \in \{5, 7, 11, 13\}$ 排除伽罗瓦稳定共不动线（`¬ HasGaloisStableCofixedLine P`）的证明并未进入模曲线同源几何，而是直接导入外部独立证明的固定指数费马定理 `fermatLastTheoremEleven/Five/Seven/Thirteen`，结合 `P.hFLT` 推出 `P.p ≠ p_0`，再与分支前提 `hp : P.p = p_0` 通过 `absurd hp`（爆炸原理）直接消去目标。

### 3. Phenomenon III: Coordinate-Model Dependence of Raw Integral Weierstrass Predicates Without Minimal-Model Quotient Normalization / 现象三：未作极小模型规范化的整系数 Weierstrass 方程谓词对同构坐标缩放的依赖性

- **Source Locations / 源码定位**:
  * `Definitions/Def_FLTPrelim_Modularity.lean:82-97`
  * `Definitions/Def_FLTPrelim_ModularRep.lean:31-88`
  * `Definitions/Def_WeierstrassCurve_Mlc1RowStatement.lean:9-19`
- **Verified Structural Finding (English)**:
  The reduction predicates `IsGoodPrimeFor` and `IsSemistableModel` are defined directly on raw integral coefficient tuples `W : WeierstrassCurve ℤ` via `¬ (p ∣ W.Delta)` and `(p ∣ W.Delta → ¬ (p ∣ W.c4))` without normalizing to a global minimal Weierstrass model. Under any admissible rational isomorphic coordinate scaling $(x,y) \mapsto (u^2 x, u^3 y)$ with $u \in \mathbb{Z}\setminus\{0, \pm 1\}$ (for instance $u = 2$ on $E_{11}$), the discriminant and $c_4$-invariant scale as $\Delta' = u^{12}\Delta$ and $c_4' = u^4 c_4$, so every prime divisor of $u$ divides both $\Delta'$ and $c_4'$, altering the truth value of the raw equation predicate across isomorphic models of the same elliptic curve over $\mathbb{Q}$.
- **核实结构结论（中文）**：
  局部约化谓词 `IsGoodPrimeFor` 与 `IsSemistableModel` 直接定义在未附加极小模型条件的整系数方程 `W : WeierstrassCurve ℤ` 上（即直接检验 `¬ (p ∣ W.Delta)` 与 `p ∣ W.Delta → ¬ (p ∣ W.c4)`）。在有理数域 $\mathbb{Q}$ 上的同构坐标缩放变换 $(x,y) \mapsto (u^2 x, u^3 y)$（如在 $E_{11}$ 上取 $u = 2$）下，判别式与不变量按 $\Delta' = u^{12}\Delta$ 及 $c_4' = u^4 c_4$ 缩放，导致 $2 \mid \Delta'$ 且 $2 \mid c_4'$，使得同一有理椭圆曲线同构类在不同整系数坐标模型下给出不一致的谓词真值。

---

## III. Exact Arithmetic Verification of Elliptic Curve Specimen $E_{11}$ (Conductor $N=11$) and Pythagorean Triple Models $(3,4,5;\, p=2)$ / 椭圆曲线试件 $E_{11}$（导子 $N=11$）与勾股三模型试件 $(3,4,5;\, p=2)$ 的精确算术核验

1. **Elliptic Curve Specimen $E_{11} : y^2 + y = x^3 - x^2 - 10x - 20$ (Conductor $N = 11$) / 导子 $11$ 椭圆曲线试件 $E_{11}$**:
   - **Minimal Model Invariants / 极小模型不变量**: $\Delta = -161051 = -11^5$, $c_4 = 496 = 16 \times 31$, $c_6 = 20008$, $v_{11}(\Delta) = 5$.
   - **Order-$5$ Rational Torsion Subgroup Trajectory / 5 阶有理挠子群完整群律轨迹**: $P = (5,5)$, $2P = (16,-61)$, $3P = (16,60)$, $4P = (5,-6)$, $5P = \mathcal{O}$ (reducing the mod-$5$ Galois representation $\bar{\rho}_{E_{11},5}$ while $5 \mid v_{11}(\Delta) = 5$).
   - **Isomorphic $u=2$ Scaled Model / $u=2$ 同构缩放模型**: $\Delta' = -659664896 = 2^{12}\Delta$, $c_4' = 7936 = 2^4 c_4$ ($2 \mid \Delta'$ and $2 \mid c_4'$).
   - **Mod-$7$ Frobenius Irreducibility Witness / 模 $7$ Frobenius 不可约性见证**: At $\ell = 2$, $|E_{11}(\mathbb{F}_2)| = 5$, $a_2(E_{11}) = 2 + 1 - 5 = -2$, and the characteristic polynomial $T^2 + 2T + 2 \pmod 7$ evaluates on $\mathbb{F}_7$ to $[2, 5, 3, 3, 5, 2, 1]$ (nowhere zero, while $7 \nmid v_{11}(\Delta) = 5$).
   - **Hecke Eigenvalue Matching / 尖点形式特征值核对**: For all good primes $p \in \{2,3,5,7,13,17,19,23,29\}$, $a_p(E_{11}) = c_p(f_{11})$ and $5 \mid |E_{11}(\mathbb{F}_p)|$.

2. **Three Models of the Pythagorean Triple $(3,4,5;\, p=2)$ / 勾股三元组 $(3,4,5;\, p=2)$ 的三模型区分**:
   - **(i) Raw cubic model / 原始整系数模型** $W_0 : y^2 = x(x-9)(x+16)$: $\Delta(W_0) = 207360000 = 2^{12} \times 50625$, $c_4(W_0) = 7696 = 2^4 \times 481$;
   - **(ii) Rational change-of-variables model / 有理换元模型** $W_{\mathbb{Q}} = (1, 3/2, 0, -9, 0)$: fails integrality at $a_2 = 3/2 \notin \mathbb{Z}$ because $b^2 - a^2 - 1 = 16 - 9 - 1 = 6 \not\equiv 0 \pmod 4$, and its rational invariants $(c_4, c_6, \Delta) = (481, -4879, 50625)$ satisfy $c_6 \equiv 1 \not\equiv 3 \pmod 4$, proving that no $2$-adic integral Weierstrass model can realize them;
   - **(iii) Integer-division truncated model / 整除截断模型** $W_{\mathbb{Z}/} = (1, 1, 0, -9, 0)$: distorts invariants to $\Delta(W_{\mathbb{Z}/}) = 48681$ and $c_4(W_{\mathbb{Z}/}) = 457$, altering the rational $j$-invariant ($481^3 \times 48681 - 457^3 \times 50625 = 585595462896 \neq 0$).

3. **Frey Integral Discriminant Identity Sample at $(p=5, a=3, b=4)$ / Frey 整模型判别式恒等式抽样核验**:
   - $\Delta \cdot 2^8 = \bigl(a^5 b^5 (a^5 + b^5)\bigr)^2 = 99395263697780736$ holds identically.
