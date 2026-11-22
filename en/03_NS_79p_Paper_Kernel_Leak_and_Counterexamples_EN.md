# Kernel-Leakage Audit of the Co-Author's 79-Page Navier–Stokes Finite-Time Blow-Up Paper Proof: Separation of the Fluid-Dynamical True Continuation Body from High-Order Semantic-Drift Artifacts and Closed-Form Counterexamples to the Cross-Plane Singular Measure Seam (Pure Closed-Form Edition)

Author: yth
Date: 2026-11-22

---

## Chapter 1. Introduction: The "True Continuation Body" versus "High-Order Semantic-Drift Artifacts" in Three-Dimensional Incompressible Fluid Dynamics — Why Kernel Leakage across Static Quotient Projections Generates Illusory Closures and Illusory Singularities

Throughout a century of modern partial differential equation analysis on the three-dimensional incompressible Navier–Stokes equations, nearly every major controversy surrounding global regularity versus finite-time singularity formation has stemmed from a single, foundational methodological confusion: **analysts routinely mistake a "high-order semantic-drift artifact" produced by projecting a fluid-dynamical operator onto a static observation chart, a piecewise spline grid, or a coarse-grained functional readout for the "true dynamical continuation body" of the fluid continuum along its comoving evolution.**

Consider the three-dimensional incompressible Navier–Stokes system on the whole space $\mathbb{R}^3$ or the three-dimensional periodic torus $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ :

$$
\partial_t u + (u \cdot \nabla) u + \nabla p = \nu \Delta u, \qquad \nabla \cdot u = 0,
$$

together with the vorticity transport–stretching–dissipation equation obtained by taking the curl $\omega = \nabla \times u$ :

$$
\partial_t \omega + (u \cdot \nabla) \omega - (\omega \cdot \nabla) u = \nu \Delta \omega.
$$

In the actual physical and geometric evolution of the continuum, the fluid state is an indivisible, pointwise-coupled entity: the velocity gradient tensor $L = \nabla u$ simultaneously advects the vorticity field along the material derivative $D_t = \partial_t + u \cdot \nabla$ and stretches or tilts the principal axes of vortex tubes through the non-commutative vortex-stretching term $(\omega \cdot \nabla)u = L\omega$ , while the viscous dissipation operator $\nu \Delta$ and the solenoidal Leray pressure projection $\mathbb{P} = I - \nabla \Delta^{-1} \operatorname{div}$ maintain instantaneous global coupling across all spatial scales and frequency shells. This complete, trajectory-preserving evolution operator—carrying every interface trace, singular distributional boundary layer, and non-commutative triadic phase—is the **true continuation body** of the Navier–Stokes equations.

Yet in traditional paper-and-pencil PDE deductions and computer-assisted matrix reductions, in order to compress an infinite-dimensional nonlinear flow into pre-existing Banach space norms or finite-dimensional quadratic inequalities, the analyst invariably introduces a **static readout projection (quotient map)** $q : \mathcal{X} \to \mathcal{Y}$ . Typical instances include:
1. On a piecewise half-space polynomial spline grid in spherical or cylindrical coordinates, reading only the Lebesgue absolutely continuous bulk density $H_{\mathrm{bulk}}$ of the second-order derivative of a multiplier weight function on open half-spaces, while silently discarding the singular Dirac surface measure concentrated on the dividing equatorial plane $\Sigma = \{y_3 = 0\}$ simply because $\Sigma$ has three-dimensional Lebesgue volume measure zero;
2. In Fourier spectral or Littlewood–Paley dyadic shell decompositions, reading only the quadratic shell energy magnitudes $\|\Delta_j u\|_{L^2}^2$ or the single-mode Hermitian spectral energy tensors $\hat{u}(k)\hat{u}(k)^*$ , while erasing the odd cubic triadic resonance phases in the readout $q$ ;
3. In finite-harmonic and finite-cell certificate reductions, projecting an infinite-dimensional divergence-free perturbation field $v$ onto a finite vector of cell unknowns $q(v)$ , while deferring multi-harmonic cross-couplings and cross-interface trace joins to unprinted external error coefficients.

Viewed from mathematical first principles, every readout map $q : \mathcal{X} \to \mathcal{Y}$ defines an equivalence kernel (or null fiber relation):

$$
\ker_{\mathrm{rel}}(q) := \bigl\{(X_+, X_-) \in \mathcal{X} \times \mathcal{X} : q(X_+) = q(X_-)\bigr\}
$$

(which reduces in the linear same-domain setting to the standard null space $\ker q = \{X \in \mathcal{X} : q(X) = 0\}$ ). If an analytical deduction attempts to bound, control, or uniquely determine a downstream physical functional or next-instant evolution operator $f : \mathcal{X} \to \mathcal{Z}$ solely from the projected readout $q(X)$ , the necessary and sufficient condition for mathematical validity is the **quotient-kernel closure law**:

$$
q(X_+) = q(X_-) \implies f(X_+) = f(X_-) \qquad \text{(in the linear same-domain case, }\ \ker q \subseteq \ker f\text{)},
$$

or, for a one-sided coercive lower-bound deduction $f(X) \ge g(q(X))$ , a uniform fiberwise bound across every admissible state in the preimage fiber $q^{-1}(y)$ :

$$
\inf_{X \in \mathcal{X},\, q(X)=y} f(X) \ge g(y).
$$

Whenever, at a seemingly innocuous coordinate chart junction, integration-by-parts seam, or piecewise spline representation, there exists a non-zero structural component $\Sigma \in \ker q$ lying inside the blind spot of the readout $q$ that produces a strictly non-zero escaping output $f(\Sigma) \neq 0$ under the physical operator $f$ (that is, $\ker q \not\subseteq \ker f$ , or within a single readout fiber $q(X_+) = q(X_-)$ the target functional changes sign and violates the claimed coercive bound), we say that the proof seam exhibits **Operator-Kernel Leakage (Kernel Leakage)**.

When kernel leakage occurs, the apparent "coercive closure" or "error control" observed on the projected representation does not reflect an intrinsic property of the Navier–Stokes equations; rather, it is a **high-order semantic-drift artifact** arising from the readout projection $q$ omitting a load-bearing degree of freedom of the full operator. From the standpoint of rigorous mathematical analysis, a proof step resting on an unguarded kernel-leaking reduction does not hold unconditionally on that domain.

This monograph conducts an exhaustive, purely mathematical internal audit of the 79-page Navier–Stokes finite-time blow-up paper proof released on November 20, 2026 by Levent Alpöge (the same author who simultaneously announced the 17.37-million-line Generalized Riemann Hypothesis Lean project) and Tristan Buckmaster, titled *Finite-time blow-up for the Navier–Stokes equations* (79 pages, archived in the authors' repository under the paper directory as finite-time-blow-up-navier-stokes.pdf, pinned commit ad53419de079eb8f95f60313473374624a348546, file size 1,615,293 bytes, SHA-256 digest 4a01929b2f8a595637bbbe1dfef9724e5de768d31283d62415ce045e2ed69901). Setting aside all external proof-assistant packaging and sociological commentary, we operate 100% within partial differential equations, distribution theory, functional analysis, and fluid mechanics. We dissect the 79-page manuscript section by section and equation by equation, establishing:
1. Its three-stage conditional implication architecture and the unclosed external verification dependencies in the paper text;
2. The exact singular surface-measure kernel leakage ( $\ker q_{\mathrm{bulk}} \not\subseteq \ker f_v$ ) across the equatorial plane $y_3 = 0$ between the half-space spline weight representation on page 53, the quadratic coefficients (B.16) on page 54, and the main coercive multiplier inequality (B.20) of Proposition B.1 on pages 55–56;
3. Two completely explicit, closed-form analytical counterexample families (Counterexample Family A for the $D$ -weight seam with exact rational margin $\frac{\pi}{65536}\frac{633509743}{432432000} > 0$ and reduced-readout twin separation, and Counterexample Family B for the $Z$ -weight seam in the $\pm(2,1)$ harmonic mode with exact Gaussian-moment defect $> 400c > 0$ ) that strictly refute the no-join half-space spline contract of Proposition B.1 / (B.20);
4. The $O(\delta^{-1})$ equatorial collar curvature-tax conservation law under strong global- $C^2$ spline smoothing $s_\delta(\eta)$ , proving that the singular surface measure cannot be smoothed away at zero cost;
5. The exact algebraic necessity criteria for the finite-tree quadratic-form certificate in Lemma B.7 and Proposition B.8 (same-domain irredundant row-deletion witness criterion and restricted-subspace Rayleigh threshold $\tau = 2 d_j b^T Q_S^{-1} b$ );
6. The fundamental fluid-dynamical separation between the static Euclidean quadratic energy/enstrophy readout (which is blind to global velocity sign reversal $u_0^\pm = \pm 17 U$ despite an exact enstrophy-derivative divergence of $4913$ ) and the comoving covariant inverse-metric $g = C^{-1}$ evolution, under which non-commutative vortex stretching is identically annihilated into pure-square viscous dissipation.

---

## Chapter 2. Overall Logical Skeleton and Three Load-Bearing Seams of the 79-Page Navier–Stokes Finite-Time Blow-Up Paper Proof

### 2.1 Exact Statement Identification: A Conditional Computer-Assisted Claim of Finite-Time Blow-Up, Not Global Regularity

First, we establish the exact mathematical claim of Alpöge and Buckmaster's 79-page manuscript. The paper does **not** claim global regularity for the three-dimensional incompressible Navier–Stokes equations; on the contrary, it claims **finite-time blow-up** on both $\mathbb{R}^3$ and $\mathbb{T}^3$ .

Specifically, **Theorem 1.1** (pages 2–3) is formulated as an explicit **conditional theorem**:
In the self-similar rescaled variables

$$
y = \frac{x}{\sqrt{T-t}}, \qquad s = \log\frac{T}{T-t},
$$

suppose there exists a non-zero, smooth, time-periodic (with period $S > 0$ in self-similar time $s$ ) velocity–pressure profile $(W, q)$ invariant under a $\kappa$ -fold discrete rotational-reflection symmetry group $\Gamma$ , satisfying the self-similar Navier–Stokes system (equation (1.2) on page 2):

$$
\partial_s W + \frac{1}{2}W + \frac{1}{2}(y \cdot \nabla)W + (W \cdot \nabla)W + \nabla q - \Delta W = 0, \qquad \nabla \cdot W = 0,
$$

together with far-field decay and a spectral gap / finite unstable-codimension condition on the linearized monodromy operator (equation (1.3) on page 2). Then there exist smooth, compactly supported divergence-free initial data $u_0 \in C_c^\infty(\mathbb{R}^3)$ (and smooth periodic divergence-free initial data on $\mathbb{T}^3$ ) whose corresponding Navier–Stokes solutions lose smoothness at the finite time $T > 0$ , with the $L^2$ gradient norm blowing up at the self-similar rate:

$$
\|\nabla u(\cdot, t)\|_{L^2} \sim (T-t)^{-1/4} \qquad (t \uparrow T),
$$

which corresponds to squared vorticity (enstrophy) growth $\|\omega(\cdot, t)\|_{L^2}^2 \sim (T-t)^{-1/2}$ .

To obtain the hypothetical non-zero self-similar periodic profile $(W, q)$ required by the premise of Theorem 1.1, the paper does not provide a closed analytical construction. Instead, it sets up a **three-stage conditional implication chain** spanning Section 7 (pages 29–46) and Appendix B (pages 49–70):

$$
\exists\, d \in \mathcal{D}_B\ \text{satisfying Appendix B certificate validity}\ \mathsf{Valid}_B(d) \xRightarrow{\text{Theorem B.14 (p.69)}} \exists\, c \in \mathcal{C}_7\ \text{satisfying Section 7 a priori certificate}\ \mathsf{Cert}_7(c) \xRightarrow{\text{Theorem 7.1 (p.35)}} \exists\, (W,q)\ \text{satisfying Theorem 1.1 profile premises} \xRightarrow{\text{Theorem 1.1 (p.3)}} \text{Finite-time blow-up on }\mathbb{R}^3\text{ and }\mathbb{T}^3.
$$

### 2.2 Classical Analytic Steps Verified to Be Locally Sound under Their Stated Premises

A rigorous mathematical audit must distinguish steps that are locally valid under their stated hypotheses from seams where kernel leakage or missing proof obligations occur. Our page-by-page inspection confirms that the following five outer reductions in Sections 1–7 are mathematically sound conditional steps and should **not** be misclassified as kernel leaks:
1. **Self-similar coordinate diffeomorphism (page 2, equation (1.4))**: On any pre-blowup time interval $t < T$ , the transformation $(x,t) \mapsto (y,s)$ is a smooth invertible diffeomorphism; it rescales norms without discarding high-frequency modes.
2. **Quotienting by gradient fields on the divergence-free space (page 30, Section 7.1 equation (7.2) and page 34, Section 7.8 equation (7.33))**: Equivalence modulo gradients on the divergence-free space $H$ is canonically isomorphic to equality under the Leray projection $\mathbb{P}$ ; moreover, the adjoint condition (7.33) holds for all representatives, and setting $v = 0$ forces the test field $\psi$ to annihilate the gradient kernel.
3. **Symmetrized bilinear operator and finite-codimension Riesz projection (page 10, equation (2.3) and pages 18–21, Lemmas 4.4–4.6)**: The symmetrized operator $K(\tau)(u,v) = -\frac{1}{2}e^{\tau\Delta}\mathbb{P}[(u\cdot\nabla)v + (v\cdot\nabla)u]$ recovers the exact Navier–Stokes nonlinearity on the diagonal $u = v$ ; in Section 4, for the monodromy recursion $\chi_{n+1} = M\chi_n + f_n$ , the unstable Riesz projection $P_u \chi_n$ is solved via a backward convergent series while the complementary stable component $(I - P_u)\chi_n$ is solved in full via forward iteration rather than being truncated to zero.
4. **Local compactness and strong–weak product convergence (pages 37–43, Propositions 7.5 and 7.10)**: When passing to the limit from finite-dimensional Galerkin approximations, Proposition 7.5 uses local spatiotemporal $H^1$ bounds and Aubin–Lions compactness to extract local $L^2$ strong convergence $v_k \to v$ alongside $\nabla v_k \rightharpoonup \nabla v$ , so Proposition 7.10 passes through the quadratic nonlinearity via a strong–weak product rather than an invalid weak–weak product.
5. **Elimination of the finite-dimensional auxiliary forcing at the fixed point (pages 43–44, equations (7.30)–(7.37))**: Section 7 first solves an auxiliary equation with a finite-dimensional corrective force, and at the topological fixed point uses $\alpha' \in K$ , $\alpha = N(\alpha') \implies \alpha = \alpha'$ together with the invertibility of the matrix $V$ to deduce $\beta^a + \beta = 0$ , eliminating the auxiliary force legitimately conditional on the certificate bounds.

### 2.3 Three Structural Seams and Operator-Kernel Discrepancies in the Paper Proof

Once the outer conditional scaffolding of Sections 1–7 is stripped away, the entire burden of proving that the infinite-dimensional three-dimensional fluid perturbation $v$ around an approximate profile $W^r$ obeys a strictly coercive energy estimate (confining the unstable spectrum of the monodromy operator) rests on **Appendix B (pages 49–70)**. Within this load-bearing core, three structural issues arise:

1. **Structural Seam I (Singular Surface-Measure Kernel Leakage across the Equatorial Plane** $y_3 = 0$ **in Proposition B.1 / Inequality (B.20), Refuted by Closed-Form Counterexamples A and B)**:
   On page 53, the multiplier weights $D$ and $Z$ are defined via piecewise polynomial spline formulas on the upper and lower half-spaces $y_3 > 0$ and $y_3 < 0$ . On pages 54–56, in defining the quadratic-form coefficients (B.16) and deriving the fundamental coercive multiplier inequality **(B.20)** of **Proposition B.1**, if one relies only on piecewise $C^2$ regularity on each half-space and reads only the open-half-space pointwise Hessian $H_{\mathrm{bulk}}$ without enforcing the cross-plane normal-derivative join conditions $[\partial_{y_3} D]_{y_3=0} = 0$ and $[\partial_{y_3} Z]_{y_3=0} = 0$ , the distributional Hessian $D^2 W = H_{\mathrm{bulk}}\,dy + [\partial_{y_3} W]\,e_3\otimes e_3\,dS_{y_3=0}$ contains a **singular Dirac surface measure** on $y_3 = 0$ . The bulk readout $q_{\mathrm{bulk}}$ annihilates this singular surface measure ( $\Sigma_W \in \ker q_{\mathrm{bulk}}$ ), yet the divergence-free integration-by-parts pairing functional $f_v$ evaluates it to a strictly positive quantity ( $\Sigma_W \notin \ker f_v$ ), directly violating inequality (B.20).
2. **Structural Seam II (The** $O(\delta^{-1})$ **Equatorial Collar Curvature Conservation Law under Global-** $C^2$ **Join Regularization)**:
   Even if one enforces global $C^2(\mathbb{R}^3)$ cross-plane joining by inserting a smooth transition spline $s_\delta(\eta)$ across a thin equatorial collar $|\eta| \le \delta$ , the singular surface measure does not vanish for free: it converts into an $O(\delta^{-1})$ bulk Hessian curvature spike $\max s_\delta'' = \frac{3}{2\delta}$ inside the collar whose volume integral $\int_{|\eta|<\delta} \|H_{D_\delta}\|_{\mathrm{op}} f\,dy$ converges strictly to the positive surface jump integral as $\delta \downarrow 0$ .
3. **Structural Seam III (Unclosed Paper Reductions and Unreleased External Certificate Data)**:
   In the 79-page PDF itself, the explicit error coefficients of (B.16) (page 54), the full proofs of Proposition B.1 (pages 55–56) and Proposition B.4 (pages 59–60), and seven additional certificate conditions listed at the end of the proof of Theorem B.14 (page 70) are **omitted from the paper text**; meanwhile, the witness certificate $d \in \mathcal{D}_B$ at the far left of the implication chain is **never provided in the paper or the repository**, being represented solely by a 64-character hexadecimal SHA-256 string (3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5) checked by an unreleased external 128-bit interval-arithmetic program.

---

## Chapter 3. First Core Kernel-Leakage Proof: Singular Surface-Measure Escape across the Equatorial Plane $y_3 = 0$ between the Half-Space Spline Weights (Page 53) and Coercive Multiplier Inequality (B.20) (Pages 55–56)

### 3.1 The Double Integration-by-Parts Seam in Proposition B.1 and Inequality (B.20)

In Appendix B (pages 49–56), the authors seek a weighted coercive lower bound for divergence-free perturbation fields $v \in \mathcal{D}_S^\Gamma$ invariant under the discrete symmetry group $\Gamma = \langle (R_{\pi/\kappa}, 1/2),\, (R_*, 0) \rangle$ , where $R_{\pi/\kappa}$ is rotation by $\pi/\kappa$ around the $y_3$ -axis and $R_* = \operatorname{diag}(1, -1, -1)$ .

Denote the self-similar spatial coordinates by $y = (y_1, y_2, y_3) \in \mathbb{R}^3$ , spherical radius $\rho = |y| = \sqrt{y_1^2 + y_2^2 + y_3^2}$ , cylindrical radius $r = \sqrt{y_1^2 + y_2^2}$ , vertical coordinate $z = y_3$ , and the compactified radial and colatitude coordinates introduced on page 53:

$$
\sigma = \frac{\rho}{1+\rho} \in [0, 1), \qquad \eta = \frac{z}{\rho} \in [-1, 1].
$$

On page 53, the scalar multiplier weight functions $D(y)$ and $Z(y)$ are expressed via piecewise polynomial splines in $(\sigma, \eta)$ on the upper and lower half-spaces $z > 0$ and $z < 0$ . To establish inequality (B.20) of Proposition B.1 (pages 55–56) using the quadratic-form coefficients $I_2, I_2', I_1', I_1, I_0$ defined in equation (B.16) (page 54), one must integrate by parts the weighted difference between the full gradient norm squared and the curl norm squared of a divergence-free vector field.

For any smooth divergence-free vector field $u$ ( $\nabla \cdot u = \sum_{i=1}^3 \partial_i u_i = 0$ ), the pointwise Levi-Civita contraction identity gives:

$$
|\nabla u|^2 - |\operatorname{curl} u|^2 = \sum_{i,j=1}^3 (\partial_i u_j)^2 - \sum_{i,j=1}^3 \bigl((\partial_i u_j)^2 - \partial_i u_j\,\partial_j u_i\bigr) = \sum_{i,j=1}^3 \partial_i u_j\,\partial_j u_i.
$$

Multiplying by a scalar weight $W(y)$ and integrating over $\mathbb{R}^3$ requires **two successive integrations by parts** with respect to $\partial_i$ and $\partial_j$ :

**Theorem 3.1 (Distributional Hessian Decomposition and Singular Surface-Measure Pairing for Half-Space** $C^2$ **Weights)**
Let $W : \mathbb{R}^3 \to \mathbb{R}$ be continuous on $\mathbb{R}^3$ and $C^2$ on the open upper half-space $\mathbb{R}_+^3 = \{z > 0\}$ and open lower half-space $\mathbb{R}_-^3 = \{z < 0\}$ up to the equatorial dividing plane $\Sigma = \{z = 0\}$ , with locally integrable open-set Hessian matrix $H_W(y) = (\partial_i \partial_j W(y))_{1\le i,j\le 3}$ and finite one-sided normal derivative traces on $\Sigma$ . Denote the normal derivative jump across $\Sigma$ by

$$
[\partial_z W](y_1, y_2) := \lim_{z \downarrow 0} \partial_z W(y_1, y_2, z) - \lim_{z \uparrow 0} \partial_z W(y_1, y_2, z).
$$

Then the second-order distributional derivative (distributional Hessian Radon measure $D^2 W$ ) of $W$ on $\mathbb{R}^3$ admits the exact Lebesgue–Radon–Nikodym decomposition:

$$
D^2 W = H_W(y)\,dy + [\partial_z W](y_1, y_2)\,e_3 \otimes e_3\,dS_\Sigma, \tag{3.1}
$$

where $dS_\Sigma = dy_1\,dy_2$ is the two-dimensional area measure on $\Sigma = \{z=0\}$ . Consequently, for every compactly supported $C^2$ divergence-free vector field (or rapidly decreasing Schwartz divergence-free vector field) $u$ , we have the exact identity:

$$
\int_{\mathbb{R}^3} W(y)\bigl(|\nabla u|^2 - |\operatorname{curl} u|^2\bigr)\,dy = \langle D^2 W,\, u \otimes u \rangle = \int_{\mathbb{R}^3} u(y)^T H_W(y) u(y)\,dy + \int_{z=0} [\partial_z W](y_1, y_2)\,u_3(y_1, y_2, 0)^2\,dS_\Sigma. \tag{3.2}
$$

**Proof**: Split the integral over $\mathbb{R}^3$ into the sum of the integrals over $\mathbb{R}_+^3$ and $\mathbb{R}_-^3$ . On each half-space, since $W$ is $C^2$ up to the boundary $\Sigma$ and $\nabla \cdot u = 0$ , the first integration by parts with respect to $y_i$ uses $\partial_i(u_j \partial_j u_i) = \partial_i u_j\,\partial_j u_i + u_j \partial_j(\nabla \cdot u) = \partial_i u_j\,\partial_j u_i$ to yield:

$$
\int_{\mathbb{R}_\pm^3} W \sum_{i,j=1}^3 \partial_i u_j\,\partial_j u_i\,dy = -\int_{\mathbb{R}_\pm^3} \sum_{i,j=1}^3 (\partial_i W) u_j \partial_j u_i\,dy \mp \int_{z=0} W(y_1, y_2, 0^\pm) \sum_{j=1}^3 u_j \partial_j u_3\,dS_\Sigma.
$$

Because $W$ is continuous across $z = 0$ , $W(y_1, y_2, 0^+) = W(y_1, y_2, 0^-)$ , so the upper and lower boundary integrals from the first integration by parts cancel identically. Next, integrate the bulk term by parts a second time with respect to $y_j$ (again using $\sum_{j=1}^3 \partial_j u_j = 0$ ):

$$
-\int_{\mathbb{R}_\pm^3} \sum_{i,j=1}^3 (\partial_i W) u_j \partial_j u_i\,dy = \int_{\mathbb{R}_\pm^3} \sum_{i,j=1}^3 (\partial_j \partial_i W) u_i u_j\,dy \pm \int_{z=0} \sum_{i=1}^3 (\partial_i W)(y_1, y_2, 0^\pm)\,u_i u_3\,dS_\Sigma.
$$

For the tangential indices $i \in \{1, 2\}$ , continuity of $W$ across $z = 0$ implies that $\partial_1 W$ and $\partial_2 W$ on both sides are tangential derivatives of the same trace $W|_\Sigma$ , so $\partial_i W(y_1, y_2, 0^+) = \partial_i W(y_1, y_2, 0^-)$ for $i = 1, 2$ , and the tangential boundary terms cancel identically when summing the two half-spaces. Only the normal index $i = 3$ ( $\partial_z W$ ) leaves a non-vanishing surface integral when the two half-spaces are summed:

$$
\int_{z=0} \bigl(\partial_z W(y_1, y_2, 0^+) - \partial_z W(y_1, y_2, 0^-)\bigr)\,u_3(y_1, y_2, 0)^2\,dS_\Sigma = \int_{z=0} [\partial_z W]\,u_3^2\,dS_\Sigma.
$$

This establishes (3.1) and (3.2). Q.E.D.

### 3.2 Mechanism of the Kernel Leak $\ker q_{\mathrm{bulk}} \not\subseteq \ker f_v$ in Equation (B.16) and Inequality (B.20)

Now examine equation (B.16) on page 54 and inequality (B.20) of Proposition B.1 on pages 55–56 of the paper.
In equation (B.16), the five quadratic coefficients are specified as:

$$
I_2 = D - \frac{3}{50}, \qquad I_2' = 1 - D, \qquad I_1' = \frac{1}{4} - Z, \qquad I_1 = Z - \|H_D\|_{\mathrm{op}} - \frac{3w}{50}, \qquad I_0 = -\|H_Z\|_{\mathrm{op}}, \tag{3.3}
$$

where $\|H_D\|_{\mathrm{op}}$ and $\|H_Z\|_{\mathrm{op}}$ evaluate the pointwise operator norm of the classical bulk Hessian matrix on the open domain $z \neq 0$ .

In the language of quotient projections:
- The **bulk Hessian readout** $q_{\mathrm{bulk}}(D^2 W) := H_W$ extracts only the Lebesgue absolutely continuous bulk density $H_W$ , mapping every singular surface measure $\Sigma_W = [\partial_z W]\,e_3\otimes e_3\,dS_\Sigma$ concentrated on the zero-volume plane $\Sigma = \{z=0\}$ to zero:

$$
\Sigma_W \in \ker q_{\mathrm{bulk}}.
$$

- When Theorem 3.1 is applied to the second-derivative tier ( $W = D$ applied to each partial derivative $u = \partial_k v$ for $k=1,2,3$ ) and to the first-derivative tier ( $W = Z$ applied to $u = v$ ), the difference functionals $E_D(v)$ and $E_Z(v)$ representing $\mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}}$ (which Proposition B.1 claims must satisfy $\mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}} \le 0$ ) take the exact form:

$$
E_D(v) = \sum_{k=1}^3 \int_{\mathbb{R}^3} (\partial_k v)^T H_D (\partial_k v)\,dy - \int_{\mathbb{R}^3} \|H_D\|_{\mathrm{op}}\,|\nabla v|^2\,dy + \int_{z=0} [\partial_z D]\,|\nabla v_3|^2\,dS_\Sigma, \tag{3.4}
$$

$$
E_Z(v) = \int_{\mathbb{R}^3} v^T H_Z v\,dy - \int_{\mathbb{R}^3} \|H_Z\|_{\mathrm{op}}\,|v|^2\,dy + \int_{z=0} [\partial_z Z]\,v_3^2\,dS_\Sigma. \tag{3.5}
$$

In both (3.4) and (3.5), the sum of the first two bulk integrals is always $\le 0$ by definition of the operator norm $\|H_W\|_{\mathrm{op}}$ . **However, the third term—the singular surface integral** $\int_{z=0} [\partial_z D]|\nabla v_3|^2\,dS_\Sigma$ **or** $\int_{z=0} [\partial_z Z]v_3^2\,dS_\Sigma$ **coming from** $\ker q_{\mathrm{bulk}}$ **—is not controlled by the bulk Hessian norm terms** $-\|H_D\|_{\mathrm{op}}$ **or** $-\|H_Z\|_{\mathrm{op}}$ **.**

Even more strikingly, one might ask whether the reflection symmetry $R_* = \operatorname{diag}(1, -1, -1) \in \Gamma$ automatically kills the surface term on $z = 0$ :
- For the $D$ -weight seam (3.4), for an axisymmetric zero-harmonic perturbation $v$ , $R_*$ -symmetry forces the vertical velocity $v_3$ to be an odd function of $z$ , so $v_3(y_1, y_2, 0) = 0$ and its tangential derivatives $\partial_1 v_3(y_1, y_2, 0) = \partial_2 v_3(y_1, y_2, 0) = 0$ on $z = 0$ . **Yet the integrand in (3.4) is** $|\nabla v_3|^2 = |\partial_1 v_3|^2 + |\partial_2 v_3|^2 + |\partial_z v_3|^2$ **. Because** $v_3$ **is odd in** $z$ **, its normal derivative** $\partial_z v_3$ **is an even function of** $z$ **and remains non-vanishing on** $z = 0$ **.**
- For the $Z$ -weight seam (3.5), in the non-zero angular harmonic mode $\iota = \pm(2,1)$ , $R_*$ -equivariance is satisfied via the odd parity of $\sin(6\varphi)$ under $\varphi \mapsto -\varphi$ , while the vertical velocity $v_3$ is an **even** function of $z$ , so $v_3(y_1, y_2, 0)$ **itself is strictly non-zero on the equatorial plane** $z = 0$ **.**

We now present two self-contained, closed-form analytical counterexample families that refute the no-join version of Proposition B.1 / inequality (B.20).

---

### 3.3 Closed-Form Counterexample Family A: Axisymmetric Compactly Supported Divergence-Free Perturbation Refuting the $D$ -Weight Seam with Exact Rational Margin and Dual-Model Separation

Fix the valid baseline parameters of Appendix B (pages 50–55): period $S = 1$ , rotation fold $\kappa = 3$ , symmetry group $\Gamma = \langle (R_{\pi/3}, 1/2), (R_*, 0) \rangle$ , reference profile $W^r = 0$ , weight $Z = 0$ , index sets $P_\lambda = P_\mu = \varnothing$ , dimensions $n = N = 0$ , $K = \mathbb{R}^0$ , empty auxiliary lists, $c_\mu = 1/2$ , and $n_\lambda = n_{\nabla\lambda} = n_\mu = 0$ . For a time-independent compactly supported divergence-free field $v$ , the operators in Proposition B.1 reduce to:

$$
F = T_1 v = \frac{1}{2}v + \frac{1}{2}(y \cdot \nabla)v - \Delta v, \qquad M v = -\Delta v, \qquad J = 0, \qquad \|v\|_\mu = 0, \qquad c_M^2 = \frac{50}{3}, \qquad w_* = \frac{39}{50}.
$$

By the solenoidal Parseval identities $\langle T_1 v, -\Delta v\rangle = \|\Delta v\|_{L^2}^2 + \frac{1}{4}\|\nabla v\|_{L^2}^2$ and $\|\nabla\operatorname{curl} v\|_{L^2}^2 = \|\nabla^2 v\|_{L^2}^2 = \|\Delta v\|_{L^2}^2$ , the auxiliary constant $w$ and the $3/50$ terms in (B.20) cancel identically, and $\mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}}$ equals $E_D(v)$ in (3.4).

**Construction of the Half-Space** $C^2$ **Twin Weights** $D_\pm$ :
Let $h(t) = 6t^5 - 15t^4 + 10t^3$ be the quintic Hermite step polynomial ( $h(0)=h'(0)=h''(0)=0$ , $h(1)=1$ , $h'(1)=h''(1)=0$ , $h'(t) = 30t^2(1-t)^2 \ge 0$ on $[0,1]$ ). Define the radial cutoff:

$$
\chi(\sigma) = \begin{cases} 0, & 0 \le \sigma \le \dfrac{1}{4}, \\[6pt] h(12\sigma - 3), & \dfrac{1}{4} < \sigma < \dfrac{1}{3}, \\[6pt] 1, & \dfrac{1}{3} \le \sigma < 1, \end{cases}
$$

and define the twin half-space $C^2$ polynomial spline weights:

$$
D_\pm(y) := \frac{1}{2} \pm \frac{1}{4}\chi(\sigma)\,|\eta| = \frac{1}{2} \pm \frac{1}{4}\chi\!\left(\frac{\rho}{1+\rho}\right)\frac{|z|}{\rho}, \qquad D_\pm(0) = \frac{1}{2}. \tag{3.6}
$$

Both $D_+$ and $D_-$ are identically constant ( $1/2$ ) near the origin ( $\rho \le 1/3$ ), belong to $C^2$ piecewise polynomials on each half-space chart, satisfy $\frac{1}{4} \le D_\pm \le \frac{3}{4}$ globally (so $I_2' = 1 - D_\pm \ge \frac{1}{4} > 0$ ), and are axisymmetric and even in $z$ . On the region $\rho \ge \frac{1}{2}$ ( $\sigma \ge \frac{1}{3}$ ), $\chi(\sigma) = 1$ and $D_+(y) = \frac{1}{2} + \frac{|z|}{4\rho}$ , so the normal derivative jumps across $z = 0$ are:

$$
[\partial_z D_+](r) = \frac{1}{2r}, \qquad [\partial_z D_-](r) = -\frac{1}{2r} \qquad \left(r \ge \frac{1}{2}\right). \tag{3.7}
$$

**Construction of the Compactly Supported** $C^2$ **Axisymmetric Divergence-Free Perturbation** $v_\varepsilon$ :
Let $a(t) := (1 - t^2)_+^4 \in C_c^3(\mathbb{R})$ (supported on $[-1, 1]$ with $a(0) = 1$ ). For $0 < \varepsilon \le \frac{1}{4}$ , define the axisymmetric stream function $\psi_\varepsilon$ and velocity field $v_\varepsilon$ in cylindrical coordinates $(v_r, v_\varphi, v_3)$ :

$$
\psi_\varepsilon(r, z) := \varepsilon z\,a\!\left(\frac{r-1}{\varepsilon}\right) a\!\left(\frac{z}{\varepsilon}\right), \qquad v_r = -\frac{1}{r}\partial_z \psi_\varepsilon, \qquad v_\varphi = 0, \qquad v_3 = \frac{1}{r}\partial_r \psi_\varepsilon. \tag{3.8}
$$

In the rescaled local coordinates $s = \frac{r-1}{\varepsilon} \in [-1,1]$ and $t = \frac{z}{\varepsilon} \in [-1,1]$ , we have:

$$
v_r(r,z) = -\frac{\varepsilon}{r}a(s)\bigl(a(t) + t a'(t)\bigr), \qquad v_3(r,z) = \frac{\varepsilon}{r}t a'(s)a(t). \tag{3.9}
$$

Direct inspection confirms:
1. **Exact divergence-freeness and compact** $C^2$ **regularity**: $\operatorname{div} v_\varepsilon = \frac{1}{r}\partial_r(r v_r) + \partial_z v_3 \equiv 0$ ; its support lies in the toroidal tube $\{|r-1| \le \varepsilon,\, |z| \le \varepsilon\}$ bounded away from the axis $r=0$ and origin ( $\rho \ge r \ge \frac{3}{4} > \frac{1}{2}$ , where $\chi(\sigma) \equiv 1$ ); and $a \in C_c^3 \implies v_\varepsilon \in C_c^2(\mathbb{R}^3)$ .
2. **Exact** $\Gamma$ **-invariance**: $v_\varepsilon$ is axisymmetric and time-independent, with $v_r$ even in $z$ and $v_3$ odd in $z$ , hence invariant under $R_* = \operatorname{diag}(1, -1, -1)$ , so $v_\varepsilon \in \mathcal{D}_S^\Gamma$ .
3. **Non-vanishing normal derivative on the equatorial plane** $z = 0$ : On $z = 0$ ( $t = 0$ ), $v_3(r,0) = 0$ and $\partial_r v_3(r,0) = 0$ , but since $a(0) = 1$ ,

$$
\partial_z v_3(r, 0) = \frac{a'(s)}{r} \neq 0.
$$

**Theorem 3.2 (Exact Rational Violation Margin of Counterexample Family A and Dual-Model Separation under** $q_{\mathrm{red}}$ **)**
For the admissible weak-contract data above and the perturbation $v_\varepsilon$ with $a(t) = (1-t^2)_+^4$ and $\varepsilon = 2^{-16} = \frac{1}{65536}$ , inequality (B.20) of Proposition B.1 (which requires $E_D(v) := \mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}} \le 0$ ) is strictly violated by $D_+$ , with the exact rational lower bound:

$$
E_{D_+}(v_\varepsilon) \ge \gamma_\varepsilon := \frac{\pi}{65536}\cdot\frac{633509743}{432432000} > 0. \tag{3.10}
$$

Furthermore, under the reduced readout $q_{\mathrm{red}}$ that observes the bulk Hessian operator-norm field $\|H_D\|_{\mathrm{op}}$ , the equatorial plane value $D|_{z=0}$ , the uniform bounds $[1/4, 3/4]$ , and all fixed structural parameters, the twin weights $(D_+, D_-)$ have identical readout values ( $q_{\mathrm{red}}(D_+) = q_{\mathrm{red}}(D_-)$ ), yet their outputs in (B.20) diverge with opposite signs:

$$
E_{D_+}(v_\varepsilon) \ge +\gamma_\varepsilon > 0, \qquad E_{D_-}(v_\varepsilon) \le -\gamma_\varepsilon < 0, \qquad E_{D_+}(v_\varepsilon) - E_{D_-}(v_\varepsilon) \ge \frac{\pi}{32768}\cdot\frac{633509743}{432432000} > 0. \tag{3.11}
$$

**Proof**:
First, evaluate the singular surface integral $T_\varepsilon$ . On the support $r = 1 + \varepsilon s \in [3/4, 5/4]$ , $[\partial_z D_+] = \frac{1}{2r}$ , $|\nabla v_3(r,0)|^2 = \frac{a'(s)^2}{r^2}$ , and $dS = 2\pi r\,dr = 2\pi\varepsilon(1+\varepsilon s)\,ds$ . Since $1 + \varepsilon s \le \frac{5}{4}$ , we have $(1+\varepsilon s)^{-1} \ge \frac{4}{5}$ , so:

$$
T_\varepsilon = \int_{z=0} \frac{|\nabla v_3|^2}{2r}\,dS = \pi\varepsilon \int_{-1}^1 \frac{a'(s)^2}{1+\varepsilon s}\,ds \ge \pi\varepsilon \int_{-1}^1 \frac{a'(s)^2}{(1+\varepsilon s)^2}\,ds \ge \frac{16\pi}{25}\varepsilon A,
$$

where the exact rational moment $A$ is (using $a'(s) = -8s(1-s^2)^3$ ):

$$
A = \int_{-1}^1 a'(s)^2\,ds = 64 \int_{-1}^1 s^2(1-s^2)^6\,ds = 128 \sum_{j=0}^6 \frac{(-1)^j \binom{6}{j}}{2j+3} = \frac{131072}{45045}. \tag{3.12}
$$

Second, bound the open-set bulk Hessian operator norm $\|H_{D_+}\|_{\mathrm{op}}$ . On the support $\rho \ge \frac{3}{4}$ , $D_+ = \frac{1}{2} + \frac{|z|}{4\rho}$ . Differentiating $\frac{z}{\rho}$ twice in Cartesian coordinates gives:

$$
\nabla^2\!\left(\frac{z}{\rho}\right) = -\frac{e_3 \otimes y + y \otimes e_3 + z I_3}{\rho^3} + \frac{3z\,y \otimes y}{\rho^5},
$$

so $\|H_{D_+}\|_{\mathrm{op}} \le \frac{3}{2\rho^2} \le \frac{3}{2(3/4)^2} = \frac{8}{3} < 3 =: M$ .

Third, bound the velocity gradient norm squared $|\nabla v_\varepsilon|^2$ and the bulk penalty. On $[-1,1]$ , $|a(t)| \le 1$ ; $a'(t)^2 = 64t^2(1-t^2)^6$ achieves its maximum at $t^2 = 1/7$ with value $\frac{64\times 6^6}{7^7} < 4$ , so $|a'(t)| \le 2$ ; and $a''(t) = -8(1-t^2)^2(1-7t^2)$ satisfies $|a''(t)| \le 8$ . Substituting these into the five cylindrical gradient components for $r \ge \frac{3}{4}$ and $\varepsilon \le \frac{1}{4}$ yields the componentwise upper bounds $|\partial_r v_r| \le \frac{28}{3}$ , $|\partial_z v_r| \le 16$ , $|v_r/r| \le \frac{4}{3}$ , $|\partial_r v_3| \le \frac{104}{9}$ , and $|\partial_z v_3| \le 8$ , whose squares sum to:

$$
|\nabla v_\varepsilon|^2 \le K := \left(\frac{28}{3}\right)^2 + 16^2 + \left(\frac{4}{3}\right)^2 + \left(\frac{104}{9}\right)^2 + 8^2 = \frac{43936}{81}. \tag{3.13}
$$

Since the support volume is $\operatorname{Vol}(\operatorname{supp} v_\varepsilon) = 8\pi\varepsilon^2$ , the two bulk integrals in (3.4) contribute at most $2 M K \cdot 8\pi\varepsilon^2 = 16\pi M K \varepsilon^2$ in magnitude. Hence:

$$
E_{D_+}(v_\varepsilon) \ge T_\varepsilon - 16\pi M K \varepsilon^2 \ge \pi\varepsilon\left(\frac{16}{25}A - 16 M K \varepsilon\right). \tag{3.14}
$$

Substituting $A = \frac{131072}{45045}$ , $M = 3$ , $K = \frac{43936}{81}$ , and $\varepsilon = \frac{1}{65536}$ gives:

$$
\frac{16}{25}\cdot\frac{131072}{45045} - 16\times 3\times\frac{43936}{81}\times\frac{1}{65536} = \frac{2097152}{1126125} - \frac{1373}{3456} = \frac{633509743}{432432000} > 0,
$$

proving (3.10). Finally, since $H_{D_-} = -H_{D_+}$ and $[\partial_z D_-] = -[\partial_z D_+]$ , writing $E_{D_\pm}(v_\varepsilon) = \pm J_v - C_v$ with $C_v = \int \|H_{D_+}\|_{\mathrm{op}}|\nabla v_\varepsilon|^2\,dy \ge 0$ yields $E_{D_-}(v_\varepsilon) \le -\gamma_\varepsilon < 0$ and $E_{D_+}(v_\varepsilon) - E_{D_-}(v_\varepsilon) \ge 2\gamma_\varepsilon$ , proving (3.11). Q.E.D.

---

### 3.4 Closed-Form Counterexample Family B: Schwartz Gaussian Divergence-Free Mode- $\pm(2,1)$ Perturbation Refuting the $Z$ -Weight Seam ( $> 400c$ )

To demonstrate that the singular surface-measure kernel leak also strikes the first-order multiplier weight $Z$ and non-zero angular harmonics, we construct a second, completely independent closed-form counterexample family.

Retaining the baseline empty data of Section 3.3 ( $S=1, \kappa=3, W^r=0, D=0, P_\lambda=P_\mu=\varnothing, n=N=0$ ), let

$$
C_6(x,y) + i S_6(x,y) := (x + i y)^6, \qquad g(x,y,z) := \exp\!\left(-\frac{x^2 + y^2}{2} - 6z^2\right),
$$

and define the three-dimensional Schwartz vector field $v = (v_1, v_2, v_3)$ :

$$
v(x,y,z) := g(x,y,z)\,\bigl(-2 z y C_6(x,y),\ 2 z x C_6(x,y),\ -S_6(x,y)\bigr). \tag{3.15}
$$

Set the half-space $C^2$ spline weight $Z$ to be:

$$
Z(y) := c\,P(\sigma)\,|\eta| = c\,P\!\left(\frac{\rho}{1+\rho}\right)\frac{|z|}{\rho} \qquad (c > 0), \tag{3.16}
$$

where $P(\sigma) = 0$ on $[0, \frac{1}{20}]$ , $P(\sigma) = h(20\sigma - 1)$ on $[\frac{1}{20}, \frac{1}{10}]$ , and $P(\sigma) = 1$ on $[\frac{1}{10}, 1)$ .

**Theorem 3.3 (Mode-** $\pm(2,1)$ **Admissibility, Exact Gaussian Moments, and** $> 400c$ **Violation Bound for Counterexample Family B)**
The vector field (3.15) belongs to the divergence-free Schwartz space $\mathcal{S}(\mathbb{R}^3) \cap \mathcal{D}_S^\Gamma$ and corresponds under the harmonic basis $E_\iota = \exp(i[2\pi(2\iota_2 - \iota_1)\theta + \kappa\iota_1\varphi])$ of page 50 equation (B.2) ( $\kappa = 3$ , time-independent $2\iota_2 = \iota_1$ , angular frequency $\kappa\iota_1 = \pm 6$ ) to the exact harmonic modes $\iota = \pm(2,1)$ . Its exact $L^2$ gradient and vector-Laplacian Gaussian moments and the exact left-hand side of inequality (B.20) are:

$$
\|\nabla v\|_{L^2(\mathbb{R}^3)}^2 = 14880\,\frac{\pi^{3/2}}{2\sqrt{3}}, \qquad \|\Delta v\|_{L^2(\mathbb{R}^3)}^2 = 431280\,\frac{\pi^{3/2}}{2\sqrt{3}}, \tag{3.17}
$$

$$
\mathrm{LHS}_{\mathrm{B.20}} = \frac{47}{50}\|\Delta v\|_{L^2}^2 + \frac{127}{625}\|\nabla v\|_{L^2}^2 = \frac{51053352}{125}\,\frac{\pi^{3/2}}{2\sqrt{3}} = \frac{8508892}{125}\sqrt{3}\pi^{3/2}. \tag{3.18}
$$

Under the half-space $C^2$ weight $Z = c P(\sigma)|\eta|$ ( $c > 0$ ), the defect $\Delta := \mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}} = E_Z(v)$ satisfies the purely analytical lower bound:

$$
\frac{\Delta}{c} \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} > \frac{26311}{64} > 400 > 0. \tag{3.19}
$$

**Proof**:
First, since $C_6 + i S_6 = (x+iy)^6$ is holomorphic, $x\partial_y C_6 - y\partial_x C_6 = -6 S_6$ , so the horizontal divergence is $\partial_x v_1 + \partial_y v_2 = -12 z g S_6$ , which cancels the vertical divergence $\partial_z v_3 = -\partial_z(g S_6) = +12 z g S_6$ identically ( $\operatorname{div} v \equiv 0$ ). In cylindrical coordinates $(r, \varphi, z)$ , $v_r = 0$ , $v_\varphi = 2 z r^7 g \cos(6\varphi)$ , and $v_3 = -r^6 g \sin(6\varphi)$ , which is invariant under rotation by $\pi/3$ and under $R_* : (\varphi, z) \mapsto (-\varphi, -z)$ , so $v \in \mathcal{D}_S^\Gamma$ .

Second, on the equatorial plane $z = 0$ , $v_3(r,\varphi,0) = -r^6 e^{-r^2/2}\sin(6\varphi) \neq 0$ and the normal derivative jump of $Z$ is $[\partial_z Z](r) = \frac{2c P(r/(1+r))}{r}$ . The uncutoff surface integral is:

$$
A_0 = \int_{z=0} \frac{2c}{r} v_3^2\,dS = 2\pi c \int_0^\infty r^{12} e^{-r^2}\,dr = \frac{10395}{64}\pi^{3/2}c, \tag{3.20}
$$

and since $p(\rho) = P(\rho/(1+\rho)) = 1$ for $\rho \ge \frac{1}{9}$ , the core cutoff loss on $r \le \frac{1}{9}$ is at most $2\pi c \int_0^{1/9} r^{12}\,dr = \frac{2\pi c}{13\cdot 9^{13}}$ .

Third, on the exterior region $\rho \ge \frac{1}{9}$ , $Z(y) = c\frac{|z|}{\rho}$ . In the orthonormal spherical frame $(e_\rho, e_\theta, e_\varphi)$ with $t = \frac{|z|}{\rho} \in [0,1]$ , the scaled bulk Hessian $\rho^2 H_{|z|/\rho}$ has eigenvalues $\frac{-t \pm \sqrt{4-3t^2}}{2}$ and $-t$ , whose maximum absolute value on $[0,1]$ is $\frac{2}{\sqrt{3}}$ (attained at $t = \frac{1}{\sqrt{3}}$ ). Thus $\|H_Z(y)\|_{\mathrm{op}} \le \frac{2c}{\sqrt{3}\rho^2}$ for $\rho \ge \frac{1}{9}$ . Bounding the weighted Gaussian volume integral gives:

$$
J := \int_{\mathbb{R}^3} \frac{|v|^2}{\rho^2}\,dy \le \pi \int_{-\infty}^\infty dz \int_0^\infty e^{-r^2 - 12z^2}\bigl(4z^2 r^{13} + r^{11}\bigr)\,dr = \frac{60}{\sqrt{3}}\pi^{3/2},
$$

so the combined magnitude of the two exterior bulk terms in (3.5) is at most $2 \cdot \frac{2c}{\sqrt{3}} J = 80\pi^{3/2}c = \frac{5120}{64}\pi^{3/2}c$ . On the transition shell $\frac{1}{19} \le \rho \le \frac{1}{9}$ , $|P'(\sigma)| \le \frac{75}{2}$ and $|P''(\sigma)| \le 6000$ imply $\|H_Z\|_{\mathrm{op}} < 9000c$ , while $\int_{\rho \le 1/9} |v|^2\,dy \le \frac{8\pi}{15\cdot 9^{15}}$ , bounding the two transition bulk terms by $\frac{9600\pi c}{9^{15}}$ . Subtracting the exterior bulk loss $\frac{5120}{64}\pi^{3/2}c$ from the surface term $\frac{10395}{64}\pi^{3/2}c$ leaves $\frac{5275}{64}\pi^{3/2}c$ , proving (3.19). Q.E.D.

---

## Chapter 4. The $O(\delta^{-1})$ Collar Curvature-Tax Conservation Law under Strong Join Restoration and the Semantic Rift between Paper Text and Code Specifications

### 4.1 Why the Singular Surface Measure Cannot Be Smoothed Away at Zero Cost

Faced with the counterexamples of Chapter 3, an analyst might ask: "If the kink $|\eta|$ across the equatorial plane $z = 0$ ( $\eta = 0$ ) causes a normal-derivative jump $[\partial_z W] \neq 0$ , can we not simply round off $|\eta|$ inside an arbitrarily thin equatorial collar $|\eta| \le \delta$ ( $0 < \delta \le 1$ ) using a $C^2$ -joined even quartic spline $s_\delta(\eta)$ , thereby eliminating the surface jump $[\partial_z W]_\Sigma = 0$ and restoring inequality (B.20)?"

Let us write down the unique minimal quartic even polynomial spline matching the second-order jet ( $s_\delta(\pm\delta) = \delta$ , $s_\delta'(\pm\delta) = \pm 1$ , $s_\delta''(\pm\delta) = 0$ ) at the collar boundaries $\eta = \pm\delta$ :

$$
s_\delta(\eta) := \begin{cases} \dfrac{3\delta}{8} + \dfrac{3\eta^2}{4\delta} - \dfrac{\eta^4}{8\delta^3}, & |\eta| \le \delta, \\[10pt] |\eta|, & |\eta| \ge \delta, \end{cases} \qquad D_\delta(y) := \frac{1}{2} + \frac{1}{4}\chi(\sigma)\,s_\delta(\eta). \tag{4.1}
$$

Inside the collar $|\eta| < \delta$ , its first and second derivatives are:

$$
s_\delta'(\eta) = \frac{3\eta}{2\delta} - \frac{\eta^3}{2\delta^3}, \qquad s_\delta''(\eta) = \frac{3}{2\delta}\left(1 - \frac{\eta^2}{\delta^2}\right). \tag{4.2}
$$

Because all derivatives up to order two match at $\eta = \pm\delta$ , $D_\delta \in C^2(\mathbb{R}^3)$ is globally $C^2$ across the equatorial plane $z = 0$ . Its singular surface measure vanishes ( $[\partial_z D_\delta]_\Sigma = 0$ ), and $E_{D_\delta}(v) \le 0$ holds.

**Where did the singular surface curvature go?**
By exact curvature-mass conservation, it is converted into an $O(\delta^{-1})$ bulk Hessian curvature concentration inside the collar $|\eta| \le \delta$ .

**Theorem 4.1 (The** $O(\delta^{-1})$ **Curvature Spike and Collar Curvature-Tax Conservation Law)**
For the globally $C^2(\mathbb{R}^3)$ joined weight family $D_\delta = \frac{1}{2} + \frac{1}{4}\chi(\sigma)s_\delta(\eta)$ ( $0 < \delta \le 1$ ):
1. **Reciprocal curvature blow-up and invariant mass**: The second derivative $s_\delta''(\eta)$ peaks at $\eta = 0$ with value $\max_{|\eta|\le\delta} s_\delta''(\eta) = \frac{3}{2\delta}$ (the normalized interface kernel $\frac{1}{2}s_\delta''$ peaks at $\frac{3}{4\delta}$ ), and its integrated curvature mass is invariant for all $\delta \in (0,1]$ :

$$
\int_{-\delta}^{\delta} s_\delta''(\eta)\,d\eta = 2, \qquad \int_{-\delta}^{\delta} \frac{1}{2}s_\delta''(\eta)\,d\eta = 1. \tag{4.3}
$$

   At the equatorial plane $z = 0$ ( $r > 0$ ), the vertical second Cartesian partial derivative of $D_\delta$ is:

$$
\partial_{zz} D_\delta(r, 0) = \frac{3\,\chi\!\left(\frac{r}{1+r}\right)}{8\,\delta\,r^2} + \frac{3\,\delta\,\chi'\!\left(\frac{r}{1+r}\right)}{32\,r(1+r)^2}. \tag{4.4}
$$

2. **Non-vanishing collar bulk-Hessian limit**: For every compactly supported continuous non-negative test function $f \in C_c(\mathbb{R}^3)$ (such as $f = |\nabla v|^2$ ), as the collar thickness $\delta \downarrow 0$ , even though the three-dimensional Lebesgue volume of the collar $\{|\eta| < \delta\}$ shrinks at rate $O(\delta)$ , the bulk Hessian operator-norm integral over the collar **never vanishes**; instead, it converges strictly to the singular surface jump integral:

$$
\lim_{\delta \downarrow 0} \int_{|\eta| < \delta} \|H_{D_\delta}(y)\|_{\mathrm{op}}\,f(y)\,dy = \int_{z=0} \frac{\chi\!\left(\frac{r}{1+r}\right)}{2r}\,f(y_1, y_2, 0)\,dS_\Sigma > 0. \tag{4.5}
$$

**Proof**: Equations (4.3) and (4.4) follow by direct integration of (4.2) and the Cartesian chain rule at $z = 0$ ( $\partial_z\eta = 1/r$ , $\partial_{zz}\eta = 0$ , $\partial_z\sigma = 0$ , $\partial_{zz}\sigma = \frac{1}{r(1+r)^2}$ ). For (4.5), decomposing $H_{D_\delta} = A_\delta + R_\delta$ with leading rank-one tensor $A_\delta = \frac{1}{4}\chi(\sigma)s_\delta''(\eta)\nabla\eta \otimes \nabla\eta \succeq 0$ and uniformly bounded remainder $\|R_\delta\|_{\mathrm{op}} = O(1)$ , the remainder integral over the $O(\delta)$ -volume collar vanishes as $\delta \downarrow 0$ , whereas changing variables via $z = \frac{r\eta}{\sqrt{1-\eta^2}}$ and $\eta = \delta t$ in the leading integral gives:

$$
\lim_{\delta \downarrow 0} \int_{|\eta|<\delta} \|A_\delta\|_{\mathrm{op}}\,f\,dy = \int_{z=0} \frac{\chi(r/(1+r))}{4r} f(y_1,y_2,0)\,dS_\Sigma \int_{-1}^1 \frac{3}{2}(1-t^2)\,dt = \int_{z=0} \frac{\chi(r/(1+r))}{2r} f(y_1,y_2,0)\,dS_\Sigma.
$$

Q.E.D.

### 4.2 Fair Stratification between the Weak No-Join Contract and the Strong Global- $C^2$ Contract

Theorems 3.2, 3.3, and 4.1 establish an inescapable dichotomy:
- Under the **weak half-space spline contract** (checking piecewise $C^2$ spline regularity on each half-space chart without enforcing cross-plane normal-derivative joining at $y_3 = 0$ ), Proposition B.1 / inequality (B.20) is **strictly false** and refuted by Counterexample Families A and B.
- Under the **strong global-** $C^2(\mathbb{R}^3)$ **joined contract** (in the authors' companion specification files CellLayerChallenge and ExtendedCoerciveChallenge, the authors explicitly imposed parity-signed cross-plane joining conditions up to order two and global $C^2$ regularity on $\mathbb{R}^3$ , which exclude the unjoined weights $D_\pm$ and $Z$ ), any valid weight certificate must genuinely pay the equatorial curvature tax of Theorem 4.1 inside the bulk Hessian penalty $-\|H_D\|_{\mathrm{op}}$ and $-\|H_Z\|_{\mathrm{op}}$ . Whether an actual numerical weight certificate exists that pays this tax while keeping the full quadratic form coercive leads directly to Chapter 5.

---

## Chapter 5. Second Structural Audit: The "Unpiloted Spans" of the Paper Proof — Omitted (B.16)/B.1/B.4 Error Coefficients, the Unreleased External Certificate, and Exact Same-Domain Breakdown Criteria for Tree Schur Pivots

### 5.1 Why the 79-Page PDF Is Not a Self-Contained Paper Proof

Even under the strong global- $C^2$ interpretation, the 79-page PDF fails to constitute a self-contained paper proof due to four unclosed external dependencies:

| Paper Location | Load-Bearing Mathematical Content | Actual Status in the 79-Page PDF | Consequence for Paper Completeness |
|:---|:---|:---|:---|
| Pages 1, 4, 70 | The finite-dimensional numerical certificate witness $d \in \mathcal{D}_B$ | **Zero data bytes provided**; only the 64-character SHA-256 hash 3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5 is printed | The existential premise $\exists\, d \in \mathcal{D}_B\,\mathsf{Valid}_B(d)$ cannot be independently verified from the paper or repository |
| Pages 4, 10 (Section 1.5) | 128-bit interval-arithmetic (Arb / FLINT) verification of the certificate inequalities | Explicitly stated to lie outside the formalization kernel, and the verification code/certificate are unreleased | External numerical verification data and outputs remain unreleased |
| Pages 54–56 (Equation (B.16) and Proposition B.1) | Explicit high-order error-absorption coefficients in (B.16) and the full proof of (B.20) | Error coefficients are omitted in (B.16); Proposition B.1 gives only an integration-by-parts sketch and defers the full proof to external code | A paper reader cannot reconstruct the exact scalar inequalities from the PDF |
| Pages 59–60 (Proposition B.4) and Page 70 (post-Theorem B.14) | Reduction from arbitrary perturbations to cell unknowns, pressure gauge, trace joins, tail bounds (B.32)–(B.34), and 7 additional unprinted conditions on page 70 | Proof of Proposition B.4 is omitted on paper; page 70 lists seven further unexpanded certificate conditions (cell pressure normalization, local-to-global unknown mapping, omitted harmonics of $W^r$ , rectangles near $y_3=0$ , $\iota \mapsto -\iota$ symmetry) | The reduction bridge $\mathsf{Valid}_B(d) \implies \mathsf{Cert}_7(\Phi(d))$ is not a closed, enumerable contract on paper |

### 5.2 Complete Mathematical Reconstruction of Lemma B.7 and Proposition B.8 and Exact Same-Domain Breakdown Criteria

Despite the absence of the external numerical matrices, **Lemma B.7** (pages 62–63, tree-structured quadratic-form telescoping) and **Proposition B.8** (page 64, free-block non-positivity and restricted strict positivity implying unique free-variable compensation) form the algebraic core of Appendix B. We provide their complete closed-form mathematical proof together with the **exact necessary and sufficient same-domain criteria** for observation-row kernel leakage and restricted pivot breakdown.

**Theorem 5.1 (Telescoping Tree Coercivity in Lemma B.7 and Direct-Sum Free Compensation in Proposition B.8)**
Let $X = P \oplus F$ be a finite-dimensional real vector space ( $P$ the primary perturbation block, $F$ the free parameter block) and $\mathcal{T}$ a finite rooted tree. Suppose at each node $\xi \in \mathcal{T}$ we are given positive weights $w_{\xi,i} > 0$ , a pivot index set $U_\xi$ , pivot coefficients $p_{\xi,j}$ , row bounds $m_{\xi,i} > 0$ , discardable columns $Y_\xi'$ , constraint columns $Y_\xi$ , symmetric matrices $H_\xi, K_\xi, N_\xi, V_\xi$ , and entrywise non-negative error matrices $H_\xi', K_\xi'$ satisfying equations (B.39)–(B.40) on page 62:

$$
H_\xi[x] \le N_\xi[x] + \sum_{\xi' \in \operatorname{child}(\xi)} V_{\xi'}[x] + H_\xi'[|x|], \qquad V_\xi[x] \le K_\xi[x] - \sum_{j \notin U_\xi} m_{\xi,j} x_j^2 + K_\xi'[|x|], \tag{5.1}
$$

$$
R_\xi := H_\xi - \operatorname{diag}_{U_\xi}(p_\xi) - Y_\xi' (Y_\xi')^T + Y_\xi Y_\xi^T - K_\xi, \qquad \sum_j \bigl(|R_{\xi,ij}| + H_{\xi,ij}' + K_{\xi,ij}'\bigr)\frac{w_{\xi,i}}{w_{\xi,j}} \le m_{\xi,i}, \qquad \bar{p}_{\xi,j} \le p_{\xi,j} - m_{\xi,j}. \tag{5.2}
$$

Then:
1. **Nodewise weighted Young inequality**: Using $2|x_i x_j| \le \frac{w_{\xi,i}}{w_{\xi,j}}x_i^2 + \frac{w_{\xi,j}}{w_{\xi,i}}x_j^2$ and symmetry yields $-R_\xi[x] + (H_\xi' + K_\xi')[|x|] \le \sum_i m_{\xi,i} x_i^2$ , and subtracting the two inequalities in (5.1) gives:

$$
N_\xi[x] + \sum_{\xi' \in \operatorname{child}(\xi)} V_{\xi'}[x] - V_\xi[x] \ge \sum_{j \in U_\xi} \bar{p}_{\xi,j} x_j^2 - |Y_\xi^T x|^2. \tag{5.3}
$$

2. **Tree summation and restricted strict positivity**: Summing (5.3) over all $\xi \in \mathcal{T}$ cancels every non-root transfer form $V_\xi[x]$ pairwise; if $V_{\mathrm{root}} \succeq 0$ and every coordinate $j$ is covered by positive net pivots $D_{jj} := \sum_{\xi : j \in U_\xi} \bar{p}_{\xi,j} > 0$ , then $N := \sum_{\xi \in \mathcal{T}} N_\xi \succeq D - Y Y^T$ ( $Y := [Y_\xi]_{\xi \in \mathcal{T}}$ ), so $N$ is strictly positive definite on the constraint kernel $S := \ker Y^T$ : $N[x] \ge (\min_j D_{jj})|x|^2 > 0$ for all $x \in S \setminus \{0\}$ .
3. **Direct-sum decomposition and unique free compensation**: If $N|_F \preceq 0$ on the free subspace $F = \{0\} \oplus F$ (guaranteed by setting $v = 0$ in equation (B.44) on page 64, where the right-hand side is $-|\zeta|^2/1000 \le 0$ ) and $\#\operatorname{cols}(Y) \le \dim F$ , then $S \cap F = \{0\}$ and dimension pinching forces:

$$
X = S \oplus F, \qquad \operatorname{rank}(Y) = \#\operatorname{cols}(Y) = \dim F. \tag{5.4}
$$

   Writing $Y^T = (Y_p^T,\ Y_f^T)$ along $P \oplus F$ , the square block $Y_f$ is invertible, and every primary state $x_p \in P$ admits the unique compensating free vector $x_f = -(Y_f^T)^{-1} Y_p^T x_p \in F$ such that $(x_p, x_f) \in S = \ker Y^T$ (without uniqueness, existence of a compensating $x_f$ is equivalent to the quotient-kernel inclusion $\ker Y_f \subseteq \ker Y_p$ ).

Furthermore, we establish the two exact same-domain criteria governing observation-row deletion and pivot sign reversal:
- **Theorem 5.2 (Same-Domain Witness Criterion for Irredundant Observation-Row Deletion)**: On a restricted subspace $\operatorname{im} J$ ( $J$ a full-column-rank basis matrix for $S = \ker Y^T$ ), deleting the $i$ -th row of an observation matrix $H$ to form $H_{-i}$ causes kernel leakage of a target linear readout $B$ **if and only if there exists a same-domain witness vector** $z$ such that:

$$
H_{-i} J z = 0 \qquad \text{and} \qquad B J z \neq 0. \tag{5.5}
$$

  (Deleting a linearly redundant row preserves $\ker(H_{-i}J) \subseteq \ker(BJ)$ and does not cause kernel leakage; thus row-deletion necessity must always be certified by an explicit witness $z$ satisfying (5.5).)
- **Theorem 5.3 (Rayleigh-Quotient Threshold Criterion for Restricted Subspace Pivot Sign Flip)**: Let $N = L D L^T$ induce a strictly positive definite quadratic form $Q_S := J^T N J \succ 0$ on $S = \operatorname{im} J$ . Flipping the $j$ -th positive pivot $d_j > 0$ of $D$ to $-d_j$ produces $Q_S' = Q_S - 2 d_j b b^T$ with $b := J^T L e_j$ . Define the dimensionless Rayleigh threshold:

$$
\tau := 2 d_j\, b^T Q_S^{-1} b \ge 0. \tag{5.6}
$$

  Then $Q_S'$ remains strictly positive definite on $S$ if $\tau < 1$ , degenerates to positive semidefinite with null vector $z_0 = Q_S^{-1} b$ if $\tau = 1$ , and **acquires a strictly negative direction on** $S$ **if and only if** $\tau > 1$ , in which case $z_- := Q_S^{-1} b$ satisfies:

$$
z_-^T Q_S' z_- = \bigl(b^T Q_S^{-1} b\bigr)(1 - \tau) < 0. \tag{5.7}
$$

### 5.3 Structural Invariance under Supplementary Proof Materials and Certificate Unsealing: Why Publishing the SHA-256 Data File or Appending Outer Lemmas Cannot Resolve the Operator-Level Discrepancy

Because the upstream existential witness $d \in \mathcal{D}_B$ on pages 1, 4, 38–39, and 70 of the 79-page paper is represented solely by the 64-character hexadecimal SHA-256 hash 3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5 with zero data bytes disclosed, a natural question is whether the proof could be completed within its existing architecture simply by publishing the raw numerical file corresponding to that SHA-256 digest, or by appending a supplementary note with a thin equatorial $C^2$ collar regularization and additional formal lemmas.

We now establish a **Trilemma on Supplementary Proof Materials and Certificate Unsealing**: **within the static piecewise-multiplier framework of the paper, neither unsealing the SHA-256 spline coefficient tables, nor inserting an equatorial collar-smoothing regularization, nor appending outer formal lemmas can eliminate the integration-by-parts discrepancy on the admissible perturbation domain.**

**Theorem 5.4 (Structural Trilemma on Unsealing the SHA-256 Certificate, Equatorial Collar Regularization, and Auxiliary Lemma Extension)**
In the reduction architecture of Appendix B (pages 50–70) linking the finite-dimensional certificate space $\mathcal{D}_B$ to the infinite-dimensional divergence-free perturbation space $\mathcal{D}_S^\Gamma$ , any attempt to resolve the discrepancy in Proposition B.1 / inequality (B.20) solely by supplying supplementary materials is governed by one of three mutually exclusive and exhaustive structural branches:

1. **Branch I (Invariance of the Distributional Hessian Identity under Unsealing the SHA-256 Certificate File** $d \in \mathcal{D}_B$ **or Appending Finite-Dimensional Spline Tables)**:
   Throughout the 79-page paper, the witness $d \in \mathcal{D}_B$ identified by the SHA-256 digest 3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5 is nothing more than a **finite-dimensional table of piecewise-polynomial spline and matrix coefficients** (specifying the approximate self-similar profile $W^r$ and the half-space polynomial coefficients of the multiplier weights $D$ and $Z$ ). The **unique analytical bridge** from any finite-dimensional tuple $d \in \mathcal{D}_B$ to the infinite-dimensional coercivity claims on $\mathcal{D}_S^\Gamma$ (Propositions 2.3 and 4.1, Theorem 7.1) is **Proposition B.1 / inequality (B.20)** on pages 55–56.
   - The kernel leak $\ker q_{\mathrm{bulk}} \not\subseteq \ker f_v$ occurs at the level of the **distributional differential operator identity** connecting half-space splines to divergence-free vector fields on $\mathbb{R}^3$ (Theorem 3.1: $D^2 W = H_W\,dy + [\partial_z W]_\Sigma(e_3 \otimes e_3)\,dS_\Sigma$ ), not because a few numerical digits were omitted from the PDF.
   - Regardless of what spline coefficients are stored inside $d \in \mathcal{D}_B$ : whenever the half-space spline weight $W \in \{D, Z\}$ has a non-zero one-sided normal restoring slope ( $[\partial_z W]_\Sigma > 0$ ) on any non-empty open annulus of the equatorial plane $\Sigma = \{y_3 = 0\}$ , placing the compactly supported axisymmetric solenoidal field $v_\varepsilon \in \mathcal{D}_S^\Gamma$ of Theorem 3.2 (or the Schwartz Gaussian solenoidal field of Theorem 3.3) inside that annulus violates inequality (B.20) with a strictly positive residual margin ( $E_{D_+}(v_\varepsilon) \ge \frac{\pi}{65536}\frac{633509743}{432432000} > 0$ for Family A and $\Delta/c > \frac{26311}{64} > 400 > 0$ for Family B). Publishing gigabytes of rational spline tables cannot alter the distributional Hessian integration-by-parts identity on $\mathbb{R}^3$ .

2. **Branch II (Quantitative Transfer under Equatorial** $C^2$ **Collar Regularization or Mesh Refinement — Conservation of Curvature Mass in the Pure-Bulk Hessian Integral and Negative Degradation of** $I_1$ **)**:
   Suppose a supplementary note attempts to eliminate the equatorial surface jump $[\partial_z D_+]_\Sigma \neq 0$ by rounding off the kink $|z|$ (or $|\eta|$ ) inside a thin equatorial collar $|z| \le \delta = \lambda\varepsilon$ ( $0 < \lambda \le \frac{1}{4}$ ) via the globally $C^2(\mathbb{R}^3)$ even quartic spline $s_\delta(z) = \frac{3\delta}{8} + \frac{3z^2}{4\delta} - \frac{z^4}{8\delta^3}$ (so that $[\partial_z D_\delta]_\Sigma = 0$ and the singular surface measure vanishes identically):
   - **First, under the certificate's open-set bulk Hessian bound** $M = 3$ **, the singular surface escape reappears at 100% strength inside the pure-bulk Hessian integral on the exact same solenoidal field** $v_\varepsilon$ :
     For the compactly supported solenoidal field $v_\varepsilon \in \mathcal{D}_S^\Gamma$ of Theorem 3.2 ( $\varepsilon = 2^{-16} = \frac{1}{65536}$ ), equation (3.9) gives $\partial_z v_3(r,z) = \frac{a'(s)}{r} b(t)$ inside $|z| \le \delta$ , where $t = \frac{z}{\varepsilon}$ and $b(t) := \frac{d}{dt}[t(1-t^2)^4] = (1-t^2)^3(1-9t^2) = 1 - 12t^2 + 30t^4 - 28t^6 + 9t^8$ . By the exact sum-of-squares identity

$$
b(t) - (1 - 12t^2) = t^4\bigl(30 - 28t^2 + 9t^4\bigr) = t^4\left[9\left(t^2 - \frac{14}{9}\right)^2 + \frac{74}{9}\right] \ge 0 \qquad (\forall\, t \in \mathbb{R}), \tag{5.8}
$$

     we have $b(t) \ge 1 - 12t^2 > 0$ and $b(t)^2 \ge (1-12t^2)^2 \ge 1 - 24t^2$ for all $|t| \le \lambda \le \frac{1}{4}$ . Evaluating the **pure-bulk Hessian integral** $\sum_{k=1}^3 \int_{\mathbb{R}^3} (\partial_k v_\varepsilon)^T H_{D_\delta}(\partial_k v_\varepsilon)\,dy$ across the collar $|z| \le \delta = \lambda\varepsilon$ against the normalized vertical curvature kernel $\frac{1}{2}s_\delta''(z) = \frac{3}{4\delta}(1 - (z/\delta)^2)$ yields the one-dimensional collar transfer factor:

$$
I_{\mathrm{collar}}(\lambda) := \int_{-1}^{1} \frac{3}{4}(1 - \tau^2)\,b(\lambda\tau)^2\,d\tau \ge \int_{-1}^{1} \frac{3}{4}(1 - \tau^2)(1 - 24\lambda^2\tau^2)\,d\tau = 1 - \frac{24}{5}\lambda^2. \tag{5.9}
$$

     In particular, at collar ratio $\lambda = \frac{\delta}{\varepsilon} = \frac{1}{8}$ ( $\delta = 2^{-19} = \frac{1}{524288}$ ), exact rational polynomial integration and the closed-form lower bound (5.9) give:

$$
I_{\mathrm{collar}}\!\left(\frac{1}{8}\right) = \frac{2787617180779875667}{3000241776758882304} > 1 - \frac{24}{5}\left(\frac{1}{8}\right)^2 = \frac{37}{40} = 0.925 > 0. \tag{5.10}
$$

     Consequently, even under the globally $C^2$ smoothed **pure-bulk Hessian readout**, the exact same solenoidal field $v_\varepsilon \in \mathcal{D}_S^\Gamma$ still violates inequality (B.20) with the strictly positive rational margin:

$$
\frac{E_{D_\delta}^{\mathrm{cert}}(v_\varepsilon)}{\pi\varepsilon} \ge \frac{16}{25}\,I_{\mathrm{collar}}\!\left(\frac{1}{8}\right)A - 16 M K \varepsilon = \frac{2147573301937507667}{1611064563204096000} > \frac{16}{25}\cdot\frac{37}{40}A - 16 M K \varepsilon = \frac{2865558827}{2162160000} > \frac{13}{10} > 0. \tag{5.11}
$$

   - **Second, if one attempts to absorb the** $O(\delta^{-1})$ **collar curvature spike into the pointwise coefficient** $I_1(y) = Z(y) - \|H_{D_\delta}(y)\|_{\mathrm{op}} - \frac{3w}{50}$ **of equation (B.16)**:
     Because $I_1'(y) = \frac{1}{4} - Z(y) \ge 0$ forces $Z(y) \le \frac{1}{4}$ everywhere (and $w \ge 0$ ), Theorem 4.1 equation (4.4) at $(r, z) = (1, 0)$ (where $\chi(1/2) = 1, \chi'(1/2) = 0$ ) gives $\|H_{D_\delta}(1,0)\|_{\mathrm{op}} \ge \frac{3}{8\delta} = 196608$ at $\delta = 2^{-19}$ , driving the gradient coefficient $I_1(1,0)$ to a large negative value:

$$
I_1(1,0) = Z(1,0) - \|H_{D_\delta}(1,0)\|_{\mathrm{op}} - \frac{3w}{50} \le \frac{1}{4} - \frac{3}{8\delta} = \frac{1}{4} - 196608 = -\frac{786431}{4} < 0. \tag{5.12}
$$

   - **Third, if one takes a wide macroscopic collar** $\delta = O(1)$ **or sends the equatorial normal slope** $c = \partial_\eta W(\sigma, 0^+) \to 0$ **to avoid the** $-\frac{3}{8\delta}$ **bulk penalty**:
     Then the normal restoring weight vanishes across the equatorial sector $|z| \le \delta r$ , stripping the linearized operator $\mathcal{L}_{W^r}$ of its normal damping weight near $y_3 = 0$ and collapsing coercivity in the equatorial sector.

3. **Branch III (Logical Persistence of Counterexamples under Theory Extension and Nonlinear Bootstrap Breakdown under Domain Restriction)**:
   By the monotonicity of universal quantification in first-order logic, once the universal bridge claim $\forall\, v \in \mathcal{D}_S^\Gamma,\ \mathrm{RHS}_{\mathrm{B.20}}(v) \le \mathrm{LHS}_{\mathrm{B.20}}(v)$ of Proposition B.1 is refuted by an explicit admissible witness $v_* \in \mathcal{D}_S^\Gamma$ , appending any number of auxiliary lemmas, interval-arithmetic scripts, or parameter tables to the repository cannot restore the truth of Proposition B.1: the same witness $v_* \in \mathcal{D}_S^\Gamma$ continues to falsify it. Conversely, if one restricts the admissible space $\mathcal{D}_S^\Gamma$ by imposing extra vanishing-derivative boundary conditions at $y_3 = 0$ to exclude $v_*$ , then the nonlinear bootstrap closure in Section 7 (page 70)—which requires the linearized resolvent to control **arbitrary** $\Gamma$ -symmetric solenoidal residuals generated by the nonlinear vortex-stretching term $B(v,v)$ —ceases to hold.

**Proof**: Branch I follows directly from Theorems 3.1, 3.2, and 3.3. In Branch II, expanding $9(u - 14/9)^2 + 74/9 = 9u^2 - 28u + 30$ ( $u = t^2$ ) establishes (5.8); integrating against $\int_{-1}^1 \frac{3}{4}(1-\tau^2)\,d\tau = 1$ and $\int_{-1}^1 \frac{3}{4}(1-\tau^2)\tau^2\,d\tau = \frac{1}{5}$ yields (5.9)–(5.11); combining (4.4) with $Z \le 1/4$ gives (5.12). Branch III follows from the persistence of universal counterexamples under theory extension and the range-domain closure of the nonlinear fixed-point map in Section 7. Q.E.D.

---

## Chapter 6. Third Fluid-Dynamical Root: The Global Sign-Reversal Blind Spot of Static Euclidean Quadratic Readouts, the Evenness Boundary of Equation (B.18), and the Pure-Square Dissipation True Body under Comoving Covariant Inverse Metrics

### 6.1 Kernel Leakage of the Full-Spectrum Static Euclidean Quadratic Readout: The $4913$ Enstrophy-Derivative Divergence of Twin Initial Data $\pm 17U$ 

In classical energy and harmonic-analysis approaches to the Navier–Stokes equations, the state of a velocity field $u$ on $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ is observed through the full-spectrum static quadratic readout:

$$
q_{\mathrm{static}}(u) := \Bigl(\bigl\{\hat{u}(k)\hat{u}(k)^*\bigr\}_{k \in \mathbb{Z}^3},\ \|u\|_{L^2}^2,\ \|\omega\|_{L^2}^2,\ \|\nabla\omega\|_{L^2}^2,\ \langle u, \omega\rangle\Bigr). \tag{6.1}
$$

Because every component of $q_{\mathrm{static}}(u)$ is homogeneous of degree two, it is completely blind to global velocity sign reversal: $q_{\mathrm{static}}(+u) = q_{\mathrm{static}}(-u)$ . Yet the Navier–Stokes vorticity equation contains the cubic vortex-stretching pairing $2\langle \omega, (\omega \cdot \nabla)u\rangle$ .

**Theorem 6.1 (Full-Spectrum Static Readout Kernel Leakage on** $\mathbb{T}^3$ **under True Navier–Stokes Evolution)**
On the normalized three-dimensional torus $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ , consider the smooth divergence-free zero-mean velocity field supported on the eight Fourier modes $\pm e_1, \pm e_2, \pm e_3, \pm(e_1+e_2)$ :

$$
U(x,y,z) := \bigl(\sin y + \sin z,\ \sin x,\ \sin x - \sin(x+y)\bigr). \tag{6.2}
$$

For any real amplitude $a > 0$ , let $u^\pm(t,x)$ be the unique local smooth Navier–Stokes solutions evolving from the twin initial data $u_0^\pm := \pm a U$ . Then:
1. **Complete identity under the static readout** $q_{\mathrm{static}}$ : At $t = 0$ , $u_0^+$ and $u_0^-$ have identical single-mode Fourier Hermitian tensors $\hat{u}_0^\pm(k)\hat{u}_0^\pm(k)^*$ for every $k \in \mathbb{Z}^3$ , identical kinetic energy $E(u_0^\pm) = \frac{5}{2}a^2$ , identical enstrophy $Y(u_0^\pm) = \langle |\omega_0^\pm|^2\rangle = 3a^2$ , identical palinstrophy $Z(u_0^\pm) = \langle |\nabla\omega_0^\pm|^2\rangle = 4a^2$ , and identical helicity $H(u_0^\pm) = \langle u_0^\pm, \omega_0^\pm\rangle = 0$ .
2. **Instantaneous cubic divergence under true Navier–Stokes evolution**: Because the resonant triadic vortex-stretching integral evaluates to $\langle \omega_U^T (\nabla U)\omega_U\rangle = \langle \cos x \cos y \cos(x+y)\rangle = \frac{1}{4}$ , the initial time derivatives of enstrophy along the true Navier–Stokes flow are:

$$
Y_\pm'(0) = 2\langle \omega_0^\pm,\, (\omega_0^\pm \cdot \nabla)u_0^\pm\rangle - 2\nu\langle |\nabla\omega_0^\pm|^2\rangle = \pm\frac{1}{2}a^3 - 8\nu a^2. \tag{6.3}
$$

   At viscosity $\nu = 1$ and amplitude $a = 17$ , the twin solutions diverge with opposite signs (instantaneous vortex-stretching growth versus instantaneous viscous decay):

$$
Y_+'(0) = +\frac{289}{2}, \qquad Y_-'(0) = -\frac{9537}{2}, \qquad Y_+'(0) - Y_-'(0) = 17^3 = 4913 \neq 0. \tag{6.4}
$$

In Alpöge and Buckmaster's paper (page 55, equation (B.18)), the linearized perturbation functional around a fixed reference profile $W^r$ ( $\omega_r = \operatorname{curl} W^r$ , $S_r = \operatorname{sym}(\nabla W^r)$ ),

$$
J_{W^r}(v) := -\omega_v \cdot S_r \omega_v + \bigl((v \cdot \nabla)\omega_r\bigr) \cdot \omega_v + \frac{1}{2}\sum_{k=1}^3 \nabla(\omega_r)_k \cdot (v \times \partial_k v), \tag{6.5}
$$

couples distinct harmonics of the perturbation $v$ through $\omega_r$ , but because $W^r$ is held fixed, every term in $J_{W^r}(v)$ is still quadratic in $v$ , hence strictly even under global perturbation sign reversal:

$$
J_{W^r}(-v) = J_{W^r}(v). \tag{6.6}
$$

### 6.2 The Comoving Covariant Inverse-Metric $g = C^{-1}$ Pure-Square Dissipation Law and Prefix Reset Conservation

When we replace the static Euclidean identity metric $I$ by a comoving symmetric positive-definite metric carrier $C(t,x) = C(t,x)^T \succ 0$ and its inverse metric $g(t,x) := C(t,x)^{-1}$ co-evolving along the parabolic advection–diffusion operator $P_\nu = D_t - \nu \Delta$ ( $D_t = \partial_t + u \cdot \nabla$ ), the non-commutative vortex-stretching term is identically annihilated by the comoving metric derivative:

**Theorem 6.2 (Arbitrary-Dimension Comoving Covariant Inverse-Metric Full-Residual Identity and Pure-Square Dissipation Law)**
Let $C(t,x) \in \mathbb{R}^{m\times m}$ be a smooth symmetric positive-definite matrix field on a common smooth interval, $g := C^{-1}$ , $z := C^{-1}\omega$ , and define the comoving covariant enstrophy density $\mathcal{E}(t,x) := \omega^T C^{-1}\omega = z^T C z$ . For general evolution equations

$$
P_\nu \omega = L\omega + r_\omega, \qquad (D_t - \kappa \Delta)C = G C + C G^T + R_C, \tag{6.7}
$$

preserving exact non-commutative matrix order yields the **universal full-residual identity**:

$$
P_\nu\bigl(\omega^T C^{-1} \omega\bigr) = -2\nu \sum_{i=1}^d (\partial_i z)^T C (\partial_i z) + 2 z^T r_\omega - z^T R_C z + z^T\bigl[(L - G)C + C(L - G)^T\bigr]z + (\nu - \kappa)z^T (\Delta C) z. \tag{6.8}
$$

In particular, under matched generator $G = L$ , matched diffusivity $\kappa = \nu$ , and zero forcing $r_\omega = 0, R_C = 0$ (or whenever $L - G = K C^{-1}$ with skew-symmetric $K^T = -K$ ), all first-order stretching terms cancel identically, yielding the **pure-square dissipation law**:

$$
P_\nu\bigl(\omega^T C^{-1} \omega\bigr) = -2\nu \sum_{i=1}^d \bigl(\partial_i(C^{-1}\omega)\bigr)^T C\,\bigl(\partial_i(C^{-1}\omega)\bigr) \le 0. \tag{6.9}
$$

On a periodic divergence-free domain, integrating (6.9) shows that total covariant enstrophy $h(t) := \frac{1}{2}\langle \omega^T C^{-1}\omega\rangle$ is monotonically non-increasing: $h'(t) = -\nu\sum_i \langle (\partial_i z)^T C (\partial_i z)\rangle \le 0$ . Meanwhile, every transition between this comoving true body and low-order static readouts is governed by three exact conservation laws:
1. **Euclidean readout spectral condition-number bridge**: By the parabolic maximum/minimum principle on $P_\nu C = L C + C L^T$ with $C(0)=I$ and $s(t) = \sup_x \|\operatorname{sym} L(t,x)\|_{\mathrm{op}}$ , $C(t,x)$ obeys the two-sided spectral barrier $\exp(-2\int_0^t s)\,I \preceq C(t,x) \preceq \exp(2\int_0^t s)\,I$ , and recovering Euclidean enstrophy requires paying the spectral factor $|\omega|^2 = |Cz|^2 \le \lambda_{\max}(C)\,z^T C z$ .
2. **Prefix-by-prefix metric reset tax conservation**: Resetting $C \leftarrow I$ at fixed vorticity $\omega$ induces the exact jump tax $s_{\mathrm{reset}} = \frac{1}{2}\langle \omega, (I - C^{-1})\omega\rangle$ , and across every prefix of any finite word of viscous dissipation steps $(h, d, S) \mapsto (h-\delta, d+\delta, S)$ and reset steps $(h, d, S) \mapsto (h+s_{\mathrm{reset}}, d, S+s_{\mathrm{reset}})$ , the invariant $h + d - S = h_0$ holds identically.
3. **Finite-shell observation boundary flux and damped Young remainder**: For the autonomous dyadic shell cascade $z_n' = 16^n(64 z_{n-1}^2 - 16 z_n z_{n+1}) - \nu 4^n z_n$ , differentiating the truncated $M$ -shell functional $F_M = \frac{1}{2}\sum_{n=0}^M 16^{-n}z_n^2 + \frac{1}{64}\sum_{n=0}^M 16^{-n}z_n z_{n+1}$ along an infinite-dimensional smooth solution retains the exact cross-boundary tail flux

$$
\mathcal{B}_M = 64 z_M^2 z_{M+1} + \frac{17}{6}z_{M+1}^3 + \frac{4}{3}z_{M+2}^3 + \frac{5\nu}{64}4^{-(M+1)}z_{M+1}^2, \tag{6.10}
$$

   while the internal viscous-cubic balance via the damped Young sum-of-squares identity $\frac{64 A^3}{243} - A z^2 + \frac{3}{4}z^3 = (z - \frac{8A}{9})^2(\frac{3}{4}z + \frac{A}{3}) \ge 0$ at $A = \frac{37}{32}\nu 4^{-n}$ yields the exact rational remainder coefficient $\frac{64}{243}(\frac{37}{32})^3 = \frac{50653}{122472}$ .

---

## Chapter 7. Summary Verdict Table: Three-Tier Structural Assessment of the 79-Page Navier–Stokes Paper Proof and Master Criterion for Separating True Continuation Bodies from Projection Artifacts

| Audit Tier | Exact Paper Location & Mathematical Object | Mechanism of Kernel Leakage ( $\ker q \not\subseteq \ker f$ ) or Structural Gap | Closed-Form Quantitative Witness / Conservation Formula | Scientific Verdict |
|:---|:---|:---|:---|:---|
| **Tier I: Equatorial Plane** $y_3=0$ **Singular Surface-Measure Kernel Leak** | Appendix B, p. 53 half-space spline weights $D, Z$ $\to$ p. 54 (B.16) $\to$ pp. 55–56 Proposition B.1 inequality (B.20) | The bulk Hessian readout $q_{\mathrm{bulk}}(D^2 W) = H_{\mathrm{bulk}}$ annihilates the singular Dirac surface measure $\Sigma_W = [\partial_z W]e_3\otimes e_3\,dS_{z=0} \in \ker q_{\mathrm{bulk}}$ on the zero-volume plane $y_3=0$ , whereas the solenoidal double integration-by-parts functional $f_v$ pairs positively with $\Sigma_W$ ( $\Sigma_W \notin \ker f_v$ ) | **Counterexample Family A** ( $D_+ = \frac12 + \frac14\chi \mid \eta \mid$ , axisymmetric $v_\varepsilon$ ): $E_{D_+}(v_\varepsilon) \ge \frac{\pi}{65536}\frac{633509743}{432432000} > 0$ , twin separation $\ge 2\gamma_\varepsilon$ ; **Counterexample Family B** ( $Z = cP \mid \eta \mid$ , Schwartz Gaussian mode $\pm(2,1)$ ): $\Delta/c \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} > 400 > 0$ | **The no-join half-space** $C^2$ **spline version of Proposition B.1 / (B.20) exhibits operator-kernel leakage and is strictly refuted by two closed-form analytical counterexample families** |
| **Tier II:** $O(\delta^{-1})$ **Collar Curvature-Tax Conservation under Strong Joining** | Globally $C^2(\mathbb{R}^3)$ quartic transition spline $s_\delta(\eta)$ across $\mid \eta \mid \le \delta$ and bulk Hessian penalty $\int \Vert H_{D_\delta}\Vert _{\mathrm{op}} \mid \nabla v \mid ^2\,dy$ | Restoring global $C^2$ cross-plane joining eliminates the surface Dirac measure but conserves total curvature mass $\int_{-\delta}^{\delta} s_\delta''(\eta)\,d\eta = 2$ , forcing a reciprocal spike $\max s_\delta'' = \frac{3}{2\delta}$ inside the collar that cannot be discarded as $\delta \downarrow 0$ | $\partial_{zz}D_\delta(r,0) = \frac{3\chi}{8\delta r^2} + \frac{3\delta\chi'}{32r(1+r)^2}$ ; and $\lim_{\delta\downarrow 0} \int_{ \mid \eta \mid <\delta} \Vert H_{D_\delta}\Vert _{\mathrm{op}}f\,dy = \int_{z=0} \frac{\chi}{2r}f\,dS > 0$ | **Strong global-** $C^2$ **joining cannot be added at zero cost: any valid global-** $C^2$ **weight certificate must pay the full equatorial curvature tax inside the bulk Hessian norm penalty** |
| **Tier III: Unclosed Paper Reductions, Unreleased Certificate & Structural Invariance under Supplementary Materials** | Pages 1, 4, 10, 38–39, 54–60, 62–64, 69–70: Theorem 1.1 $\Leftarrow$ Theorem 7.1 $\Leftarrow$ Theorem B.14 $\Leftarrow$ external certificate $d \in \mathcal{D}_B$ (SHA-256: 3f7a335b...) | The PDF omits the error coefficients of (B.16), the full proofs of B.1 and B.4, and 7 post-B.14 conditions on p. 70; moreover, **Theorem 5.4 (Structural Trilemma)** proves that unsealing the SHA-256 spline table cannot alter $D^2 W$ , thin-collar $C^2$ regularization transfers the surface jump into the collar bulk Hessian or drives $I_1$ strongly negative, and appending outer lemmas cannot eliminate a same-domain counterexample | At collar ratio $\lambda = \frac{\delta}{\varepsilon} = \frac{1}{8}$ ( $\delta = 2^{-19}$ ), transfer factor $I_{\mathrm{collar}}(\frac{1}{8}) = \frac{2787617180779875667}{3000241776758882304} > \frac{37}{40}$ gives pure-bulk violation $\ge \frac{\pi}{65536}\frac{2147573301937507667}{1611064563204096000} > 0$ on the same $v_\varepsilon$ , while absorbing the curvature peak yields $I_1(1,0) \le -\frac{786431}{4} < 0$ | **The 79-page PDF is not self-contained as a paper proof, and within its static piecewise-multiplier framework, unsealing the SHA-256 certificate file or appending supplementary proof materials cannot resolve the operator-level discrepancy** |
| **Tier IV: True Fluid Continuation Body vs Static Projection Artifact** | 3D Navier–Stokes vorticity dynamics vs static Euclidean spectral readout $q_{\mathrm{static}}$ and comoving covariant inverse metric $g = C^{-1}$ | Static Euclidean quadratic readouts are even under sign reversal ( $q_{\mathrm{static}}(+17U) = q_{\mathrm{static}}(-17U)$ ) and miss cubic vortex-stretching parity; equation (B.18) with fixed $W^r$ is also quadratic and even in $v$ ( $J_{W^r}(-v) = J_{W^r}(v)$ ) | Twin initial data $\pm 17U$ diverge in true NS initial enstrophy derivative by $Y_+'(0) - Y_-'(0) = 4913$ ; comoving inverse metric $g = C^{-1}$ annihilates vortex stretching into pure-square dissipation $P_\nu(\omega^T C^{-1}\omega) = -2\nu\sum_i (\partial_i z)^T C (\partial_i z) \le 0$ | **Exposes the exact mathematical root of why static projection readouts lose the non-commutative fluid continuation body, and establishes the exact spectral bridge and prefix reset conservation laws** |
