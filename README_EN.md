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
