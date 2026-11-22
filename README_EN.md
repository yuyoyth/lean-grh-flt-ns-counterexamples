# Counterexamples, Structural Paradoxes & Formal Source-Code Verification for the 17.37M-Line GRH Lean 4 Proof, 13.00M-Line FLT Lean 4 Proof, and 79-Page Navier–Stokes Blow-Up Paper

> **Language Navigation**: **[Bilingual Overview (`README.md`)](README.md)** | **[中文独立导览 (`README_ZH.md`)](README_ZH.md)** | **[II. 1-Minute Reproduction](#quick-reproduction)** | **[III. Repository Structure](#repo-structure)**

---

## I. Executive Summary & Monograph Index

When automated formalization or computer-assisted PDE campaigns scale to **10M+ lines of Lean 4 code** or **79 pages of multi-chart weighted inequalities backed by an undisclosed numerical certificate**, verifying only the *top-level theorem statement* or the *open-set smooth bulk formulas* leaves a critical structural gap: **representation-quotient kernel leakage** ( $\ker q \not\subseteq \ker f$ ). Once an initial carrier definition or coordinate-chart seam drops a load-bearing conservation constraint, downstream deductions no longer establish the original mathematical claim, but instead operate on a degenerated quotient projection.

| Part | Verified Target | Upstream Scale & Commit | English Monograph (`en/`) | Chinese Monograph (`zh/`) | Reproduction Suite (`reproduction/`) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **01** | **Generalized Riemann Hypothesis (GRH)** Lean 4 Proof | `17,374,215` lines (`40e56bab`) / community `16,571,342` lines (`f1f6d654`) | [01_GRH Monograph (EN)](en/01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md) | [01_GRH 中文专著](zh/01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md) | [01_grh_17m_lean](reproduction/01_grh_17m_lean/) |
| **02** | **Fermat's Last Theorem (FLT)** Lean 4 Proof | `13,004,119` lines (`anthropics/fermats-last-theorem`) | [02_FLT Monograph (EN)](en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md) | [02_FLT 中文专著](zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md) | [02_flt_13m_lean](reproduction/02_flt_13m_lean/) |
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
- Consequently, `S_FreyPackage_level_lowering_to_two.lean` (line 129) sets `set_option linter.unusedVariables false` and **never references its explicit modularity premise `hmod` (`0` occurrences in the proof term)**.

#### 2.3 Premature Invocation of Terminal Zero-Space Theorems Inside Level-Lowering via `False.elim`

- In `S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean` (lines 113–170), odd-prime elimination yields only $M \mid 2$ (so $M \in \{1, 2\}$ , without preserving the lower divisibility guard $2 \mid M$ ).
- Unable to construct a level-2 cusp form directly, lines 156–170 prematurely invoke $S _ 2(\Gamma _ 0(1)) = 0$ and $S _ 2(\Gamma _ 0(2)) = 0$ *inside* the level-lowering lemma to trigger `False.elim` and non-constructively produce $\exists f \in S _ 2(\Gamma _ 0(2)), f \neq 0$ .

#### 2.4 Raw Integer `IsSemistableModel` Degenerates on Conductor-11 Curve Under Rational Isomorphic Scaling

- Defined on raw integer Weierstrass tuples without minimal-model quotient normalization, `IsSemistableModel` changes truth value from `True (1)` to `False (0)` on the semistable curve $E _ {11} : y^2 + y = x^3 - x^2 - 10x - 20$ (with $c _ 4 = 496, \Delta = -11^5$ ) under the rational isomorphism $(x, y) \mapsto (4x, 8y)$ ( $u = 2$ ).

---

### 3. Part 03 (`03_NS`): Four Principal Analytical Findings & Closed-Form Counterexamples for the 79-Page Navier–Stokes Paper

#### 3.1 Equatorial Seam Dirac Surface-Measure Omission in Proposition B.1 / Inequality (B.20) (Pages 47–57)

- Multiplier weights $D, Z$ are represented as piecewise splines on half-spaces $y _ 3 > 0$ and $y _ 3 < 0$ in compactified coordinates $\sigma = \frac{|y|}{1+|y|}$ and $\eta = \frac{y _ 3}{|y|}$ .
- Bounding the twice-integrated divergence-free quadratic form solely by open-set bulk Hessian norms omits the singular Dirac surface measure across the equatorial plane $\Sigma = \{y _ 3 = 0\}$ :

$$
D^2 W = H _ {W,\mathrm{bulk}}\,dy + [\partial _ z W] _ \Sigma\,(e _ 3 \otimes e _ 3)\,dS _ {z=0}
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
\int _ {-\delta}^{\delta} s _ \delta''(\eta)\,d\eta = 2, \qquad \max _ {|\eta| \le \delta} s _ \delta''(\eta) = \frac{3}{2\delta}
$$

- Meanwhile, the paper's upstream existence witness $d \in \mathcal{D} _ B$ (pp. 1, 4, 38–39, 70) is not published as a numerical file, appearing only as the 64-character SHA-256 digest `3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5`.

#### 3.4 Structural Invariance Under Supplementary Proof Materials & Certificate Unsealing (Theorem 5.4 & `suite_6`)

Section 5.3 (Theorem 5.4) of the monograph and `suite_6` of `verify_ns_counterexamples.py` establish a **three-branch structural trilemma** showing why neither releasing the file behind the SHA-256 hash nor appending supplementary lemmas/smoothing certificates within the paper's static piecewise-multiplier framework can resolve the defect:

- **Branch I** (Unsealing the finite-dimensional table $d \in \mathcal{D} _ B$ cannot alter the distributional integration-by-parts identity): $d \in \mathcal{D} _ B$ is a finite spline-coefficient table whose sole analytical bridge to the infinite-dimensional solenoidal space $\mathcal{D} _ S^\Gamma$ is Proposition B.1 / Inequality (B.20). Whenever the one-sided normal slope is non-zero on any open equatorial annulus, Counterexample Families A and B violate (B.20) on that annulus regardless of the remaining grid coefficients.
- **Branch II** (Appending a $C^2$ equatorial collar smoothing transfers the singular surface integral into an equivalent positive pure-bulk Hessian violation while driving $I _ 1$ negative): Replacing $|z|$ across $|z| \le \delta = \lambda\varepsilon$ (with $\lambda = \frac{1}{8}, \varepsilon = 2^{-16}, \delta = 2^{-19}$ ) by the global $C^2$ quartic spline $s _ \delta(z)$ eliminates the surface jump ( $[\partial _ z D _ \delta] _ \Sigma = 0$ ) but transfers the curvature mass into the collar bulk integral with transfer factor $I _ {\mathrm{collar}}(1/8) = \frac{2787617180779875667}{3000241776758882304} > \frac{37}{40} = 0.925 > 0$ . Consequently, the exact same solenoidal field $v _ \varepsilon$ violates (B.20) under the **pure-bulk Hessian readout**:

$$
\frac{E _ {D _ \delta}^{\mathrm{cert}}(v _ \varepsilon)}{\pi\varepsilon} \ge \frac{2147573301937507667}{1611064563204096000} > \frac{13}{10} > 0
$$

Simultaneously, accounting for the collar Hessian peak $\|H _ {D _ \delta}(1,0)\| _ {\mathrm{op}} \ge \frac{3}{8\delta} = 196608$ in Equation (B.16) (p. 54) drives the leading gradient coefficient to $I _ 1(1,0) \le \frac{1}{4} - 196608 = -\frac{786431}{4} < 0$ .
- **Branch III** (Appending peripheral lemmas cannot overturn an in-domain universal counterexample, while restricting $\mathcal{D} _ S^\Gamma$ breaks the Section 7 nonlinear bootstrap): By monotonicity of universal falsification, no added lemma can make (B.20) hold on $\mathcal{D} _ S^\Gamma$ while $v _ \varepsilon \in \mathcal{D} _ S^\Gamma$ remains in the domain; conversely, restricting $\mathcal{D} _ S^\Gamma$ at $y _ 3 = 0$ breaks the nonlinear vortex-stretching bootstrap closure on page 70.

---

<a id="quick-reproduction"></a>

## II. 1-Minute Quick Reproduction Guide

### 1. Part 01 (17.37M-Line GRH 8-Vertex Min-Cut Certificate & Lean 4 Probes)
```bash
# Zero-dependency verification of the 8-vertex minimum directed cut across 2.70M declarations (Python 3 stdlib only, < 0.2s):
python3 -B reproduction/01_grh_17m_lean/verify_graph_certificate.py

# If Lean 4 + Mathlib v4.33.1 is installed locally, compile the countermodel verification probes directly:
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme1.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme5.lean
lake env lean reproduction/01_grh_17m_lean/AutopsyProbe_Scheme6.lean
```

### 2. Part 02 (13.00M-Line FLT Zero-Dependency Lean 4 Kernel Probe)
```bash
# Zero-dependency Lean 4 kernel verification (no Mathlib required, 0 sorry / 0 axiom) reproducing the FLT structural gaps:
lean reproduction/02_flt_13m_lean/lean4_flt_real_kernel_verification.lean
```

### 3. Part 03 (79-Page Navier–Stokes Paper Exact Rational Counterexamples & Collar Transfer)
```bash
# Zero-dependency exact rational verification (fractions.Fraction only, < 0.1s) of all 6 NS counterexample & collar-transfer suites:
python3 -B reproduction/03_ns_79p_paper/verify_ns_counterexamples.py
```

---

<a id="repo-structure"></a>

## III. Repository Structure
```text
.
├── README.md                                                     # Bilingual Top-Level Overview (Chinese & English)
├── README_ZH.md                                                  # Standalone Chinese Overview
├── README_EN.md                                                  # Standalone English Overview
├── CITATION.cff                                                  # GitHub / Zenodo Academic Citation Metadata
├── .zenodo.json                                                  # Zenodo Permanent DOI Archival Metadata
├── SHA256SUMS                                                    # Full Repository 50-File SHA-256 Manifest
├── zh/                                                           # Complete Chinese Monographs (3 Volumes)
│   ├── 01_GRH_17M_Lean_Paradox_and_Autopsy_ZH.md                 # Part 01 (ZH): 17.37M-Line GRH Lean 4 Structural & Graph Verification
│   ├── 02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md                 # Part 02 (ZH): 13.00M-Line FLT Lean 4 Structural & Kernel Verification
│   └── 03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_ZH.md     # Part 03 (ZH): 79-Page NS Paper Kernel Analysis, Counterexamples & Trilemma
├── en/                                                           # Complete English Monographs (3 Volumes)
│   ├── 01_GRH_17M_Lean_Paradox_and_Autopsy_EN.md                 # Part 01 (EN): 17.37M-Line GRH Lean 4 Structural & Graph Verification
│   ├── 02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md                 # Part 02 (EN): 13.00M-Line FLT Lean 4 Structural & Kernel Verification
│   └── 03_NS_79p_Paper_Kernel_Leak_and_Counterexamples_EN.md     # Part 03 (EN): 79-Page NS Paper Kernel Analysis, Counterexamples & Trilemma
└── reproduction/                                                 # Bilingual One-Command Reproduction Suites
    ├── 01_grh_17m_lean/                                          # GRH: 12 Lean 4 probes, 10 graph JSONs & 8-vertex min-cut verifier (Bilingual)
    ├── 02_flt_13m_lean/                                          # FLT: Zero-dependency Lean 4 kernel probe & source-code verification report (Bilingual)
    └── 03_ns_79p_paper/                                          # NS: 6 exact rational verification suites & 6 bilingual analytical reports (Bilingual)
```
