# Lean GRH (17.37M Lines), Lean FLT (13.00M Lines) & 79-Page Navier–Stokes Blow-Up Paper: Mathematical Internal Paradoxes, Real-Machine Autopsies & Closed-Form Counterexamples
# 1,737 万行 GRH Lean 4、1,300 万行 FLT Lean 4 与同作者 79 页纳维－斯托克斯（NS）有限时爆破纸面证明：数学内部原理性悖论、真机验尸与闭式反例集

**Quick Jump / 快速跳转**: [English Section](#english-edition) | [中文部分](#中文版) | [Standalone English (`README_EN.md`)](README_EN.md) | [独立中文版 (`README_ZH.md`)](README_ZH.md)

---

<a id="english-edition"></a>

# Mathematical Internal Paradoxes, Real-Machine Autopsies, and Closed-Form Counterexamples for the 17.37M-Line GRH Lean 4 Formalization, 13.00M-Line FLT Lean 4 Formalization, and Co-Author 79-Page Navier–Stokes Finite-Time Blow-Up Paper Proof

**Languages**: **English** | [中文 (`README_ZH.md`)](README_ZH.md) | [Bilingual Combined (`README.md`)](README.md)

---

## Executive Summary

When automated theorem-proving or computer-assisted mathematical campaigns scale to **tens of millions of lines of Lean 4 code** or **scores of pages of dense multi-chart PDE inequalities backed by external numerical certificates**, verifying only the *top-level theorem type signature* or the *open-set smooth bulk derivative formulas* creates a fundamental blind spot: **representation-quotient kernel leakage** ($\ker q \not\subseteq \ker f$). If an intermediate definition, carrier type, or regularity readout $q$ collapses distinct mathematical structures into the same equivalence class—or silently omits a singular boundary/interface functional—then any downstream theorem chain $f$ that depends on the lost invariant either:
1. proves a **semantically distorted proxy statement** that does not entail the classical mathematical theorem (as in the **17,374,215-line Generalized Riemann Hypothesis (GRH)** Lean 4 repository),
2. short-circuits the deep arithmetic-geometric bridge via **degenerate constant definitions and counterfactual premise explosion (*ex falso quodlibet*)** inside intermediate carrier structures (as in the **13,004,119-line Fermat's Last Theorem (FLT)** Lean 4 repository), or
3. drops a **strictly positive singular surface-measure term** across a chart seam in an energy-multiplier integration by parts, allowing explicit closed-form perturbations to violate the claimed coercive inequality (as in the co-author's simultaneously released **79-page Navier–Stokes (NS) finite-time blow-up paper proof**).

This repository provides a complete, self-contained, bilingual (**English** and **Chinese**) mathematical audit, closed-form counterexample suite, and 1-minute reproducible verification package across all three works:

| Part | Audited Target | Upstream Scale & Provenance | English Monograph | Chinese Monograph | Reproduction Bundle |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Part 01** | **Generalized Riemann Hypothesis (GRH)** Lean 4 Formalization | `17,374,215` lines (`175,190` `.lean` files, commit `40e56bab026552e089d7afcfeff08d2defb9c005`) & pruned `16,571,342`-line community edition (`f1f6d654`) | [`en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md`](en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md) | [`zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md`](zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md) | [`reproduction/01_grh_17m_lean/`](reproduction/01_grh_17m_lean/) |
| **Part 02** | **Fermat's Last Theorem (FLT)** Lean 4 Formalization | `13,004,119` lines (`4,598` `.lean` files, `anthropics/fermats-last-theorem`) | [`en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md`](en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md) | [`zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md`](zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md) | [`reproduction/02_flt_13m_lean/`](reproduction/02_flt_13m_lean/) |
| **Part 03** | **Navier–Stokes (NS) Finite-Time Blow-Up** 79-Page Paper Proof | `79` pages PDF (`1,615,293` bytes, commit `ad53419de079eb8f95f60313473374624a348546`, SHA-256 `4a01929b...901`, `tristanbuckmaster/navier-stokes`) | [`en/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md`](en/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md) | [`zh/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md`](zh/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md) | [`reproduction/03_ns_79p_paper/`](reproduction/03_ns_79p_paper/) |

---

## Key Mathematical Findings & Closed-Form Counterexamples

### Part 01: The 17.37-Million-Line GRH Lean 4 Formalization (`01_GRH_17M_Lean`)

1. **Carrier Semantic Distortion vs. Guarded Analytic Continuation (`Scheme 1 & Scheme 2`)**:
   - In Lean 4 / Mathlib (`v4.33.1`), the raw Dirichlet series carrier `LSeries` vanishes identically on its half-plane of divergence ($\operatorname{Re}(s) \le 1 \implies \operatorname{LSeries}(1, s) = 0$, hence $\operatorname{LSeries}(1, 3/4) = 0$ and $(s \mapsto \operatorname{LSeries}(1, s)) \neq \operatorname{riemannZeta}$), while the analytically continued `DirichletCharacter.LFunction` / `ZMod.LFunction` is defined via purely additive Hurwitz zeta linear combinations (`hurwitzZetaEven` / `hurwitzZetaOdd`).
   - Stripping the left critical-strip guard $0 < \operatorname{Re}(s)$ makes the universal critical-line statement provably **false** in Lean 4 (`removing_guard_is_false`), because the modulo-$2$ principal character $L$-function $(1 - 2^{-s})\zeta(s)$ vanishes along the imaginary axis at $s_0 = \frac{2\pi i}{\log 2}$.
2. **Trojan Countermodels in the Same Additive Hurwitz Quotient Fiber (`Scheme 5 & Scheme 6`)**:
   - Any proof architecture whose zero-exclusion functional factors only through the additive Hurwitz linear-combination carrier and functional-equation symmetry without enforcing Euler-product multiplicativity is refuted by explicit **Trojan countermodels** living in the exact same quotient fiber:
     - **Algebraic Trojan polynomial**: $P(s) = (s - 1/2)^2 - 1/16$, symmetric under $s \leftrightarrow 1 - s$ with real off-critical zeros at $s = 3/4$ and $s = 1/4$;
     - **Davenport–Heilbronn countermodel**: satisfies the Hurwitz additive expansion and completed functional equation (`even_completed_reflection`), fails multiplicativity at composite $n = 6$ (`dh_not_multiplicative`), and vanishes at $s = 3/4$ (`even_root`), formally refuting `WeakRule` in Lean 4 (`weak_rule_refuted : ¬WeakRule`).
3. **Full-Environment Declaration-Graph Minimum Vertex Cut & Kernel Bypass Forensics (`Scheme 4`)**:
   - Traversing `env.checked` of `Main` across the entire `17,374,215`-line repository yields **`2,701,132` declarations** and **`170,706,224` directed dependency edges**.
   - The joint dependency cone of the five top-level GRH theorems contains `1,478,243` nodes (`1,072,980` active). A split-node Dinic maximum-flow / minimum-cut computation (independently verified by a zero-import flow certificate checker) proves that the entire 17.37-million-line dependency cone is severed from the core arithmetic definitions by an **exact `8`-vertex minimum internal directed cut**:
     $$\bigl\{\texttt{DirichletCharacter.FactorsThrough},\ \texttt{Formalism.VW.critLine},\ \texttt{Formalism.VW.rh_of_every},\ \texttt{HurwitzZeta.hurwitzZetaEven},\ \texttt{UpperTheory.FinalTheorems.everyCharacter},\ \texttt{ZMod.LFunction},\ \texttt{claimAll},\ \texttt{starRingEnd.\_proof\_2}\bigr\}.$$
   - Furthermore, the dependency cone contains `1,816` declarations across `62 / 66` modules calling the custom metaprogramming tactic `kexactB` (which elaborates with expected type `none` and calls `g.assign` directly without `Meta.isDefEq` guarding) and `23` declarations in the reflexive mutual inductive blocks `PrincipalizationCertificate` and `OrderCertificate` that trigger exit code `2` under the standalone external kernel checkers `con-leche` and `con-ron`.

---

### Part 02: The 13.00-Million-Line FLT Lean 4 Formalization (`02_FLT_13M_Lean`)

1. **Degenerate Modularity Encoding & Constant Conductor Collapse (`Defs_ModularityPrep.lean`, `Defs_ConductorLevel.lean`)**:
   - In `anthropics/fermats-last-theorem`, a modular newform (`Newform`) is defined not as an automorphic eigenform on $\Gamma_0(N)$, but as a **3-integer record** `(level : Nat, weight : Nat, eigenSeed : Int)` with `weight = 2` (`Defs_ModularityPrep.lean:82-93`).
   - The modularity predicate `IsModular E p` (`Defs_ModularityPrep.lean:101-102`) does not reference any coefficient, discriminant, or Frobenius trace of the elliptic curve $E$; it reduces logically to $p \ge 2 \land \exists N \ge 1, N \equiv 0 \pmod{2}$, which holds trivially for **every** curve $E$ via the fixed witness $N = 2$ and $f = \langle 2, 2, 0\rangle$.
   - Consequently, `ConductorLevel E` (`Defs_ConductorLevel.lean:12-26`, defined via `Classical.choose` on `IsModular E 2`) collapses identically to the constant `2` for every curve $E$ (`conductorLevel_eq_two`), reducing Ribet's level-lowering theorem (`S_FreyPackage_level_lowering_to_two.lean:129-134`) to a zero-step identity substitution $2 = 2$ while asserting a nonempty `Newform 2` in direct conflict with the classical theorem $\dim_{\mathbb{C}} S_2(\Gamma_0(2)) = 0$.
2. **Decoupled `FreyPackage` Carrier & Counterfactual Premise Explosion in `Mazur_Frey` (`Defs_FreyPackage.lean`, `S_FreyPackage_Mazur_Frey.lean`)**:
   - The carrier structure `FreyPackage` (`Defs_FreyPackage.lean:12-44`) bundles a Fermat counterexample tuple `(a, b, c, p)` satisfying `hFlt : a^p + b^p = c^p` alongside a curve field `E : WeierstrassCurve` and a proxy representation `galoisRep : Nat → Int`, **without any field connecting `E` to $Y^2 = X(X-a^p)(X+b^p)$ or connecting `galoisRep` to $E[p]$**.
   - In `FreyPackage.Mazur_Frey` (`S_FreyPackage_Mazur_Frey.lean:68-91`), the theorem states that `cofixed P.p P.galoisRep` implies $P.p \in \{2,3,5,7,11,13,17,19\}$. Yet the proof body **never reads `P.galoisRep` (`_h`)**! Instead, for each prime exponent (e.g., $p = 3, 5, 7, 11$), it dispatches directly to pre-imported small-exponent Fermat theorems (`flt_three`, `flt_five`, `flt_seven`, `flt_eleven`) applied to `P.hFlt : a^p + b^p = c^p`, deriving `False` by *ex falso quodlibet*!
   - Our standalone Lean 4 probe (`lean4_flt_real_kernel_verification.lean`) mechanically proves that if $(a,b,c) = (2,-1,1)$ or $(1,0,1)$ at $p = 23$ with constant representation $\mathrm{galoisRep}(n) = 1$, `Mazur_Frey` is **strictly false** (`mazur_frey_false_on_non_diophantine_witness`).
3. **Why Surface Statement Comparators Miss Intermediate Semantic Collapse**:
   - The repository's `verification/comparator/Challenge.lean` checks only the final top-level type signature of `fermats_last_theorem`, leaving the intermediate algebraic-geometric definitions (`Newform`, `IsModular`, `ConductorLevel`, `FreyPackage`, `galoisRep`) completely uninspected.

---

### Part 03: The Co-Author 79-Page Navier–Stokes Finite-Time Blow-Up Paper Proof (`03_NS_79p_Paper`)

1. **Equatorial Interface Singular Measure Kernel Leak in Proposition B.1 / Inequality (B.20) (Pages 47–57)**:
   - In the 79-page paper *Finite-time blow-up for the Navier–Stokes equations* (Levent Alpöge & Tristan Buckmaster, 2026-11-20), the coercive energy-multiplier inequality **(B.20)** of Proposition B.1 uses multiplier weights $D, Z$ represented in half-space charts $y_3 > 0$ and $y_3 < 0$ via compactified coordinates $\sigma = \frac{|y|}{1+|y|}$ and $\eta = \frac{y_3}{|y|}$ (with $|\eta| = \frac{|y_3|}{|y|}$ on page 47).
   - If a continuous, $y_3$-even weight $W \in \{D, Z\}$ is $C^2$ on each open half-space $\mathbb{R}_+^3$ and $\mathbb{R}_-^3$ without enforcing first-order normal-derivative vanishing across the equatorial seam $\Sigma = \{y_3 = 0\}$, its true distributional Hessian on $\mathbb{R}^3$ is a Radon measure with a non-vanishing **Dirac surface-measure tensor** on $\Sigma$:
     $$D^2 W = H_{W,\mathrm{bulk}}\,dy + [\partial_z W]_\Sigma\,(e_3 \otimes e_3)\,dS_{z=0}, \qquad [\partial_z W]_\Sigma(r) = \frac{2}{r}\partial_{|\eta|}W(\sigma, 0^+).$$
   - Reading only the open-set bulk Hessian $H_{W,\mathrm{bulk}}$ (`q_bulk`) drops the strictly non-negative equatorial surface integral (`\Sigma_W \in \ker q_{\mathrm{bulk}} \setminus \ker f_v`).
2. **Two Independent Closed-Form Counterexample Families Shattering Weak (B.20)**:
   - **Closed-Form Counterexample Family A ($D$-weight seam, compactly supported $C_c^2$ axisymmetric divergence-free perturbation $v_\varepsilon$)**:
     With $D_\pm(y) = \frac{1}{2} \pm \frac{1}{4}\chi(\sigma)|\eta|$, polynomial profile $a(t) = (1-t^2)_+^4$ ($A = \int_{-1}^1 a'(s)^2\,ds = \frac{131072}{45045}$, $K = \frac{43936}{81}$), and $\varepsilon = 2^{-16} = \frac{1}{65536}$, inequality (B.20) (which requires $E_D(v) := \mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}} \le 0$) is strictly violated with the **exact rational margin**:
     $$E_{D_+}(v_\varepsilon) \ge \frac{\pi}{65536}\cdot\frac{633509743}{432432000} > 0,$$
     while under the reduced Hessian-norm readout $q_{\mathrm{red}}$, $q_{\mathrm{red}}(D_+) = q_{\mathrm{red}}(D_-)$ yet $E_{D_+}(v_\varepsilon) - E_{D_-}(v_\varepsilon) \ge \frac{\pi}{32768}\cdot\frac{633509743}{432432000} > 0$. (Replacing $a(t)$ by $C_c^\infty$ bump $a_\infty(t) = \exp(1 - (1-t^2)^{-1})\mathbf{1}_{|t|<1}$ at $\varepsilon = 10^{-15}$ likewise gives $E_{D_+}(v_\varepsilon) \ge \frac{4\pi}{9}\times 10^{-15} > 0$.)
   - **Closed-Form Counterexample Family B ($Z$-weight seam, Schwartz Gaussian divergence-free mode-$\pm(2,1)$ perturbation)**:
     With $C_6 + i S_6 = (x+iy)^6$, $g = \exp(-(x^2+y^2)/2 - 6z^2)$, $v = g(-2zyC_6, 2zxC_6, -S_6) \in \mathcal{S}(\mathbb{R}^3) \cap \mathcal{D}_S^\Gamma$ ($\operatorname{div} v \equiv 0$, $\|\nabla v\|_{L^2}^2 = 14880\frac{\pi^{3/2}}{2\sqrt{3}}$, $\|\Delta v\|_{L^2}^2 = 431280\frac{\pi^{3/2}}{2\sqrt{3}}$, $\mathrm{LHS}_{\mathrm{B.20}} = \frac{51053352}{125}\frac{\pi^{3/2}}{2\sqrt{3}}$), and $Z = c P(\sigma)|\eta|$ ($c > 0$), the surface integral $A_0 = \frac{10395}{64}\pi^{3/2}c$ strictly dominates the exterior bulk loss $80\pi^{3/2}c = \frac{5120}{64}\pi^{3/2}c$, yielding the purely analytical violation bound:
     $$\frac{\mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}}}{c} \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} > \frac{26311}{64} > 400 > 0.$$
3. **The $O(\delta^{-1})$ Collar Curvature-Tax Conservation Law, Unreleased Certificate Hash, and True-Body vs. Artifact Separation**:
   - Smoothing $|\eta|$ across an equatorial collar $|\eta| \le \delta$ via the unique even $C^2$ quartic spline $s_\delta(\eta) = \frac{3\delta}{8} + \frac{3\eta^2}{4\delta} - \frac{\eta^4}{8\delta^3}$ (matching the global `ContDiff R 2` / `(-1)^o` parity join in the authors' Lean files `CellLayerChallenge.lean:2372-2378, 2505, 2509` and `ExtendedCoerciveChallenge.lean:322-323`) removes the surface jump $[\partial_z W]_\Sigma = 0$, **but** converts the singular mass into an invariant bulk normal-curvature tax $\int_{-\delta}^{\delta} s_\delta''(\eta)\,d\eta = 2$ with peak $\max_{|\eta|\le\delta} s_\delta''(\eta) = \frac{3}{2\delta} = O(\delta^{-1})$.
   - Because the paper's computer-assisted certificate witness on pages 38–39 is **not published** in the repository (represented only by SHA-256 hash `3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5`) and the paper omits the derivations/coefficients of (B.16), Proposition B.1, Proposition B.4, and the page-70 bootstrap bounds, the $O(\delta^{-1})$ collar curvature tax cannot be verified from the 79-page text.
   - Finally, for the true 3D Navier–Stokes dynamics on $\mathbb{T}^3$, the explicit 4-mode divergence-free twin initial data $u_0^\pm = \pm 17 U$ prove that any static Euclidean spectral readout $q_{\mathrm{full}}$ is sign-blind to cubic vortex stretching ($q_{\mathrm{full}}(u_0^+) = q_{\mathrm{full}}(u_0^-)$ while $Y_+'(0) - Y_-'(0) = \frac{289}{2} - (-\frac{9537}{2}) = 4913 \neq 0$), whereas a comoving covariant inverse metric $g = C^{-1}$ ($z = C^{-1}\omega$) converts the indefinite static Hessian cross-term into pure-square viscous dissipation $-2\nu\sum_{i=1}^3 (\partial_i z)^T C (\partial_i z) \le 0$.

---

## Repository Structure

```text
.
├── README.md                                                     # Combined Bilingual Top-Level README (English + Chinese)
├── README_EN.md                                                  # Standalone English Top-Level README
├── README_ZH.md                                                  # Standalone Chinese Top-Level README
├── CITATION.cff                                                  # GitHub / Zenodo Citation File Format metadata
├── .zenodo.json                                                  # Zenodo Permanent Academic DOI metadata
├── en/                                                           # Complete English Monographs (3 Parts)
│   ├── 01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md                 # Part 01: 17.37M-Line GRH Lean 4 Paradox & Autopsy (English)
│   ├── 02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md                 # Part 02: 13.00M-Line FLT Lean 4 Paradox & Autopsy (English)
│   └── 03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md     # Part 03: 79-Page NS Paper Kernel Leak & Counterexamples (English)
├── zh/                                                           # Complete Chinese Monographs (3 Parts)
│   ├── 01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md                 # Part 01: 17.37M-Line GRH Lean 4 Paradox & Autopsy (Chinese)
│   ├── 02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md                 # Part 02: 13.00M-Line FLT Lean 4 Paradox & Autopsy (Chinese)
│   └── 03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md     # Part 03: 79-Page NS Paper Kernel Leak & Counterexamples (Chinese)
└── reproduction/                                                 # Self-Contained Reproducible Verification Bundles
    ├── 01_grh_17m_lean/                                          # Lean 4 Scheme 1..6 probes, 2.70M-node min-cut verifier & JSONs
    ├── 02_flt_13m_lean/                                          # Self-contained Lean 4 FLT kernel counterexample probe & report
    └── 03_ns_79p_paper/                                          # Zero-dependency exact rational NS counterexample verifier & autopsy
```

---

## 1-Minute Reproducible Verification Guide

### 1. Reproduce Part 01 (17.37M-Line GRH Lean 4 Minimum Vertex Cut Certificate & Probes)

Verify the `8`-vertex minimum directed cut certificate across the `2,701,132`-node / `170,706,224`-edge declaration dependency graph (requires only Python 3 standard library):

```bash
python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py
```

If Lean 4 (`v4.33.1`) with Mathlib is installed, compile the six self-contained mathematical & Trojan countermodel probes (`AutopsyProbe_Scheme1.lean` through `AutopsyProbe_Scheme6.lean`):

```bash
# Inside a Lean 4 + Mathlib v4.33.1 environment:
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme1.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme5.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme6.lean
```

### 2. Reproduce Part 02 (13.00M-Line FLT Lean 4 Kernel Paradox & Counterexample Probe)

Compile the zero-dependency standalone Lean 4 kernel verification file (`0 sorry`, `0 axiom`, requires only core Lean 4 without Mathlib):

```bash
lean reproduction/02_flt_13m_lean/lean4_flt_real_kernel_verification.lean
```

### 3. Reproduce Part 03 (79-Page Navier–Stokes Paper Closed-Form Counterexamples & Exact Rational Moments)

Run the zero-dependency Python 3 exact rational verification script (`fractions.Fraction` only, finishes in `< 0.1` seconds with exit code `0`):

```bash
python3 -B reproduction/03_ns_79p_paper/verify_ns_counterexamples.py
```

---

## Academic Citation & Permanent Archiving

This repository is linked with **Zenodo** for permanent academic DOI and timestamp preservation. Please see [`CITATION.cff`](CITATION.cff) and [`.zenodo.json`](.zenodo.json) for structured citation metadata.


---

<a id="中文版"></a>

# 1,737 万行 GRH Lean 4 形式化、1,300 万行 FLT Lean 4 形式化与同作者 79 页纳维－斯托克斯（NS）方程有限时爆破纸面证明的数学内部原理性悖论、真机验尸与闭式反例集

**语言版本**：[English (`README_EN.md`)](README_EN.md) | **中文** | [中英双语合订本 (`README.md`)](README.md)

---

## 核心总览

当自动化定理证明或计算机辅助数学工程膨胀至**上千万行 Lean 4 代码**或**近百页分片坐标偏微分方程（PDE）加权乘子不等式加外部数值证书**时，若仅核验“**最顶层定理的表层类型签名**”或“**开集内部的光滑体积导数公式**”，就会在第一性原理下暴露出最致命的共性盲区——**表示商空间核漏**（$\ker q \not\subseteq \ker f$）。一旦中间层定义、底层类型载体或正则性观测读口 $q$ 将具有本质差异的数学结构折叠进同一个等价类，或者在跨坐标图像接缝处静默丢弃了奇异边界／界面泛函，则依赖该被抹平不变量的下游定理链 $f$ 必然发生以下三类原理性崩塌之一：
1. **载体语义失真与无乘性商纤维坍缩**：证明的只是一个语义走样的代理命题，无法蕴涵经典数学定理，且其排零规则被同一加法商纤维内的特洛伊反模型直接击穿（如 **17,374,215 行广义黎曼猜想 GRH** Lean 4 仓库）；
2. **中间层常数坍缩与反事实假前提爆炸（*Ex Falso Quodlibet*）**：将深层算术几何对象退化为与曲线无关的常数记录，并在中间结构载体中焊入反事实假前提 $a^p + b^p = c^p$，从而不读取伽罗瓦表示便借初等小指数费马反证分支直接“爆炸”出结论（如 **13,004,119 行费马大定理 FLT** Lean 4 仓库）；
3. **跨坐标图像接缝的狄拉克（Dirac）奇异界面测度逃逸**：在分片半空间加权分部积分中仅读取开集体积海森（Hessian）矩阵而丢弃赤道接缝平面 $y_3 = 0$ 上严格正定的奇异面测度项，导致显式闭式无散扰动场严格击穿其核心强制性不等式（如同作者同时放出的 **79 页纳维－斯托克斯 NS 方程有限时爆破纸面证明**）。

本仓库完整公开针对上述三大标的的**中英文双语数学内部原理性批驳专著**、**纯闭式解析／有理数反例族**与**一分钟一键真机复现证据包**：

| 组成部分 | 审计与反例标的 | 上游规模与固定溯源标识 | 英文版专著 | 中文版专著 | 一键复现证据包 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **第一部分 (`Part 01`)** | **广义黎曼猜想（GRH）** 1,737 万行 Lean 4 形式化 | 原版 `17,374,215` 行（`175,190` 个 `.lean` 文件，提交 `40e56bab026552e089d7afcfeff08d2defb9c005`）及社区删改版 `16,571,342` 行（`f1f6d654`） | [`en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md`](en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md) | [`zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md`](zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md) | [`reproduction/01_grh_17m_lean/`](reproduction/01_grh_17m_lean/) |
| **第二部分 (`Part 02`)** | **费马大定理（FLT）** 1,300 万行 Lean 4 形式化 | `13,004,119` 行（`4,598` 个 `.lean` 文件，`anthropics/fermats-last-theorem`） | [`en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md`](en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md) | [`zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md`](zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md) | [`reproduction/02_flt_13m_lean/`](reproduction/02_flt_13m_lean/) |
| **第三部分 (`Part 03`)** | **纳维－斯托克斯（NS）方程有限时爆破** 79 页纸面证明 | `79` 页 PDF 原件（`1,615,293` 字节，提交 `ad53419de079eb8f95f60313473374624a348546`，SHA-256 `4a01929b...901`，`tristanbuckmaster/navier-stokes`） | [`en/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md`](en/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md) | [`zh/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md`](zh/03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md) | [`reproduction/03_ns_79p_paper/`](reproduction/03_ns_79p_paper/) |

---

## 三大标的的核心数学发现与闭式反例总览

### 第一部分：1,737 万行广义黎曼猜想（GRH）Lean 4 形式化 (`01_GRH_17M_Lean`)

1. **底层级数载体截断失真与带守卫解析延拓边界（方案一 & 方案二）**：
   - 在 Lean 4 / Mathlib (`v4.33.1`) 中，原始狄利克雷级数载体 `LSeries` 在发散半平面 $\operatorname{Re}(s) \le 1$ 上因条件可和守卫失败被硬编码賦值为恒零（`raw_zero`：$\operatorname{Re}(s) \le 1 \implies \operatorname{LSeries}(1, s) = 0$，从而 $\operatorname{LSeries}(1, 3/4) = 0$ 且 $(s \mapsto \operatorname{LSeries}(1, s)) \neq \operatorname{riemannZeta}$）；而目标库主定理实际使用的 `DirichletCharacter.LFunction` / `ZMod.LFunction` 则是按模周期展开的纯加法 Hurwitz $\zeta$ 线性组合（`hurwitzZetaEven` / `hurwitzZetaOdd`）。
   - 一旦剥离临界带左边界守卫 $0 < \operatorname{Re}(s)$，全称临界线命题在 Lean 4 内直接**机器可证为假**（`removing_guard_is_false`），因为模 $2$ 主特征 $L$ 函数 $(1 - 2^{-s})\zeta(s)$ 在虚轴 $s_0 = \frac{2\pi i}{\log 2}$ 处拥有由欧拉局部因子 $(1 - 2^{-s})$ 产生的真实零点（`axis_principal_zero`）。
2. **同一加法 Hurwitz 商纤维内的特洛伊（Trojan）反模型对撞（方案五 & 方案六）**：
   - 任何仅通过“纯加法 Hurwitz 线性组合载体＋函数方程反射对称性”因子化、而未在排零泛函中强制锁定欧拉乘积乘性的证明架构，均被落在同一商纤维内的显式**特洛伊反模型**严格证伪：
     - **代数特洛伊多项式**：$P(s) = (s - 1/2)^2 - 1/16$，满足 $s \leftrightarrow 1 - s$ 反射对称，但在 $s = 3/4$ 与 $s = 1/4$ 处拥有严格偏离临界线的实零点；
     - **Davenport–Heilbronn 反模型**：满足完整的模周期 Hurwitz 加法展开与完备化函数方程反射对称（`even_completed_reflection`），在复合数 $n = 6$ 处破缺乘性（`dh_not_multiplicative`），并在 $s = 3/4 \neq 1/2$ 处严格为零（`even_root`），在 Lean 4 内形式证伪弱排零规则 `WeakRule`（`weak_rule_refuted : ¬WeakRule`）并导出 `WeakRule → (3/4 : ℝ) = 1/2` 与 `WeakRule → (0 : ℤ) = 1`。
3. **全环境 270 万节点声明依赖图最小有向顶点割与内核绕过取证（方案四）**：
   - 遍历原版 `17,374,215` 行仓库 `Main` 的已检查环境 `env.checked`，精确导出 **`2,701,132` 个声明节点**与 **`170,706,224` 条有向依赖边**。
   - 五大顶层 GRH 主定理的联合依赖锥包含 `1,478,243` 个节点（`1,072,980` 个活跃内部节点）。拆点最大流／最小割算法（经零导入独立最大流证书校验器 `verify_graph_certificate.py` 校验 `VERIFIED`）证明：整个 1,737 万行依赖锥与底层算术定义之间存在一个**容量严格为 `8` 的最小内部有向顶点割**：
     $$\bigl\{\texttt{DirichletCharacter.FactorsThrough},\ \texttt{Formalism.VW.critLine},\ \texttt{Formalism.VW.rh_of_every},\ \texttt{HurwitzZeta.hurwitzZetaEven},\ \texttt{UpperTheory.FinalTheorems.everyCharacter},\ \texttt{ZMod.LFunction},\ \texttt{claimAll},\ \texttt{starRingEnd.\_proof\_2}\bigr\}.$$
   - 同时，主定理依赖锥内嵌有 `62 / 66` 个调用自定义元编程策略 `kexactB` 的模块（共 `1,816` 个入锥声明；该策略以 `expectedType := none` 绕过前端期望类型统一并直接调用 `g.assign`）以及触发外部独立内核检查器 `con-leche` / `con-ron` 退出码 `2` 的自指互归纳块 `PrincipalizationCertificate`（`11` 个入锥声明）与 `OrderCertificate`（`12` 个入锥声明）。

---

### 第二部分：1,300 万行费马大定理（FLT）Lean 4 形式化 (`02_FLT_13M_Lean`)

1. **退化模性编码与导子水平恒等于 `2` 的常数坍缩（`Defs_ModularityPrep.lean`, `Defs_ConductorLevel.lean`）**：
   - 在 `anthropics/fermats-last-theorem`（`4,598` 个 `.lean` 文件，共 `13,004,119` 行）中，尖点新形式 `Newform` 并未被定义为 $\Gamma_0(N)$ 上的全纯自守特征形式，而是被定义为一个**三元整数记录** `(level : Nat, weight : Nat, eigenSeed : Int)`（附加 `weight = 2`，见 `Defs_ModularityPrep.lean:82-93`）。
   - 模性谓词 `IsModular E p`（`Defs_ModularityPrep.lean:101-102`）完全不读取椭圆曲线 $E$ 的任何系数、判别式或 Frobenius 迹，其逻辑充要条件恒等价于 $p \ge 2 \land \exists N \ge 1, N \equiv 0 \pmod{2}$（`isModular_degenerate_iff`），对**任意**椭圆曲线 $E$ 均由固定平凡见证 $N = 2, f = \langle 2, 2, 0\rangle$ 恒真（`isModular_true_for_all_curves`）。
   - 由此，通过 `Classical.choose` 定义的导子水平算子 `ConductorLevel E`（`Defs_ConductorLevel.lean:12-26`）对**一切**椭圆曲线 $E$ 恒塌缩为常数 `2`（`conductorLevel_eq_two`）！目标库中本应承担核心算术桥梁的 Ribet 降水平定理（`S_FreyPackage_level_lowering_to_two.lean:129-134`）直接退化为沿 $2 = 2$ 的零步恒等代换（`level_lowering_to_two_is_trivial`），并给出非空 `Newform 2`，与经典数学定理 $\dim_{\mathbb{C}} S_2(\Gamma_0(2)) = 0$ 正面冲突。
2. **`FreyPackage` 载体与丢番图解完全解耦，以及 `Mazur_Frey` 中的假前提爆炸捷径（`Defs_FreyPackage.lean`, `S_FreyPackage_Mazur_Frey.lean`）**：
   - 核心载体 `FreyPackage`（`Defs_FreyPackage.lean:12-44`）虽同时打包了满足 `hFlt : a^p + b^p = c^p` 的整数组 `(a, b, c, p)`、曲线字段 `E : WeierstrassCurve` 以及表示代理 `galoisRep : Nat → Int`，但**没有任何字段要求 `E` 等于 Frey 曲线 $Y^2 = X(X-a^p)(X+b^p)$，也没有任何字段将 `galoisRep` 与 $E[p]$ 或 Frobenius 迹关联**（`freyCurve_independent_of_abc`）。
   - 更致命的是，在 `FreyPackage.Mazur_Frey`（`S_FreyPackage_Mazur_Frey.lean:68-91`）中，定理声称由伽罗瓦表示不动点条件 `cofixed P.p P.galoisRep` 可推出指数 $P.p \in \{2,3,5,7,11,13,17,19\}$。然而其证明体**根本没有读取伽罗瓦表示假设 `_h : cofixed ...`**！相反，它对小素数指数（如 $p = 3, 5, 7, 11$）直接调用仓库内预先写好的具体小指数初等／分圆费马定理（`flt_three`, `flt_five`, `flt_seven`, `flt_eleven`）去轰击结构体自带的假前提 `P.hFlt : a^p + b^p = c^p`，借假前提爆炸（*Ex Falso Quodlibet*）直接导出任意结论！
   - 我们的零依赖 Lean 4 内核探针（`lean4_flt_real_kernel_verification.lean`）在真机上机械证出：取 $p = 23$ 及常值表示 $\mathrm{galoisRep}(n) = 1$，`Mazur_Frey` 的结论直接为 `False`（`mazur_frey_false_on_non_diophantine_witness`）。
3. **表层签名比对器为何彻底失明**：
   - 目标仓库自带的 `verification/comparator/Challenge.lean` 仅比对最顶层定理 `fermats_last_theorem` 的表层语句签名，对中间层 `Newform`、`IsModular`、`ConductorLevel`、`FreyPackage` 与 `galoisRep` 的算术几何塌缩零语义审查。

---

### 第三部分：同作者 79 页纳维－斯托克斯（NS）方程有限时爆破纸面证明 (`03_NS_79p_Paper`)

1. **命题 B.1 / 核心不等式 (B.20) 跨赤道平面 $y_3 = 0$ 的奇异界面测度核漏（PDF 第 47–57 页）**：
   - 在与 GRH 宣称同作者（Levent Alpöge & Tristan Buckmaster，2026-11-20）同时放出的 79 页论文 *Finite-time blow-up for the Navier–Stokes equations* 中，命题 B.1 的核心加权能量－乘子不等式 **(B.20)** 使用了在上下半空间 $y_3 > 0$ 与 $y_3 < 0$ 中以紧化坐标 $\sigma = \frac{|y|}{1+|y|}$、$\eta = \frac{y_3}{|y|}$（第 47 页含 $|\eta| = \frac{|y_3|}{|y|}$）分片表示的样条权函数 $D, Z$。
   - 若连续偶对称权函数 $W \in \{D, Z\}$ 仅满足各开半空间 $\mathbb{R}_+^3$ 与 $\mathbb{R}_-^3$ 上的分侧 $C^2$ 正则性而未强制跨赤道接缝平面 $\Sigma = \{y_3 = 0\}$ 的一阶法向导数归零，则其在全空间 $\mathbb{R}^3$ 上的真实分布海森算子包含赤道平面上非零的**狄拉克（Dirac）奇异面测度张量**：
     $$D^2 W = H_{W,\mathrm{bulk}}\,dy + [\partial_z W]_\Sigma\,(e_3 \otimes e_3)\,dS_{z=0}, \qquad [\partial_z W]_\Sigma(r) = \frac{2}{r}\partial_{|\eta|}W(\sigma, 0^+).$$
   - 仅读取开集体积海森矩阵 $H_{W,\mathrm{bulk}}$ 的读口 $q_{\mathrm{bulk}}$ 直接将严格正定的赤道界面奇异积分漏入核空间（$\Sigma_W \in \ker q_{\mathrm{bulk}} \setminus \ker f_v$）。
2. **两族完全独立的纯闭式解析反例严格击穿弱合同版 (B.20)**：
   - **闭式反例族 A（二阶权 $D$ 接缝＋紧支集 $C_c^2$ 轴对称无散扰动场 $v_\varepsilon$ 的精确有理破坏裕量与双模型分离）**：
     取分侧 $C^2$ 双权函数 $D_\pm(y) = \frac{1}{2} \pm \frac{1}{4}\chi(\sigma)|\eta|$、多项式母函数 $a(t) = (1-t^2)_+^4$（一维精确有理矩 $A = \int_{-1}^1 a'(s)^2\,ds = \frac{131072}{45045}$，五分量柱坐标梯度平方上界 $K = \frac{43936}{81}$）及 $\varepsilon = 2^{-16} = \frac{1}{65536}$，命题 B.1 不等式 (B.20)（原命题要求 $E_D(v) := \mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}} \le 0$）被 $D_+$ 严格击穿，其**精确闭式有理下界**为：
     $$E_{D_+}(v_\varepsilon) \ge \frac{\pi}{65536}\cdot\frac{633509743}{432432000} > 0;$$
     同时在简化海森范数读口 $q_{\mathrm{red}}$ 下，$q_{\mathrm{red}}(D_+) = q_{\mathrm{red}}(D_-)$，但输出发生一正一负的严格对称撕裂 $E_{D_+}(v_\varepsilon) - E_{D_-}(v_\varepsilon) \ge \frac{\pi}{32768}\cdot\frac{633509743}{432432000} > 0$。（若换为 $C_c^\infty$ 光滑隆起函数 $a_\infty(t) = \exp(1 - (1-t^2)^{-1})\mathbf{1}_{|t|<1}$ 并取 $\varepsilon = 10^{-15}$，同样有 $E_{D_+}(v_\varepsilon) \ge \frac{4\pi}{9}\times 10^{-15} > 0$。）
   - **闭式反例族 B（一阶权 $Z$ 接缝＋施瓦茨高斯无散 $\pm(2,1)$ 模态扰动场的 $> 400c$ 严格破坏下界）**：
     取 $C_6 + i S_6 = (x+iy)^6$、$g = \exp(-(x^2+y^2)/2 - 6z^2)$、三维无散施瓦茨场 $v = g(-2zyC_6, 2zxC_6, -S_6) \in \mathcal{S}(\mathbb{R}^3) \cap \mathcal{D}_S^\Gamma$（$\operatorname{div} v \equiv 0$，$\|\nabla v\|_{L^2}^2 = 14880\frac{\pi^{3/2}}{2\sqrt{3}}$，$\|\Delta v\|_{L^2}^2 = 431280\frac{\pi^{3/2}}{2\sqrt{3}}$，$\mathrm{LHS}_{\mathrm{B.20}} = \frac{51053352}{125}\frac{\pi^{3/2}}{2\sqrt{3}}$）及分侧 $C^2$ 权 $Z = c P(\sigma)|\eta|$（$c > 0$），赤道奇异面积分 $A_0 = \frac{10395}{64}\pi^{3/2}c$ 严格压倒外部体积海森损失 $80\pi^{3/2}c = \frac{5120}{64}\pi^{3/2}c$，给出纯解析下界：
     $$\frac{\mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}}}{c} \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} > \frac{26311}{64} > 400 > 0.$$
3. **强接合修复下的 $O(\delta^{-1})$ 薄层曲率税守恒律、未公开证书哈希悬空与流体真体／伪影分离**：
   - 若按作者仓库 Lean 源码（`CellLayerChallenge.lean:2372-2378, 2505, 2509` 的 `(-1)^o` 跨面拼接与 `ExtendedCoerciveChallenge.lean:322-323` 的全空间 `ContDiff R 2`）在赤道薄层 $|\eta| \le \delta$ 内用偶四次 $C^2$ 样条 $s_\delta(\eta) = \frac{3\delta}{8} + \frac{3\eta^2}{4\delta} - \frac{\eta^4}{8\delta^3}$ 磨平 $|\eta|$，虽消除了面跳跃 $[\partial_z W]_\Sigma = 0$，但奇异质量一分不差地转化为薄层内守恒的法向曲率税 $\int_{-\delta}^{\delta} s_\delta''(\eta)\,d\eta = 2$，且海森峰值呈 $\max_{|\eta|\le\delta} s_\delta''(\eta) = \frac{3}{2\delta} = O(\delta^{-1})$ 奇异激增。
   - 由于论文第 38–39 页声明的计算机辅助数值证书本体在公开仓库中**完全未发布**（仅给出一串 SHA-256 哈希 `3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5`），且正文省略了 (B.16)、命题 B.1、命题 B.4 与第 70 页自举常数的推导与系数表，该 $O(\delta^{-1})$ 薄层曲率税在 79 页纸面文本内无法核验。
   - 最后，回到真实三维不可压 NS 动力学，$\mathbb{T}^3$ 上显式四模态无散双初值 $u_0^\pm = \pm 17 U$ 证明：任何静态欧氏谱读口 $q_{\mathrm{full}}$ 对三次涡拉伸项均存在本质符号盲区（$q_{\mathrm{full}}(u_0^+) = q_{\mathrm{full}}(u_0^-)$，而初始拟涡能导数分裂为 $Y_+'(0) - Y_-'(0) = \frac{289}{2} - (-\frac{9537}{2}) = 4913 \neq 0$）；唯有切口对齐随流协变逆度量 $g = C^{-1}$（$z = C^{-1}\omega$），才能将静态海森不定交叉项化为纯平方粘性耗散 $-2\nu\sum_{i=1}^3 (\partial_i z)^T C (\partial_i z) \le 0$。

---

## 仓库目录结构

```text
.
├── README.md                                                     # 中英双语合订顶层 README（上半部英文，下半部中文）
├── README_EN.md                                                  # 独立英文版顶层 README
├── README_ZH.md                                                  # 独立中文版顶层 README
├── CITATION.cff                                                  # GitHub / Zenodo 标准学术引用元数据
├── .zenodo.json                                                  # Zenodo 永久学术 DOI 归档元数据
├── en/                                                           # 英文版完整数学专著（共三卷）
│   ├── 01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md                 # 第一部分：1,737 万行 GRH Lean 4 悖论与真机验尸（英文）
│   ├── 02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md                 # 第二部分：1,300 万行 FLT Lean 4 悖论与真机验尸（英文）
│   └── 03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md     # 第三部分：79 页 NS 纸面证明核漏与闭式反例（英文）
├── zh/                                                           # 中文版完整数学专著（共三卷）
│   ├── 01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md                 # 第一部分：1,737 万行 GRH Lean 4 悖论与真机验尸（中文）
│   ├── 02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md                 # 第二部分：1,300 万行 FLT Lean 4 悖论与真机验尸（中文）
│   └── 03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md     # 第三部分：79 页 NS 纸面证明核漏与闭式反例（中文）
└── reproduction/                                                 # 自足可复现验证与取证证据包
    ├── 01_grh_17m_lean/                                          # GRH 六大 Lean 4 探针、270 万节点最小割独立校验器与 JSON 档案
    ├── 02_flt_13m_lean/                                          # FLT 零依赖自足 Lean 4 内核反例验证探针与真机验尸总账
    └── 03_ns_79p_paper/                                          # NS 零依赖 Python 3 精确有理数反例核验脚本与原件验尸报告
```

---

## 一分钟极速复现指南

### 1. 复现第一部分（1,737 万行 GRH Lean 4 全图 8 顶点最小割证书校验与六大探针）

使用零外部依赖的 Python 3 独立证书校验器核验 `2,701,132` 节点 / `170,706,224` 边声明图上的 `8` 顶点最小有向割证书：

```bash
python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py
```

在配置有 Lean 4 (`v4.33.1`) 与 Mathlib 的环境中，可直接编译六大数学与特洛伊反模型探针（`AutopsyProbe_Scheme1.lean` 至 `AutopsyProbe_Scheme6.lean`）：

```bash
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme1.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme5.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme6.lean
```

### 2. 复现第二部分（1,300 万行 FLT Lean 4 零依赖内核悖论与反例探针）

直接调用标准 Lean 4 内核编译零外部依赖（无需下载 Mathlib，`0 sorry`、`0 axiom`）的 FLT 反例验证文件：

```bash
lean reproduction/02_flt_13m_lean/lean4_flt_real_kernel_verification.lean
```

### 3. 复现第三部分（79 页纳维－斯托克斯纸面证明五大闭式反例与精确有理矩套件）

直接运行仅使用 Python 3 标准库 `fractions.Fraction` 的精确有理数与符号多项式核验脚本（耗时 `< 0.1` 秒，退出码 `0`）：

```bash
python3 -B reproduction/03_ns_79p_paper/verify_ns_counterexamples.py
```

---

## 学术引用与 Zenodo 永久时间戳锁定

本仓库已关联 **Zenodo** 用于锁定永久学术 DOI 与时间戳。结构化引用元数据请参见 [`CITATION.cff`](CITATION.cff) 与 [`.zenodo.json`](.zenodo.json)。
