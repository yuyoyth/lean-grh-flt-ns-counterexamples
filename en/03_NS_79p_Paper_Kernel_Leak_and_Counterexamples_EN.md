# Kernel-Leakage Audit of the Co-Author's 79-Page Navier–Stokes Finite-Time Blow-Up Paper Proof: Separation of the Fluid-Dynamical True Continuation Body from High-Order Semantic-Drift Artifacts and Closed-Form Counterexamples to the Cross-Plane Singular Measure Seam

Author: yth
Date: 2026-11-22

---

## Chapter 1. Introduction: The "True Continuation Body" versus "High-Order Semantic-Drift Artifacts" in Three-Dimensional Incompressible Fluid Dynamics — Why Kernel Leakage across Static Quotient Projections Generates Illusory Closures and Illusory Singularities

Throughout a century of modern partial differential equation analysis on the three-dimensional incompressible Navier–Stokes equations, nearly every major controversy surrounding global regularity versus finite-time singularity formation has stemmed from a single, foundational methodological confusion.

**Analysts routinely mistake a "high-order semantic-drift artifact" produced by projecting a fluid-dynamical operator onto a static observation chart, a piecewise spline grid, or a coarse-grained functional readout for the "true dynamical continuation body" of the fluid continuum along its comoving evolution.**

Consider the three-dimensional incompressible Navier–Stokes system on the whole space $\mathbb{R}^3$ or the three-dimensional periodic torus $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ :

$$
\partial _ t u + (u \cdot \nabla) u + \nabla p = \nu \Delta u, \qquad \nabla \cdot u = 0,
$$

together with the vorticity transport–stretching–dissipation equation obtained by taking the curl $\omega = \nabla \times u$ :

$$
\partial _ t \omega + (u \cdot \nabla) \omega - (\omega \cdot \nabla) u = \nu \Delta \omega.
$$

In the actual physical and geometric evolution of the continuum, the fluid state is an indivisible, pointwise-coupled entity.

The velocity gradient tensor $L = \nabla u$ simultaneously advects the vorticity field along the material derivative $D _ t = \partial _ t + u \cdot \nabla$ and stretches or tilts the principal axes of vortex tubes through the non-commutative vortex-stretching term $(\omega \cdot \nabla)u = L\omega$ .

The viscous dissipation operator $\nu \Delta$ and the solenoidal Leray pressure projection $\mathbb{P} = I - \nabla \Delta^{-1} \mathrm{div}$ maintain instantaneous global coupling across all spatial scales and frequency shells.

This complete, trajectory-preserving evolution operator—carrying every interface trace, singular distributional boundary layer, and non-commutative triadic phase—is the **true continuation body** of the Navier–Stokes equations.

Yet in traditional paper-and-pencil PDE deductions and computer-assisted matrix reductions, in order to compress an infinite-dimensional nonlinear flow into pre-existing Banach space norms or finite-dimensional quadratic inequalities, the analyst invariably introduces a **static readout projection** (quotient map) $q : \mathcal{X} \to \mathcal{Y}$ . Typical instances include:

**Half-space bulk projection**: On a piecewise half-space polynomial spline grid in spherical or cylindrical coordinates, reading only the Lebesgue absolutely continuous bulk density $H _ {\mathrm{bulk}}$ of the second-order derivative of a multiplier weight function on open half-spaces, while silently discarding the singular Dirac surface measure concentrated on the dividing equatorial plane $\Sigma = \lbrace y _ 3 = 0\rbrace$ simply because $\Sigma$ has three-dimensional Lebesgue volume measure zero;

**Static spectral projection**: In Fourier spectral or Littlewood–Paley dyadic shell decompositions, reading only the quadratic shell energy magnitudes $\Vert \Delta _ j u\Vert _ {L^2}^2$ or the single-mode Hermitian spectral energy tensors $\hat{u}(k)\hat{u}(k)^{\ast}$ , while erasing the odd cubic triadic resonance phases in the readout $q$ ;

**Finite-cell projection**: In finite-harmonic and finite-cell certificate reductions, projecting an infinite-dimensional divergence-free perturbation field $v$ onto a finite vector of cell unknowns $q(v)$ , while deferring multi-harmonic cross-couplings and cross-interface trace joins to unprinted external error coefficients.

Viewed from mathematical first principles, every readout map $q : \mathcal{X} \to \mathcal{Y}$ defines an equivalence kernel (or null fiber relation):

$$
\begin{aligned}
& \ker _ {\mathrm{rel}}(q) := \bigl\lbrace (X _ +, X _ -) \in \mathcal{X} \times \mathcal{X} : \cr
& \quad q(X _ +) = q(X _ -)\bigr\rbrace
\end{aligned}
$$

(which reduces in the linear same-domain setting to the standard null space $\ker q = \lbrace X \in \mathcal{X} : q(X) = 0\rbrace$ ). If an analytical deduction attempts to bound, control, or uniquely determine a downstream physical functional or next-instant evolution operator $f : \mathcal{X} \to \mathcal{Z}$ solely from the projected readout $q(X)$ , the necessary and sufficient condition for mathematical validity is the **equivalence-kernel inclusion condition (nullspace inclusion condition)**:

$$
q(X _ +) = q(X _ -) \implies f(X _ +) = f(X _ -), \qquad \ker q \subseteq \ker f. \qquad (1.3)
$$

In the linear same-domain setting, this is precisely nullspace inclusion.

For a one-sided coercive lower-bound deduction $f(X) \ge g(q(X))$ , a uniform fiberwise bound across every admissible state in the preimage fiber $q^{-1}(y)$ :

$$
\inf _ {X \in \mathcal{X}, q(X)=y} f(X) \ge g(y).
$$

A seemingly innocuous coordinate chart junction, integration-by-parts seam, or piecewise spline representation may contain a non-zero structural component $\Sigma \in \ker q$ in the blind spot of the readout $q$ . If the physical operator $f$ produces a strictly non-zero escaping output $f(\Sigma) \neq 0$ , then $\ker q \not\subseteq \ker f$ .

For a claimed coercive bound, within a single readout fiber $q(X _ +) = q(X _ -)$ the target functional may change sign and violate the claimed coercive bound. We call this defect **Operator-Kernel Leakage** (Kernel Leakage).

When kernel leakage occurs, the apparent "coercive closure" or "error control" observed on the projected representation does not reflect an intrinsic property of the Navier–Stokes equations; rather, it is a **high-order semantic-drift artifact** arising from the readout projection $q$ omitting a load-bearing degree of freedom of the full operator. From the standpoint of rigorous mathematical analysis, a proof step resting on an unguarded kernel-leaking reduction does not hold unconditionally on that domain.

This monograph conducts an exhaustive, purely mathematical internal audit of the 79-page Navier–Stokes finite-time blow-up paper proof released on November 20, 2026 by Levent Alpöge (the same author who simultaneously announced the 17.37-million-line Generalized Riemann Hypothesis Lean project) and Tristan Buckmaster.

The paper is titled *Finite-time blow-up for the Navier–Stokes equations* (79 pages, archived in the authors' repository under the paper directory as finite-time-blow-up-navier-stokes.pdf).

The pinned commit is ad53419de079eb8f95f60313473374624a348546, file size 1,615,293 bytes, SHA-256 digest 4a01929b2f8a595637bbbe1dfef9724e5de768d31283d62415ce045e2ed69901.

Setting aside all external proof-assistant packaging and sociological commentary, we operate 100% within partial differential equations, distribution theory, functional analysis, and fluid mechanics. We dissect the 79-page manuscript section by section and equation by equation, establishing:

**Conditional implication architecture**: Its three-stage conditional implication architecture and the unclosed external verification dependencies in the paper text;

**Singular interface kernel leakage**: The exact singular surface-measure kernel leakage ( $\ker q _ {\mathrm{bulk}} \not\subseteq \ker f _ v$ ) across the equatorial plane $y _ 3 = 0$ between the half-space spline weight representation on page 53, the quadratic coefficients (B.16) on page 54, and the main coercive multiplier inequality (B.20) of Proposition B.1 on pages 55–56;

**Two counterexample families**: Two completely explicit, closed-form analytical counterexample families (Counterexample Family A for the $D$ -weight seam with exact rational margin $\frac{\pi}{65536}\frac{633509743}{432432000} \gt 0$ and reduced-readout twin separation, and Counterexample Family B for the $Z$ -weight seam in the $\pm(2,1)$ harmonic mode with exact Gaussian-moment defect $\gt 400c \gt 0$ ) that strictly refute the no-join half-space spline contract of Proposition B.1 / (B.20);

**Collar curvature conservation**: The $O(\delta^{-1})$ equatorial collar curvature-tax conservation law under strong global- $C^2$ spline smoothing $s _ \delta(\eta)$ , proving that the singular surface measure cannot be smoothed away at zero cost;

**Tree-certificate criteria**: The exact algebraic necessity criteria for the finite-tree quadratic-form certificate in Lemma B.7 and Proposition B.8 (same-domain irredundant row-deletion witness criterion and restricted-subspace Rayleigh threshold $\tau = 2 d _ j b^T Q _ S^{-1} b$ );

**Static and covariant flow readouts**: The fundamental fluid-dynamical separation between the static Euclidean quadratic energy/enstrophy readout (which is blind to global velocity sign reversal $u _ 0^\pm = \pm 17 U$ despite an exact enstrophy-derivative divergence of $4913$ ) and the comoving covariant inverse-metric $g = C^{-1}$ evolution, under which non-commutative vortex stretching is identically annihilated into pure-square viscous dissipation.

---

## Chapter 2. Overall Logical Skeleton and Three Load-Bearing Seams of the 79-Page Navier–Stokes Finite-Time Blow-Up Paper Proof

### 2.1 Exact Statement Identification: A Conditional Computer-Assisted Claim of Finite-Time Blow-Up, Not Global Regularity

First, we establish the exact mathematical claim of Alpöge and Buckmaster's 79-page manuscript. The paper does **not** claim global regularity for the three-dimensional incompressible Navier–Stokes equations; on the contrary, it claims **finite-time blow-up** on both $\mathbb{R}^3$ and $\mathbb{T}^3$ .

Specifically, **Theorem 1.1** (pages 2–3) is formulated as an explicit **conditional theorem**:
In the self-similar rescaled variables

$$
y = \frac{x}{\sqrt{T-t}}, \qquad s = \log\frac{T}{T-t},
$$

suppose there exists a non-zero, smooth, time-periodic (with period $S \gt 0$ in self-similar time $s$ ) velocity–pressure profile $(W, q)$ invariant under a $\kappa$ -fold discrete rotational-reflection symmetry group $\Gamma$ , satisfying the self-similar Navier–Stokes system (equation (1.2) on page 2):

$$
\begin{aligned}
& \partial _ s W + \frac{1}{2}W + \frac{1}{2}(y \cdot \nabla)W + (W \cdot \nabla)W + \nabla q - \Delta W = 0, \cr
& \nabla \cdot W = 0,
\end{aligned}
$$

together with far-field decay and a spectral gap / finite unstable-codimension condition on the linearized monodromy operator (equation (1.3) on page 2). Then there exist smooth, compactly supported divergence-free initial data $u _ 0 \in C _ c^\infty(\mathbb{R}^3)$ (and smooth periodic divergence-free initial data on $\mathbb{T}^3$ ) whose corresponding Navier–Stokes solutions lose smoothness at the finite time $T \gt 0$ , with the $L^2$ gradient norm blowing up at the self-similar rate:

$$
\Vert \nabla u(\cdot, t)\Vert _ {L^2} \sim (T-t)^{-1/4} \qquad (t \uparrow T),
$$

which corresponds to squared vorticity (enstrophy) growth $\Vert \omega(\cdot, t)\Vert _ {L^2}^2 \sim (T-t)^{-1/2}$ .

To obtain the hypothetical non-zero self-similar periodic profile $(W, q)$ required by the premise of Theorem 1.1, the paper does not provide a closed analytical construction. Instead, it sets up a **three-stage conditional implication chain** spanning Section 7 (pages 29–46) and Appendix B (pages 49–70):

$$
\begin{aligned}
& \exists d \in \mathcal{D} _ B, \mathsf{Valid} _ B(d) \Longrightarrow \exists c \in \mathcal{C} _ 7, \cr
& \mathsf{Cert} _ 7(c) \Longrightarrow \exists (W, q) \in \mathcal{P} _ {\mathrm{rot}} \cr
& \Longrightarrow \mathrm{BlowUp}(\mathbb{R}^3, \mathbb{T}^3).
\end{aligned} \qquad (2.1)
$$

**Step 1: Appendix B to Section 7**: Theorem B.14 (page 69) converts valid matrix and cell data into the a priori certificate required by Section 7.

**Step 2: Certificate to rotating profile**: Theorem 7.1 (pages 38–39) constructs a self-similar rotating profile from a certificate satisfying every hypothesis. Here $\mathcal{P} _ {\mathrm{rot}}$ denotes the profile class satisfying the premises of Theorem 1.1.

**Step 3: Profile to finite-time blow-up**: Theorem 1.1 (page 1) converts that profile into finite-time blow-up on $\mathbb{R}^3$ and $\mathbb{T}^3$ .

### 2.2 Classical Analytic Steps Verified to Be Locally Sound under Their Stated Premises

A rigorous mathematical audit must distinguish steps that are locally valid under their stated hypotheses from seams where kernel leakage or missing proof obligations occur. Our page-by-page inspection confirms that the following five outer reductions in Sections 1–7 are mathematically sound conditional steps and should **not** be misclassified as kernel leaks:

**Self-similar coordinate diffeomorphism** (page 2, equation (1.4)): On any pre-blowup time interval $t \lt T$ , the transformation $(x,t) \mapsto (y,s)$ is a smooth invertible diffeomorphism; it rescales norms without discarding high-frequency modes.

**Quotienting by gradient fields on the divergence-free space** (page 30, Section 7.1 equation (7.2) and page 34, Section 7.8 equation (7.33)): Equivalence modulo gradients on the divergence-free space $H$ is canonically isomorphic to equality under the Leray projection $\mathbb{P}$ ; moreover, the adjoint condition (7.33) holds for all representatives, and setting $v = 0$ forces the test field $\psi$ to annihilate the gradient kernel.

**Symmetrized bilinear operator and finite-codimension Riesz projection** (page 10, equation (2.3) and pages 18–21, Lemmas 4.4–4.6): The symmetrized operator $K(\tau)(u,v) = -\frac{1}{2}e^{\tau\Delta}\mathbb{P}[(u\cdot\nabla)v + (v\cdot\nabla)u]$ recovers the exact Navier–Stokes nonlinearity on the diagonal $u = v$ ;

in Section 4, for the monodromy recursion $\chi _ {n+1} = M\chi _ n + f _ n$ , the unstable Riesz projection $P _ u \chi _ n$ is solved via a backward convergent series while the complementary stable component $(I - P _ u)\chi _ n$ is solved in full via forward iteration rather than being truncated to zero.

**Local compactness and strong–weak product convergence** (pages 37–43, Propositions 7.5 and 7.10): When passing to the limit from finite-dimensional Galerkin approximations, Proposition 7.5 uses local spatiotemporal $H^1$ bounds and Aubin–Lions compactness to extract local $L^2$ strong convergence $v _ k \to v$ alongside $\nabla v _ k \rightharpoonup \nabla v$ , so Proposition 7.10 passes through the quadratic nonlinearity via a strong–weak product rather than an invalid weak–weak product.

**Elimination of the finite-dimensional auxiliary forcing at the fixed point** (pages 43–44, equations (7.30)–(7.37)): Section 7 first solves an auxiliary equation with a finite-dimensional corrective force, and at the topological fixed point uses $\alpha' \in K$ , $\alpha = N(\alpha') \implies \alpha = \alpha'$ together with the invertibility of the matrix $V$ to deduce $\beta^a + \beta = 0$ , eliminating the auxiliary force legitimately conditional on the certificate bounds.

### 2.3 Three Structural Seams and Operator-Kernel Discrepancies in the Paper Proof

Once the outer conditional scaffolding of Sections 1–7 is stripped away, the entire burden of proving that the infinite-dimensional three-dimensional fluid perturbation $v$ around an approximate profile $W^r$ obeys a strictly coercive energy estimate (confining the unstable spectrum of the monodromy operator) rests on **Appendix B** (pages 49–70). Within this load-bearing core, three structural issues arise:

**Structural seam I: Singular interface measures**: On page 53, the multiplier weights $D$ and $Z$ are defined via piecewise polynomial spline formulas on the upper and lower half-spaces $y _ 3 \gt 0$ and $y _ 3 \lt 0$ .

On pages 54–56, the coefficients (B.16) and the coercive multiplier inequality (B.20) of Proposition B.1 depend on the interface contract. Consider the interpretation that checks only piecewise $C^2$ regularity on each half-space and reads the open-half-space pointwise Hessian $H _ {\mathrm{bulk}}$ .

Without the cross-plane normal-derivative conditions $[\partial _ {y _ 3} D] _ {y _ 3=0} = 0$ and $[\partial _ {y _ 3} Z] _ {y _ 3=0} = 0$ , the distributional Hessian $D^2 W = H _ {\mathrm{bulk}} dy + [\partial _ {y _ 3} W] e _ 3\otimes e _ 3 dS _ {y _ 3=0}$ contains a singular Dirac surface measure on $y _ 3 = 0$ .

The bulk readout $q _ {\mathrm{bulk}}$ annihilates this measure ( $\Sigma _ W \in \ker q _ {\mathrm{bulk}}$ ), yet the divergence-free integration-by-parts functional $f _ v$ pairs with it strictly positively ( $\Sigma _ W \notin \ker f _ v$ ), violating inequality (B.20).

**Structural seam II: Collar curvature conservation**: Even if one enforces global $C^2(\mathbb{R}^3)$ cross-plane joining by inserting a smooth transition spline $s _ \delta(\eta)$ across a thin equatorial collar $|\eta| \le \delta$ , the singular surface measure does not vanish for free.

It converts into an $O(\delta^{-1})$ bulk Hessian curvature spike $\max s _ \delta'' = \frac{3}{2\delta}$ inside the collar whose volume integral $\int _ {|\eta|\lt\delta} \Vert H _ {D _ \delta}\Vert _ {\mathrm{op}} f dy$ converges strictly to the positive surface jump integral as $\delta \downarrow 0$ .

**Structural seam III: Unclosed reductions and external certificates**: In the 79-page PDF itself, the explicit error coefficients of (B.16) (page 54), the full proofs of Proposition B.1 (pages 55–56) and Proposition B.4 (pages 59–60), and seven additional certificate conditions listed at the end of the proof of Theorem B.14 (page 70) are omitted from the paper text;

meanwhile, the witness certificate $d \in \mathcal{D} _ B$ at the far left of the implication chain is never provided in the paper or the repository, being represented solely by a 64-character hexadecimal SHA-256 string (3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5) checked by an unreleased external 128-bit interval-arithmetic program.

---

## Chapter 3. First Core Kernel-Leakage Proof: Singular Surface-Measure Escape across the Equatorial Plane $y _ 3 = 0$ between the Half-Space Spline Weights (Page 53) and Coercive Multiplier Inequality (B.20) (Pages 55–56)

### 3.1 The Double Integration-by-Parts Seam in Proposition B.1 and Inequality (B.20)

In Appendix B (pages 49–56), the authors seek a weighted coercive lower bound for divergence-free perturbation fields $v \in \mathcal{D} _ S^\Gamma$ invariant under the discrete symmetry group $\Gamma = \langle (R _ {\pi/\kappa}, 1/2), (R _ {\ast}, 0) \rangle$ , where $R _ {\pi/\kappa}$ is rotation by $\pi/\kappa$ around the $y _ 3$ -axis and $R _ {\ast} = \mathrm{diag}(1, -1, -1)$ .

Denote the self-similar spatial coordinates by $y = (y _ 1, y _ 2, y _ 3) \in \mathbb{R}^3$ , spherical radius $\rho = |y| = \sqrt{y _ 1^2 + y _ 2^2 + y _ 3^2}$ , cylindrical radius $r = \sqrt{y _ 1^2 + y _ 2^2}$ , vertical coordinate $z = y _ 3$ , and the compactified radial and colatitude coordinates introduced on page 53:

$$
\sigma = \frac{\rho}{1+\rho} \in [0, 1), \qquad \eta = \frac{z}{\rho} \in [-1, 1].
$$

On page 53, the scalar multiplier weight functions $D(y)$ and $Z(y)$ are expressed via piecewise polynomial splines in $(\sigma, \eta)$ on the upper and lower half-spaces $z \gt 0$ and $z \lt 0$ . To establish inequality (B.20) of Proposition B.1 (pages 55–56) using the quadratic-form coefficients $I _ 2, I _ 2', I _ 1', I _ 1, I _ 0$ defined in equation (B.16) (page 54), one must integrate by parts the weighted difference between the full gradient norm squared and the curl norm squared of a divergence-free vector field.

For any smooth divergence-free vector field $u$ ( $\nabla \cdot u = \sum _ {i=1}^3 \partial _ i u _ i = 0$ ), the pointwise Levi-Civita contraction identity gives:

$$
\begin{aligned}
& |\nabla u|^2 - |\mathrm{curl} u|^2 \cr
& = \sum _ {i,j=1}^3 (\partial _ i u _ j)^2 \cr
& - \sum _ {i,j=1}^3 \bigl((\partial _ i u _ j)^2 - \partial _ i u _ j \partial _ j u _ i\bigr) \cr
& = \sum _ {i,j=1}^3 \partial _ i u _ j \partial _ j u _ i.
\end{aligned}
$$

Multiplying by a scalar weight $W(y)$ and integrating over $\mathbb{R}^3$ requires **two successive integrations by parts** with respect to $\partial _ i$ and $\partial _ j$ :

#### Theorem 3.1 (Distributional Hessians and Singular Interface Measures for Piecewise Twice Differentiable Weights)

Let $W : \mathbb{R}^3 \to \mathbb{R}$ be continuous on $\mathbb{R}^3$ and $C^2$ on the open upper half-space $\mathbb{R} _ +^3 = \lbrace z \gt 0\rbrace$ and open lower half-space $\mathbb{R} _ -^3 = \lbrace z \lt 0\rbrace$ up to the equatorial dividing plane $\Sigma = \lbrace z = 0\rbrace$ , with locally integrable open-set Hessian matrix $H _ W(y) = (\partial _ i \partial _ j W(y)) _ {1\le i,j\le 3}$ and finite one-sided normal derivative traces on $\Sigma$ . Denote the normal derivative jump across $\Sigma$ by

$$
\begin{aligned}
& [\partial _ z W] (y _ 1, y _ 2) := \lim _ {z \downarrow 0} \partial _ z W(y _ 1, y _ 2, z) \cr
& - \lim _ {z \uparrow 0} \partial _ z W(y _ 1, y _ 2, z).
\end{aligned}
$$

Then the second-order distributional derivative (distributional Hessian Radon measure $D^2 W$ ) of $W$ on $\mathbb{R}^3$ admits the exact Lebesgue–Radon–Nikodym decomposition:

$$
D^2 W = H _ W(y) dy + [\partial _ z W] (y _ 1, y _ 2) e _ 3 \otimes e _ 3 dS _ \Sigma, \qquad (3.1)
$$

where $dS _ \Sigma = dy _ 1 dy _ 2$ is the two-dimensional area measure on $\Sigma = \lbrace z=0\rbrace$ . Consequently, for every compactly supported $C^2$ divergence-free vector field (or rapidly decreasing Schwartz divergence-free vector field) $u$ , we have the exact identity:

$$
\begin{aligned}
& \int _ {\mathbb{R}^3} W(y)\bigl(|\nabla u|^2 - |\mathrm{curl} u|^2\bigr) dy = \langle D^2 W, u \otimes u \rangle \cr
& = \int _ {\mathbb{R}^3} u(y)^T H _ W(y) u(y) dy \cr
& + \int _ {z=0} [\partial _ z W] (y _ 1, y _ 2) u _ 3(y _ 1, y _ 2, 0)^2 dS _ \Sigma.
\end{aligned} \qquad (3.2)
$$

**Proof**: Split the integral over $\mathbb{R}^3$ into the sum of the integrals over $\mathbb{R} _ +^3$ and $\mathbb{R} _ -^3$ . On each half-space, since $W$ is $C^2$ up to the boundary $\Sigma$ and $\nabla \cdot u = 0$ , the first integration by parts with respect to $y _ i$ uses

$$
\begin{aligned}
& \partial _ i(u _ j \partial _ j u _ i) = \partial _ i u _ j \partial _ j u _ i + u _ j \partial _ j(\nabla \cdot u) \cr
& = \partial _ i u _ j \partial _ j u _ i
\end{aligned}
$$

to yield:

$$
\begin{aligned}
& \int _ {\mathbb{R} _ \pm^3} W \sum _ {i,j=1}^3 \partial _ i u _ j \partial _ j u _ i dy \cr
& = -\int _ {\mathbb{R} _ \pm^3} \sum _ {i,j=1}^3 (\partial _ i W) u _ j \partial _ j u _ i dy \cr
& \mp \int _ {z=0} W(y _ 1, y _ 2, 0^\pm) \sum _ {j=1}^3 u _ j \partial _ j u _ 3 dS _ \Sigma.
\end{aligned}
$$

Because $W$ is continuous across $z = 0$ , $W(y _ 1, y _ 2, 0^+) = W(y _ 1, y _ 2, 0^-)$ , so the upper and lower boundary integrals from the first integration by parts cancel identically. Next, integrate the bulk term by parts a second time with respect to $y _ j$ (again using $\sum _ {j=1}^3 \partial _ j u _ j = 0$ ):

$$
\begin{aligned}
& -\int _ {\mathbb{R} _ \pm^3} \sum _ {i,j=1}^3 (\partial _ i W) u _ j \partial _ j u _ i dy \cr
& = \int _ {\mathbb{R} _ \pm^3} \sum _ {i,j=1}^3 (\partial _ j \partial _ i W) u _ i u _ j dy \cr
& \pm \int _ {z=0} \sum _ {i=1}^3 (\partial _ i W)(y _ 1, y _ 2, 0^\pm) u _ i u _ 3 dS _ \Sigma.
\end{aligned}
$$

For the tangential indices $i \in \lbrace 1, 2\rbrace$ , continuity of $W$ across $z = 0$ implies that $\partial _ 1 W$ and $\partial _ 2 W$ on both sides are tangential derivatives of the same trace $W| _ \Sigma$ , so $\partial _ i W(y _ 1, y _ 2, 0^+) = \partial _ i W(y _ 1, y _ 2, 0^-)$ for $i = 1, 2$ , and the tangential boundary terms cancel identically when summing the two half-spaces. Only the normal index $i = 3$ ( $\partial _ z W$ ) leaves a non-vanishing surface integral when the two half-spaces are summed:

$$
\begin{aligned}
& \int _ {z=0} \bigl(\partial _ z W(y _ 1, y _ 2, 0^+) - \partial _ z W(y _ 1, y _ 2, 0^-)\bigr) \cr
& \quad u _ 3(y _ 1, y _ 2, 0)^2 dS _ \Sigma \cr
& = \int _ {z=0} [\partial _ z W] u _ 3^2 dS _ \Sigma.
\end{aligned}
$$

This establishes (3.1) and (3.2). Q.E.D.

### 3.2 Mechanism of the Kernel Leak $\ker q _ {\mathrm{bulk}} \not\subseteq \ker f _ v$ in Equation (B.16) and Inequality (B.20)

Now examine equation (B.16) on page 54 and inequality (B.20) of Proposition B.1 on pages 55–56 of the paper.
In equation (B.16), the five quadratic coefficients are specified as:

$$
\begin{aligned}
& I _ 2 = D - \frac{3}{50}, \qquad I _ 2' = 1 - D, \qquad I _ 1' = \frac{1}{4} - Z, \cr
& I _ 1 = Z - \Vert H _ D\Vert _ {\mathrm{op}} - \frac{3w}{50}, \qquad I _ 0 = -\Vert H _ Z\Vert _ {\mathrm{op}},
\end{aligned} \qquad (3.3)
$$

where $\Vert H _ D\Vert _ {\mathrm{op}}$ and $\Vert H _ Z\Vert _ {\mathrm{op}}$ evaluate the pointwise operator norm of the classical bulk Hessian matrix on the open domain $z \neq 0$ .

In the language of quotient projections:

**(1) Bulk Hessian readout**: $q _ {\mathrm{bulk}}(D^2 W) := H _ W$ extracts only the Lebesgue absolutely continuous bulk density $H _ W$ , mapping every singular surface measure $\Sigma _ W = [\partial _ z W] e _ 3\otimes e _ 3 dS _ \Sigma$ concentrated on the zero-volume plane $\Sigma = \lbrace z=0\rbrace$ to zero:

$$
\Sigma _ W \in \ker q _ {\mathrm{bulk}}.
$$

When Theorem 3.1 is applied to the second-derivative tier ( $W = D$ applied to each partial derivative $u = \partial _ k v$ for $k=1,2,3$ ) and to the first-derivative tier ( $W = Z$ applied to $u = v$ ), the difference functionals $E _ D(v)$ and $E _ Z(v)$ representing $\mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}}$ (which Proposition B.1 claims must satisfy $\mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}} \le 0$ ) take the exact form:

$$
\begin{aligned}
& E _ D(v) = \sum _ {k=1}^3 \int _ {\mathbb{R}^3} (\partial _ k v)^T H _ D (\partial _ k v) dy \cr
& - \int _ {\mathbb{R}^3} \Vert H _ D\Vert _ {\mathrm{op}} |\nabla v|^2 dy \cr
& + \int _ {z=0} [\partial _ z D] |\nabla v _ 3|^2 dS _ \Sigma,
\end{aligned} \qquad (3.4)
$$

$$
\begin{aligned}
& E _ Z(v) = \int _ {\mathbb{R}^3} v^T H _ Z v dy - \int _ {\mathbb{R}^3} \Vert H _ Z\Vert _ {\mathrm{op}} |v|^2 dy \cr
& + \int _ {z=0} [\partial _ z Z] v _ 3^2 dS _ \Sigma.
\end{aligned} \qquad (3.5)
$$

In both (3.4) and (3.5), the sum of the first two bulk integrals is always $\le 0$ by definition of the operator norm $\Vert H _ W\Vert _ {\mathrm{op}}$ . However, the third term—the singular surface integral $\int _ {z=0} [\partial _ z D]|\nabla v _ 3|^2 dS _ \Sigma$ or $\int _ {z=0} [\partial _ z Z]v _ 3^2 dS _ \Sigma$ coming from $\ker q _ {\mathrm{bulk}}$ —is not controlled by the bulk Hessian norm terms $-\Vert H _ D\Vert _ {\mathrm{op}}$ or $-\Vert H _ Z\Vert _ {\mathrm{op}}$ .

Even more strikingly, one might ask whether the reflection symmetry $R _ {\ast} = \mathrm{diag}(1, -1, -1) \in \Gamma$ automatically kills the surface term on $z = 0$ :

For the $D$ -weight seam (3.4), for an axisymmetric zero-harmonic perturbation $v$ , $R _ {\ast}$ -symmetry forces the vertical velocity $v _ 3$ to be an odd function of $z$ , so $v _ 3(y _ 1, y _ 2, 0) = 0$ and its tangential derivatives $\partial _ 1 v _ 3(y _ 1, y _ 2, 0) = \partial _ 2 v _ 3(y _ 1, y _ 2, 0) = 0$ on $z = 0$ . Yet the integrand in (3.4) is $|\nabla v _ 3|^2 = |\partial _ 1 v _ 3|^2 + |\partial _ 2 v _ 3|^2 + |\partial _ z v _ 3|^2$ .

Because $v _ 3$ is odd in $z$ , its normal derivative $\partial _ z v _ 3$ is an even function of $z$ and remains non-vanishing on $z = 0$ .

For the $Z$ -weight seam (3.5), in the non-zero angular harmonic mode $\iota = \pm(2,1)$ , $R _ {\ast}$ -equivariance is satisfied via the odd parity of $\sin(6\varphi)$ under $\varphi \mapsto -\varphi$ , while the vertical velocity $v _ 3$ is an even function of $z$ , so $v _ 3(y _ 1, y _ 2, 0)$ itself is strictly non-zero on the equatorial plane $z = 0$ .

We now present two self-contained, closed-form analytical counterexample families that refute the no-join version of Proposition B.1 / inequality (B.20).

---

### 3.3 Closed-Form Counterexample Family A: Axisymmetric Compactly Supported Divergence-Free Perturbation Refuting the $D$ -Weight Seam with Exact Rational Margin and Dual-Model Separation

Fix the valid baseline parameters of Appendix B (pages 50–55): period $S = 1$ , rotation fold $\kappa = 3$ , symmetry group $\Gamma = \langle (R _ {\pi/3}, 1/2), (R _ {\ast}, 0) \rangle$ , reference profile $W^r = 0$ , weight $Z = 0$ , index sets $P _ \lambda = P _ \mu = \varnothing$ , dimensions $n = N = 0$ , $K = \mathbb{R}^0$ , empty auxiliary lists, $c _ \mu = 1/2$ , and $n _ \lambda = n _ {\nabla\lambda} = n _ \mu = 0$ . For a time-independent compactly supported divergence-free field $v$ , the operators in Proposition B.1 reduce to:

$$
\begin{aligned}
& F = T _ 1 v = \frac{1}{2}v + \frac{1}{2}(y \cdot \nabla)v - \Delta v, \qquad M v = -\Delta v, \qquad J = 0, \cr
& \Vert v\Vert _ \mu = 0, \qquad c _ M^2 = \frac{50}{3}, \qquad w _ {\ast} = \frac{39}{50}.
\end{aligned}
$$

By the solenoidal Parseval identities $\langle T _ 1 v, -\Delta v\rangle = \Vert \Delta v\Vert _ {L^2}^2 + \frac{1}{4}\Vert \nabla v\Vert _ {L^2}^2$ and

$$
\Vert \nabla\mathrm{curl} v\Vert _ {L^2}^2 = \Vert \nabla^2 v\Vert _ {L^2}^2 = \Vert \Delta v\Vert _ {L^2}^2,
$$

the auxiliary constant $w$ and the $3/50$ terms in (B.20) cancel identically, and $\mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}}$ equals $E _ D(v)$ in (3.4).

**Construction of the piecewise twice differentiable twin weights**: Let $h(t) = 6t^5 - 15t^4 + 10t^3$ be the quintic Hermite step polynomial ( $h(0)=h'(0)=h''(0)=0$ , $h(1)=1$ , $h'(1)=h''(1)=0$ , $h'(t) = 30t^2(1-t)^2 \ge 0$ on $[0,1]$ ). Define the radial cutoff:

$$
\chi(\sigma) = \begin{cases}
0, & 0 \le \sigma \le \dfrac{1}{4}, \cr
h(12\sigma - 3), & \dfrac{1}{4} \lt \sigma \lt \dfrac{1}{3}, \cr
1, & \dfrac{1}{3} \le \sigma \lt 1,
\end{cases}
$$

and define the twin half-space $C^2$ polynomial spline weights:

$$
\begin{aligned}
& D _ \pm(y) := \frac{1}{2} \pm \frac{1}{4}\chi(\sigma) |\eta| \cr
& = \frac{1}{2} \pm \frac{1}{4}\chi\left(\frac{\rho}{1+\rho}\right)\frac{|z|}{\rho}, \qquad D _ \pm(0) = \frac{1}{2}.
\end{aligned} \qquad (3.6)
$$

Both $D _ +$ and $D _ -$ are identically constant ( $1/2$ ) near the origin ( $\rho \le 1/3$ ), belong to $C^2$ piecewise polynomials on each half-space chart, satisfy $\frac{1}{4} \le D _ \pm \le \frac{3}{4}$ globally (so $I _ 2' = 1 - D _ \pm \ge \frac{1}{4} \gt 0$ ), and are axisymmetric and even in $z$ . On the region $\rho \ge \frac{1}{2}$ ( $\sigma \ge \frac{1}{3}$ ), $\chi(\sigma) = 1$ and $D _ +(y) = \frac{1}{2} + \frac{|z|}{4\rho}$ , so the normal derivative jumps across $z = 0$ are:

$$
\begin{aligned}
& [\partial _ z D _ +] (r) = \frac{1}{2r}, \qquad [\partial _ z D _ -] (r) = -\frac{1}{2r} \cr
& \left(r \ge \frac{1}{2}\right).
\end{aligned} \qquad (3.7)
$$

**Construction of the compactly supported solenoidal perturbation**: Let $a(t) := (1 - t^2) _ +^4 \in C _ c^3(\mathbb{R})$ (supported on $[-1, 1]$ with $a(0) = 1$ ). For $0 \lt \varepsilon \le \frac{1}{4}$ , define the axisymmetric stream function $\psi _ \varepsilon$ and velocity field $v _ \varepsilon$ in cylindrical coordinates $(v _ r, v _ \varphi, v _ 3)$ :

$$
\begin{aligned}
& \psi _ \varepsilon(r, z) := \varepsilon z a\left(\frac{r-1}{\varepsilon}\right) a\left(\frac{z}{\varepsilon}\right), \cr
& v _ r = -\frac{1}{r}\partial _ z \psi _ \varepsilon, \qquad v _ \varphi = 0, \cr
& v _ 3 = \frac{1}{r}\partial _ r \psi _ \varepsilon.
\end{aligned} \qquad (3.8)
$$

In the rescaled local coordinates $s = \frac{r-1}{\varepsilon} \in [-1,1]$ and $t = \frac{z}{\varepsilon} \in [-1,1]$ , we have:

$$
\begin{aligned}
& v _ r(r,z) = -\frac{\varepsilon}{r}a(s)\bigl(a(t) + t a'(t)\bigr), \cr
& v _ 3(r,z) = \frac{\varepsilon}{r}t a'(s)a(t).
\end{aligned} \qquad (3.9)
$$

Direct inspection confirms:

**(1) Divergence-freeness and compact regularity**: $\mathrm{div} v _ \varepsilon = \frac{1}{r}\partial _ r(r v _ r) + \partial _ z v _ 3 \equiv 0$ ; its support lies in the toroidal tube $\lbrace |r-1| \le \varepsilon, |z| \le \varepsilon\rbrace$ bounded away from the axis $r=0$ and origin ( $\rho \ge r \ge \frac{3}{4} \gt \frac{1}{2}$ , where $\chi(\sigma) \equiv 1$ ); and $a \in C _ c^3 \implies v _ \varepsilon \in C _ c^2(\mathbb{R}^3)$ .

**(2) Discrete rotation and reflection symmetry**: $v _ \varepsilon$ is axisymmetric and time-independent, with $v _ r$ even in $z$ and $v _ 3$ odd in $z$ , hence invariant under $R _ {\ast} = \mathrm{diag}(1, -1, -1)$ , so $v _ \varepsilon \in \mathcal{D} _ S^\Gamma$ .

**(3) Nonzero normal derivative on the equatorial plane**: On $z = 0$ ( $t = 0$ ), $v _ 3(r,0) = 0$ and $\partial _ r v _ 3(r,0) = 0$ , but since $a(0) = 1$ ,

$$
\partial _ z v _ 3(r, 0) = \frac{a'(s)}{r} \neq 0.
$$

#### Theorem 3.2 (Exact Rational Residual Bounds and Reduced-Readout Twin Separation for Family A)

For the admissible weak-contract data above and the perturbation $v _ \varepsilon$ with $a(t) = (1-t^2) _ +^4$ and $\varepsilon = 2^{-16} = \frac{1}{65536}$ , inequality (B.20) of Proposition B.1 (which requires $E _ D(v) := \mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}} \le 0$ ) is strictly violated by $D _ +$ , with the exact rational lower bound:

$$
E _ {D _ +}(v _ \varepsilon) \ge \gamma _ \varepsilon := \frac{\pi}{65536}\cdot\frac{633509743}{432432000} \gt 0. \qquad (3.10)
$$

Furthermore, under the reduced readout $q _ {\mathrm{red}}$ that observes the bulk Hessian operator-norm field $\Vert H _ D\Vert _ {\mathrm{op}}$ , the equatorial plane value $D| _ {z=0}$ , the uniform bounds $[1/4, 3/4]$ , and all fixed structural parameters, the twin weights $(D _ +, D _ -)$ have identical readout values ( $q _ {\mathrm{red}}(D _ +) = q _ {\mathrm{red}}(D _ -)$ ), yet their outputs in (B.20) diverge with opposite signs:

$$
\begin{aligned}
& E _ {D _ +}(v _ \varepsilon) \ge +\gamma _ \varepsilon \gt 0, \cr
& E _ {D _ -}(v _ \varepsilon) \le -\gamma _ \varepsilon \lt 0, \cr
& E _ {D _ +}(v _ \varepsilon) - E _ {D _ -}(v _ \varepsilon) \ge \frac{\pi}{32768}\cdot\frac{633509743}{432432000} \gt 0.
\end{aligned} \qquad (3.11)
$$

**Proof**:
First, evaluate the singular surface integral $T _ \varepsilon$ . On the support $r = 1 + \varepsilon s \in [3/4, 5/4]$ , $[\partial _ z D _ +] = \frac{1}{2r}$ , $|\nabla v _ 3(r,0)|^2 = \frac{a'(s)^2}{r^2}$ , and $dS = 2\pi r dr = 2\pi\varepsilon(1+\varepsilon s) ds$ . Since $1 + \varepsilon s \le \frac{5}{4}$ , we have $(1+\varepsilon s)^{-1} \ge \frac{4}{5}$ , so:

$$
\begin{aligned}
& T _ \varepsilon = \int _ {z=0} \frac{|\nabla v _ 3|^2}{2r} dS \cr
& = \pi\varepsilon \int _ {-1}^1 \frac{a'(s)^2}{1+\varepsilon s} ds \cr
& \ge \pi\varepsilon \int _ {-1}^1 \frac{a'(s)^2}{(1+\varepsilon s)^2} ds \ge \frac{16\pi}{25}\varepsilon A,
\end{aligned}
$$

where the exact rational moment $A$ is (using $a'(s) = -8s(1-s^2)^3$ ):

$$
\begin{aligned}
& A = \int _ {-1}^1 a'(s)^2 ds = 64 \int _ {-1}^1 s^2(1-s^2)^6 ds \cr
& = 128 \sum _ {j=0}^6 \frac{(-1)^j \binom{6}{j}}{2j+3} = \frac{131072}{45045}.
\end{aligned} \qquad (3.12)
$$

Second, bound the open-set bulk Hessian operator norm $\Vert H _ {D _ +}\Vert _ {\mathrm{op}}$ . On the support $\rho \ge \frac{3}{4}$ , $D _ + = \frac{1}{2} + \frac{|z|}{4\rho}$ . Differentiating $\frac{z}{\rho}$ twice in Cartesian coordinates gives:

$$
\begin{aligned}
& \nabla^2\left(\frac{z}{\rho}\right) = -\frac{e _ 3 \otimes y + y \otimes e _ 3 + z I _ 3}{\rho^3} \cr
& + \frac{3z y \otimes y}{\rho^5},
\end{aligned}
$$

so $\Vert H _ {D _ +}\Vert _ {\mathrm{op}} \le \frac{3}{2\rho^2} \le \frac{3}{2(3/4)^2} = \frac{8}{3} \lt 3 =: M$ .

Third, bound the velocity gradient norm squared $|\nabla v _ \varepsilon|^2$ and the bulk penalty. On $[-1,1]$ , $|a(t)| \le 1$ ; $a'(t)^2 = 64t^2(1-t^2)^6$ achieves its maximum at $t^2 = 1/7$ with value $\frac{64\times 6^6}{7^7} \lt 4$ , so $|a'(t)| \le 2$ ; and $a''(t) = -8(1-t^2)^2(1-7t^2)$ satisfies $|a''(t)| \le 8$ .

Substituting these into the five cylindrical gradient components for $r \ge \frac{3}{4}$ and $\varepsilon \le \frac{1}{4}$ yields the componentwise upper bounds $|\partial _ r v _ r| \le \frac{28}{3}$ , $|\partial _ z v _ r| \le 16$ , $|v _ r/r| \le \frac{4}{3}$ , $|\partial _ r v _ 3| \le \frac{104}{9}$ , and $|\partial _ z v _ 3| \le 8$ , whose squares sum to:

$$
\begin{aligned}
& |\nabla v _ \varepsilon|^2 \le K := \left(\frac{28}{3}\right)^2 + 16^2 + \left(\frac{4}{3}\right)^2 \cr
& + \left(\frac{104}{9}\right)^2 + 8^2 = \frac{43936}{81}.
\end{aligned} \qquad (3.13)
$$

Since the support volume is $\mathrm{Vol}(\mathrm{supp} v _ \varepsilon) = 8\pi\varepsilon^2$ , the two bulk integrals in (3.4) contribute at most $2 M K \cdot 8\pi\varepsilon^2 = 16\pi M K \varepsilon^2$ in magnitude. Hence:

$$
\begin{aligned}
& E _ {D _ +}(v _ \varepsilon) \ge T _ \varepsilon - 16\pi M K \varepsilon^2 \cr
& \ge \pi\varepsilon\left(\frac{16}{25}A - 16 M K \varepsilon\right).
\end{aligned} \qquad (3.14)
$$

Substituting $A = \frac{131072}{45045}$ , $M = 3$ , $K = \frac{43936}{81}$ , and $\varepsilon = \frac{1}{65536}$ gives:

$$
\begin{aligned}
& \frac{16}{25}\cdot\frac{131072}{45045} - 16\times 3\times\frac{43936}{81}\times\frac{1}{65536} \cr
& = \frac{2097152}{1126125} - \frac{1373}{3456} = \frac{633509743}{432432000} \gt 0,
\end{aligned}
$$

proving (3.10). Finally, since $H _ {D _ -} = -H _ {D _ +}$ and $[\partial _ z D _ -] = -[\partial _ z D _ +]$ , writing $E _ {D _ \pm}(v _ \varepsilon) = \pm J _ v - C _ v$ with $C _ v = \int \Vert H _ {D _ +}\Vert _ {\mathrm{op}}|\nabla v _ \varepsilon|^2 dy \ge 0$ yields $E _ {D _ -}(v _ \varepsilon) \le -\gamma _ \varepsilon \lt 0$ and $E _ {D _ +}(v _ \varepsilon) - E _ {D _ -}(v _ \varepsilon) \ge 2\gamma _ \varepsilon$ , proving (3.11). Q.E.D.

---

### 3.4 Closed-Form Counterexample Family B: Schwartz Gaussian Divergence-Free Mode- $\pm(2,1)$ Perturbation Refuting the $Z$ -Weight Seam ( $\gt 400c$ )

To demonstrate that the singular surface-measure kernel leak also strikes the first-order multiplier weight $Z$ and non-zero angular harmonics, we construct a second, completely independent closed-form counterexample family.

Retaining the baseline empty data of Section 3.3 ( $S=1, \kappa=3, W^r=0, D=0, P _ \lambda=P _ \mu=\varnothing, n=N=0$ ), let

$$
C _ 6(x,y) + i S _ 6(x,y) := (x + i y)^6, \qquad g(x,y,z) := \exp\left(-\frac{x^2 + y^2}{2} - 6z^2\right),
$$

and define the three-dimensional Schwartz vector field $v = (v _ 1, v _ 2, v _ 3)$ :

$$
v(x,y,z) := g(x,y,z) \bigl(-2 z y C _ 6(x,y), 2 z x C _ 6(x,y), -S _ 6(x,y)\bigr). \qquad (3.15)
$$

Set the half-space $C^2$ spline weight $Z$ to be:

$$
Z(y) := c P(\sigma) |\eta| = c P\left(\frac{\rho}{1+\rho}\right)\frac{|z|}{\rho} \qquad (c \gt 0), \qquad (3.16)
$$

where $P(\sigma) = 0$ on $[0, \frac{1}{20}]$ , $P(\sigma) = h(20\sigma - 1)$ on $[\frac{1}{20}, \frac{1}{10}]$ , and $P(\sigma) = 1$ on $[\frac{1}{10}, 1)$ .

#### Theorem 3.3 (Gaussian Solenoidal Symmetry and Strictly Positive Residual Bounds for Family B)

The vector field (3.15) belongs to the divergence-free Schwartz space $\mathcal{S}(\mathbb{R}^3) \cap \mathcal{D} _ S^\Gamma$ and corresponds under the harmonic basis $E _ \iota = \exp(i[2\pi(2\iota _ 2 - \iota _ 1)\theta + \kappa\iota _ 1\varphi])$ of page 50 equation (B.2) ( $\kappa = 3$ , time-independent $2\iota _ 2 = \iota _ 1$ , angular frequency $\kappa\iota _ 1 = \pm 6$ ) to the exact harmonic modes $\iota = \pm(2,1)$ . Its exact $L^2$ gradient and vector-Laplacian Gaussian moments and the exact left-hand side of inequality (B.20) are:

$$
\begin{aligned}
& \Vert \nabla v\Vert _ {L^2(\mathbb{R}^3)}^2 = 14880 \frac{\pi^{3/2}}{2\sqrt{3}}, \cr
& \Vert \Delta v\Vert _ {L^2(\mathbb{R}^3)}^2 = 431280 \frac{\pi^{3/2}}{2\sqrt{3}},
\end{aligned} \qquad (3.17)
$$

$$
\begin{aligned}
& \mathrm{LHS} _ {\mathrm{B.20}} = \frac{47}{50}\Vert \Delta v\Vert _ {L^2}^2 \cr
& + \frac{127}{625}\Vert \nabla v\Vert _ {L^2}^2 = \frac{51053352}{125} \frac{\pi^{3/2}}{2\sqrt{3}} \cr
& = \frac{8508892}{125}\sqrt{3}\pi^{3/2}.
\end{aligned} \qquad (3.18)
$$

Under the half-space $C^2$ weight $Z = c P(\sigma)|\eta|$ ( $c \gt 0$ ), the defect $\Delta := \mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}} = E _ Z(v)$ satisfies the purely analytical lower bound:

$$
\begin{aligned}
& \frac{\Delta}{c} \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} \cr
& \gt \frac{26311}{64} \gt 400 \gt 0.
\end{aligned} \qquad (3.19)
$$

**Proof**:
First, since $C _ 6 + i S _ 6 = (x+iy)^6$ is holomorphic, $x\partial _ y C _ 6 - y\partial _ x C _ 6 = -6 S _ 6$ , so the horizontal divergence is $\partial _ x v _ 1 + \partial _ y v _ 2 = -12 z g S _ 6$ , which cancels the vertical divergence $\partial _ z v _ 3 = -\partial _ z(g S _ 6) = +12 z g S _ 6$ identically ( $\mathrm{div} v \equiv 0$ ).

In cylindrical coordinates $(r, \varphi, z)$ , $v _ r = 0$ , $v _ \varphi = 2 z r^7 g \cos(6\varphi)$ , and $v _ 3 = -r^6 g \sin(6\varphi)$ , which is invariant under rotation by $\pi/3$ and under $R _ {\ast} : (\varphi, z) \mapsto (-\varphi, -z)$ , so $v \in \mathcal{D} _ S^\Gamma$ .

Second, on the equatorial plane $z = 0$ , $v _ 3(r,\varphi,0) = -r^6 e^{-r^2/2}\sin(6\varphi) \neq 0$ and the normal derivative jump of $Z$ is $[\partial _ z Z] (r) = \frac{2c P(r/(1+r))}{r}$ . The uncutoff surface integral is:

$$
\begin{aligned}
& A _ 0 = \int _ {z=0} \frac{2c}{r} v _ 3^2 dS = 2\pi c \int _ 0^\infty r^{12} e^{-r^2} dr \cr
& = \frac{10395}{64}\pi^{3/2}c,
\end{aligned} \qquad (3.20)
$$

and since $p(\rho) = P(\rho/(1+\rho)) = 1$ for $\rho \ge \frac{1}{9}$ , the core cutoff loss on $r \le \frac{1}{9}$ is at most $2\pi c \int _ 0^{1/9} r^{12} dr = \frac{2\pi c}{13\cdot 9^{13}}$ .

Third, on the exterior region $\rho \ge \frac{1}{9}$ , $Z(y) = c\frac{|z|}{\rho}$ . In the orthonormal spherical frame $(e _ \rho, e _ \theta, e _ \varphi)$ with $t = \frac{|z|}{\rho} \in [0,1]$ , the scaled bulk Hessian $\rho^2 H _ {|z|/\rho}$ has eigenvalues $\frac{-t \pm \sqrt{4-3t^2}}{2}$ and $-t$ , whose maximum absolute value on $[0,1]$ is $\frac{2}{\sqrt{3}}$ (attained at $t = \frac{1}{\sqrt{3}}$ ). Thus $\Vert H _ Z(y)\Vert _ {\mathrm{op}} \le \frac{2c}{\sqrt{3}\rho^2}$ for $\rho \ge \frac{1}{9}$ .

Bounding the weighted Gaussian volume integral gives:

$$
\begin{aligned}
& J := \int _ {\mathbb{R}^3} \frac{|v|^2}{\rho^2} dy \cr
& \le \pi \int _ {-\infty}^\infty dz \int _ 0^\infty e^{-r^2 - 12z^2}\bigl(4z^2 r^{13} + r^{11}\bigr) dr \cr
& = \frac{60}{\sqrt{3}}\pi^{3/2},
\end{aligned}
$$

so the combined magnitude of the two exterior bulk terms in (3.5) is at most $2 \cdot \frac{2c}{\sqrt{3}} J = 80\pi^{3/2}c = \frac{5120}{64}\pi^{3/2}c$ . On the transition shell $\frac{1}{19} \le \rho \le \frac{1}{9}$ , $|P'(\sigma)| \le \frac{75}{2}$ and $|P''(\sigma)| \le 6000$ imply $\Vert H _ Z\Vert _ {\mathrm{op}} \lt 9000c$ , while $\int _ {\rho \le 1/9} |v|^2 dy \le \frac{8\pi}{15\cdot 9^{15}}$ , bounding the two transition bulk terms by $\frac{9600\pi c}{9^{15}}$ .

Subtracting the exterior bulk loss $\frac{5120}{64}\pi^{3/2}c$ from the surface term $\frac{10395}{64}\pi^{3/2}c$ leaves $\frac{5275}{64}\pi^{3/2}c$ , proving (3.19). Q.E.D.

---

## Chapter 4. The $O(\delta^{-1})$ Collar Curvature-Tax Conservation Law under Strong Join Restoration and the Semantic Rift between Paper Text and Code Specifications

### 4.1 Why the Singular Surface Measure Cannot Be Smoothed Away at Zero Cost

Faced with the counterexamples of Chapter 3, an analyst might ask: "If the kink $|\eta|$ across the equatorial plane $z = 0$ ( $\eta = 0$ ) causes a normal-derivative jump $[\partial _ z W] \neq 0$ , can we not simply round off $|\eta|$ inside an arbitrarily thin equatorial collar $|\eta| \le \delta$ ( $0 \lt \delta \le 1$ ) using a $C^2$ -joined even quartic spline $s _ \delta(\eta)$ , thereby eliminating the surface jump $[\partial _ z W] _ \Sigma = 0$ and restoring inequality (B.20)?"

Let us write down the unique minimal quartic even polynomial spline matching the second-order jet ( $s _ \delta(\pm\delta) = \delta$ , $s _ \delta'(\pm\delta) = \pm 1$ , $s _ \delta''(\pm\delta) = 0$ ) at the collar boundaries $\eta = \pm\delta$ :

$$
\begin{aligned}
& s _ \delta(\eta) := \begin{cases}
\dfrac{3\delta}{8} + \dfrac{3\eta^2}{4\delta} - \dfrac{\eta^4}{8\delta^3}, & |\eta| \le \delta, \cr
|\eta|, & |\eta| \ge \delta,
\end{cases}
\cr
& D _ \delta(y) := \frac{1}{2} + \frac{1}{4}\chi(\sigma) s _ \delta(\eta).
\end{aligned}
\qquad (4.1)
$$

Inside the collar $|\eta| \lt \delta$ , its first and second derivatives are:

$$
\begin{aligned}
& s _ \delta'(\eta) = \frac{3\eta}{2\delta} - \frac{\eta^3}{2\delta^3}, \cr
& s _ \delta''(\eta) = \frac{3}{2\delta}\left(1 - \frac{\eta^2}{\delta^2}\right).
\end{aligned} \qquad (4.2)
$$

Because all derivatives up to order two match at $\eta = \pm\delta$ , $D _ \delta \in C^2(\mathbb{R}^3)$ is globally $C^2$ across the equatorial plane $z = 0$ . Its singular surface measure vanishes ( $[\partial _ z D _ \delta] _ \Sigma = 0$ ), and $E _ {D _ \delta}(v) \le 0$ holds.

**Where did the singular surface curvature go?**
By exact curvature-mass conservation, it is converted into an $O(\delta^{-1})$ bulk Hessian curvature concentration inside the collar $|\eta| \le \delta$ .

#### Theorem 4.1 (Collar Curvature Peaks and Conservation of Singular Interface Mass)

For the globally $C^2(\mathbb{R}^3)$ joined weight family $D _ \delta = \frac{1}{2} + \frac{1}{4}\chi(\sigma)s _ \delta(\eta)$ ( $0 \lt \delta \le 1$ ):

**(1) Reciprocal curvature growth and invariant mass**: The second derivative $s _ \delta''(\eta)$ peaks at $\eta = 0$ with value $\max _ {|\eta|\le\delta} s _ \delta''(\eta) = \frac{3}{2\delta}$ (the normalized interface kernel $\frac{1}{2}s _ \delta''$ peaks at $\frac{3}{4\delta}$ ), and its integrated curvature mass is invariant for all $\delta \in (0,1]$ :

$$
\begin{aligned}
& \int _ {-\delta}^{\delta} s _ \delta''(\eta) d\eta = 2, \cr
& \int _ {-\delta}^{\delta} \frac{1}{2}s _ \delta''(\eta) d\eta = 1.
\end{aligned} \qquad (4.3)
$$

At the equatorial plane $z = 0$ ( $r \gt 0$ ), the vertical second Cartesian partial derivative of $D _ \delta$ is:

$$
\begin{aligned}
& \partial _ {zz} D _ \delta(r, 0) = \frac{3 \chi\left(\frac{r}{1+r}\right)}{8 \delta r^2} \cr
& + \frac{3 \delta \chi'\left(\frac{r}{1+r}\right)}{32 r(1+r)^2}.
\end{aligned} \qquad (4.4)
$$

**(2) Nonzero collar bulk-Hessian limit**: For every compactly supported continuous non-negative test function $f \in C _ c(\mathbb{R}^3)$ (such as $f = |\nabla v|^2$ ), as the collar thickness $\delta \downarrow 0$ , even though the three-dimensional Lebesgue volume of the collar $\lbrace |\eta| \lt \delta\rbrace$ shrinks at rate $O(\delta)$ , the bulk Hessian operator-norm integral over the collar **never vanishes**; instead, it converges strictly to the singular surface jump integral:

$$
\begin{aligned}
& \lim _ {\delta \downarrow 0} \int _ {|\eta| \lt \delta} \Vert H _ {D _ \delta}(y)\Vert _ {\mathrm{op}} f(y) dy \cr
& = \int _ {z=0} \frac{\chi\left(\frac{r}{1+r}\right)}{2r} f(y _ 1, y _ 2, 0) dS _ \Sigma \gt 0.
\end{aligned} \qquad (4.5)
$$

**Proof**: Equations (4.3) and (4.4) follow by direct integration of (4.2) and the Cartesian chain rule at $z = 0$ ( $\partial _ z\eta = 1/r$ , $\partial _ {zz}\eta = 0$ , $\partial _ z\sigma = 0$ , $\partial _ {zz}\sigma = \frac{1}{r(1+r)^2}$ ).

For (4.5), decomposing $H _ {D _ \delta} = A _ \delta + R _ \delta$ with leading rank-one tensor $A _ \delta = \frac{1}{4}\chi(\sigma)s _ \delta''(\eta)\nabla\eta \otimes \nabla\eta \succeq 0$ and uniformly bounded remainder $\Vert R _ \delta\Vert _ {\mathrm{op}} = O(1)$ , the remainder integral over the $O(\delta)$ -volume collar vanishes as $\delta \downarrow 0$ , whereas changing variables via $z = \frac{r\eta}{\sqrt{1-\eta^2}}$ and $\eta = \delta t$ in the leading integral gives:

$$
\begin{aligned}
& \lim _ {\delta \downarrow 0} \int _ {|\eta|\lt\delta} \Vert A _ \delta\Vert _ {\mathrm{op}} f dy \cr
& = \int _ {z=0} \frac{\chi(r/(1+r))}{4r} f(y _ 1,y _ 2,0) dS _ \Sigma \int _ {-1}^1 \frac{3}{2}(1-t^2) dt \cr
& = \int _ {z=0} \frac{\chi(r/(1+r))}{2r} f(y _ 1,y _ 2,0) dS _ \Sigma.
\end{aligned}
$$

Q.E.D.

### 4.2 Fair Stratification between the Weak No-Join Contract and the Strong Global- $C^2$ Contract

Theorems 3.2, 3.3, and 4.1 establish an inescapable dichotomy:

**Weak half-space contract**: Under the weak half-space spline contract (checking piecewise $C^2$ spline regularity on each half-space chart without enforcing cross-plane normal-derivative joining at $y _ 3 = 0$ ), Proposition B.1 / inequality (B.20) is strictly false and refuted by Counterexample Families A and B.

**Strong global contract**: The companion specification files CellLayerChallenge and ExtendedCoerciveChallenge explicitly impose parity-signed cross-plane joining through order two and global $C^2$ regularity on $\mathbb{R}^3$ . These conditions exclude the unjoined weights $D _ \pm$ and $Z$ .

Any valid weight certificate must therefore pay the equatorial curvature tax of Theorem 4.1 inside the bulk Hessian penalties $-\Vert H _ D\Vert _ {\mathrm{op}}$ and $-\Vert H _ Z\Vert _ {\mathrm{op}}$ . Whether a numerical certificate can pay this tax while keeping the full quadratic form coercive leads directly to Chapter 5.

---

## Chapter 5. Second Structural Audit: The "Unpiloted Spans" of the Paper Proof — Omitted (B.16)/B.1/B.4 Error Coefficients, the Unreleased External Certificate, and Exact Same-Domain Breakdown Criteria for Tree Schur Pivots

### 5.1 Why the 79-Page PDF Is Not a Self-Contained Paper Proof

Even under the strong global- $C^2$ interpretation, the 79-page PDF fails to constitute a self-contained paper proof due to four unclosed external dependencies:

| Paper location | Load-bearing content | PDF status | Closure consequence |
|:---|:---|:---|:---|
| Pages 1, 4, 70 | Appendix B numerical certificate | SHA-256 prefix 3f7a335b... only | Existence premise cannot be independently checked |
| Pages 4, 10 | 128-bit interval verification | Certificate and output unreleased | External verification remains open |
| Pages 54–56 | (B.16) and Proposition B.1 | Error coefficients and full proof omitted | Scalar inequalities cannot be reconstructed from the PDF |
| Pages 59–60, 70 | Proposition B.4 and additional conditions | Proof and seven conditions unexpanded | Certificate reduction contract remains incomplete |

**(1) Unreleased upstream certificate witness (Pages 1, 4, 70)**: Throughout the manuscript, the finite-dimensional numerical certificate witness $d \in \mathcal{D} _ B$ is represented without any disclosed data bytes; only the 64-character SHA-256 hash 3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5 is printed. Consequently, the upstream existential premise $\exists d \in \mathcal{D} _ B \mathsf{Valid} _ B(d)$ cannot be independently verified from the paper or companion repository.

**(2) Unreleased 128-bit interval-arithmetic verifier and output (Pages 4, 10, Section 1.5)**: The 128-bit interval-arithmetic (Arb / FLINT) verification of the certificate inequalities is explicitly stated to lie outside the formalization kernel, and both the verification program and the certificate data remain unreleased.

**(3) Omitted error-absorption coefficients in (B.16) and full proof of Proposition B.1 (Pages 54–56)**: Equation (B.16) omits explicit high-order error-absorption coefficients, while Proposition B.1 provides only an integration-by-parts sketch and defers the full proof of inequality (B.20) to external code, preventing a paper reader from reconstructing the exact scalar inequalities from the PDF.

**(4) Omitted proof of Proposition B.4 and seven unexpanded conditions (Pages 59–60, 70)**: The reduction from general solenoidal perturbations to spatial cell unknowns, pressure gauge normalization, trace joins, and harmonic tail bounds (B.32)–(B.34) omits the proof of Proposition B.4 on paper, and page 70 lists seven additional certificate conditions after Theorem B.14 (cell pressure normalization, local-to-global unknown mapping, omitted harmonics of $W^r$ , rectangles near $y _ 3=0$ , and $\iota \mapsto -\iota$ symmetry) without algebraic expansion.

Consequently, the reduction bridge $\mathsf{Valid} _ B(d) \implies \mathsf{Cert} _ 7(\Phi(d))$ is not a closed, enumerable contract on paper.

### 5.2 Complete Mathematical Reconstruction of Lemma B.7 and Proposition B.8 and Exact Same-Domain Breakdown Criteria

Despite the absence of the external numerical matrices, **Lemma B.7** (pages 62–63, tree-structured quadratic-form telescoping) and **Proposition B.8** (page 64, free-block non-positivity and restricted strict positivity implying unique free-variable compensation) form the algebraic core of Appendix B. We provide their complete closed-form mathematical proof together with the **exact necessary and sufficient same-domain criteria** for observation-row kernel leakage and restricted pivot breakdown.

#### Theorem 5.1 (Weighted Young Elimination on Finite Trees and Direct-Sum Free Compensation)

Let $X = P \oplus F$ be a finite-dimensional real vector space ( $P$ the primary perturbation block, $F$ the free parameter block) and $\mathcal{T}$ a finite rooted tree.

Suppose at each node $\xi \in \mathcal{T}$ we are given positive weights $w _ {\xi,i} \gt 0$ , a pivot index set $U _ \xi$ , pivot coefficients $p _ {\xi,j}$ , row bounds $m _ {\xi,i} \gt 0$ , discardable columns $Y _ \xi'$ , constraint columns $Y _ \xi$ , symmetric matrices $H _ \xi, K _ \xi, N _ \xi, V _ \xi$ , and entrywise non-negative error matrices $H _ \xi', K _ \xi'$ satisfying equations (B.39)–(B.40) on page 62:

$$
\begin{aligned}
& H _ \xi[x] \le N _ \xi[x] + \sum _ {\xi' \in \mathrm{child}(\xi)} V _ {\xi'}[x] + H _ \xi'[|x|], \cr
& V _ \xi[x] \le K _ \xi[x] - \sum _ {j \notin U _ \xi} m _ {\xi,j} x _ j^2 + K _ \xi'[|x|],
\end{aligned} \qquad (5.1)
$$

$$
\begin{aligned}
& R _ \xi := H _ \xi - \mathrm{diag} _ {U _ \xi}(p _ \xi) - Y _ \xi' (Y _ \xi')^T + Y _ \xi Y _ \xi^T - K _ \xi, \cr
& \sum _ j \bigl(|R _ {\xi,ij}| + H _ {\xi,ij}' + K _ {\xi,ij}'\bigr)\frac{w _ {\xi,i}}{w _ {\xi,j}} \le m _ {\xi,i}, \cr
& \bar{p} _ {\xi,j} \le p _ {\xi,j} - m _ {\xi,j}.
\end{aligned} \qquad (5.2)
$$

Then:

**(1) Nodewise weighted Young inequality**: Using $2|x _ i x _ j| \le \frac{w _ {\xi,i}}{w _ {\xi,j}}x _ i^2 + \frac{w _ {\xi,j}}{w _ {\xi,i}}x _ j^2$ and symmetry yields $-R _ \xi[x] + (H _ \xi' + K _ \xi')[|x|] \le \sum _ i m _ {\xi,i} x _ i^2$ , and subtracting the two inequalities in (5.1) gives:

$$
\begin{aligned}
& N _ \xi[x] + \sum _ {\xi' \in \mathrm{child}(\xi)} V _ {\xi'}[x] - V _ \xi[x] \cr
& \ge \sum _ {j \in U _ \xi} \bar{p} _ {\xi,j} x _ j^2 - |Y _ \xi^T x|^2.
\end{aligned} \qquad (5.3)
$$

**(2) Tree summation and restricted positivity**: Summing (5.3) over all $\xi \in \mathcal{T}$ cancels every non-root transfer form $V _ \xi[x]$ pairwise;

if $V _ {\mathrm{root}} \succeq 0$ and every coordinate $j$ is covered by positive net pivots $D _ {jj} := \sum _ {\xi : j \in U _ \xi} \bar{p} _ {\xi,j} \gt 0$ , then $N := \sum _ {\xi \in \mathcal{T}} N _ \xi \succeq D - Y Y^T$ ( $Y := [Y _ \xi] _ {\xi \in \mathcal{T}}$ ), so $N$ is strictly positive definite on the constraint kernel $S := \ker Y^T$ : $N[x] \ge (\min _ j D _ {jj})|x|^2 \gt 0$ for all $x \in S \setminus \lbrace 0\rbrace$ .

**(3) Direct-sum decomposition and free compensation**: If $N| _ F \preceq 0$ on the free subspace $F = \lbrace 0\rbrace \oplus F$ (guaranteed by setting $v = 0$ in equation (B.44) on page 64, where the right-hand side is $-|\zeta|^2/1000 \le 0$ ) and $\mathrm{ncols}(Y) \le \dim F$ , then $S \cap F = \lbrace 0\rbrace$ and dimension pinching forces:

$$
X = S \oplus F, \qquad \mathrm{rank}(Y) = \mathrm{ncols}(Y) = \dim F. \qquad (5.4)
$$

Writing $Y^T = (Y _ p^T, Y _ f^T)$ along $P \oplus F$ , the square block $Y _ f$ is invertible, and every primary state $x _ p \in P$ admits the unique compensating free vector $x _ f = -(Y _ f^T)^{-1} Y _ p^T x _ p \in F$ such that $(x _ p, x _ f) \in S = \ker Y^T$ (without uniqueness, existence of a compensating $x _ f$ is equivalent to the quotient-kernel inclusion $\ker Y _ f \subseteq \ker Y _ p$ ).

Furthermore, we establish the two exact same-domain criteria governing observation-row deletion and pivot sign reversal:

#### Theorem 5.2 (Same-Domain Kernel-Leak Witnesses for Irredundant Observation Rows)

On a restricted subspace $\mathrm{im} J$ ( $J$ a full-column-rank basis matrix for $S = \ker Y^T$ ), deleting the $i$ -th row of an observation matrix $H$ to form $H _ {-i}$ causes kernel leakage of a target linear readout $B$ **if and only if there exists a same-domain witness vector** $z$ such that:

$$
H _ {-i} J z = 0 \qquad \mathrm{and} \qquad B J z \neq 0. \qquad (5.5)
$$

(Deleting a linearly redundant row preserves $\ker(H _ {-i}J) \subseteq \ker(BJ)$ and does not cause kernel leakage; thus row-deletion necessity must always be certified by an explicit witness $z$ satisfying (5.5).)

#### Theorem 5.3 (Rayleigh-Quotient Thresholds for Restricted Pivot Sign Reversal)

Let $N = L D L^T$ induce a strictly positive definite quadratic form $Q _ S := J^T N J \succ 0$ on $S = \mathrm{im} J$ . Flipping the $j$ -th positive pivot $d _ j \gt 0$ of $D$ to $-d _ j$ produces $Q _ S' = Q _ S - 2 d _ j b b^T$ with $b := J^T L e _ j$ . Define the dimensionless Rayleigh threshold:

$$
\tau := 2 d _ j b^T Q _ S^{-1} b \ge 0. \qquad (5.6)
$$

**Case 1: Below threshold**: If $\tau \lt 1$ , then $Q _ S'$ remains strictly positive definite on $S$ .

**Case 2: Critical degeneracy**: If $\tau = 1$ , then $Q _ S'$ is positive semidefinite with null vector $z _ 0 = Q _ S^{-1} b$ .

**Case 3: Sign reversal**: A strictly negative direction on $S$ appears if and only if $\tau \gt 1$ . In this case $z _ - := Q _ S^{-1} b$ satisfies:

$$
z _ -^T Q _ S' z _ - = \bigl(b^T Q _ S^{-1} b\bigr)(1 - \tau) \lt 0. \qquad (5.7)
$$

### 5.3 Structural Invariance under Supplementary Proof Materials and Certificate Unsealing: Why Publishing the SHA-256 Data File or Appending Outer Lemmas Cannot Resolve the Operator-Level Discrepancy

Because the upstream existential witness $d \in \mathcal{D} _ B$ on pages 1, 4, 38–39, and 70 of the 79-page paper is represented solely by the 64-character hexadecimal SHA-256 hash 3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5 with zero data bytes disclosed.

A natural question is whether the proof could be completed within its existing architecture simply by publishing the raw numerical file corresponding to that SHA-256 digest, or by appending a supplementary note with a thin equatorial $C^2$ collar regularization and additional formal lemmas.

We now establish a **Trilemma on Supplementary Proof Materials and Certificate Unsealing**: **within the static piecewise-multiplier framework of the paper, neither unsealing the SHA-256 spline coefficient tables, nor inserting an equatorial collar-smoothing regularization, nor appending outer formal lemmas can eliminate the integration-by-parts discrepancy on the admissible perturbation domain.**

#### Theorem 5.4 (The Structural Trilemma of Certificate Unsealing, Collar Smoothing, and Auxiliary Lemmas)

In the reduction architecture of Appendix B (pages 50–70) linking the finite-dimensional certificate space $\mathcal{D} _ B$ to the infinite-dimensional divergence-free perturbation space $\mathcal{D} _ S^\Gamma$ , any attempt to resolve the discrepancy in Proposition B.1 / inequality (B.20) solely by supplying supplementary materials is governed by one of three mutually exclusive and exhaustive structural branches:

**Branch I: Certificate unsealing and spline tables**: Throughout the 79-page paper, the witness $d \in \mathcal{D} _ B$ identified by the SHA-256 digest 3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5 is nothing more than a finite-dimensional table of piecewise-polynomial spline and matrix coefficients (specifying the approximate self-similar profile $W^r$ and the half-space polynomial coefficients of the multiplier weights $D$ and $Z$ ).

The unique analytical bridge from any finite-dimensional tuple $d \in \mathcal{D} _ B$ to the infinite-dimensional coercivity claims on $\mathcal{D} _ S^\Gamma$ (Propositions 2.3 and 4.1, Theorem 7.1) is Proposition B.1 / inequality (B.20) on pages 55–56.

The kernel leak $\ker q _ {\mathrm{bulk}} \not\subseteq \ker f _ v$ occurs at the level of the **distributional differential operator identity** connecting half-space splines to divergence-free vector fields on $\mathbb{R}^3$ (Theorem 3.1: $D^2 W = H _ W dy + [\partial _ z W] _ \Sigma(e _ 3 \otimes e _ 3) dS _ \Sigma$ ), not because a few numerical digits were omitted from the PDF.

Regardless of the coefficients stored in $d \in \mathcal{D} _ B$ , consider a half-space weight $W \in \lbrace D, Z\rbrace$ with non-zero one-sided normal restoring slope ( $[\partial _ z W] _ \Sigma \gt 0$ ) on a non-empty open annulus of the equatorial plane $\Sigma = \lbrace y _ 3 = 0\rbrace$ .

Placing the compactly supported axisymmetric solenoidal field $v _ \varepsilon \in \mathcal{D} _ S^\Gamma$ of Theorem 3.2, or the Schwartz Gaussian solenoidal field of Theorem 3.3, in that annulus violates inequality (B.20) with a strictly positive residual margin.

Family A gives $E _ {D _ +}(v _ \varepsilon) \ge \frac{\pi}{65536}\frac{633509743}{432432000} \gt 0$ , and Family B gives $\Delta/c \gt \frac{26311}{64} \gt 400 \gt 0$ . Publishing rational spline tables cannot alter the distributional Hessian integration-by-parts identity on $\mathbb{R}^3$ .

**Branch II: Collar smoothing and mesh refinement**: Suppose a supplementary note attempts to eliminate the equatorial surface jump $[\partial _ z D _ +] _ \Sigma \neq 0$ by rounding off the kink $|z|$ (or $|\eta|$ ) inside a thin equatorial collar $|z| \le \delta = \lambda\varepsilon$ ( $0 \lt \lambda \le \frac{1}{4}$ ).

The globally $C^2(\mathbb{R}^3)$ even quartic spline is $s _ \delta(z) = \frac{3\delta}{8} + \frac{3z^2}{4\delta} - \frac{z^4}{8\delta^3}$ . This gives $[\partial _ z D _ \delta] _ \Sigma = 0$ , so the singular surface measure vanishes identically:

**(2a) Pure-bulk recovery under the original Hessian bound**: For the compactly supported solenoidal field $v _ \varepsilon \in \mathcal{D} _ S^\Gamma$ of Theorem 3.2 ( $\varepsilon = 2^{-16} = \frac{1}{65536}$ ), equation (3.9) gives $\partial _ z v _ 3(r,z) = \frac{a'(s)}{r} b(t)$ inside $|z| \le \delta$ , where $t = \frac{z}{\varepsilon}$ and $b(t) := \frac{d}{dt}[t(1-t^2)^4] = (1-t^2)^3(1-9t^2) = 1 - 12t^2 + 30t^4 - 28t^6 + 9t^8$ . By the exact sum-of-squares identity

$$
\begin{aligned}
& b(t) - (1 - 12t^2) = t^4\bigl(30 - 28t^2 + 9t^4\bigr) \cr
& = t^4\left[9\left(t^2 - \frac{14}{9}\right)^2 + \frac{74}{9}\right] \ge 0 \qquad (\forall t \in \mathbb{R}),
\end{aligned} \qquad (5.8)
$$

we have $b(t) \ge 1 - 12t^2 \gt 0$ and $b(t)^2 \ge (1-12t^2)^2 \ge 1 - 24t^2$ for all $|t| \le \lambda \le \frac{1}{4}$ . Evaluating the **pure-bulk Hessian integral**

$$
\sum _ {k=1}^3 \int _ {\mathbb{R}^3} (\partial _ k v _ \varepsilon)^T H _ {D _ \delta}(\partial _ k v _ \varepsilon) dy
$$

across the collar $|z| \le \delta = \lambda\varepsilon$ against the normalized vertical curvature kernel $\frac{1}{2}s _ \delta''(z) = \frac{3}{4\delta}(1 - (z/\delta)^2)$ yields the one-dimensional collar transfer factor:

$$
\begin{aligned}
& I _ {\mathrm{collar}}(\lambda) := \int _ {-1}^{1} \frac{3}{4}(1 - \tau^2) b(\lambda\tau)^2 d\tau \cr
& \ge \int _ {-1}^{1} \frac{3}{4}(1 - \tau^2)(1 - 24\lambda^2\tau^2) d\tau = 1 - \frac{24}{5}\lambda^2.
\end{aligned} \qquad (5.9)
$$

In particular, at collar ratio $\lambda = \frac{\delta}{\varepsilon} = \frac{1}{8}$ ( $\delta = 2^{-19} = \frac{1}{524288}$ ), exact rational polynomial integration and the closed-form lower bound (5.9) give:

$$
\begin{aligned}
& I _ {\mathrm{collar}}\left(\frac{1}{8}\right) = \frac{2787617180779875667}{3000241776758882304} \cr
& \gt 1 - \frac{24}{5}\left(\frac{1}{8}\right)^2 = \frac{37}{40} = 0.925 \gt 0.
\end{aligned} \qquad (5.10)
$$

Consequently, even under the globally $C^2$ smoothed **pure-bulk Hessian readout**, the exact same solenoidal field $v _ \varepsilon \in \mathcal{D} _ S^\Gamma$ still violates inequality (B.20) with the strictly positive rational margin:

$$
\begin{aligned}
& \frac{E _ {D _ \delta}^{\mathrm{cert}}(v _ \varepsilon)}{\pi\varepsilon} \cr
& \ge \frac{16}{25} I _ {\mathrm{collar}}\left(\frac{1}{8}\right)A - 16 M K \varepsilon \cr
& = \frac{2147573301937507667}{1611064563204096000} \gt \frac{16}{25}\cdot\frac{37}{40}A - 16 M K \varepsilon \cr
& = \frac{2865558827}{2162160000} \gt \frac{13}{10} \gt 0.
\end{aligned} \qquad (5.11)
$$

**(2b) Negative gradient coefficient from the curvature peak**: If one attempts to absorb the $O(\delta^{-1})$ collar curvature spike into the pointwise coefficient $I _ 1(y) = Z(y) - \Vert H _ {D _ \delta}(y)\Vert _ {\mathrm{op}} - \frac{3w}{50}$ of equation (B.16), the following bound results.

Because $I _ 1'(y) = \frac{1}{4} - Z(y) \ge 0$ forces $Z(y) \le \frac{1}{4}$ everywhere (and $w \ge 0$ ), Theorem 4.1 equation (4.4) at $(r, z) = (1, 0)$ (where $\chi(1/2) = 1, \chi'(1/2) = 0$ ) gives $\Vert H _ {D _ \delta}(1,0)\Vert _ {\mathrm{op}} \ge \frac{3}{8\delta} = 196608$ at $\delta = 2^{-19}$ , driving the gradient coefficient $I _ 1(1,0)$ to a large negative value:

$$
\begin{aligned}
& I _ 1(1,0) = Z(1,0) - \Vert H _ {D _ \delta}(1,0)\Vert _ {\mathrm{op}} - \frac{3w}{50} \cr
& \le \frac{1}{4} - \frac{3}{8\delta} = \frac{1}{4} - 196608 = -\frac{786431}{4} \lt 0.
\end{aligned} \qquad (5.12)
$$

**(2c) Loss of control under broad collars or vanishing slope**: If one takes a wide macroscopic collar $\delta = O(1)$ or sends the equatorial normal slope $c = \partial _ \eta W(\sigma, 0^+) \to 0$ to avoid the $-\frac{3}{8\delta}$ bulk penalty, the following loss occurs.

Then the normal restoring weight vanishes across the equatorial sector $|z| \le \delta r$ , stripping the linearized operator $\mathcal{L} _ {W^r}$ of its normal damping weight near $y _ 3 = 0$ and collapsing coercivity in the equatorial sector.

**Branch III: Auxiliary lemmas and domain restriction**: By the monotonicity of universal quantification in first-order logic, once the universal bridge claim

$$
\forall v \in \mathcal{D} _ S^\Gamma, \mathrm{RHS} _ {\mathrm{B.20}}(v) \le \mathrm{LHS} _ {\mathrm{B.20}}(v)
$$

of Proposition B.1 is refuted by an explicit admissible witness $v _ {\ast} \in \mathcal{D} _ S^\Gamma$ , appending any number of auxiliary lemmas, interval-arithmetic scripts, or parameter tables to the repository cannot restore the truth of Proposition B.1: the same witness $v _ {\ast} \in \mathcal{D} _ S^\Gamma$ continues to falsify it.

Conversely, if one restricts the admissible space $\mathcal{D} _ S^\Gamma$ by imposing extra vanishing-derivative boundary conditions at $y _ 3 = 0$ to exclude $v _ {\ast}$ , then the nonlinear bootstrap closure in Section 7 (page 70)—which requires the linearized resolvent to control **arbitrary** $\Gamma$ -symmetric solenoidal residuals generated by the nonlinear vortex-stretching term $B(v,v)$ —ceases to hold.

**Proof**: Branch I follows directly from Theorems 3.1, 3.2, and 3.3. In Branch II, expanding $9(u - 14/9)^2 + 74/9 = 9u^2 - 28u + 30$ ( $u = t^2$ ) establishes (5.8); integrating against $\int _ {-1}^1 \frac{3}{4}(1-\tau^2) d\tau = 1$ and $\int _ {-1}^1 \frac{3}{4}(1-\tau^2)\tau^2 d\tau = \frac{1}{5}$ yields (5.9)–(5.11); combining (4.4) with $Z \le 1/4$ gives (5.12). Branch III follows from the persistence of universal counterexamples under theory extension and the range-domain closure of the nonlinear fixed-point map in Section 7. Q.E.D.

---

## Chapter 6. Third Fluid-Dynamical Root: The Global Sign-Reversal Blind Spot of Static Euclidean Quadratic Readouts, the Evenness Boundary of Equation (B.18), and the Pure-Square Dissipation True Body under Comoving Covariant Inverse Metrics

### 6.1 Kernel Leakage of the Full-Spectrum Static Euclidean Quadratic Readout: The $4913$ Enstrophy-Derivative Divergence of Twin Initial Data $\pm 17U$

In classical energy and harmonic-analysis approaches to the Navier–Stokes equations, the state of a velocity field $u$ on $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ is observed through the full-spectrum static quadratic readout:

$$
\begin{aligned}
& q _ {\mathrm{static}}(u) := \Bigl(\bigl\lbrace \hat{u}(k)\hat{u}(k)^{\ast}\bigr\rbrace _ {k \in \mathbb{Z}^3}, \cr
& \quad \Vert u\Vert _ {L^2}^2, \Vert \omega\Vert _ {L^2}^2, \Vert \nabla\omega\Vert _ {L^2}^2, \langle u, \omega\rangle\Bigr).
\end{aligned} \qquad (6.1)
$$

Because every component of $q _ {\mathrm{static}}(u)$ is homogeneous of degree two, it is completely blind to global velocity sign reversal: $q _ {\mathrm{static}}(+u) = q _ {\mathrm{static}}(-u)$ . Yet the Navier–Stokes vorticity equation contains the cubic vortex-stretching pairing $2\langle \omega, (\omega \cdot \nabla)u\rangle$ .

#### Theorem 6.1 (Isospectral Twin-Data Divergence under Navier–Stokes Flow on the Three-Torus)

On the normalized three-dimensional torus $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ , consider the smooth divergence-free zero-mean velocity field supported on the eight Fourier modes $\pm e _ 1, \pm e _ 2, \pm e _ 3, \pm(e _ 1+e _ 2)$ :

$$
U(x,y,z) := \bigl(\sin y + \sin z, \sin x, \sin x - \sin(x+y)\bigr). \qquad (6.2)
$$

For any real amplitude $a \gt 0$ , let $u^\pm(t,x)$ be the unique local smooth Navier–Stokes solutions evolving from the twin initial data $u _ 0^\pm := \pm a U$ . Then:

**(1) Equality of the full-spectrum static readout**: At $t = 0$ , $u _ 0^+$ and $u _ 0^-$ have identical single-mode Fourier Hermitian tensors $\hat{u} _ 0^\pm(k)\hat{u} _ 0^\pm(k)^{\ast}$ for every $k \in \mathbb{Z}^3$ , identical kinetic energy $E(u _ 0^\pm) = \frac{5}{2}a^2$ , identical enstrophy $Y(u _ 0^\pm) = \langle |\omega _ 0^\pm|^2\rangle = 3a^2$ , identical palinstrophy $Z(u _ 0^\pm) = \langle |\nabla\omega _ 0^\pm|^2\rangle = 4a^2$ , and identical helicity $H(u _ 0^\pm) = \langle u _ 0^\pm, \omega _ 0^\pm\rangle = 0$ .

**(2) Instantaneous divergence under the true flow**: Because the resonant triadic vortex-stretching integral evaluates to $\langle \omega _ U^T (\nabla U)\omega _ U\rangle = \langle \cos x \cos y \cos(x+y)\rangle = \frac{1}{4}$ , the initial time derivatives of enstrophy along the true Navier–Stokes flow are:

$$
\begin{aligned}
& Y _ \pm'(0) = 2\langle \omega _ 0^\pm, (\omega _ 0^\pm \cdot \nabla)u _ 0^\pm\rangle \cr
& - 2\nu\langle |\nabla\omega _ 0^\pm|^2\rangle = \pm\frac{1}{2}a^3 - 8\nu a^2.
\end{aligned} \qquad (6.3)
$$

At viscosity $\nu = 1$ and amplitude $a = 17$ , the twin solutions diverge with opposite signs (instantaneous vortex-stretching growth versus instantaneous viscous decay):

$$
Y _ +'(0) = +\frac{289}{2}, \qquad Y _ -'(0) = -\frac{9537}{2}, \qquad Y _ +'(0) - Y _ -'(0) = 17^3 = 4913 \neq 0. \qquad (6.4)
$$

In Alpöge and Buckmaster's paper (page 55, equation (B.18)), the linearized perturbation functional around a fixed reference profile $W^r$ ( $\omega _ r = \mathrm{curl} W^r$ , $S _ r = \mathrm{sym}(\nabla W^r)$ ),

$$
\begin{aligned}
& J _ {W^r}(v) := -\omega _ v \cdot S _ r \omega _ v + \bigl((v \cdot \nabla)\omega _ r\bigr) \cdot \omega _ v \cr
& + \frac{1}{2}\sum _ {k=1}^3 \nabla(\omega _ r) _ k \cdot (v \times \partial _ k v),
\end{aligned} \qquad (6.5)
$$

couples distinct harmonics of the perturbation $v$ through $\omega _ r$ , but because $W^r$ is held fixed, every term in $J _ {W^r}(v)$ is still quadratic in $v$ , hence strictly even under global perturbation sign reversal:

$$
J _ {W^r}(-v) = J _ {W^r}(v). \qquad (6.6)
$$

### 6.2 The Comoving Covariant Inverse-Metric $g = C^{-1}$ Pure-Square Dissipation Law and Prefix Reset Conservation

When we replace the static Euclidean identity metric $I$ by a comoving symmetric positive-definite metric carrier $C(t,x) = C(t,x)^T \succ 0$ and its inverse metric $g(t,x) := C(t,x)^{-1}$ co-evolving along the parabolic advection–diffusion operator $P _ \nu = D _ t - \nu \Delta$ ( $D _ t = \partial _ t + u \cdot \nabla$ ), the non-commutative vortex-stretching term is identically annihilated by the comoving metric derivative:

#### Theorem 6.2 (Full-Residual Identity and Pure-Square Dissipation for Comoving Inverse Metrics in Any Dimension)

Let $C(t,x) \in \mathbb{R}^{m\times m}$ be a smooth symmetric positive-definite matrix field on a common smooth interval, $g := C^{-1}$ , $z := C^{-1}\omega$ , and define the comoving covariant enstrophy density $\mathcal{E}(t,x) := \omega^T C^{-1}\omega = z^T C z$ . For general evolution equations

$$
P _ \nu \omega = L\omega + r _ \omega, \qquad (D _ t - \kappa \Delta)C = G C + C G^T + R _ C, \qquad (6.7)
$$

preserving exact non-commutative matrix order yields the **universal full-residual identity**:

$$
\begin{aligned}
& P _ \nu\bigl(\omega^T C^{-1} \omega\bigr) \cr
& = -2\nu \sum _ {i=1}^d (\partial _ i z)^T C (\partial _ i z) + 2 z^T r _ \omega - z^T R _ C z \cr
& + z^T\bigl[(L - G)C + C(L - G)^T\bigr]z + (\nu - \kappa)z^T (\Delta C) z.
\end{aligned} \qquad (6.8)
$$

In particular, under matched generator $G = L$ , matched diffusivity $\kappa = \nu$ , and zero forcing $r _ \omega = 0, R _ C = 0$ (or whenever $L - G = K C^{-1}$ with skew-symmetric $K^T = -K$ ), all first-order stretching terms cancel identically, yielding the **pure-square dissipation law**:

$$
\begin{aligned}
& P _ \nu\bigl(\omega^T C^{-1} \omega\bigr) \cr
& = -2\nu \sum _ {i=1}^d \bigl(\partial _ i(C^{-1}\omega)\bigr)^T C \bigl(\partial _ i(C^{-1}\omega)\bigr) \le 0.
\end{aligned} \qquad (6.9)
$$

On a periodic divergence-free domain, integrating (6.9) shows that total covariant enstrophy $h(t) := \frac{1}{2}\langle \omega^T C^{-1}\omega\rangle$ is monotonically non-increasing: $h'(t) = -\nu\sum _ i \langle (\partial _ i z)^T C (\partial _ i z)\rangle \le 0$ . Meanwhile, every transition between this comoving true body and low-order static readouts is governed by three exact conservation laws:

**(1) Spectral condition-number bridge to Euclidean readouts**: By the parabolic maximum/minimum principle on $P _ \nu C = L C + C L^T$ with $C(0)=I$ and $s(t) = \sup _ x \Vert \mathrm{sym} L(t,x)\Vert _ {\mathrm{op}}$ , $C(t,x)$ obeys the two-sided spectral barrier $\exp(-2\int _ 0^t s) I \preceq C(t,x) \preceq \exp(2\int _ 0^t s) I$ , and recovering Euclidean enstrophy requires paying the spectral factor $|\omega|^2 = |Cz|^2 \le \lambda _ {\max}(C) z^T C z$ .

**(2) Prefix conservation of the metric reset cost**: Resetting $C \leftarrow I$ at fixed vorticity $\omega$ induces the exact jump tax $s _ {\mathrm{reset}} = \frac{1}{2}\langle \omega, (I - C^{-1})\omega\rangle$ , and across every prefix of any finite word of viscous dissipation steps $(h, d, S) \mapsto (h-\delta, d+\delta, S)$ and reset steps $(h, d, S) \mapsto (h+s _ {\mathrm{reset}}, d, S+s _ {\mathrm{reset}})$ , the invariant $h + d - S = h _ 0$ holds identically.

**(3) Finite-shell boundary flux and damped Young remainder**: For the autonomous dyadic shell cascade $z _ n' = 16^n(64 z _ {n-1}^2 - 16 z _ n z _ {n+1}) - \nu 4^n z _ n$ , differentiating the truncated $M$ -shell functional $F _ M = \frac{1}{2}\sum _ {n=0}^M 16^{-n}z _ n^2 + \frac{1}{64}\sum _ {n=0}^M 16^{-n}z _ n z _ {n+1}$ along an infinite-dimensional smooth solution retains the exact cross-boundary tail flux

$$
\begin{aligned}
& \mathcal{B} _ M = 64 z _ M^2 z _ {M+1} + \frac{17}{6}z _ {M+1}^3 + \frac{4}{3}z _ {M+2}^3 \cr
& + \frac{5\nu}{64}4^{-(M+1)}z _ {M+1}^2,
\end{aligned} \qquad (6.10)
$$

while the internal viscous-cubic balance via the damped Young sum-of-squares identity $\frac{64 A^3}{243} - A z^2 + \frac{3}{4}z^3 = (z - \frac{8A}{9})^2(\frac{3}{4}z + \frac{A}{3}) \ge 0$ at $A = \frac{37}{32}\nu 4^{-n}$ yields the exact rational remainder coefficient $\frac{64}{243}(\frac{37}{32})^3 = \frac{50653}{122472}$ .

---

## Chapter 7. Summary Verdict Table: Three-Tier Structural Assessment of the 79-Page Navier–Stokes Paper Proof and Master Criterion for Separating True Continuation Bodies from Projection Artifacts

| Audit tier | Location and object | Structural mechanism | Quantitative evidence | Assessment |
|:---|:---|:---|:---|:---|
| I: Interface measure | Pages 53–56; Proposition B.1 | Bulk readout omits interface pairing | Theorem 3.2, (3.10)–(3.11); Theorem 3.3 | Counterexamples refute the unjoined contract |
| II: Collar curvature | Quartic transition under strong joining | Surface measure transfers into bulk curvature | Theorem 4.1, (4.3)–(4.5) | Joining must include the full curvature cost |
| III: Unclosed reductions | Appendix B and external certificate | Unsealing, smoothing, and auxiliary-lemma trilemma | Theorem 5.4, (5.10)–(5.12) | Constraints persist within the static piecewise-multiplier framework |
| IV: Flow readouts | Static spectra and covariant inverse metric | Sign blindness versus pure-square dissipation | Theorems 6.1–6.2 | Euclidean recovery and reset costs remain necessary |

**(I) Tier I (Equatorial singular surface-measure discrepancy)**: Across Appendix B from the page 53 half-space spline weights $D, Z$ and page 54 equation (B.16) to pages 55–56 Proposition B.1 inequality (B.20), the bulk Hessian readout $q _ {\mathrm{bulk}}(D^2 W) = H _ {\mathrm{bulk}}$ annihilates the singular Dirac surface measure $\Sigma _ W = [\partial _ z W]e _ 3\otimes e _ 3 dS _ {z=0} \in \ker q _ {\mathrm{bulk}}$ on the zero-volume plane $y _ 3=0$ , whereas the solenoidal double integration-by-parts functional $f _ v$ pairs positively with $\Sigma _ W$ ( $\Sigma _ W \notin \ker f _ v$ ). Under the unjoined half-space $C^2$ spline contract, Counterexample Family A ( $D _ + = \frac12 + \frac14\chi \lvert \eta \rvert$ , axisymmetric $v _ \varepsilon$ ) yields $E _ {D _ +}(v _ \varepsilon) \ge \frac{\pi}{65536}\frac{633509743}{432432000} \gt 0$ with dual-weight separation $\ge 2\gamma _ \varepsilon$ , and Counterexample Family B ( $Z = cP \lvert \eta \rvert$ , Schwartz Gaussian mode $\pm(2,1)$ ) yields $\Delta/c \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} \gt 400 \gt 0$ , analytically refuting the unjoined version of Proposition B.1 / (B.20).

**(II) Tier II (Collar curvature-tax conservation under strong joining)**: Restoring global $C^2(\mathbb{R}^3)$ cross-plane joining via the quartic transition spline $s _ \delta(\eta)$ across $\lvert \eta \rvert \le \delta$ eliminates the surface Dirac measure but conserves the total curvature mass $\int _ {-\delta}^{\delta} s _ \delta''(\eta) d\eta = 2$ , forcing an $O(\delta^{-1})$ reciprocal curvature peak $\max s _ \delta'' = \frac{3}{2\delta}$ and $\partial _ {zz}D _ \delta(r,0) = \frac{3\chi}{8\delta r^2} + \frac{3\delta\chi'}{32r(1+r)^2}$ inside the collar:

$$
\begin{aligned}
& \lim _ {\delta\downarrow 0} \int _ { \lvert \eta \rvert \lt\delta} \Vert H _ {D _ \delta}\Vert _ {\mathrm{op}}f dy \cr
& = \int _ {z=0} \frac{\chi}{2r}f dS \gt 0.
\end{aligned}
$$

Thus strong global- $C^2$ joining cannot be added at zero cost: any valid global- $C^2$ weight certificate must pay the full equatorial curvature tax inside the bulk Hessian norm penalty.

**(III) Tier III (Unclosed paper reductions, unreleased certificate, and structural invariance under supplementary materials)**: Along the implication chain of pages 1, 4, 10, 38–39, 54–60, 62–64, and 69–70 (Theorem 1.1 $\Leftarrow$ Theorem 7.1 $\Leftarrow$ Theorem B.14 $\Leftarrow$ external certificate $d \in \mathcal{D} _ B$ , SHA-256 prefix 3f7a335b...), the PDF omits the error coefficients of (B.16), the full proofs of Propositions B.1 and B.4, and seven post-B.14 conditions on page 70. Moreover, Theorem 5.4 (Structural Trilemma) proves that unsealing the SHA-256 spline table cannot alter $D^2 W$ ; at collar ratio $\lambda = \frac{\delta}{\varepsilon} = \frac{1}{8}$ ( $\delta = 2^{-19}$ ), thin-collar $C^2$ regularization transfers the surface jump into the collar bulk Hessian with factor $I _ {\mathrm{collar}}(\frac{1}{8}) = \frac{2787617180779875667}{3000241776758882304} \gt \frac{37}{40}$ to maintain a pure-bulk violation $\ge \frac{\pi}{65536}\frac{2147573301937507667}{1611064563204096000} \gt 0$ on the same $v _ \varepsilon$ , or drives $I _ 1(1,0) \le -\frac{786431}{4} \lt 0$ ; and appending outer lemmas cannot eliminate an explicit counterexample in the admissible domain.

**(IV) Tier IV (Fluid-dynamical continuation body versus static projection readouts)**: Comparing three-dimensional Navier–Stokes vorticity dynamics against the static Euclidean spectral readout $q _ {\mathrm{static}}$ and the comoving covariant inverse metric $g = C^{-1}$ , static Euclidean quadratic readouts are even under sign reversal ( $q _ {\mathrm{static}}(+17U) = q _ {\mathrm{static}}(-17U)$ ) and miss cubic vortex-stretching parity, while equation (B.18) with fixed $W^r$ is likewise quadratic and even in $v$ ( $J _ {W^r}(-v) = J _ {W^r}(v)$ ). Twin initial data $\pm 17U$ diverge in true initial enstrophy derivative by $Y _ +'(0) - Y _ -'(0) = 4913$ , whereas the comoving inverse metric $g = C^{-1}$ annihilates vortex stretching into pure-square dissipation $P _ \nu(\omega^T C^{-1}\omega) = -2\nu\sum _ i (\partial _ i z)^T C (\partial _ i z) \le 0$ , governed by the spectral condition-number bridge and prefix reset conservation laws.
