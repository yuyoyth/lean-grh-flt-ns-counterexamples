# Internal Arithmetic Structural Ruptures, Vacuous Carrier Degeneration, and a Mathematician's Diagnostic Guide to the Thirteen-Million-Line Formalization of Fermat's Last Theorem (A Closed-Form Monograph in Arithmetic Algebraic Geometry and Formal Logic)

---

## Introduction: The Visible Static Type-Signature Stratum versus the Cross-Stage Implicit Arithmetic Coupling Flow in Ultra-Large-Scale Formalizations

At the intersection of modern arithmetic algebraic geometry and mechanized formal verification, a foundational methodological question arises: when a formal proof repository comprising tens of thousands of modules and over thirteen million lines of code passes a static type-checking kernel, to what extent does that certification genuinely faithfully reproduce the arithmetic and geometric mechanism of the classical mathematical proof?

Addressing the thirteen-million-line formalization of Fermat's Last Theorem (reported upstream scale: 60,475 modules, 295,110 theorems, and 145,003 definitions), this monograph operates entirely within the internal mathematics of arithmetic algebraic geometry, the theory of minimal Weierstrass models of elliptic curves, the level-lowering mechanism for residual Galois representations, and dependent type theory. By tracing the core definitions and main proof spine module by module, and by subjecting them to exact arithmetic stress tests using the conductor-11 semistable elliptic curve specimen and the Pythagorean boundary specimen at exponent 2, we uncover a deep structural phenomenon pervasive in large-scale formal proof engineering.

To understand this phenomenon with mathematical precision, one must distinguish two strata that are conflated whenever formal verification is reduced to top-level signature matching:

The first stratum is the **Visible Static Theorem-Signature Stratum**. Within a static type checker, every definition or theorem exposes to external callers only its top-level syntactic type signature. Whenever the static output type of an upstream module unifies syntactically with the static input type demanded by a downstream module, the type checker certifies the interface as closed.

The second stratum is the **Cross-Stage Implicit Arithmetic Coupling Flow**. In the classical proof of Fermat's Last Theorem forged by Frey, Hellegouarch, Serre, Ribet, Mazur, Wiles, and Taylor–Wiles, elliptic curves, modular forms, and Galois representations do not function as isolated static Boolean predicates. Rather, they constitute a tightly coupled, continuously evolving transport chain of arithmetic invariants across successive reduction stages. As the proof advances from the construction of the Hellegouarch–Frey elliptic curve to the modularity lifting of semistable elliptic curves, then to Ribet's step-by-step level lowering of the modulo- $p$ residual Galois representation, and finally to the zero-dimensional vanishing of the weight-2 cusp form space at level 2, each stage must transmit to its successor not merely an existential assertion, but three indispensable implicit arithmetic coupling constraints:

1. **The Binding Constraint between Local and Global Minimal Integral Weierstrass Model Equivalence Classes and Bad-Reduction Fibers**: The reduction behavior of an elliptic curve at each prime (good reduction, multiplicative semistable bad reduction, or additive bad reduction) is an intrinsic geometric invariant of the rational isomorphism class of the curve. At the level of algebraic Weierstrass equations, however, this invariant is well-defined only after one first quotients out rational Weierstrass coordinate transformations at every prime $\ell$ and projects onto the equivalence class of local (or global) minimal integral Weierstrass models—that is, the equivalence class of integral Weierstrass equations isomorphic to the curve over $\mathbb{Q}_\ell$ that minimize the valuation $v_\ell(\Delta)$ of the discriminant. Because any two local minimal integral models at $\ell$ are related by a generalized Weierstrass affine coordinate transformation $(x, y) \mapsto (u^2 x + r,\, u^3 y + u^2 s x + t)$ in which the translation and shear parameters $r, s, t$ leave $c_4, c_6, \Delta$ strictly unchanged while the scaling parameter $u$ is necessarily an $\ell$ -adic unit $u \in \mathbb{Z}_\ell^\times$ , the minimal valuations $v_\ell(\Delta_{\min})$ and $v_\ell(c_{4,\min})$ are strict invariants of the rational isomorphism class. Only on this minimal quotient do the prime factorizations of $\Delta_{\min}$ and $c_{4,\min}$ faithfully encode the true reduction types and the arithmetic conductor $N_E$ .
2. **The Synchronous Coupling Constraint between the Modular Level and the Squarefree Radical of the Minimal Discriminant**: When the modularity theorem produces a normalized weight-2 cusp eigenform $f \in S_2(\Gamma_0(N))$ , its level $N$ cannot be an arbitrary positive integer hidden behind an existential quantifier. It must carry the explicit radical-coupling certificate that $N$ is squarefree and that every prime divisor $q \mid N$ divides the minimal discriminant $\Delta_{\min}$ of the Frey curve (and consequently divides $abc$ ). The moment this coupling between the chosen witness level $N$ and the radical of $abc$ is erased at a theorem interface by existential quantification, the downstream level-lowering induction loses all control over which odd prime factors reside inside $N$ and must be eliminated.
3. **The Cooperative Transmission Constraint of a Non-Empty Ambient Parameter Base and Local Single-Premise Guards**: Eliminating an odd prime factor $q$ from the level $N$ to descend to $N/q$ must be guarded simultaneously by the **absolute irreducibility of the modulo-** $p$ **Galois representation** $\bar{\rho}_{E,p}$ (supplied by Mazur's theorem) and by **local unramifiedness at odd primes** $q \neq 2, p$ **arising from the divisibility** $p \mid v_q(\Delta_{\min})$ **, together with finite-flat group scheme extension at** $q = p$ (supplied by the $2p$ -th power discriminant structure of the Frey curve). At the even prime $q = 2$ , the exponent threshold $p \ge 5$ enforces the $2$ -adic valuation inequality

$$
v_2(\Delta_{\min}) = 2p\,v_2(b) - 8 \ge 2p - 8 \ge 2 > 0,
$$

   which preserves multiplicative bad reduction at $2$ and governs the terminal descent toward $\Gamma_0(2)$ or $\Gamma_0(1)$ . Across classical mathematics, every one of these arithmetic theorems is formulated over a **non-empty domain of elliptic curves or parameter triples**.

The relationship between these two strata is captured by an exact algebraic decomposition. Let $\mathcal{F}_\infty = \varprojlim_n \mathcal{C}_n$ denote the full-order tower of arithmetic invariant formations spanning the entire proof chain, where the $0$ -th stratum $\mathcal{C}_0 = \Sigma_0$ is the visible static theorem-signature section, the $1$ -st stratum $\mathcal{C}_1$ carries integral Weierstrass models equipped with the coordinate-transformation group action and local valuations, the $2$ -nd stratum $\mathcal{C}_2$ encodes the coupling between the conductor radical and modulo- $p$ residual irreducibility, the $3$ -rd stratum $\mathcal{C}_3$ governs local unramified valuation divisibility and prime-by-prime level lowering, and higher strata $\mathcal{C}_{n \ge 4}$ record multi-step level-lowering words and cross-verification trajectories. Letting $\pi_0 : \mathcal{F}_\infty \to \Sigma_0$ denote the truncation projection from the full arithmetic proof state onto the static type signature, its kernel $\mathcal{K}_{\ge 1} = \ker \pi_0$ houses precisely the cross-stage arithmetic coupling relations suppressed by the static signature, yielding the short exact sequence

$$
0 \longrightarrow \mathcal{K}_{\ge 1} \xrightarrow{\;\iota\;} \mathcal{F}_\infty \xrightarrow{\;\pi_0\;} \Sigma_0 \longrightarrow 0.
$$

When a large-scale formalization project optimizes exclusively for syntactic unification on the static visible section $\Sigma_0$ while neglecting the continuous transport of the cross-stage coupling flow inside $\mathcal{K}_{\ge 1}$ , three major structural ruptures arise inside the mathematics itself:
- **First, Dead-Wire Disconnection of the Main Modularity Theorem and Premature Contradiction Elimination Inside the Lower-Level Induction Lemma**: Because the upstream modularity predicate erases the coupling between the chosen witness level $N$ and the conductor radical via an existential quantifier, our kernel-leakage theorem rules out any well-defined recovery map that extracts the conductor-radical support property of the chosen witness level solely from the output of that weak modularity predicate. Independently, direct inspection of the frozen repository source code confirms that the downstream level-lowering theorem disables the unused-variable linter, leaves its explicit weak-modularity hypothesis parameter completely unreferenced in the proof term (zero free occurrences), and instead obtains its modular input from an internal bypass theorem carrying explicit conductor-level constraints (this implementation fact is established by direct source auditing and is carefully distinguished from the algebraic kernel-leakage theorem). Furthermore, inside the lower-level conductor-level descent lemma itself, because strong induction eliminates only odd primes to obtain $M \mid 2$ (meaning $M = 1$ or $M = 2$ ) without preserving the lower-bound bad-reduction divisibility $2 \mid M$ (and without embedding level $1$ into level $2$ via oldform inclusion), the actual proof imports both terminal vanishing theorems $S_2(\Gamma_0(1)) = \{0\}$ and $S_2(\Gamma_0(2)) = \{0\}$ prematurely inside the level-lowering lemma, derives a local contradiction against $f \neq 0$ , and applies the principle of explosion (ex falso quodlibet) to non-constructively derive an existential witness $\exists f \in S_2(\Gamma_0(2)),\, f \neq 0$ handed back to the top-level theorem for a redundant second contradiction.
- **Second, Vacuous Domain Degeneration from Directly Embedding the Counterfactual Equation into the Base Carrier Structure and Logical Explosion Short-Circuiting of the Small-Prime Mazur Isogeny Branches**: The formalization welds the counterfactual Fermat equation $a^p + b^p = c^p$ (with $p \ge 5$ prime and $abc \neq 0$ ) directly into the fields of the base carrier structure (the Frey package record). Because Fermat's Last Theorem is true, this carrier structure is mathematically an **empty set (an uninhabited type)**. Consequently, thousands of intermediate arithmetic theorems universally quantified over a Frey package have an empty domain of quantification and cannot be instantiated on any actual elliptic curve over $\mathbb{Q}$ . Even more strikingly, in the modules purporting to prove that for small prime exponents $p \in \{5, 7, 11, 13\}$ the Frey curve admits no Galois-stable cofixed line (the step responsible for ruling out reducible modulo- $p$ representations), the proofs completely bypass elliptic curve isogeny geometry and modular curve rational-point classification: they directly import externally proved fixed-exponent Fermat theorems for $n = 5, 7, 11, 13$ , collide them against the field $a^p + b^p = c^p$ baked into the Frey package to deduce $P.p \neq n$ , and collide $P.p \neq n$ with the branch hypothesis $P.p = n$ via logical explosion in a single line—a proof term which, in the exact same local context, proves the negation ("a cofixed line exists") or $0 = 1$ without changing a single character.
- **Third, Non-Invariance of Bare Integral Weierstrass Predicates Under Rational Isomorphism**: By defining "good prime" and "semistable model" directly on bare integral Weierstrass equations without first passing to the local minimal integral model equivalence class quotient, the formalization renders semistability non-invariant under rational isomorphism: applying the elementary coordinate scaling $(x, y) \mapsto (u^2 x, u^3 y)$ with $u = 2$ to a genuinely semistable elliptic curve multiplies $\Delta$ by $2^{12}$ and $c_4$ by $2^4$ , causing the curve to fail the repository's bare semistability predicate at the prime $2$ .

This monograph presents a complete, self-contained, closed-form mathematical derivation of all three structural ruptures, their exact source-level realizations, and their quantitative behavior under single-premise deprivation experiments, concluding with an operational six-step diagnostic protocol for working mathematicians and formal-proof referees.

---

## Chapter 1: Three Conservation Laws of Cross-Stage Arithmetic Coupling Flows and the Static Signature Truncation Theorem

### 1.1 Typed History Spaces in Multi-Stage Arithmetic Proof Chains and the Necessary and Sufficient Condition for Quotient Factorization

In an arithmetic geometric proof chain involving multi-stage reductions, let $H$ denote the set of complete typed proof histories. For each stage depth $n \ge 0$ , let $\tau_n$ denote the truncation map extracting the $n$ -th stage state, let $D_n = \tau_n(H)$ be the set of visible $n$ -th stage arithmetic states generated by projecting complete histories, and let $\mathcal{C}_n = \mathbb{Q}^{(D_n)}$ be the free $\mathbb{Q}$ -vector space spanned by $D_n$ , equipped with natural prefix-forgetful surjections $p_{n,n+1} : \mathcal{C}_{n+1} \to \mathcal{C}_n$ satisfying $\tau_n = p_{n,n+1} \circ \tau_{n+1}$ . The resulting inverse limit space

$$
\mathcal{F}_\infty = \varprojlim_{n \ge 0} \mathcal{C}_n
$$

faithfully records the full-order evolutionary trajectory from the initial Diophantine input to the terminal vanishing of cusp forms.

Let the $0$ -th stage projection $\pi_0 = q_0 : \mathcal{F}_\infty \to \Sigma_0$ be the surjection compressing the full arithmetic proof state onto its top-level static theorem-signature representation, with kernel

$$
\mathcal{K}_{\ge 1} = \ker \pi_0 = \{x \in \mathcal{F}_\infty : \pi_0(x) = 0\}.
$$

Consider now a target arithmetic observation map $B : \mathcal{F}_\infty \to V_{\mathrm{target}}$ required by a downstream reduction step (for instance, extracting the modular level $N$ of the currently selected witness and verifying that all of its odd prime factors lie in the prime radical of the minimal discriminant of the Frey curve). If a proof architecture attempts to recover the downstream target observation $B$ on the same witness solely from the static signature projection $H_{\mathrm{stat}} : \mathcal{F}_\infty \to V_{\mathrm{stat}}$ exposed by an upstream theorem—that is, if it demands a typed transition operator $F : V_{\mathrm{stat}} \to V_{\mathrm{target}}$ satisfying

$$
B = F \circ H_{\mathrm{stat}}
$$

—then by the fundamental quotient factorization theorem of linear algebra and module theory, the **necessary and sufficient condition** for such a lossless interface factorization to exist is the kernel inclusion

$$
\ker H_{\mathrm{stat}} \subseteq \ker B.
$$

Whenever an upstream static signature projection $H_{\mathrm{stat}}$ , through excessive existential quantification, collapses to zero an implicit coupling difference $v \in \mathcal{F}_\infty$ that still alters the downstream arithmetic target $B$ (so that $v \in \ker H_{\mathrm{stat}}$ while $B(v) \neq 0$ ), we say that **static signature truncation kernel leakage** occurs at the interface $(H_{\mathrm{stat}}, B)$ . Kernel leakage mathematically rules out any recovery map that reconstructs the target observation of the originally selected witness solely from the output of the weak predicate. Independently, in our audit of the frozen repository source code, the explicit weak modularity parameter is left unreferenced in the downstream proof term and the actual input is supplied by an internal bypass theorem carrying explicit conductor-level constraints; this source-level implementation fact is established by direct code inspection and is not deduced from the kernel-leakage theorem alone.

### 1.2 Three Fundamental Conservation Laws of Cross-Stage Arithmetic Coupling Flows

To prevent static signature kernel leakage and domain vacuity, any proof architecture that faithfully reflects arithmetic algebraic geometry must simultaneously obey three conservation laws across its entire evolutionary trajectory:

1. **First Law (Conservation of Cross-Stage Coupled Invariants)**:
   Let $E_{\mathrm{inv}} : \mathcal{F}_\infty \to V_{\mathrm{inv}}$ be the coupled invariant observation functional required by all subsequent reduction stages (such as the minimality binding between an integral model $W$ and the rational curve $E$ , or the prime support inclusion between the level $N$ and $\mathrm{rad}(\Delta_{\min})$ ). Under the action of each step-by-step local evolution increment $\delta_t$ ( $1 \le t \le T$ ), the non-interference conservation equation must hold across **every intermediate prefix** $1 \le t \le T$ :

$$
E_{\mathrm{inv}}\!\left(\sum_{s=1}^{t} \delta_s\right) = 0.
$$

   One cannot erase a coupled invariant via existential quantification at step $t_1$ and expect to resurrect it from the erased static predicate at a later step $t_2 > t_1$ .

2. **Second Law (Non-Emptiness of the Ambient Parameter Carrier)**:
   When the top-level proof strategy is proof by contradiction (such as assuming a non-trivial integer solution to $a^p + b^p = c^p$ to derive a contradiction), every intermediate theorem performing substantive geometric or arithmetic work—including modularity lifting for semistable models, local unramifiedness of Galois representations at odd primes, Mazur's irreducibility criterion for modulo- $p$ representations, and Ribet's level-lowering induction—must be formulated over an ambient carrier domain $\mathcal{D}_{\mathrm{amb}}$ that is **decoupled from the top-level counterfactual hypothesis** and is genuinely non-empty:

$$
\mathcal{D}_{\mathrm{amb}} \neq \varnothing.
$$

   Only when the counterfactual equation $a^p + b^p = c^p$ is introduced exclusively at the final top-level synthesis step do the thousands of intermediate theorems stand as genuine, reusable theorems about elliptic curves and modular forms. Conversely, if the counterfactual equation is directly embedded into the base carrier structure at the preliminary definition stage, the entire base type collapses to the empty set $\varnothing$ , and every intermediate theorem quantified over it degenerates in both classical and intuitionistic type theory into a vacuously true implication with an uninhabited premise.

3. **Third Law (Local Valuation Bridging Across the Level-Lowering Ladder)**:
   At each descent step along the level-lowering ladder from level $N$ to $M = N/q$ , the transition must be driven by an explicit local arithmetic valuation bridge. Specifically, at any odd prime $q \mid N$ ( $q \neq 2, p$ ), because the minimal discriminant of the normalized Frey curve satisfies

$$
\Delta_{\min} = 2^{-8}(abc)^{2p},
$$

   its $q$ -adic valuation at every odd prime divisor $q$ is automatically a multiple of the exponent $p$ :

$$
v_q(\Delta_{\min}) = 2p\,v_q(abc) \equiv 0 \pmod{p}.
$$

   By Tate's non-Archimedean uniformization theory, the modulo- $p$ torsion Galois representation $\bar{\rho}_{E,p}$ of a semistable elliptic curve at a prime $q \neq p$ of multiplicative bad reduction is unramified at $q$ if and only if $p \mid v_q(\Delta_{\min})$ . This exact chain—local valuation divisible by $p \Longleftrightarrow$ trivial action of the local inertia group at $q \Longrightarrow$ elimination of the prime factor $q$ from the level $N$ when combined with absolute irreducibility—constitutes the sole legitimate arithmetic engine driving the level-lowering ladder.

---

## Chapter 2: The First Structural Rupture: Dead-Wire Disconnection of the Main Modularity Theorem and Premature Contradiction Elimination Inside the Level-Lowering Lemma

### 2.1 Existential Quantifier Erasure and Loss of Radical Coupling in the Top-Level Modularity Predicate

In the documentation and top-level architectural diagrams of the thirteen-million-line Fermat's Last Theorem repository, the two flagship pillars are the Modularity Theorem for semistable elliptic curves and Ribet's Level-Lowering Theorem. In the top-level synthesis module (the solution module for the no-Frey-package theorem, lines 139 to 142), the apparent proof pipeline reads as follows:
- First, apply the Frey curve modularity theorem to a Frey package $P$ to obtain a proof term $h_{\mathrm{mod}} : \mathrm{IsModular}(P.\mathrm{freyCurve})$ ;
- Second, apply the Mazur–Frey theorem to obtain an irreducibility proof term $h_{\mathrm{irr}}$ for the modulo- $p$ Galois representation;
- Third, pass the triple $(P,\, h_{\mathrm{mod}},\, h_{\mathrm{irr}})$ into the main theorem "level lowering to level 2", seemingly combining $h_{\mathrm{mod}}$ and $h_{\mathrm{irr}}$ to produce a non-zero weight-2 cusp form $f \in S_2(\Gamma_0(2))$ at level 2;
- Finally, invoke $\dim_{\mathbb{C}} S_2(\Gamma_0(2)) = 0$ (every weight-2 cusp form at level 2 vanishes identically) to collide against $f \neq 0$ and complete the proof by contradiction.

Any reader or referee inspecting only the top-level theorem file would naturally conclude that the output $h_{\mathrm{mod}}$ of the main modularity theorem is seamlessly wired into Ribet's level-lowering theorem.

When we descend into the preliminary definition module (the modularity preparation definition module, lines 98 to 102) and the actual proof module for level lowering to level 2 (lines 129 to 134), however, we uncover a striking **physical disconnection**:

First, in the modularity preparation definition module (lines 98 to 102), the modularity predicate $\mathrm{IsModular}(E)$ for a rational elliptic curve $E/\mathbb{Q}$ is defined by wrapping two existential quantifiers in succession:

$$
\mathrm{IsModular}(E) \;\;:\Longleftrightarrow\;\; \exists W \in \mathrm{WeierstrassCurve}(\mathbb{Z}),\;\Big(\mathrm{IsIntegralModelOf}(W, E) \;\land\; \exists N \in \mathbb{N},\;\big(N > 0 \;\land\; \mathrm{IsModularModelOfLevel}(W, N)\big)\Big).
$$

Examine this definition carefully: it asserts only that there exists some integral Weierstrass model $W$ and there exists some positive integer level $N > 0$ at which $W$ is modular. Inside this static predicate, there is **no arithmetic divisibility or radical-support constraint whatsoever** linking the level $N$ to the parameters $(a, b, c, p)$ of the Frey package! In particular, it completely erases the conductor-level predicate $\mathrm{IsConductorLevel}(P, N)$ (defined in the conductor-level definition module, lines 12 to 26):

$$
\mathrm{IsConductorLevel}(P, N) \;\;:\Longleftrightarrow\;\; N > 0 \;\land\; \mathrm{Squarefree}(N) \;\land\; \forall q \in \mathbb{N},\;\big(\mathrm{Prime}(q) \;\land\; q \mid N \;\Longrightarrow\; q \mid a b c\big).
$$

Why does erasing $\mathrm{IsConductorLevel}(P, N)$ cause a downstream interface mismatch? Because Ribet's level-lowering theorem cannot lower an **arbitrary** positive integer level $N$ to level $2$ ! If a modular form's level $N$ contains a squared prime factor $q^2 \mid N$ , or contains an extraneous prime factor $q \nmid abc$ outside the radical of the Frey discriminant, strong induction on the level fails at the very first step because neither squarefreeness nor the local unramified valuation condition at $q$ can be established.

### 2.2 Explicit Dual-Level Arithmetic Witness, Matrix Certificate of Kernel Leakage, and Bypass Reconnection Under Disabled Unused-Variable Warnings

To demonstrate that the two levels $N_1 = 15$ and $N_2 = 105$ are concrete arithmetic geometric objects rather than abstract scalars, we construct them explicitly from a concrete Frey parameter triple:
- Take the non-zero integer triple satisfying $A + B = C$ , $\gcd(A, B) = 1$ , $A \equiv 3 \pmod 4$ , and $16 \mid B$ :

$$
A = -1, \qquad B = 16, \qquad C = 15 \qquad (ABC = -240).
$$

  Its normalized integral Weierstrass model is $W = (1, 4, 0, 1, 0)$ , corresponding to the affine equation $Y^2 + XY = X^3 + 4X^2 + X$ . Direct evaluation of Tate's polynomial formulas (Chapter 4, Section 4.1) yields:

$$
b_2 = 17, \qquad b_4 = 2, \qquad b_6 = 0, \qquad b_8 = -1, \qquad c_4 = 17^2 - 24\times 2 = 241, \qquad \Delta = -17^2\times(-1) - 8\times 2^3 = 289 - 64 = 225 = 3^2 \times 5^2.
$$

  At the primes $3$ and $5$ , the valuations of $\Delta = 225$ are both $2 > 0$ , while $c_4 = 241$ is divisible by neither $3$ nor $5$ ( $241 = 3\times 80 + 1 = 5\times 48 + 1$ ), so $W$ has minimal multiplicative bad reduction at $3$ and $5$ ; at all other primes $\Delta = 225$ is a local unit and $W$ has good reduction. Thus $W$ is a global minimal semistable model whose exact arithmetic conductor is $N_1 = 3 \times 5 = 15$ .
- By the modularity theorem for elliptic curves over $\mathbb{Q}$ , $W$ corresponds at its conductor level $N_1 = 15$ to a normalized weight-2 cusp newform $f(z) \in S_2(\Gamma_0(15))$ . Now choose the extraneous prime $7 \nmid ABC = -240$ (since $240 = 7 \times 34 + 2$ ) and consider the oldform subspace at the multiplied level $N_2 = 7 \times 15 = 105$ . This oldspace is spanned by $f(z)$ and $f(7z)$ ; letting $\alpha, \beta$ be the two roots of the Hecke characteristic polynomial $X^2 - a_7(f)X + 7 = 0$ (satisfying $\alpha\beta = 7$ ), the linear combination

$$
f_{105}(z) = f(z) - \beta\,f(7z) \in S_2(\Gamma_0(105))
$$

  has leading Fourier coefficient $1$ , is a simultaneous normalized eigenform for the operator $U_7$ (with eigenvalue $\alpha$ ) and for all Hecke operators $T_\ell$ at good primes $\ell \nmid 105$ , and retains the exact same Hecke eigenvalues $a_\ell(W)$ as $f$ at every good prime $\ell \nmid 105$ !
- Consequently, for the exact same elliptic curve $W$ , the level- $15$ witness $(W, 15, f)$ and the level- $105$ witness $(W, 105, f_{105})$ **both satisfy every defining condition of the weak existential modularity predicate** $\mathrm{IsModular}(E)$ ; yet the former satisfies the conductor-radical support condition $\mathrm{Supp}(15) = \{3, 5\} \subseteq \mathrm{Supp}(ABC)$ , whereas the latter contains the extraneous prime factor $7 \mid 105$ with $7 \nmid ABC = -240$ and violates the conductor-radical support condition!

Using the quotient factorization framework of Chapter 1, we obtain an exact matrix certificate of this kernel leakage. On the two-dimensional history coefficient space $\mathbb{Q}^2$ spanned by the level- $15$ witness history $h_{15}$ (represented by the first standard basis vector $e_1 = (1, 0)^\top$ ) and the level- $105$ witness history $h_{105}$ (represented by the second standard basis vector $e_2 = (0, 1)^\top$ ), any input vector $u = \binom{a}{b} \in \mathbb{Q}^2$ encodes the linear combination coefficients $(a, b)$ of the two witness histories, while the output observation vector $\binom{m}{n_{\mathrm{cond}}} = H_+\binom{a}{b}$ records in its first component $m = a + b$ the existential modularity signature indicator and in its second component $n_{\mathrm{cond}} = 15a + 105b$ the selected witness level functional:
- The complete joint projection operator mapping history coefficient vectors $\binom{a}{b}$ to joint observation vectors $\binom{m}{n_{\mathrm{cond}}} = H_+\binom{a}{b}$ is the invertible matrix

$$
H_+ = \begin{pmatrix} 1 & 1 \\ 15 & 105 \end{pmatrix}, \qquad \det(H_+) = 105 - 15 = 90 \neq 0,
$$

  which evaluates to $H_+ e_1 = (1, 15)^\top$ on the single level- $15$ witness history $e_1 = (1, 0)^\top$ and to $H_+ e_2 = (1, 105)^\top$ on the single level- $105$ witness history $e_2 = (0, 1)^\top$ ;
- The degenerate static projection operator corresponding to the existentially erased predicate $\mathrm{IsModular}$ (which reads only the first-row modularity signature $m = H_-\binom{a}{b} = a + b$ ) is the single-row matrix

$$
H_- = \begin{pmatrix} 1 & 1 \end{pmatrix}, \qquad H_- e_1 = 1, \qquad H_- e_2 = 1;
$$

- The selected witness level functional required by the downstream level-lowering induction is the second-row matrix (reading $n_{\mathrm{cond}} = B\binom{a}{b} = 15a + 105b$ ):

$$
B = \begin{pmatrix} 15 & 105 \end{pmatrix}, \qquad B e_1 = 15, \qquad B e_2 = 105.
$$

For the complete joint projection $H_+$ , taking the transition operator $F_0 = (0,\, 1)$ immediately yields $F_0 H_+ = (15,\, 105) = B$ , closing the interface without loss (in the observation coordinates $\binom{m}{n_{\mathrm{cond}}}$ , the two coordinate projections correspond to the row vectors $(1, 0)$ and $(0, 1)$ , and the observation difference between the two single histories is $H_+(e_1 - e_2) = (0, -90)^\top$ ). When the binding between the selected level and radical support is erased by existential quantification (corresponding to truncation parameter $\lambda = 1$ , where the transition operator degenerates to $F_\lambda = (0,\, 1 - \lambda)$ ), evaluating on the history coefficient difference vector

$$
v = e_1 - e_2 = \begin{pmatrix} 1 \\ -1 \end{pmatrix}
$$

gives by direct calculation:

$$
H_- v = 0, \qquad B v = 15 \times 1 + 105 \times (-1) = -90 \neq 0, \qquad (B - F_\lambda H_+) v = -90\lambda.
$$

Because $v \in \ker H_-$ while $v \notin \ker B$ , the kernel inclusion condition $\ker H_- \subseteq \ker B$ fails with an exact quantitative kernel-leakage residual of $-90$ .

Strict mathematical precision is maintained here: this kernel-leakage theorem proves that **starting solely from the weak existential predicate** $\mathrm{IsModular}(E)$ **, one cannot guarantee that an arbitrarily extracted witness level** $N$ **satisfies the conductor-radical support condition** $\mathrm{Supp}(N) \subseteq \mathrm{Supp}(abc)$ , because $\mathrm{IsModular}(E)$ forgets the binding between the chosen witness level $N$ and the conductor radical. This does not deny that an auxiliary arithmetic theorem can independently construct a new witness carrying conductor-level support, nor does it imply that modularity is absent from the repository.

Indeed, confronted with the interface rupture that $\mathrm{IsModular}$ cannot supply conductor-radical binding, the thirteen-million-line repository executes the following actual operations in the solution module for "level lowering to level 2" (lines 129 to 134):
1. Immediately above the theorem declaration, it inserts an explicit compiler directive **disabling the unused-variable linter (setting the unused-variables warning option to false)**;
2. It then declares the theorem parameters: a Frey package $P$ , the explicit weak modularity hypothesis $h_{\mathrm{mod}} : \mathrm{IsModular}(P.\mathrm{freyCurve})$ , and the irreducibility hypothesis $h_{\mathrm{irr}}$ ;
3. Inside its two-line proof body, **it never references the explicit parameter** $h_{\mathrm{mod}}$ **at all (the number of free variable occurrences of** $h_{\mathrm{mod}}$ **in the proof term is identically zero)**! Instead, it invokes an internal bypass theorem ("modular representation of conductor level", located in the conductor-level modular representation solution module, lines 193 to 208) to regenerate from scratch a triple $(N,\, h_{\mathrm{cond}},\, h_{\mathrm{mod},N})$ equipped with conductor-level support constraints, and passes $(h_{\mathrm{irr}},\, h_{\mathrm{cond}},\, h_{\mathrm{mod},N})$ into "level lowering to two of conductor level"!

This source-code fact proves beyond dispute that passing the weak modularity theorem output $h_{\mathrm{mod}}$ into the level-lowering theorem in the top-level synthesis file (lines 139 to 142) is a **dead-wire interface whose explicit parameter is never consumed**; the actual transmission of modularity and conductor-radical support is carried out by the underlying bypass theorem that circumvents $h_{\mathrm{mod}}$ .

### 2.3 Premature Contradiction and Non-Constructive Derivation of the Existential Witness via Ex Falso Quodlibet Inside the Lower-Level Descent Lemma

Even more revealingly, when we follow that internal bypass channel into the solution module for "level lowering to two of conductor level" (lines 113 to 170), we uncover a second structural anomaly.

The static return type of this theorem is declared as:

$$
\exists f \in S_2(\Gamma_0(2)),\;\; f \neq 0.
$$

According to its name and return type, the mathematical duty of this theorem is to eliminate all odd prime factors from the conductor level $N$ by induction, proving that the level necessarily descends to the **exact level** $2$ , thereby producing a non-zero weight-2 cusp form $f \in S_2(\Gamma_0(2))$ which is returned to the top-level theorem to collide against $S_2(\Gamma_0(2)) = \{0\}$ .

When we inspect lines 113 to 170 of the actual proof, however, its true logical path is as follows:
1. In the core strong-induction lemma (lines 113 to 149), the proof eliminates odd prime divisors ( $q \neq 2, p$ and $q = p$ ) one by one from the level $N$ . Once no odd prime divisors remain, because $N$ is a positive squarefree integer all of whose prime divisors equal $2$ , the auxiliary arithmetic lemma on lines 98 to 112 can deduce only the upper divisibility relation

$$
M \mid 2 \qquad (\text{that is, } M = 1 \text{ or } M = 2).
$$

   Why does it deduce only $M \mid 2$ rather than $M = 2$ ? Because throughout the level-lowering strong induction, the inductive hypothesis transmits only the upper-bound support condition "every prime divisor of $M$ divides $abc$ ", while **omitting the lower-bound bad-reduction invariant** $2 \mid M$ (it never proves in the inductive post-state that the level cannot degenerate further at $q = 2$ to $M = 1$ )!
2. Having obtained only "there exists $M \in \{1, 2\}$ and a non-zero cusp form $f \in S_2(\Gamma_0(M))$ ", whenever $M = 1$ the form $f$ belongs to $S_2(\Gamma_0(1))$ rather than directly to the type $S_2(\Gamma_0(2))$ . Without constructing an oldform inclusion map lifting $S_2(\Gamma_0(1))$ into $S_2(\Gamma_0(2))$ , the proof cannot directly return $f$ as an element of $S_2(\Gamma_0(2))$ !
3. To manufacture the declared return type $\exists f \in S_2(\Gamma_0(2)),\; f \neq 0$ , lines 156 to 161 of the module prematurely import **both terminal vanishing theorems**—that the weight-2 cusp form space at level 1 is zero and that the weight-2 cusp form space at level 2 is zero—directly inside the level-lowering lemma, combining them into an auxiliary lemma stating that for every level $M$ satisfying $0 < M \le 2$ and $M \mid 2$ , every weight-2 cusp form at level $M$ vanishes identically;
4. Then, on lines 169 to 170, directly inside the level-lowering lemma, the proof collides $f = 0$ against $f \neq 0$ to obtain a local contradiction (logical falsehood), and invokes the principle of explosion (ex falso quodlibet) from that local contradiction to **non-constructively derive via ex falso quodlibet an existential witness** $\exists f \in S_2(\Gamma_0(2)),\; f \neq 0$ **and return it to the top level**!
5. Finally, the top-level synthesis theorem receives this cusp-form existential witness $f \in S_2(\Gamma_0(2))$ —which was already derived non-constructively via ex falso quodlibet from $S_2(\Gamma_0(1)) = 0$ and $S_2(\Gamma_0(2)) = 0$ inside the lower lemma—and on line 142 subsequently invokes $S_2(\Gamma_0(2)) = 0$ a second time to finish the outer proof by contradiction.

While deriving a contradiction early inside a refutation context and applying explosion to populate an intermediate existential type does not violate logical soundness, from the standpoint of mathematical architecture it renders the return type of "level lowering to level 2" a hollow shell: at that local explosion point on line 170, even if the return type of the theorem were replaced by "there exists a non-zero cusp form at level 2 and $1 = 0$ ", the exact same line-170 proof term would compile without alteration!

---

## Chapter 3: The Second Structural Rupture: Vacuous Carrier Degeneration and Logical Explosion Short-Circuiting of the Small-Prime Mazur Isogeny Branches

### 3.1 Global Empty-Type Degeneration Caused by Directly Embedding the Counterfactual Equation into the Base Carrier Structure

In classical arithmetic algebraic geometry, the Hellegouarch–Frey curve is a genuine family of elliptic curves defined over the non-empty space of coprime integer parameter triples

$$
\mathcal{D}_{\mathrm{Frey}} = \Big\{(A, B, C) \in (\mathbb{Z}\setminus\{0\})^3 \;\Big|\; A + B = C,\;\; \gcd(A, B) = 1,\;\; A \equiv -1 \pmod{4},\;\; 16 \mid B\Big\}
$$

by the equation

$$
E_{A,B} : y^2 = x(x - A)(x + B).
$$

This parameter space $\mathcal{D}_{\mathrm{Frey}}$ contains infinitely many actual elements (for instance, $A = -1, B = 16, C = 15$ from Section 2.2, or $A = 3^5 = 243 \equiv 3 \pmod 4, B = 4^5 = 1024, C = 243 + 1024 = 1267$ , or $A = 3^{11} = 177147 \equiv 3 \pmod 4, B = 4^{11} = 4194304, C = 177147 + 4194304 = 4371451$ ). In the classical mathematical proof, one first establishes over this non-empty family of curves (or over all semistable rational elliptic curves with prescribed local reduction properties) the unramifiedness of Galois representations, Mazur's irreducibility criterion, and Ribet's level-lowering theorem. Only after all of these general theorems of arithmetic geometry have been established does one ask at the very end: what happens if there exist an odd prime $p \ge 5$ and non-zero coprime integers $(a, b, c)$ satisfying $a^p + b^p = c^p$ so that the power-lifted triple $(A, B, C) = (a^p, b^p, c^p)$ lands in $\mathcal{D}_{\mathrm{Frey}}$ ?

In the preliminary definition module of the thirteen-million-line formalization (the Frey package definition module, lines 12 to 34), however, the authors define a foundational record structure named the "Frey Package" that welds eight properties into a single base carrier type:
- Non-zero integers $a, b, c \in \mathbb{Z}$ with $a \neq 0, b \neq 0, c \neq 0$ ;
- A prime exponent $p \in \mathbb{N}$ satisfying $p \ge 5$ ;
- The counterfactual Fermat equation field $h_{\mathrm{FLT}} : a^p + b^p = c^p$ ;
- The coprimality condition $\gcd(|a|, |b|) = 1$ ;
- The modulo-4 and modulo-2 congruence normalizations $a \equiv 3 \pmod 4$ and $2 \mid b$ .

What appears at first sight to be a mere syntactic convenience ("bundling hypotheses into a record structure to shorten theorem preambles") triggers a profound **vacuous carrier collapse** in dependent type theory and mathematical logic:

Because Fermat's Last Theorem holds for all exponents $p \ge 5$ (and the repository itself proves the theorem "no Frey package exists", whose type is a function from the Frey package structure to logical falsehood $\bot$ ), the "Frey Package" record type is mathematically isomorphic to the **empty type (the empty set** $\varnothing$ **)**!

The immediate logical consequence is stark: every intermediate theorem across the entire repository that begins with the universal quantifier prefix "for every Frey package $P$ "—whether it is the modularity theorem for the Frey curve, the Mazur–Frey irreducibility theorem, level lowering at odd primes, level lowering at the prime $p$ , or the absence of Galois-stable cofixed lines at individual prime exponents—degenerates in static type theory into a vacuous implication of the form

$$
\forall P \in \varnothing,\;\; Q(P) \qquad \Longleftrightarrow \qquad \bot \longrightarrow Q.
$$

Not a single one of these universally quantified Frey-package theorems can be invoked by an external mathematician on any actual elliptic curve existing over the rational numbers $\mathbb{Q}$ .

### 3.2 Source-Code and Kernel Verification of the Cofixed-Line Exclusion Theorems for Small Primes $p \in \{5, 7, 11, 13\}$ 

One might attempt to defend this design by arguing: "Even though the counterfactual equation was bundled into the base carrier structure, as long as the intermediate proofs do not secretly reach into the structure to extract the counterfactual field $a^p + b^p = c^p$ and manufacture an elementary contradiction, the proof bodies still formalize genuine arithmetic geometry."

That is precisely the litmus test for determining whether a formalization has suffered **vacuous domain short-circuiting**! We performed a file-by-file source-code structural verification of the Mazur–Frey irreducibility proof tree and caught red-handed, in the cofixed-line exclusion modules for $p = 11$ and $p \in \{5, 7, 13\}$ , **direct extraction of the counterfactual field** $h_{\mathrm{FLT}}$ **to collide against externally imported fixed-exponent Fermat theorems and bypass elliptic curve geometry altogether via logical explosion**.

In the solution module for the Mazur–Frey irreducibility theorem (lines 68 to 91), in order to prove that the modulo- $p$ Galois representation $\bar{\rho}_{E,p}$ of the Frey curve is irreducible when $a \not\equiv 3 \pmod 8$ , the proof argues by contradiction: if $\bar{\rho}_{E,p}$ were reducible, then multiplicative bad reduction at $2$ together with the absence of fixed non-zero torsion points would force $E[p]$ to contain a "Galois-stable cofixed line" (a one-dimensional Galois-stable subspace $L \subset E[p]$ such that the absolute Galois group $\mathrm{Gal}(\overline{\mathbb{Q}}/\mathbb{Q})$ acts trivially on the one-dimensional quotient $E[p]/L$ ). The proof then partitions the prime exponent $p \ge 5$ into three branches:

$$
(p = 5 \lor p = 7 \lor p = 13) \;\;\lor\;\; (p = 11) \;\;\lor\;\; (p \ge 17),
$$

and calls three sub-theorems asserting that "the Frey curve admits no Galois-stable cofixed line in this exponent branch":
1. The small-prime branch theorem (covering $p \in \{5, 7, 13\}$ );
2. The exponent-11 branch theorem (covering $p = 11$ );
3. The large-prime branch theorem (covering $p \ge 17$ ).

In genuine arithmetic geometry, why can a Frey curve not possess a Galois-stable line with trivial quotient action when $p \in \{5, 7, 11, 13\}$ ?
- For $p \in \{5, 7, 13\}$ , equipping the curve with a $p$ -isogeny and full rational $2$ -torsion structure produces a non-cuspidal rational point on the modular curve $X_0(2p)$ or $X_0(p)$ compatible with semistable multiplicative reduction at $2$ , which collides against the genus and rational-point classification of those modular curves;
- For $p = 11$ , the modular curve $X_0(11)$ has genus $1$ and is isomorphic to a conductor-11 elliptic curve whose Mordell–Weil group over $\mathbb{Q}$ has exactly $5$ rational points: $2$ cusps and $3$ non-cuspidal rational points, none of whose corresponding elliptic curves over $\mathbb{Q}$ possesses full rational $2$ -torsion and semistable reduction at $2$ matching a Frey curve.

How, then, does the thirteen-million-line repository actually "prove" these two elliptic-curve Galois-representation theorems in the "no cofixed line at eleven solution module" (only 24 lines in total!) and the "no cofixed line for small primes solution module" (only 29 lines in total!)?

Opening the "no cofixed line at eleven solution module" (lines 14 to 24), we find that its entire core proof consists of **a single line of code**:
1. At the top of the file, the module imports zero modules concerning the modular curve $X_0(11)$ , $11$ -isogenies, Tate curves, or elliptic curve torsion geometry. Instead, it imports an externally proved **Fermat's Last Theorem for exponent 11** (stating that for all non-zero integers $a, b, c$ , $a^{11} + b^{11} \neq c^{11}$ )!
2. Next, it invokes a preliminary helper lemma: since every Frey package $P$ carries the built-in counterfactual field $h_{\mathrm{FLT}} : a^p + b^p = c^p$ , and the external theorem has already established $a^{11} + b^{11} \neq c^{11}$ , the exponent of any Frey package $P$ must satisfy

$$
P.p \neq 11.
$$

3. Confronted with the branch hypothesis $h_p : P.p = 11$ passed into the theorem, the proof immediately invokes the logical explosion eliminator (colliding $P.p = 11$ against $P.p \neq 11$ to deduce an arbitrary conclusion), **claiming in a single line—without mentioning "Galois-stable cofixed line" even once—to have proved that "the Frey curve admits no Galois-stable cofixed line at** $p = 11$ **"**!

Opening the "no cofixed line for small primes solution module" (lines 16 to 29), we find the exact same shortcut: it imports externally proved Fermat theorems for exponents $5, 7,$ and $13$ , collides them against the built-in field $a^p + b^p = c^p$ of the Frey package to deduce $P.p \neq 5$ , $P.p \neq 7$ , and $P.p \neq 13$ , and eliminates the branch hypothesis $(P.p = 5 \lor P.p = 7 \lor P.p = 13)$ case by case via logical explosion—again without touching the $5$ -isogeny, $7$ -isogeny, or $13$ -isogeny geometry of any elliptic curve!

### 3.3 Real-Kernel Antithesis Collapse Experiment: The Exact Same One-Line Proof Establishes Both "No Cofixed Line Exists" and "A Cofixed Line Exists"

To exhibit this vacuous-carrier explosion mechanism to the mathematical community with unmistakable clarity, we supplemented our static source audit by executing a real-machine kernel antithesis collapse verification (in version 4.33.1 of the proof assistant kernel) on the extracted minimal dependency skeleton. (We maintain strict evidence stratification: because the 46 locally archived upstream core source files omit 96 non-standard-library upstream imports, this real-kernel experiment is not an in-place recompilation of the entire upstream repository, but an exact, zero-external-dependency kernel extraction of lines 14 to 24 of the exponent-11 cofixed-line solution module: we define the minimal Frey-package skeleton record containing the exact fields read by that proof— $a, b, c \in \mathbb{Z}$ , $p \in \mathbb{N}$ , the non-zero proof terms, and the counterfactual equation $h_{\mathrm{FLT}} : a^p + b^p = c^p$ —pass the cofixed-line predicate as an unexpanded abstract predicate parameter, and pass the exponent-11 Fermat theorem $\forall a, b, c \neq 0,\, a^{11} + b^{11} \neq c^{11}$ as an explicit hypothesis parameter.)

In this real-machine kernel experiment replicating the upstream call graph, while keeping the skeleton structure, the external exponent-11 Fermat hypothesis, and the branch premise $h_p : P.p = 11$ completely unchanged:
- When the theorem conclusion is written as the repository's statement "**no** Galois-stable cofixed line exists", the one-line logical explosion proof identical to the upstream code passes the kernel with zero warnings and zero errors;
- When we replace the theorem conclusion with the exact opposite statement "**a** Galois-stable cofixed line exists", while **leaving the proof term completely unchanged character for character**, the real-machine kernel equally certifies the proof with zero warnings and zero errors!
- When we replace the theorem conclusion with an arbitrary abstract proposition $Q$ (including $0 = 1$ ), while **still leaving the proof term completely unchanged**, the real-machine kernel certifies that proof as well!

Expressed in closed-form arithmetic terms: at exponent $p = 11$ , if one keeps the Frey curve base on the non-empty additive parameter space $A + B = C$ (for instance, taking the non-zero integer pair $a = 3, b = 4$ satisfying $a \equiv 3 \pmod 4, 2 \mid b, \gcd(a,b)=1$ , and setting $A = 3^{11} = 177147$ and $B = 4^{11} = 4194304$ , whose true sum is $C_+ = A + B = 4371451$ ), the triple $(A, B, C_+)$ is a bona fide non-empty arithmetic object that harbors no logical contradiction at $p = 11$ ; only when one forcibly binds $C_+$ to a counterfactual eleventh power $C_- = 5^{11} = 48828125$ does one incur the non-zero Fermat residual

$$
\Delta_{\mathrm{FLT}}(3, 4, 5;\, 11) = 3^{11} + 4^{11} - 5^{11} = 4371451 - 48828125 = -44456674 \neq 0.
$$

By pre-solving the Fermat equation at $p \in \{5, 7, 11, 13\}$ externally via classical Kummer cyclotomic and descent methods and then using logical explosion against the built-in field $h_{\mathrm{FLT}}$ to skip the Mazur isogeny exclusion at those four primes under module names proclaiming "no cofixed line on the Frey curve" and "Mazur–Frey irreducibility", the repository leaves the geometric proof of Mazur's rational isogeny theorem at those four small primes **completely unformalized**.

---

## Chapter 4: The Third Structural Rupture: Non-Invariance of Bare Integral Weierstrass Predicates Under Rational Isomorphism

### 4.1 The Fundamental Distinction Between a Rational Elliptic Curve Isomorphism Class and a Specific Integral Weierstrass Equation

In algebraic number theory and arithmetic geometry, an elliptic curve $E/\mathbb{Q}$ over the rational numbers is geometrically a smooth projective curve of genus $1$ equipped with a specified rational base point $\mathcal{O}$ . Writing it in affine coordinates as a generalized Weierstrass equation

$$
W : y^2 + a_1 x y + a_3 y = x^3 + a_2 x^2 + a_4 x + a_6 \qquad (a_1, a_2, a_3, a_4, a_6 \in \mathbb{Z})
$$

selects merely **one specific integral coordinate representative** of the rational isomorphism class of $E$ .

In standard Tate notation, the invariants of the integral model $W$ are determined by the universal integer polynomials:

$$
b_2 = a_1^2 + 4a_2, \qquad b_4 = 2a_4 + a_1 a_3, \qquad b_6 = a_3^2 + 4a_6,
$$

$$
b_8 = a_1^2 a_6 + 4a_2 a_6 - a_1 a_3 a_4 + a_2 a_3^2 - a_4^2,
$$

$$
c_4 = b_2^2 - 24b_4, \qquad c_6 = -b_2^3 + 36b_2 b_4 - 216b_6,
$$

$$
\Delta = -b_2^2 b_8 - 8b_4^3 - 27b_6^2 + 9b_2 b_4 b_6.
$$

Now apply to $W$ the most elementary rational isomorphism coordinate scaling:

$$
(x, y) \longmapsto (u^2 x, u^3 y) \qquad (u \in \mathbb{Z}\setminus\{0\}).
$$

Over $\mathbb{Q}$ , the transformed integral model

$$
W_u = \big(u a_1,\; u^2 a_2,\; u^3 a_3,\; u^4 a_4,\; u^6 a_6\big)
$$

defines the **exact same rational elliptic curve** $E/\mathbb{Q}$ (its Mordell–Weil group, $j$ -invariant $j = c_4^3/\Delta$ , arithmetic conductor $N_E$ , $L$ -function, and modulo- $p$ Galois representations are canonically isomorphic). Yet the invariants $c_4(W_u), c_6(W_u)$ and the discriminant $\Delta(W_u)$ transform homogeneously with weights $4, 6,$ and $12$ :

$$
c_4(W_u) = u^4\,c_4(W), \qquad c_6(W_u) = u^6\,c_6(W), \qquad \Delta(W_u) = u^{12}\,\Delta(W).
$$

Consequently, in modern arithmetic geometry, whether a prime $\ell$ is a prime of good reduction for $E/\mathbb{Q}$ and whether $E/\mathbb{Q}$ is semistable (meaning every bad prime is of multiplicative rather than additive reduction) **can never be defined on an arbitrary bare integral equation** $W$ **simply by testing** $\ell \mid \Delta(W)$ **and** $\ell \mid c_4(W)$ ! A mathematically well-defined predicate must first project at the carrier entry onto the equivalence class $[W_{\min,\ell}]$ of local minimal integral Weierstrass models at $\ell$ —that is, the equivalence class of integral Weierstrass equations $\mathbb{Q}_\ell$ -isomorphic to $E$ that minimize $v_\ell(\Delta)$ . Because any generalized Weierstrass transformation $(x, y) \mapsto (u^2 x + r,\, u^3 y + u^2 s x + t)$ between two local minimal integral models at $\ell$ has $u \in \mathbb{Z}_\ell^\times$ while $r, s, t$ leave $c_4, c_6, \Delta$ invariant, the minimal valuations $v_\ell(\Delta_{\min})$ and $v_\ell(c_{4,\min})$ are genuine invariants of the rational isomorphism class. One then tests:
- The prime $\ell$ is a prime of good reduction $\Longleftrightarrow v_\ell(\Delta_{\min}) = 0$ ;
- The curve is semistable at $\ell$ $\Longleftrightarrow v_\ell(\Delta_{\min}) > 0 \implies v_\ell(c_{4,\min}) = 0$ . (Note: at the primes $\ell = 2, 3$ , one cannot naively divide $(c_4, \Delta)$ by powers of $\ell$ using $\min(\lfloor v_\ell(c_4)/4 \rfloor, \lfloor v_\ell(\Delta)/12 \rfloor)$ without verifying integral Weierstrass admissibility, because when $b_2, b_4, b_6, b_8$ fail the modulo- $4$ and modulo- $16$ congruence gates of generalized Weierstrass equations, a rational scaling $(x, y) \mapsto (u^{-2}x + r, u^{-3}y + u^{-2}s x + t)$ lands in a non-integral rational model; minimality must be taken within the family of admissible integral Weierstrass models.)

### 4.2 Bare-Equation Predicates in the Formalization Repository and Their Collapse Under Isomorphic Scaling

In the modularity preparation definition module of the thirteen-million-line repository (lines 82 to 87), however, "good prime" and "semistable model" are defined directly on bare, unminimized integral Weierstrass equations $W \in \mathrm{WeierstrassCurve}(\mathbb{Z})$ :

$$
\mathrm{IsGoodPrimeFor}(W, \ell) \;\;:\Longleftrightarrow\;\; \ell \nmid \Delta(W),
$$

$$
\mathrm{IsSemistableModel}(W) \;\;:\Longleftrightarrow\;\; \forall \ell \in \mathbb{N},\;\;\Big(\mathrm{Prime}(\ell) \;\land\; \ell \mid \Delta(W) \;\Longrightarrow\; \ell \nmid c_4(W)\Big).
$$

Even more pervasively, in the modular representation preparation definition module (lines 31 to 42), when defining "the model $W$ is residually modular at level $N$ " and "the model $W$ is a modular model at level $N$ ", the set of primes over which the Hecke eigenvalue congruence

$$
a_\ell(W) \equiv c_\ell(f) \pmod{\mathfrak{m}}
$$

is required to hold is filtered by the equation-dependent predicate $\mathrm{IsGoodPrimeFor}(W, \ell)$ (that is, $\ell \nmid \Delta(W)$ )!

This bare definition immediately triggers an isomorphism-breaking theorem:

**Theorem 4.1 (Non-Invariance of the Bare Integral Semistability Predicate Under Rational Isomorphism)**
Let $W \in \mathrm{WeierstrassCurve}(\mathbb{Z})$ be any global minimal semistable elliptic curve model satisfying $\mathrm{IsSemistableModel}(W)$ . For any integer $u \ge 2$ , let $W_u$ be the integral Weierstrass model obtained via the rational isomorphism $(x, y) \mapsto (u^2 x, u^3 y)$ . Then for every prime divisor $\ell \mid u$ , one has

$$
\ell^{12} \mid \Delta(W_u) \qquad \text{and} \qquad \ell^4 \mid c_4(W_u),
$$

so that $\ell \mid \Delta(W_u)$ and $\ell \mid c_4(W_u)$ hold simultaneously at $\ell$ . Consequently, the isomorphic integral model $W_u$ necessarily violates $\mathrm{IsSemistableModel}(W_u)$ , and every prime $\ell \mid u$ that was a prime of good reduction for $W$ ( $\ell \nmid \Delta(W)$ ) is misclassified under $W_u$ as a bad prime!

We verified Theorem 4.1 with exact integer arithmetic on the classical conductor-11 semistable elliptic curve

$$
E_{11} : y^2 + y = x^3 - x^2 - 10x - 20 \qquad (a_1 = 0,\; a_2 = -1,\; a_3 = 1,\; a_4 = -10,\; a_6 = -20):
$$

- On the global minimal model $E_{11}$ , the closed-form polynomials of Section 4.1 evaluate to:

$$
b_2 = 0^2 + 4(-1) = -4, \qquad b_4 = 2(-10) + 0\times 1 = -20, \qquad b_6 = 1^2 + 4(-20) = -79,
$$

$$
b_8 = 0^2(-20) + 4(-1)(-20) - 0\times 1\times(-10) + (-1)\times 1^2 - (-10)^2 = 80 - 1 - 100 = -21,
$$

$$
c_4(E_{11}) = (-4)^2 - 24\times(-20) = 16 + 480 = 496 = 2^4 \times 31,
$$

$$
c_6(E_{11}) = -(-4)^3 + 36\times(-4)\times(-20) - 216\times(-79) = 64 + 2880 + 17064 = 20008,
$$

$$
\Delta(E_{11}) = -(-4)^2\times(-21) - 8\times(-20)^3 - 27\times(-79)^2 + 9\times(-4)\times(-20)\times(-79) = 336 + 64000 - 168507 - 56880 = -161051 = -11^5.
$$

  Because the sole prime dividing $\Delta(E_{11}) = -11^5$ is $\ell = 11$ , and $11 \nmid c_4(E_{11}) = 496$ ( $496 = 11 \times 45 + 1$ ), the minimal model $E_{11}$ strictly satisfies $\mathrm{IsSemistableModel}(E_{11})$ .
- Now apply the elementary two-fold rational coordinate scaling $u = 2$ to obtain the integral model representing the exact same rational elliptic curve:

$$
E_{11}^{(2)} = (0,\; -4,\; 8,\; -160,\; -1280).
$$

  Recomputing its invariants directly from the five coefficients gives:

$$
c_4\!\left(E_{11}^{(2)}\right) = 2^4 \times 496 = 7936, \qquad c_6\!\left(E_{11}^{(2)}\right) = 2^6 \times 20008 = 1280512, \qquad \Delta\!\left(E_{11}^{(2)}\right) = 2^{12} \times (-161051) = -659664896.
$$

  At the prime $\ell = 2$ , both $\Delta(E_{11}^{(2)}) \equiv 0 \pmod 2$ and $c_4(E_{11}^{(2)}) \equiv 0 \pmod 2$ . Thus, merely performing the rational coordinate change $(x, y) \mapsto (4x, 8y)$ causes this classical conductor-11 semistable elliptic curve—which has good reduction at $\ell = 2$ —to be rejected by the repository's bare predicate as neither having good reduction at $2$ nor being semistable!

---

## Chapter 5: Dual Arithmetic Specimen Stress Tests: Separating the Necessity of Level-Lowering Guards via the Conductor-11 Curve $E_{11}$ and the Pythagorean Three-Model Specimen $(3, 4, 5;\, p=2)$ 

In auditing and refereeing any ultra-large-scale formal proof, the most decisive instrument is not passive code reading, but injecting into intermediate interfaces **concrete, genuinely existing boundary arithmetic specimens that strip away exactly one premise at a time**. If an intermediate theorem interface has omitted a crucial arithmetic guard due to an overly coarse static signature, the boundary specimen immediately penetrates the level-lowering ladder and triggers an arithmetic collapse ( $1 = 0$ or $25 \neq 25$ ) at the bottom.

This chapter presents two incisive arithmetic specimens that completely separate and lock down the three core guards of Ribet level lowering and the Frey curve construction: **the absolute irreducibility guard for the modulo-** $p$ **Galois representation**, **the local discriminant valuation** $p$ **-divisibility unramified guard at odd primes to be eliminated**, and **the exponent threshold guard** $p \ge 5$ **governing** $2$ **-adic bad reduction and integral normalization**.

### 5.1 First Specimen: The Order-5 Rational Torsion Subgroup of the Conductor-11 Semistable Curve $E_{11}$ and the Modulo-5 / Modulo-7 Dual-Channel Separation Test

Consider again the conductor-11 semistable elliptic curve introduced in Chapter 4:

$$
E_{11} : y^2 + y = x^3 - x^2 - 10x - 20, \qquad \Delta(E_{11}) = -11^5, \qquad c_4(E_{11}) = 496.
$$

In the space $S_2(\Gamma_0(11))$ of weight-2 cusp forms at level $\Gamma_0(11)$ , the complex dimension is $\dim_{\mathbb{C}} S_2(\Gamma_0(11)) = 1$ , and its unique normalized newform (Hecke eigenform) is given by the infinite product $q$ -expansion ( $q = e^{2\pi i \tau}$ ):

$$
f_{11}(\tau) = q \prod_{n=1}^{\infty} (1 - q^n)^2 (1 - q^{11n})^2 = \sum_{n=1}^{\infty} c_n(f_{11})\,q^n.
$$

Expanding this product and counting the projective points $|E_{11}(\mathbb{F}_\ell)|$ and Frobenius traces $a_\ell(E_{11}) = \ell + 1 - |E_{11}(\mathbb{F}_\ell)|$ over the finite fields $\mathbb{F}_\ell$ for the first nine primes of good reduction $\ell \in \{2, 3, 5, 7, 13, 17, 19, 23, 29\}$ yields the exact alignment table:

| Good Prime $\ell$ | Projective Point Count $\Vert E_{11}(\mathbb{F}_\ell)\Vert$ | Elliptic Curve Frobenius Trace $a_\ell(E_{11})$ | Modular Form Fourier Coefficient $c_\ell(f_{11})$ | $a_\ell(E_{11}) \bmod 5$ | $(\ell + 1) \bmod 5$ |
| :---: | :---: | :---: | :---: | :---: | :---: |
| $2$ | $5$ | $-2$ | $-2$ | $3$ | $3$ |
| $3$ | $5$ | $-1$ | $-1$ | $4$ | $4$ |
| $5$ | $5$ | $1$ | $1$ | $1$ | $1$ |
| $7$ | $10$ | $-2$ | $-2$ | $3$ | $3$ |
| $13$ | $10$ | $4$ | $4$ | $4$ | $4$ |
| $17$ | $20$ | $-2$ | $-2$ | $3$ | $3$ |
| $19$ | $20$ | $0$ | $0$ | $0$ | $0$ |
| $23$ | $25$ | $-1$ | $-1$ | $4$ | $4$ |
| $29$ | $30$ | $0$ | $0$ | $0$ | $0$ |

At all nine verified primes of good reduction (expanding the infinite product to order $q^{30}$ ), $a_\ell(E_{11}) = c_\ell(f_{11})$ holds identically; this finite-order numerical alignment serves as an independent cross-check of concrete object and eigenvalue conventions, consistent with the known global modularity theorem for the conductor-11 curve $E_{11}$ associated to the unique normalized weight-2 newform $f_{11} \in S_2(\Gamma_0(11))$ (as always, finite prime checks verify the concrete witness and are not used as a substitute for the general modularity proof). Given that $E_{11}$ is semistable, modular at the squarefree odd prime level $N = 11$ , why can we not apply Ribet's level-lowering theorem to $E_{11}$ to eliminate the odd prime factor $q = 11$ from the level $N = 11$ , descending to level $M = 11/11 = 1$ and colliding against $S_2(\Gamma_0(1)) = \{0\}$ ?

Here lies the surgical dual-channel separation property of $E_{11}$ : when we test modulo $p = 5$ versus modulo $p = 7$ , the arithmetic guard that blocks $E_{11}$ from descending from level $11$ to level $1$ switches completely:

#### (A) Channel A (Modulo Prime $p = 5$ ): The Local Unramified Condition Is Completely Satisfied, and the Sole Guard Blocking Level Lowering Is the "Modulo-5 Irreducibility Guard"

When $p = 5$ , examine the $11$ -adic valuation of the minimal discriminant at the bad odd prime $q = 11 \neq 5$ :

$$
v_{11}\!\big(\Delta(E_{11})\big) = v_{11}(-11^5) = 5.
$$

Crucially, this valuation $5$ is **exactingly divisible by** $p = 5$ :

$$
5 \;\big|\; v_{11}\!\big(\Delta(E_{11})\big) = 5 \qquad (5 \bmod 5 = 0)!
$$

By Tate curve uniformization theory, at the multiplicative bad prime $q = 11$ , because $5 \mid v_{11}(\Delta(E_{11}))$ , the modulo- $5$ torsion Galois representation $\bar{\rho}_{E_{11}, 5}$ of $E_{11}$ **is genuinely unramified at** $q = 11$ (and at $q = 5$ the curve $E_{11}$ has good reduction, so its $5$ -torsion group scheme is automatically finite-flat over $\mathbb{Z}_5$ )!

Since $E_{11}$ is semistable, modular at level $N = 11$ , finite-flat at $p = 5$ , and its modulo- $5$ representation $\bar{\rho}_{E_{11}, 5}$ is unramified at $q = 11$ , what single premise blocks it from descending to level $M = 1$ in the $p = 5$ channel?

The answer is: $E_{11}$ **possesses a rational torsion point of exact order** $5$ **over** $\mathbb{Q}$ **, causing its modulo-** $5$ **Galois representation** $\bar{\rho}_{E_{11}, 5}$ **to be reducible!**

We derive the entire order- $5$ rational torsion trajectory of $E_{11}(\mathbb{Q})$ step by step without omission using the closed-form chord-and-tangent group law in rational coordinates (including the tangent step for $2P$ , the first secant step for $3P = P + 2P$ , the second secant step for $4P = P + 3P$ , and the vertical inverse closure $5P = \mathcal{O}$ ):
1. **Base Point Verification**: Take the rational point $P = (5, 5)$ . Substituting into the left-hand side gives $y^2 + y = 5^2 + 5 = 30$ , and into the right-hand side gives $x^3 - x^2 - 10x - 20 = 125 - 25 - 50 - 20 = 30$ . Thus $P \in E_{11}(\mathbb{Q})$ is a finite affine point ( $P \neq \mathcal{O}$ ).
2. **Tangent Step Computing** $2P$ : Differentiating $y^2 + y = x^3 - x^2 - 10x - 20$ implicitly at $P = (5, 5)$ with non-zero denominator $2y_P + 1 = 11 \neq 0$ gives the tangent slope

$$
\lambda_1 = \frac{3x_P^2 - 2x_P - 10}{2y_P + 1} = \frac{3\times 25 - 10 - 10}{10 + 1} = \frac{55}{11} = 5.
$$

   The tangent line $y - 5 = 5(x - 5)$ , or $y = 5x - 20$ , substituted into the curve polynomial $(y^2 + y) - (x^3 - x^2 - 10x - 20) = 0$ , factors identically as

$$
-(x - 5)^2(x - 16) = 0.
$$

   Thus the third intersection point has abscissa $x_{2P} = \lambda_1^2 + 1 - 2x_P = 25 + 1 - 10 = 16$ and ordinate $y_{\mathrm{tan}} = 5\times 16 - 20 = 60$ , namely $(16, 60)$ . Under the group law for $y^2 + y = f(x)$ , the group inverse of $(x, y)$ is $-(x, y) = (x, -y - 1)$ ; inverting $(16, 60)$ yields the doubled point:

$$
2P = (16,\; -60 - 1) = (16, -61).
$$

   Direct check on $(16, -61)$ : left-hand side $(-61)^2 + (-61) = 3721 - 61 = 3660$ , right-hand side $16^3 - 16^2 - 160 - 20 = 4096 - 256 - 180 = 3660$ .
3. **First Secant Step Computing** $3P = P + 2P$ : Connect $P = (5, 5)$ and $2P = (16, -61)$ . Since $x_{2P} = 16 \neq 5 = x_P$ , the secant slope is

$$
\lambda_2 = \frac{y_{2P} - y_P}{x_{2P} - x_P} = \frac{-61 - 5}{16 - 5} = \frac{-66}{11} = -6.
$$

   The secant line through $P(5, 5)$ is $y - 5 = -6(x - 5)$ , or $y = -6x + 35$ . Substituting into $(y^2 + y) - (x^3 - x^2 - 10x - 20) = 0$ yields the exact factorization

$$
-(x - 5)(x - 16)^2 = 0.
$$

   Hence the third intersection has abscissa $x_{3P} = \lambda_2^2 + 1 - x_P - x_{2P} = (-6)^2 + 1 - 5 - 16 = 36 + 1 - 21 = 16$ and ordinate $y_{\mathrm{sec},1} = -6\times 16 + 35 = -61$ (the secant line is tangent to the curve at $2P = (16, -61)$ ). Applying the group inverse $(x, y) \mapsto (x, -y - 1)$ gives the tripled point:

$$
3P = P + 2P = \big(16,\; -(-61) - 1\big) = (16, 60) = -2P.
$$

   Direct check on $(16, 60)$ : $60^2 + 60 = 3660$ .
4. **Second Secant Step Computing** $4P = P + 3P$ **and Order-5 Closure** $5P = \mathcal{O}$ : Connect $P = (5, 5)$ and $3P = (16, 60)$ . Since $x_{3P} = 16 \neq 5 = x_P$ , the second secant slope is

$$
\lambda_3 = \frac{y_{3P} - y_P}{x_{3P} - x_P} = \frac{60 - 5}{16 - 5} = \frac{55}{11} = 5.
$$

   The secant line is $y = 5x - 20$ , giving third intersection abscissa $x_{4P} = \lambda_3^2 + 1 - x_P - x_{3P} = 25 + 1 - 5 - 16 = 5$ and ordinate $y_{\mathrm{sec},2} = 5\times 5 - 20 = 5$ . Applying the group inverse $(x, y) \mapsto (x, -y - 1)$ yields the quadrupled point:

$$
4P = P + 3P = (5,\; -5 - 1) = (5, -6) = -P.
$$

   Direct check on $(5, -6)$ : $(-6)^2 + (-6) = 36 - 6 = 30$ . Finally, because $4P = (5, -6)$ and $P = (5, 5)$ share the abscissa $x_{4P} = x_P = 5$ and satisfy the vertical inverse closure condition $v = y_{4P} + y_P + 1 = -6 + 5 + 1 = 0$ , we have $4P = -P$ , and therefore in the elliptic curve group law:

$$
5P = 4P + P = (-P) + P = \mathcal{O}.
$$

   Since $P = (5, 5) \neq \mathcal{O}$ and $5$ is prime, the order of $P$ is **exactingly equal to** $5$ :

$$
\langle P \rangle = \big\{\mathcal{O},\; P=(5, 5),\; 2P=(16, -61),\; 3P=(16, 60),\; 4P=(5, -6)\big\} \cong \mathbb{Z}/5\mathbb{Z}.
$$

Because the coordinates of $P = (5, 5)$ lie in $\mathbb{Q}$ , every Galois automorphism $\sigma \in \mathrm{Gal}(\overline{\mathbb{Q}}/\mathbb{Q})$ fixes $P$ ( $\sigma(P) = P$ ) and commutes with the group law defined over $\mathbb{Q}$ , hence fixes $kP$ pointwise for all $k \in \mathbb{Z}/5\mathbb{Z}$ . Thus $\langle P \rangle \subset E_{11}[5]$ is a one-dimensional globally Galois-invariant trivial line, proving that the modulo- $5$ Galois representation $\bar{\rho}_{E_{11}, 5}$ is reducible (with semisimplification $\bar{\rho}_{E_{11}, 5}^{\mathrm{ss}} \cong 1 \oplus \bar{\chi}_5$ , which also explains why $|E_{11}(\mathbb{F}_\ell)| \equiv 0 \pmod 5$ and $a_\ell(E_{11}) \equiv \ell + 1 \pmod 5$ for every good prime $\ell \neq 11$ in our table). If a formalization of Ribet's level-lowering theorem **omits or weakens the absolute irreducibility guard on** $\bar{\rho}_{E,p}$ while retaining semistability, squarefree level, and local unramifiedness $p \mid v_q(\Delta_{\min})$ , then $E_{11}$ at $p = 5$ satisfies every remaining premise and lowers level $11$ to level $1$ , directly colliding against $S_2(\Gamma_0(1)) = \{0\}$ !

#### (B) Channel B (Modulo Prime $p = 7$ ): Absolute Irreducibility of the Modulo-7 Representation Is Completely Satisfied, and the Sole Guard Blocking Level Lowering Is the "Local Valuation 7-Divisibility Unramified Guard"

Conversely, when we switch to the prime $p = 7$ on the exact same curve $E_{11}$ :
- First examine the characteristic polynomial of the Frobenius endomorphism $\mathrm{Frob}_2$ at the good prime $\ell = 2$ acting on the $7$ -torsion module $E_{11}[7] \cong \mathbb{F}_7^2$ . From our table, $|E_{11}(\mathbb{F}_2)| = 5$ (consisting of the four affine points $(0,0), (0,1), (1,0), (1,1) \in \mathbb{F}_2^2$ together with $\mathcal{O}$ ), so $a_2(E_{11}) = 2 + 1 - 5 = -2$ , and the characteristic polynomial of $\mathrm{Frob}_2$ modulo $7$ is

$$
P_{\mathrm{Frob}_2}(T) = T^2 - a_2(E_{11})\,T + 2 \equiv T^2 + 2T + 2 \pmod{7}.
$$

  Evaluating $T^2 + 2T + 2 \bmod 7$ across all seven elements of the finite field $\mathbb{F}_7 = \{0, 1, 2, 3, 4, 5, 6\}$ produces the remainders

$$
2,\;\; 5,\;\; 3,\;\; 3,\;\; 5,\;\; 2,\;\; 1,
$$

  **every single one of which lies strictly between** $1$ **and** $6$ **(all non-zero)**! Hence the quadratic polynomial $P_{\mathrm{Frob}_2}(T)$ has no root in $\mathbb{F}_7$ and is irreducible over $\mathbb{F}_7$ . If $E_{11}[7]$ admitted a one-dimensional Galois-stable subspace over $\mathbb{F}_7$ , restricting $\mathrm{Frob}_2$ to that line would produce an eigenvalue in $\mathbb{F}_7$ , a contradiction; thus $\bar{\rho}_{E_{11}, 7}$ is irreducible over $\mathbb{F}_7$ .
- Furthermore, a self-contained oddness argument promotes irreducibility over the prime field $\mathbb{F}_7$ to **absolute irreducibility** over the algebraic closure $\overline{\mathbb{F}}_7$ :
  By the Weil pairing, $\det \bar{\rho}_{E_{11}, 7} = \bar{\chi}_7$ (the modulo- $7$ cyclotomic character). For complex conjugation $c \in \mathrm{Gal}(\overline{\mathbb{Q}}/\mathbb{Q})$ , we have $c^2 = 1$ and $\det \bar{\rho}_{E_{11}, 7}(c) = \bar{\chi}_7(c) = -1$ . Because the field characteristic is $7 \neq 2$ , the involution $\bar{\rho}_{E_{11}, 7}(c)$ has two distinct eigenvalues $+1$ and $-1$ , whose corresponding one-dimensional eigenspaces $L_+, L_- \subset E_{11}[7]$ **are already defined over the prime field** $\mathbb{F}_7$ . If extending scalars to $\overline{\mathbb{F}}_7$ produced a line $L \subset E_{11}[7] \otimes_{\mathbb{F}_7} \overline{\mathbb{F}}_7$ stable under the full Galois group $\mathrm{Gal}(\overline{\mathbb{Q}}/\mathbb{Q})$ , then $L$ would in particular be stable under complex conjugation $c$ , forcing $L$ to be an eigenline of $c$ . Since the two eigenvalues $+1 \neq -1$ of $c$ are distinct, its only eigenlines over $\overline{\mathbb{F}}_7$ are the scalar extensions $L_+ \otimes \overline{\mathbb{F}}_7$ and $L_- \otimes \overline{\mathbb{F}}_7$ of the two $\mathbb{F}_7$ -eigenlines! Thus $L$ is spanned by a basis vector in $\mathbb{F}_7^2$ , the matrix condition preserving $L$ holds already over $\mathbb{F}_7$ , and $E_{11}[7]$ would possess a Galois-stable line over $\mathbb{F}_7$ , contradicting $\mathbb{F}_7$ -irreducibility! Hence $\bar{\rho}_{E_{11}, 7}$ is strictly **absolutely irreducible** over $\overline{\mathbb{F}}_7$ .
- Since at $p = 7$ the curve $E_{11}$ is semistable, modular at the squarefree level $N = 11$ , has good reduction (and hence finite-flat $7$ -torsion) at $p = 7$ , and possesses an absolutely irreducible modulo- $7$ Galois representation, why can it still not descend from level $11$ to level $1$ ?
  Because at the bad odd prime $q = 11$ , the $11$ -adic valuation of the minimal discriminant is $v_{11}(\Delta(E_{11})) = 5$ , and

$$
7 \;\nmid\; v_{11}\!\big(\Delta(E_{11})\big) = 5 \qquad (5 = 7\times 0 + 5,\;\; 5 \bmod 7 = 5 \neq 0)!
$$

  Because $v_{11}(\Delta) = 5$ is not divisible by $p = 7$ , the inertia group at $q = 11$ acts on the $7$ -torsion of the Tate curve with non-trivial unipotent ramification (Artin conductor exponent $a_{11} = 1$ , true Artin conductor $N(\bar{\rho}_{E_{11}, 7}) = 11$ ), blocking the local unramified guard. If a formalization of level lowering **omits or weakens the local unramified / minimal discriminant valuation divisibility guard** $p \mid v_q(\Delta_{\min})$ , then $E_{11}$ at $p = 7$ satisfies every remaining premise and lowers level $11$ to level $1$ , triggering an immediate contradiction!

### 5.2 Second Specimen: Strict Separation of Three Weierstrass Models for the Pythagorean Triple $(a, b, c) = (3, 4, 5)$ at Exponent $p = 2$ and the Odd-Exponent Divisibility Gate / 2-Adic Valuation Threshold $p \ge 5$ 

We now turn to the Hellegouarch–Frey curve construction itself. In the Fermat equation $a^p + b^p = c^p$ , when the exponent is set to the even prime $p = 2$ , there exists the classical Pythagorean integer solution:

$$
a = 3, \qquad b = 4, \qquad c = 5, \qquad 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
$$

Observe that this actual integer solution $(a, b, c) = (3, 4, 5)$ **satisfies every single arithmetic normalization premise of a Frey package except the exponent lower bound** $p \ge 5$ :
- $a = 3 \neq 0$ , $b = 4 \neq 0$ , $c = 5 \neq 0$ ;
- $\gcd(|a|, |b|) = \gcd(3, 4) = 1$ ;
- $a = 3 \equiv 3 \pmod 4$ ;
- $2 \mid b = 4$ ;
- $p = 2$ is prime and satisfies the Fermat equation $a^p + b^p = c^p$ .

If the exponent threshold $p \ge 5$ were omitted or relaxed in the Frey curve normalization and modularity refutation chain, the refutation machinery would apply directly to $(3, 4, 5;\, p = 2)$ and deduce $3^2 + 4^2 \neq 5^2$ ( $25 \neq 25$ )! At which exact algebraic nodes inside the arithmetic geometry does the threshold $p \ge 5$ block $(3, 4, 5;\, p = 2)$ from entering the normalized integral Frey model and level-lowering chain?

By strictly distinguishing three Weierstrass models associated with $(3, 4, 5;\, p = 2)$ (where $A = a^2 = 9, B = b^2 = 16, A + B = 25$ ), we isolate the **odd-exponent modulo-4 integrality gate** and the **discriminant 2-adic valuation threshold** guarded by $p \ge 5$ :

1. **The Raw Integral Cubic Model** $W_0$ :

$$
W_0 : y^2 = x(x - 3^2)(x + 4^2) = x(x - 9)(x + 16) = x^3 + 7x^2 - 144x.
$$

   Its five Weierstrass coefficients are $(a_1, a_2, a_3, a_4, a_6) = (0, 7, 0, -144, 0)$ , with exact invariants

$$
c_4(W_0) = 16(9^2 + 9\times 16 + 16^2) = 7696 = 2^4 \times 481, \qquad c_6(W_0) = -312256 = -2^6 \times 4879,
$$

$$
\Delta(W_0) = 16 \times (9 \times 16 \times 25)^2 = 207360000 = 2^{12} \times 50625.
$$

2. **The Rational Affine Change-of-Variables Model** $W_{\mathbb{Q}}$ **(via** $x = 4X, y = 8Y + 4X$ **) and Failure of the Modulo-4 Integrality Gate**:
   Over $\mathbb{Q}$ , the invertible affine coordinate transformation $x = 4X, y = 8Y + 4X$ (with inverse $X = x/4, Y = (y-x)/8$ ) transforms $y^2 = x(x-A)(x+B)$ into the normalized equation

$$
Y^2 + XY = X^3 + \frac{B - A - 1}{4}X^2 - \frac{AB}{16}X.
$$

   For any odd prime $p \ge 5$ , because $a \equiv 3 \pmod 4$ and $p$ is odd, one has $A = a^p \equiv 3^p \equiv 3 \pmod 4$ , while $2 \mid b \implies 2^p \mid B \implies 4 \mid B$ and $16 \mid AB$ . Thus the modulo-4 divisibility gate $4 \mid (B - A - 1)$ holds identically, all five coefficients of the transformed model are genuine integers, and the rational discriminant identity $256\,\Delta = A^2 B^2 (A + B)^2$ computes the discriminant of an admissible integral Weierstrass model.
   When the exponent drops to the even prime $p = 2$ , however, even though $a = 3 \equiv 3 \pmod 4$ , squaring flips the congruence to $A = a^2 = 9 \equiv 1 \pmod 4$ ! The numerator becomes $B - A - 1 = 16 - 9 - 1 = 6 \equiv 2 \not\equiv 0 \pmod 4$ , so the transformed rational model

$$
W_{\mathbb{Q}} = \left(1,\;\; \frac{3}{2},\;\; 0,\;\; -9,\;\; 0\right)
$$

   has a **non-integral half-integer coefficient** $a_2 = 3/2 \notin \mathbb{Z}$ ! Although at the level of rational polynomials its invariants evaluate to

$$
c_4(W_{\mathbb{Q}}) = 2^{-4}c_4(W_0) = 481, \qquad c_6(W_{\mathbb{Q}}) = 2^{-6}c_6(W_0) = -4879, \qquad \Delta(W_{\mathbb{Q}}) = 2^{-12}\Delta(W_0) = 50625 = 3^4 \times 5^4,
$$

   **one must never infer from the odd rational model discriminant** $\Delta(W_{\mathbb{Q}}) = 50625$ **that the curve has good integral reduction at the prime** $2$ ! Indeed, for any generalized Weierstrass equation with $2$ -adically integral coefficients, if $c_4 = b_2^2 - 24b_4$ is odd, then $b_2 = a_1^2 + 4a_2$ must be odd, so $a_1$ must be odd ( $a_1^2 \equiv 1 \pmod 4$ ), which upon substitution into $c_6 = -b_2^3 + 36b_2 b_4 - 216b_6$ modulo $4$ forces

$$
c_6 \equiv -b_2^3 \equiv -a_1^6 \equiv -1 \equiv 3 \pmod{4};
$$

   yet $c_6(W_{\mathbb{Q}}) = -4879 = 4\times(-1220) + 1 \equiv 1 \not\equiv 3 \pmod 4$ (and scaling by any $2$ -adic unit $u \in \mathbb{Z}_2^\times$ multiplies $c_6$ by $u^6 \equiv 1 \pmod 4$ ), proving by elementary modulo-4 arithmetic that the invariant triple $(c_4, c_6, \Delta) = (481, -4879, 50625)$ **cannot arise from any local integral Weierstrass model at the prime** $2$ ! This is the first exact algebraic gate where $p = 2$ is intercepted by $4 \mid (b^p - a^p - 1)$ .
3. **The Integer-Division Truncated Model** $W_{\mathbb{Z}/}$ **and Breaking of Rational Isomorphism**:
   If one ignores $4 \nmid (b^2 - a^2 - 1)$ and substitutes $(a, b, c, p) = (3, 4, 5, 2)$ into the integral five-tuple defined using truncating integer division $\lfloor 6/4 \rfloor = 1$ ,

$$
W_{\mathbb{Z}/} = (1,\;\; 1,\;\; 0,\;\; -9,\;\; 0),
$$

   direct evaluation from the five coefficients shows that its invariants distort to

$$
c_4(W_{\mathbb{Z}/}) = 457, \qquad \Delta(W_{\mathbb{Z}/}) = 48681.
$$

   Because the cross-product difference of $j$ -invariants is non-zero,

$$
481^3 \times 48681 - 457^3 \times 50625 = 111284641 \times 48681 - 95443993 \times 50625 = 5417447608521 - 4831852145625 = 585595462896 \neq 0,
$$

    $W_{\mathbb{Z}/}$ has a different $j$ -invariant from $W_0$ and $W_{\mathbb{Q}}$ and is no longer isomorphic to the original elliptic curve over $\mathbb{Q}$ !
4. **Threshold Separation of the 2-Adic Valuation Expression** $e(p) = 2p\,v_2(b) - 8$ **Between** $p \ge 5$ **and** $p = 2$ :
   On an admissible normalized integral Frey model with odd prime exponent $p \ge 5$ , the $2$ -adic valuation of the minimal discriminant is given by $e(p) = 2p\,v_2(b) - 8$ , whose algebraic decomposition

$$
2p\,v - 8 = 2p(v - 1) + 2(p - 5) + 2
$$

   guarantees that whenever $v = v_2(b) \ge 1$ and $p \ge 5$ , one has $e(p) \ge 2 > 0$ (for example, at the $h_{\mathrm{FLT}}$ -free valuation regression test point $p = 5$ with $v = v_2(4) = 2$ , $e(5) = 2\times 5\times 2 - 8 = 12 > 0$ ). Once the threshold $p \ge 5$ is removed and one drops to $p = 2, v = 2$ , this formal valuation expression collapses to

$$
e(2) = 2\times 2\times 2 - 8 = 0,
$$

   losing the positive $2$ -adic valuation lower bound that forces even discriminant on normalized integral Frey models for $p \ge 5$ .

Moreover, at $p = 2$ , because the cubic polynomial $x(x-9)(x+16)$ splits completely into distinct rational roots $0, 9, -16 \in \mathbb{Q}$ , the $2$ -torsion subgroup $E[2](\mathbb{Q}) \cong (\mathbb{Z}/2\mathbb{Z})^2$ is completely rational and the modulo- $2$ Galois representation $\bar{\rho}_{E,2}$ is trivially reducible. Thus the exponent threshold guard $p \ge 5$ simultaneously protects three arithmetic gates: " $a^p \equiv 3 \pmod 4$ preventing the normalized integral model transformation from landing on a half-integer coefficient", " $2p\,v_2(b) - 8 \ge 2 > 0$ ensuring multiplicative bad reduction at the prime $2$ ", and "Mazur's torsion and isogeny theorem ruling out reducibility of the modulo- $p$ Galois representation".

---

## Chapter 6: A Six-Step Systematic Diagnostic Protocol for External Mathematicians and Formal-Proof Referees

Synthesizing our source-code structural verification and arithmetic specimen stress tests of the thirteen-million-line Fermat's Last Theorem repository, we formulate a **six-step diagnostic protocol** enabling working mathematicians and domain referees to audit ultra-large-scale formal proof repositories within hours by inspecting six decisive structural junctions without getting lost in millions of lines of tactic scripts:

### Step 1: Audit Top-Level Theorem Junctions for Disabled Unused-Variable Warnings and Existential-Quantifier Disconnections

- **Operational Procedure**: At the interface modules connecting major proof stages (such as the junction from the modularity theorem to the level-lowering theorem), search for compiler directives disabling unused-variable warnings and verify whether the hypothesis variable output by the upstream theorem actually appears as a free variable inside the proof term of the downstream theorem.
- **Mathematical Diagnostic Principle**: If a flagship geometric predicate proved over hundreds of thousands of lines (such as $\mathrm{IsModular}(E)$ ) wraps the integral model $W$ and the level $N$ inside existential quantifiers without preserving inside the predicate the coupling that "the chosen level $N$ is squarefree and all of its prime divisors divide the minimal discriminant", our kernel-leakage theorem rules out any recovery map that reconstructs the conductor-radical support property of the originally selected witness level solely from that weak predicate output; and as confirmed by our audit of the frozen source code, the explicit weak modularity parameter is left unreferenced in the downstream proof term while the actual input is supplied by an internal bypass theorem carrying conductor-level constraints (a source-level implementation fact established by code inspection rather than deduced from kernel leakage alone).

### Step 2: Audit Core Reduction Lemmas (Such as Level Lowering) for Premature Importation of Terminal Vanishing Theorems and Existential Non-Constructive Derivation via Logical Explosion

- **Operational Procedure**: Inspect the final ten lines of the proof of any core reduction lemma claiming to produce an intermediate geometric object (such as $\exists f \in S_2(\Gamma_0(2)),\; f \neq 0$ ), checking whether it provides a constructive or representation-theoretic witness at level $2$ , or whether it imports the terminal vanishing theorems $S_2(\Gamma_0(1)) = 0$ and $S_2(\Gamma_0(2)) = 0$ inside the reduction lemma itself and invokes logical explosion (ex falso quodlibet) to non-constructively populate the return type.
- **Mathematical Diagnostic Principle**: When strong induction eliminates only odd prime factors from a squarefree conductor level to obtain $M \mid 2$ ( $M \in \{1, 2\}$ ) without preserving the lower-bound bad-reduction invariant $2 \mid M$ , one could mathematically close the gap either by maintaining $2 \mid M$ across the induction or by embedding $S_2(\Gamma_0(1))$ into $S_2(\Gamma_0(2))$ via oldform inclusion; instead, to match the declared level- $2$ return type directly, the repository's actual proof imports both $S_2(\Gamma_0(1)) = 0$ and $S_2(\Gamma_0(2)) = 0$ inside the level-lowering lemma to derive a local contradiction and derives the level- $2$ existential witness non-constructively via ex falso quodlibet, rendering the top-level theorem's outer contradiction a redundant shell.

### Step 3: Audit Base Carrier Data Structures for Directly Embedded Counterfactual Hypotheses (The Empty-Carrier Vacuity Test)

- **Operational Procedure**: Inspect the foundational record structure universally quantified across intermediate theorems (such as the Frey package record) to check whether it embeds the counterfactual Diophantine equation ( $a^p + b^p = c^p$ with $p \ge 5$ ) directly as a structure field.
- **Mathematical Diagnostic Principle**: Once a base carrier structure embeds a counterfactual equation, the carrier type is mathematically the empty set $\varnothing$ . One should then perform the **Antithesis Collapse Test** in the proof assistant kernel: take any intermediate theorem quantified over that structure (especially fixed-exponent branches such as $p = 11$ or $p \in \{5, 7, 13\}$ ), negate its conclusion (or replace the conclusion with $0 = 1$ ), and check whether the exact same proof term still compiles by colliding an externally imported fixed-exponent Fermat theorem against the structure's built-in field. If it compiles unchanged, that branch never formalized the elliptic curve isogeny or Galois representation theorem proclaimed by its title.

### Step 4: Audit Arithmetic Geometric Predicates for Bare Integral Equations Lacking Minimal-Model Quotient Normalization (The Isomorphic Scaling Test)

- **Operational Procedure**: Inspect the repository's definitions of "good prime", "semistable model", and "conductor level" to determine whether they are defined invariant on the rational isomorphism class of an elliptic curve $E/\mathbb{Q}$ via local minimal integral model equivalence classes, or directly on an unminimized bare integral Weierstrass tuple $W \in \mathrm{WeierstrassCurve}(\mathbb{Z})$ .
- **Mathematical Diagnostic Principle**: Any predicate defined directly on a bare integral equation via $\ell \nmid \Delta(W)$ or $\ell \mid \Delta(W) \implies \ell \nmid c_4(W)$ is broken at $\ell = 2$ by applying the two-fold rational isomorphism scaling $(x, y) \mapsto (4x, 8y)$ , under which $\Delta \mapsto 2^{12}\Delta$ and $c_4 \mapsto 2^4 c_4$ .

### Step 5: Inject the Conductor-11 Elliptic Curve Specimen $E_{11}$ Across Dual Channels ( $p = 5$ and $p = 7$ ) to Test the Irreducibility and Local Unramified Valuation Guards

- **Operational Procedure**: Test the repository's local level-lowering theorems on the curve $E_{11} : y^2 + y = x^3 - x^2 - 10x - 20$ ( $\Delta = -11^5, c_4 = 496, N = 11$ ) at $p = 5$ and at $p = 7$ :
  1. At $p = 5$ , $5 \mid v_{11}(\Delta) = 5$ satisfies local unramifiedness at $11$ , but the order- $5$ rational torsion point $P = (5, 5)$ forces the modulo- $5$ representation to be reducible. Any level-lowering interface that omits the irreducibility guard will falsely lower $E_{11}$ to level $1$ .
  2. At $p = 7$ , the absence of roots of the $\mathrm{Frob}_2$ characteristic polynomial $T^2 + 2T + 2 \bmod 7$ together with oddness ensures absolute irreducibility of the modulo- $7$ representation, but $7 \nmid v_{11}(\Delta) = 5$ forces ramification at $11$ . Any level-lowering interface that omits the local unramified valuation divisibility guard $p \mid v_q(\Delta_{\min})$ will equally falsely lower $E_{11}$ to level $1$ .

### Step 6: Inject the Pythagorean Specimen $(3, 4, 5;\, p = 2)$ to Test the 2-Adic Valuation Lower Bound and the Modulo-4 Integrality Gate of the Frey Model

- **Operational Procedure**: Substitute the genuine Pythagorean solution $(a, b, c, p) = (3, 4, 5, 2)$ —which satisfies $a \equiv 3 \pmod 4, 2 \mid b, \gcd(a,b)=1$ , and $a^p + b^p = c^p$ —into the repository's integral Frey model construction and discriminant valuation identities.
- **Mathematical Diagnostic Principle**: Because an even exponent flips $3^2 = 9 \equiv 1 \pmod 4$ , the rational normalization coefficient $(b^2 - a^2 - 1)/4 = 3/2$ becomes a non-integral half-integer (violating the modulo-4 divisibility gate, and since $c_6 = -4879 \equiv 1 \not\equiv 3 \pmod 4$ cannot come from any local integral Weierstrass model at $2$ , its odd rational discriminant $50625$ cannot be mistaken for good integral reduction at $2$ ), while integer-division truncation alters the $j$ -invariant and breaks rational isomorphism (distorting the discriminant from $50625$ to $48681$ ), and the formal $2$ -adic valuation expression $2p\,v_2(b) - 8 = 8 - 8 = 0$ loses its positive lower bound. This specimen tests whether the formalization genuinely consumes the odd prime threshold $p \ge 5$ in its integral model normalization and $2$ -adic bad reduction proofs.

---

## Conclusion: From Static Type Jigsaw Puzzles Back to Full-Prefix Conservation of Cross-Stage Arithmetic Invariants

Our internal mathematical structural verification of the thirteen-million-line formalization of Fermat's Last Theorem demonstrates a foundational truth of formal verification: passing a static type-checking kernel certifies only that a formal derivation obeys first-order or dependent type-elimination rules on the **visible static signature stratum**. It never automatically guarantees that intermediate definitions are isomorphic to classical arithmetic geometric objects, nor does it guarantee that flagship theorems have not been disconnected by existential-quantifier erasure, bypassed via unreferenced parameters under disabled unused-variable warnings, or short-circuited by logical explosion over an uninhabited counterfactual base structure.

A formalization of arithmetic algebraic geometry worthy of serving as a permanent mathematical canon must abolish the practice of welding counterfactual hypotheses into foundational carrier structures or severing cross-stage coupled invariants behind existential quantifiers. Every intermediate theorem must be anchored on a non-empty, isomorphism-invariant arithmetic geometric carrier, ensuring that the implicit coupling flow of minimal-model valuations, squarefree conductor radicals, Galois-representation irreducibility, and local unramifiedness is transmitted without loss across every single intermediate prefix from the initial Diophantine equation to the terminal vanishing of modular forms.

---

## Chapter 7: Complete Closed-Form Natural-Language Derivations of the Thirty-Six Core Structural Theorems and Arithmetic Geometric Lemmas

To enable external mathematicians to verify every step of our mathematical derivations without reading any formal verification code, this chapter presents the full suite of thirty-six core propositions as self-contained, closed-form theorems of arithmetic algebraic geometry, linear algebra, and formal logic, followed by the six single-premise deprivation control experiments.

### First Group (Theorems 1 to 12): Algebraic Quotient Structure, Cross-Stage Invariant Preservation, and Non-Empty Fiber Meta-Theorems for Multi-Stage Arithmetic Proof Chains

#### Theorem 1 (Multi-Stage Proof History Truncation and Short Exact Kernel Decomposition Theorem)
Let $H$ be the set of complete typed proof histories of an arithmetic reduction chain, and for each stage depth $n \ge 0$ , let $D_n = \tau_n(H)$ be the $n$ -th stage visible state truncation set (well-defined on records since $\tau_n h = \tau_n h' \implies \tau_m h = \tau_m h'$ for all $m \le n$ ). Let $\mathcal{C}_n = \mathbb{Q}^{(D_n)}$ be the free $\mathbb{Q}$ -vector space spanned by $D_n$ , and let $p_{n,n+1} : \mathcal{C}_{n+1} \to \mathcal{C}_n$ be the natural prefix-forgetful surjection (satisfying $p_{m,n} \circ p_{n,k} = p_{m,k}$ , where each basis element $[\tau_n h]$ has preimage $[\tau_{n+1} h]$ ). Set the inverse limit space $\mathcal{F}_\infty = \varprojlim_n \mathcal{C}_n$ , define the natural map $\eta(h) = ([\tau_n h])_{n \ge 0} \in \mathcal{F}_\infty$ (which is injective by joint separation), denote by $\pi_0 = q_0 : \mathcal{F}_\infty \to \Sigma_0 = \mathcal{C}_0$ the $0$ -th stage truncation onto the top-level static theorem-signature stratum, and set $\mathcal{K}_{\ge 1} = \ker \pi_0$ to be the space of cross-stage coupling constraints hidden by the top-level static signature. For any finitely supported static linear combination $s = \sum_{i=1}^{m} a_i [d_i] \in \Sigma_0$ , choosing histories $h_i \in H$ with $\tau_0 h_i = d_i$ gives $q_0\!\left(\sum_{i=1}^{m} a_i \eta(h_i)\right) = s$ , proving that $\pi_0$ is surjective; since the inclusion $\iota : \mathcal{K}_{\ge 1} \hookrightarrow \mathcal{F}_\infty$ is injective with image equal to $\ker \pi_0$ , we obtain the short exact sequence

$$
0 \longrightarrow \mathcal{K}_{\ge 1} \xrightarrow{\;\iota\;} \mathcal{F}_\infty \xrightarrow{\;\pi_0\;} \Sigma_0 \longrightarrow 0.
$$

On the two-dimensional history plane spanned by the two witness histories $h_{15}$ and $h_{105}$ of Theorem 12, the static projection is $q(a, b) = a + b$ , the kernel embedding is $i(k) = (k, -k)$ , and choosing the linear section $j(s) = (s, 0)$ yields identically for all $a, b, k, s$ : $q(i(k)) = k + (-k) = 0$ , $q(j(s)) = s + 0 = s$ , and $(a, b) - j(q(a, b)) = (a - (a+b),\, b - 0) = (-b, b) = i(-b)$ .

#### Theorem 2 (Non-Canonicity of Static Section Splittings and Complementary Idempotent Projection Decomposition Theorem)
In the short exact sequence of Theorem 1, once one supplies a choice premise selecting for each static basis record $d \in D_0$ a history $h_d \in H$ with $\tau_0 h_d = d$ , defining $j([d]) = \eta(h_d)$ and extending linearly yields a linear section $j : \Sigma_0 \to \mathcal{F}_\infty$ satisfying $\pi_0 \circ j = \mathrm{id}_{\Sigma_0}$ . Setting $P_0 = j \circ \pi_0$ and $Q_{\ge 1} = \mathrm{id}_{\mathcal{F}_\infty} - P_0$ produces a pair of complementary idempotent projection operators:

$$
P_0^2 = P_0, \qquad Q_{\ge 1}^2 = Q_{\ge 1}, \qquad P_0 Q_{\ge 1} = Q_{\ge 1} P_0 = 0, \qquad \mathcal{F}_\infty = j(\Sigma_0) \oplus \mathcal{K}_{\ge 1}
$$

(on the two-dimensional level-history plane of Theorem 1, $P_0(a, b) = (a+b, 0)$ and $Q_{\ge 1}(a, b) = (-b, b)$ , satisfying $P_0^2(a, b) = (a+b+0, 0) = (a+b, 0)$ , $Q_{\ge 1}^2(a, b) = (-b, b)$ , and $P_0 Q_{\ge 1}(a, b) = Q_{\ge 1} P_0(a, b) = (0, 0)$ ). Crucially, the family of all linear sections is parametrized by $j_L = j + \iota \circ L$ as $L : \Sigma_0 \to \mathcal{K}_{\ge 1}$ ranges over arbitrary linear maps; different level-history choices induce distinct sections $j$ , and without the operator intertwining condition $A \circ j = j \circ \bar{A}$ one can never claim a canonical operator splitting.

#### Theorem 3 (Necessary and Sufficient Condition for Well-Defined Factorization of Downstream Arithmetic Observations Through Upstream Static Signatures)
For any surjection onto its image $q : D \to q(D)$ and any map $f : D \to Z$ on the same domain, there exists a unique induced map $\bar{f} : q(D) \to Z$ satisfying $f = \bar{f} \circ q$ if and only if $f$ is constant on every $q$ -fiber:

$$
q(x) = q(y) \;\Longrightarrow\; f(x) = f(y)
$$

(necessity follows by direct substitution; sufficiency follows by defining $\bar{f}(q(x)) = f(x)$ , where fiber-constancy ensures independence of representatives and surjectivity onto $q(D)$ ensures uniqueness on the image $q(D)$ , while extensions outside $q(D)$ are not unique and must not be conflated with uniqueness on the image). In the category of vector spaces and linear maps, substituting difference vectors $v = x - y$ renders this condition equivalent to the kernel inclusion (where $H_{\mathrm{stat}} : X \to Y$ is the upstream static signature projection and $B : X \to Z$ is the downstream target arithmetic observation):

$$
\ker H_{\mathrm{stat}} \subseteq \ker B,
$$

with the induced map $F : \mathrm{im}(H_{\mathrm{stat}}) \to Z$ ( $B = F \circ H_{\mathrm{stat}}$ ) automatically linear. On the two-dimensional level-history plane, the constant-coefficient observation $B_0 = (15, 15) = 15(1, 1)$ descends across the static quotient $H_{\mathrm{stat}} = (1, 1)$ , whereas the true selected-level observation $B = (15, 105)$ evaluates to $-90 \neq 0$ on the kernel vector $v = (1, -1)^\top \in \ker H_{\mathrm{stat}}$ and cannot factor through $H_{\mathrm{stat}}$ (demonstrating also that having the same row dimension or the same matrix rank $1$ never implies equality of kernels).

#### Theorem 4 (Tag-Preserving Quotient Factorization on Tagged Coproducts and the Prohibition of Cross-Branch Cancellation Theorem)
Let the carrier domain be a tagged coproduct (disjoint union) $D = \coprod_{t \in \mathcal{T}} D_t$ (such as the three explicit tagged branches in our study: the non-empty additive Frey parameter base branch, the power-lifted counterfactual source fiber branch carrying $a^p + b^p = c^p$ , and the independent elliptic curve specimen branch $(E_{11}, p)$ ). This theorem strictly requires that the coproduct quotient map $q = \coprod_{t \in \mathcal{T}} q_t : \coprod_t D_t \to \coprod_t Q_t$ **preserve branch tags**, meaning that any single $q$ -fiber contains only records sharing the exact same tag $t$ ( $q(t, x) = q(t', x') \implies t = t' \land q_t(x) = q_t(x')$ ). Under this tag-preserving premise, applying Theorem 3 to each branch $t \in \mathcal{T}$ yields $f_t = \bar{f}_t \circ q_t \iff \ker q_t \subseteq \ker f_t$ , and the universal property of the coproduct assembles a unique global induced map $\bar{f} : \coprod_t Q_t \to Z$ . In the linear certificate direct sum $\bigoplus_{t \in \mathcal{T}} X_t$ , the tag-preserving projection $q = \bigoplus_t q_t$ and target observation $f = \bigoplus_t f_t$ are block-diagonal operators whose kernel decomposes as the direct sum

$$
\ker q = \bigoplus_{t \in \mathcal{T}} \ker q_t,
$$

so that global kernel inclusion $\ker q \subseteq \ker f$ is equivalent to block-by-block kernel inclusion $\forall t \in \mathcal{T},\; \ker q_t \subseteq \ker f_t$ (for example, on the four-dimensional block space combining the Frey parameter branch and the $E_{11}$ specimen branch, the tag-preserving block projection $H = \begin{pmatrix}1 & 1 & 0 & 0 \\ 0 & 0 & 1 & 1\end{pmatrix}$ factors without loss the block-weighted observation $B = \begin{pmatrix}15 & 15 & 0 & 0 \\ 0 & 0 & 11 & 11\end{pmatrix}$ ). **Cross-tag cancellation is strictly forbidden**: if one violated tag preservation by summing the two branches into a single untagged row, a positive unit in the first branch and a negative unit in the second branch would cancel across tags, destroying tag-preserving factorization; likewise, the uninhabited counterfactual source fiber branch contributes only the zero subspace and can never borrow non-empty witnesses from the $E_{11}$ specimen branch or the additive parameter base branch.

#### Theorem 5 (Domain Saturation of Partial Evolution Operators Along Quotient Fibers, Common All-Future Closure of the Six Domain Operators, and Arbitrary-Length Mixed-Word Induction Theorem)
Let $\{A_a : D_a \to D\}_{a \in \Gamma}$ be a family of partial arithmetic evolution operators (with domains $D_a \subseteq D$ ) and let $q : D \to Q$ be a chosen quotient map. A family of partial induced operators $\bar{A}_a : q(D_a) \to Q$ satisfying $q(A_a x) = \bar{A}_a(q(x))$ for all $x \in D_a$ exists on the quotient $Q$ **if and only if** both of the following conditions hold simultaneously:
1. **Domain Saturation Along Quotient Fibers (Executability Is Independent of Representatives)**: $D_a = q^{-1}(q(D_a))$ is a union of $q$ -fibers (whenever $q(x) = q(y)$ , $x \in D_a \iff y \in D_a$ );
2. **Fiber-Preserving Image Transport (Output Is Independent of Representatives)**: For all $x, y \in D_a$ , $q(x) = q(y) \implies q(A_a x) = q(A_a y)$ (which on linear difference spaces takes the form of kernel invariance $A_a(\ker q) \subseteq \ker q$ ; for instance, under a four-dimensional block upper-triangular linear certificate action with zero upper-right coupling block, any kernel vector $(0, 0, k, l)$ maps in one step to $(0, 0, g k + h l, m k + n l)$ , remaining strictly inside the kernel).

To ensure that these two necessary and sufficient conditions are constructively realized rather than left as unverified abstract axioms, we explicitly construct on the complete history space $H$ of our proof domain a common safe quotient $Q_* = H / {\sim_*}$ accommodating all six fundamental arithmetic generators: coordinate scaling and minimization $S_u$ (requiring the same curve $E$ , invertible $u$ , and change-of-variables equations, retaining the new model, inverse transform, and local invariants), modularity witness extraction $C$ (requiring the same $E$ , selected modular form $f$ , level $N$ , and modularity proof, while at the conductor-level interface retaining radical-support evidence), local reduction and inertia/finite-flat verification $L_q$ (requiring the same $E, p$ and prime $q$ , strictly distinguishing the $q \neq p$ unramified gate from the $q = p$ finite-flat gate, retaining minimal valuations and local evidence or failure flags), single-step level lowering $D_q$ (requiring the same representation, input form, all premises of Theorem 34, and local eliminability evidence at $q$ , retaining the new level, normalized form, explicit representation isomorphism, and remaining local evidence), power-lifted source package embedding $J_p$ (requiring the same $a,b,c,p$ , power equation, and congruence normalizations, retaining the embedding into the additive parameter base), and contradiction elimination $X$ (requiring an explicit proof of falsehood in the same context, outputting only the target proof term without non-constructively synthesizing arithmetic objects). Fixing each action label to specify the action kind, object, parameters, and entry-selected existential witnesses, we define two histories $h \sim_* h'$ if and only if they share the same object tag and agree on all domain-executability flags (including missing-premise rejection requests, not merely successful executions) and all stage observations under every finite word of actions. Under this definition, if a single action $a$ is executable on $h$ , agreement on single-letter domain flags guarantees it is executable on $h'$ (domain saturation along $\sim_*$ -fibers); for any subsequent action word $v$ , the $v$ -observation after executing $a$ equals the observation of the concatenated word $av$ on the original history, so $A_a h \sim_* A_a h'$ (fiber-preserving image transport). By induction on the word length $m \ge 0$ for any finite admissible mixed word $w = a_{i_m} \cdots a_{i_1} \in \Gamma^*$ (where the empty word is the identity operator, and if $w$ descends then pulling back the saturated domain of $a$ along $\bar{A}_w$ defines a unique quotient domain on $Q_*$ with $q A_a A_w = \bar{A}_a \bar{A}_w q$ ), every finite mixed trajectory descends without loss (whereas any coarser production quotient $Q$ must satisfy $\ker Q \subseteq \ker Q_*$ , a condition violated by the coarse static type-signature quotient because it drops level and local discriminant valuation couplings under $C$ and $L_{11}$ ).

#### Theorem 6 (Order-Sensitivity of Non-Commuting Evolution Operators and Joint Observation Refinement Theorem)
On any two-dimensional linear certificate plane, consider the upper- and lower-triangular generators $A = \begin{pmatrix}1 & 1 \\ 0 & 1\end{pmatrix}$ and $B = \begin{pmatrix}1 & 0 \\ 1 & 1\end{pmatrix}$ . Direct matrix multiplication yields the non-zero commutator operator

$$
AB - BA = \begin{pmatrix}2 & 1 \\ 1 & 1\end{pmatrix} - \begin{pmatrix}1 & 1 \\ 1 & 2\end{pmatrix} = \begin{pmatrix}1 & 0 \\ 0 & -1\end{pmatrix} = \mathrm{diag}(1, -1),
$$

whose order-sensitivity response on an arbitrary state vector $(x, y)^\top$ is

$$
(AB - BA)\begin{pmatrix}x \\ y\end{pmatrix} = \begin{pmatrix}((x+y)+x) - (x+y) \\ (x+y) - (x+2y)\end{pmatrix} = \begin{pmatrix}x \\ -y\end{pmatrix}
$$

(in particular, on the basis vector $e_1 = (1, 0)^\top$ , $AB e_1 = (2, 1)^\top \neq (1, 1)^\top = BA e_1$ , whereas degenerating $B$ to the identity collapses the commutator to zero). In general, whenever two composite words $AB x$ and $BA x$ both lie in the common executable domain and an observation map $R$ satisfies $R(AB x) \neq R(BA x)$ , the order-retaining joint observation is strictly finer than any order-forgetting coarse static observation; conversely, equality $R(AB x) = R(BA x)$ on a single length-2 word never licenses declaring all longer mixed words equal.

#### Theorem 7 (Coarsest Fidelity Quotient of Joint Observation Maps and Kernel Invariance Under Coordinate Transformations Theorem)
Let $\pi : X \to Y_1$ be a static signature projection and $B : X \to Y_2$ be a target arithmetic observation map required downstream. Defining their joint observation map $Q = (\pi, B) : X \to Y_1 \times Y_2$ , componentwise vanishing immediately gives:

$$
\ker Q = \ker \pi \cap \ker B.
$$

If any other observation map $R : X \to W$ suffices to recover both $\pi$ and $B$ without loss, Theorem 3 implies $\ker R \subseteq \ker \pi$ and $\ker R \subseteq \ker B$ , whence

$$
\ker R \subseteq \ker \pi \cap \ker B = \ker Q,
$$

so that $Q$ factors uniquely through $\mathrm{im}(R)$ as $Q = \bar{Q} \circ R$ by Theorem 3. This proves that **the joint observation map** $Q = (\pi, B)$ **defines the unique coarsest (minimal-overhead) quotient that simultaneously preserves** $\pi$ **and** $B$ . Moreover, for any invertible linear coordinate transformation $T$ on the target space, $\ker(T Q) = \ker Q$ (whereas equality of matrix ranks alone never implies equality of kernels). On the two-dimensional level- $15$ and level- $105$ witness history plane, the joint observation matrix preserving both the total modularity signature $\pi = (1, 1)$ and the selected level $B = (15, 105)$ is

$$
H = \begin{pmatrix}1 & 1 \\ 15 & 105\end{pmatrix}, \qquad \det(H) = 90 \neq 0.
$$

Subtracting $15$ times the first row from the second row yields the row-reduced normal form $B_{\mathrm{norm}} = \begin{pmatrix}1 & 1 \\ 0 & 90\end{pmatrix}$ , which shares the exact same kernel and mutually factors without loss; discarding the second row back to $\pi = (1, 1)$ immediately reintroduces the $-90$ kernel leakage.

#### Theorem 8 (Equivalence Between Single-Step Non-Interference and Full-Prefix Arithmetic Invariant Conservation Theorem)
Fix a baseline linear invariant observation functional $E_{\mathrm{orig}} : X \to V_{\mathrm{inv}}$ and a sequence of single-step evolution increments $\delta_1, \delta_2, \dots, \delta_T \in X$ , and denote the $t$ -th cumulative prefix increment by $S_t = \sum_{s=1}^{t} \delta_s$ (with $S_0 = 0$ ). If every single-step increment satisfies $E_{\mathrm{orig}}(\delta_t) = 0$ , then by linearity of finite sums every prefix $1 \le t \le T$ satisfies $E_{\mathrm{orig}}(S_t) = \sum_{s=1}^{t} E_{\mathrm{orig}}(\delta_s) = 0$ ; conversely, if every prefix $1 \le t \le T$ satisfies $E_{\mathrm{orig}}(S_t) = 0$ , subtracting prefix $t-1$ from prefix $t$ yields $E_{\mathrm{orig}}(\delta_t) = E_{\mathrm{orig}}(S_t) - E_{\mathrm{orig}}(S_{t-1}) = 0$ (and for state-dependent actions, the same equivalence holds along every admissible trajectory provided the same functional $E_{\mathrm{orig}}$ and object identity are checked at each step). By contrast, requiring only terminal vanishing $E_{\mathrm{orig}}(S_T) = 0$ at the final step $T$ never guarantees intermediate prefix conservation (for example, the two-step scalar increments $\delta_1 = +1, \delta_2 = -1$ satisfy $S_2 = 0$ at the end while violating conservation at the first prefix $S_1 = +1 \neq 0$ ). On a three-dimensional certificate state $(x, y, z)$ initialized at $(a, b, -a-b)$ with conserved invariant $x + y + z = 0$ , both the transfer generator $(x, y, z) \mapsto (x+y, 0, z)$ and the transfer generator $(x, y, z) \mapsto (x+z, y, 0)$ preserve $x + y + z = 0$ across every prefix of any finite alternating word by induction on word length.

#### Theorem 9 (Necessary and Sufficient Criterion for All-Successor Safe Elimination of Redundant Auxiliary Components)
Fix the set $\mathcal{W}$ of all admissible subsequent evolution words (including the empty word), and include the domain-executability flag of each step among the successor observations. An auxiliary subspace $K$ can be safely quotiented out (eliminated) from the state space **if and only if** for every admissible successor word $w \in \mathcal{W}$ , its executable domain is saturated along $K$ and every successor observation map $R_w$ satisfies

$$
K \subseteq \ker R_w
$$

(necessity follows directly from representative-independence of executability and observation values across all successor steps after elimination; sufficiency follows by applying Theorem 3 to each successor observation and Theorem 5 to each admissible word). For instance, on the two-dimensional level-history plane, the joint observation $H = \begin{pmatrix}1 & 1 \\ 15 & 105\end{pmatrix}$ retaining the modularity signature $\pi = (1, 1)$ and the level $B = (15, 105)$ simultaneously factors the three-row successor observation matrix $\begin{pmatrix}15 & 105 \\ 0 & 90 \\ -14 & -104\end{pmatrix}$ consisting of "actual level $B = (15, 105)$ ", "level minus fifteen times signature $B - 15\pi = (0, 90)$ ", and "signature minus actual level $\pi - B = (-14, -104)$ "; whereas until one proves that the discriminant valuation observation of the local operator $L_{11}$ is invisible to all subsequent level-lowering steps, one can never eliminate that local valuation component (doing so would conflate the eliminability of prime $11$ at $p = 5$ with its non-eliminability at $p = 7$ ).

#### Theorem 10 (Synchronous Composition Compatibility of Invariant Preservation, Safe Elimination, and Typed Bridge Growth Theorem)
Define each admissible evolution step in a proof chain as a typed transition $(x, d) \mapsto (y, \beta)$ whose output witness $\beta$ simultaneously certifies four obligations within the same step: (i) the domain premise of the current action holds; (ii) zero baseline invariant drift $E_{\mathrm{orig}}(y - x) = 0$ ; (iii) any auxiliary component eliminated at this step lies in the kernel of all successor observations (satisfying the all-successor kernel criterion of Theorem 9); and (iv) an explicit typed binding (such as equality or representation isomorphism) linking the new state object $y$ to the original object. When composing two consecutive steps $(x, d_1) \mapsto (y, \beta_1)$ and $(y, d_2) \mapsto (z, \beta_2)$ , the domain premise of the second step is transported along the typed binding of the first step, the invariant drift satisfies $E_{\mathrm{orig}}(z - x) = E_{\mathrm{orig}}(z - y) + E_{\mathrm{orig}}(y - x) = 0 + 0 = 0$ , all-successor invisibility of eliminated components is preserved by Theorem 9, and the object bindings compose by transitivity of equality or composition of isomorphisms (whereas if $\beta_1$ records only a new level $M$ without carrying the representation isomorphism $\phi$ to the source representation, the intermediate binding object required for the second step is missing and typed bridge growth breaks). In the linear invariant-preserving realization $(s, r) \mapsto (s+d, r-d)$ conserving $s + r$ , for any initial $(s_0, r_0)$ and any two increments $d, e$ , the composite trajectory $(s_0, r_0) \mapsto (s_0+d, r_0-d) \mapsto (s_0+d+e, r_0-d-e)$ preserves $(s_0+d) + (r_0-d) = (s_0+d+e) + (r_0-d-e) = s_0 + r_0$ at every prefix.

#### Theorem 11 (Inverse-Limit Formal Completion, Operator Intertwining with Joint Separation, and the Full-Intersection Barrier for Fixed-Point Existence in the Original Domain Theorem)
Let $Z$ be a space of genuine arithmetic objects in the original domain, and let $\{q_n : Z \to Z_n\}_{n \ge 1}$ be a compatible family of finite-order projections satisfying the **joint injectivity (joint separation) condition**: whenever $q_n(z) = q_n(z')$ for all $n \ge 1$ , one has $z = z'$ . Let $U : Z \to Z$ be an evolution operator on the original domain and $U_n : Z_n \to Z_n$ be stage quotient operators satisfying the **operator intertwining condition**

$$
\forall n \ge 1,\qquad q_n \circ U = U_n \circ q_n,
$$

and let $(x_n)_{n \ge 1}$ be a compatible sequence of fixed points in the finite-stage spaces ( $U_n(x_n) = x_n$ for every $n \ge 1$ ). Then there exists a genuine fixed point $z \in Z$ in the original domain satisfying $U(z) = z$ and $q_n(z) = x_n$ for all $n \ge 1$ **if and only if** the **full intersection of preimage fibers in the original domain is non-empty**:

$$
\bigcap_{n \ge 1} q_n^{-1}(x_n) \neq \varnothing.
$$

**Proof and Empty Full-Intersection Counterexample**: Necessity is immediate. Conversely, if there exists $z \in \bigcap_{n \ge 1} q_n^{-1}(x_n)$ , then for every $n \ge 1$ , operator intertwining and the fixed-point property of $x_n$ yield

$$
q_n\big(U(z)\big) = U_n\big(q_n(z)\big) = U_n(x_n) = x_n = q_n(z).
$$

Joint injectivity of $\{q_n\}_{n \ge 1}$ then immediately implies $U(z) = z$ (if either operator intertwining or joint injectivity is omitted, this lifting step fails). Conversely, when the full intersection of original-domain fibers is empty, even if every individual finite-stage fixed-point fiber $q_n^{-1}(x_n)$ is non-empty in $Z$ , no genuine solution exists in $Z$ : take the original domain to be the natural numbers $Z = \mathbb{N}$ , the operator to be $U(m) = 2m + 1$ , the $n$ -th projection to be reduction modulo $2^n$ onto $Z_n = \mathbb{Z}/2^n\mathbb{Z}$ , and $x_n = 2^n - 1 \pmod{2^n}$ . At every finite modulus $z = 2^n$ , the residue $x_n = z - 1$ satisfies the fixed-point residual $2(z - 1) + 1 - (z - 1) = z \equiv 0 \pmod z$ , the truncation compatibility difference from modulus $2z$ to $z$ is $(2z - 1) - (z - 1) = z \equiv 0 \pmod z$ , and each individual finite stage has the non-empty preimage $2^n - 1 \in \mathbb{N}$ ; yet if there existed a natural number $m \in \bigcap_{n \ge 1} q_n^{-1}(x_n)$ , then $2^n \mid (m + 1)$ would hold for every $n \ge 1$ , which is impossible for $m + 1 > 0$ once $2^n > m + 1$ , so $\bigcap_{n \ge 1} q_n^{-1}(x_n) = \varnothing$ (corresponding to the $2$ -adic integer limit $-1 \notin \mathbb{N}$ ). Thus finite-order congruence compatibility can never substitute for proving non-empty existence in the original arithmetic domain.

#### Theorem 12 (Dual-Model Separation Barrier Theorem for Same-Signature Dual-Level Arithmetic Witnesses with Distinct Conductor-Support Properties)
Take the non-zero Frey parameter triple $A = -1, B = 16, C = 15$ ( $ABC = -240$ ) satisfying $A + B = C, \gcd(A,B)=1, A \equiv 3 \pmod 4, 16 \mid B$ . Its normalized integral Weierstrass model $W = (1, 4, 0, 1, 0)$ has invariants $b_2 = 17, b_4 = 2, b_6 = 0, b_8 = -1, c_4 = 241, \Delta = 225 = 3^2 \times 5^2$ , with minimal multiplicative bad reduction at the primes $3$ and $5$ and good reduction at all other primes, so its exact arithmetic conductor is $N_1 = 15$ . Let $f(z) \in S_2(\Gamma_0(15))$ be its normalized weight-2 newform at level $15$ , and in the oldform space at the multiplied level $N_2 = 105 = 7 \times 15$ (where $7 \nmid ABC = -240$ ) let $f_{105}(z) = f(z) - \beta f(7z)$ be the normalized old eigenform associated to a root $\alpha$ of the $U_7$ characteristic polynomial $\alpha^2 - a_7(f)\alpha + 7 = 0$ (with the other root $\beta$ satisfying $\alpha\beta = 7$ ). Because $f_{105}$ shares the exact same Hecke eigenvalues as $f$ at all good primes $\ell \nmid 105$ , the two witness histories $\mathcal{M}_1 = (W, 15, f)$ and $\mathcal{M}_2 = (W, 105, f_{105})$ produce the exact same output under the level-forgetting static weak modularity signature projection $\pi_0$ ( $\pi_0(\mathcal{M}_1) - \pi_0(\mathcal{M}_2) = 1 - 1 = 0$ ), while their selected-level observation values differ by $15 - 105 = -90 \neq 0$ . Thus their history difference lies in the static signature kernel $\ker \pi_0$ but outside the kernel of the selected-level observation map.

---

### Second Group (Theorems 13 to 16): Exact Mathematical Theorems for the First Structural Rupture (Modularity Dead-Wire Disconnection and Premature Internal Contradiction in Level Lowering)

#### Theorem 13 (Forgetting of the Binding Between the Selected Witness Level and Conductor-Radical Support by the Existential Weak Modularity Predicate Theorem)
In the modularity preparation definition module (lines 93 to 102), the weak modularity predicate $\mathrm{IsModular}(E)$ is defined as $\exists W, N, f,\; \mathrm{IsIntegralModelOf}(W, E) \land N > 0 \land \mathrm{IsModularModelOfLevel}(W, N, f)$ , omitting the conductor-level predicate $\mathrm{IsConductorLevel}(P, N)$ (defined in the conductor-level definition module, lines 8 to 14, requiring $N > 0$ , $\mathrm{Squarefree}(N)$ , and one-way prime support inclusion $\mathrm{Supp}(N) \subseteq \mathrm{Supp}(abc)$ ) from inside the existential quantifier. By the concrete arithmetic construction of Theorem 12, the single elliptic curve $W = (1, 4, 0, 1, 0)$ admits both a level- $15$ witness satisfying the radical-support condition and a level- $105$ witness containing the extraneous prime factor $7 \mid 105$ ( $240 = 7\times 34 + 2$ , so $7 \nmid ABC = -240$ ). Therefore, the forgetful projection from the strong conductor-coupled modularity predicate to $\mathrm{IsModular}(E)$ is strictly irreversible: although in formal logic one can apply existential elimination to $\mathrm{IsModular}(E)$ to extract some witness level $N$ , and although one can invoke additional arithmetic theorems to construct a new conductor-level witness from scratch, **one can never deduce solely from a witness satisfying** $\mathrm{IsModular}(E)$ **that the extracted level** $N$ **satisfies the conductor-radical support condition** $\mathrm{Supp}(N) \subseteq \mathrm{Supp}(abc)$ .

#### Theorem 14 (Zero Free-Variable Dependency on the Explicit Modularity Parameter and Actual Bypass Dependency in the Main Level-Lowering Theorem)
In a dependent type-theoretic context $\Gamma,\; h : H_{\mathrm{mod}}$ , if the set of free variables of a proof term $t$ does not contain $h$ , and none of the downstream declarations invoked by $t$ takes $h$ as an input, then the abstraction $\lambda h.\, t$ is constant with respect to the parameter $h$ . A line-by-line audit of the frozen repository source code confirms that while the top-level synthesis module (the no-Frey-package solution module, lines 139 to 142) passes the Frey curve modularity proof term as an explicit argument into the "level lowering to level 2" solution module (lines 129 to 134), the latter explicitly disables the unused-variable linter and its proof body never references the explicit parameter $h_{\mathrm{mod}}$ ; instead, it invokes the bypass module (the conductor-level modular representation solution module, lines 193 to 208) to regenerate a conductor-coupled triple from scratch and passes it together with the irreducibility proof term into the underlying conductor-level descent lemma. In the four-column source-dependency matrix indexed by (explicit $h_{\mathrm{mod}}$ , irreducibility term $h_{\mathrm{irr}}$ , conductor-level support term $h_{\mathrm{cond}}$ , bypass modular representation term $h_{\mathrm{mod},N}$ ), the projection matrix retaining only the last three columns, $H = \begin{pmatrix}0&1&0&0\\0&0&1&0\\0&0&0&1\end{pmatrix}$ , factors without loss all actual consumption outputs $B = \begin{pmatrix}0&1&0&0\\0&0&1&1\\0&1&1&1\end{pmatrix}$ , whose first column (explicit $h_{\mathrm{mod}}$ ) is identically zero. This establishes the exact source-level dependency structure: the explicit parameter $h_{\mathrm{mod}}$ is unconsumed, and the actual modularity dependency is carried by the bypass theorem.

#### Theorem 15 (Full Preservation of the Three Conductor-Level Arithmetic Conditions Under Divisibility Descent and Odd-Prime Exhaustion Reduction Theorem)
Let a natural number $N \in \mathbb{N}$ satisfy, relative to a non-zero integer product $abc \neq 0$ , all three arithmetic conditions of the repository's conductor-level predicate $\mathrm{IsConductorLevel}$ : (i) positivity $N > 0$ ; (ii) squarefreeness $\mathrm{Squarefree}(N)$ ; and (iii) one-way prime support inclusion $\forall q,\; (\mathrm{Prime}(q) \land q \mid N) \implies q \mid abc$ . Then **for every divisor** $M \mid N$ (writing $N = M d$ ), all three arithmetic conditions are strictly preserved under divisibility descent:
1. **Preservation of Positivity**: $M \neq 0$ (otherwise $N = 0 \cdot d = 0$ , contradicting $N > 0$ ), so $M > 0$ in $\mathbb{N}$ ;
2. **Preservation of Squarefreeness**: If any prime or integer $q > 1$ satisfied $q^2 \mid M$ (writing $M = q^2 e$ ), associativity of multiplication would compose the divisibility witnesses as $(q^2 e) d = q^2 (e d) = N$ , giving $q^2 \mid N$ and contradicting $\mathrm{Squarefree}(N)$ ; hence $\mathrm{Squarefree}(M)$ holds;
3. **Preservation of One-Way Prime Support**: If any prime $q$ satisfies $q \mid M$ (writing $M = q e$ ), associativity composes $(q e) d = q (e d) = N$ to give $q \mid N$ , which by the support condition on $N$ implies $q \mid abc$ .

Thus the predicate $\mathrm{IsConductorLevel}$ is strictly closed under arbitrary divisibility descent $M \mid N$ (while respecting two mathematical boundaries: this one-way support inclusion does not assert that $M$ equals the true arithmetic conductor $N_E$ of the curve, nor does merely dividing $N$ by a prime automatically produce a non-zero modular form at level $M$ ). In particular, once strong induction eliminates all odd prime divisors $q \neq 2, p$ and then eliminates the odd prime $p$ , so that the remaining level $M$ satisfies $\forall q,\; (\mathrm{Prime}(q) \land q \mid M) \implies q = 2$ , the squarefree condition $2^2 \nmid M$ together with $M > 0$ forces the divisibility relation $M \mid 2$ , whence $0 < M \le 2$ , meaning $M = 1$ or $M = 2$ (removing the condition $M \mid 2$ allows levels such as $M = 3$ outside the scope of the level- $1$ and level- $2$ vanishing theorems, whereas omitting the lower-bound bad-reduction invariant $2 \mid M$ from the induction prevents pure divisibility descent from ruling out $M = 1$ ).

#### Theorem 16 (Premature Invocation of Terminal Zero-Space Vanishing Theorems and Non-Constructive Derivation via Ex Falso Quodlibet Inside the Lower-Level Descent Lemma Theorem)
For any vector space $V$ , if a vanishing theorem establishes $\forall f \in V,\, f = 0$ and a local context supplies $f \in V$ with $f \neq 0$ (or, in terms of the leading Fourier coefficient $a_1(f) = 1$ of a normalized cusp form against $a_1(0) = 0$ in a zero space, applies the elimination identity $(n - 0) - (n - 1) = 1 \neq 0$ ), a local contradiction $\bot$ results immediately; the principle of explosion can then inhabit any target type from $\bot$ (including an existential statement at a different level), without constructing any actual non-zero modular form. In the classical geometry of modular curves, the weight- $2$ cusp form space $S_2(\Gamma_0(N))$ is canonically isomorphic to the space of holomorphic differentials $\Omega^1(X_0(N))$ on the compactified modular curve $X_0(N)$ , whose complex dimension equals the genus $g(X_0(N))$ :
- At level $N = 1$ , the projective modular group index is $\mu = 1$ , the number of elliptic points of period $2$ is $e_2 = 1$ , the number of elliptic points of period $3$ is $e_3 = 1$ , and the number of cusps is $c = 1$ , so the Riemann–Hurwitz genus formula gives

$$
g\big(X_0(1)\big) = 1 + \frac{1}{12} - \frac{1}{4} - \frac{1}{3} - \frac{1}{2} = 0;
$$

- At level $N = 2$ , the index is $\mu = 3$ , with $e_2 = 1$ , $e_3 = 0$ , and $c = 2$ , so the genus again vanishes identically:

$$
g\big(X_0(2)\big) = 1 + \frac{3}{12} - \frac{1}{4} - 0 - \frac{2}{2} = 0.
$$

Because a compact Riemann surface of genus zero admits no non-zero holomorphic differentials, $S_2(\Gamma_0(1)) = \{0\}$ and $S_2(\Gamma_0(2)) = \{0\}$ . In lines 156 to 170 of the solution module for "level lowering to two of conductor level", after obtaining $M \mid 2$ and a non-zero form $f$ at level $M$ , the proof imports both vanishing theorems directly inside the lemma to collide against $f \neq 0$ and uses explosion elimination to return the level- $2$ existential statement $\exists f_2 \in S_2(\Gamma_0(2)),\, f_2 \neq 0$ , turning line 142 of the outer main theorem into a redundant second refutation shell.

---

### Third Group (Theorems 17 to 20): Exact Mathematical Theorems for the Second Structural Rupture (Counterfactual Carrier Vacuity and Small-Prime Isogeny Short-Circuiting)

#### Theorem 17 (Separation Theorem Between the Non-Empty Additive Parameter Triple Base and the Power-Lifted Fermat Counterfactual Source Fiber)
Define the general non-zero additive parameter triple base space and its normalized Frey base subdomain respectively by

$$
\mathcal{B} = \Big\{(A, B, C) \in (\mathbb{Z}\setminus\{0\})^3 \;\Big|\; A + B = C,\;\; ABC \neq 0\Big\},
$$

$$
\mathcal{B}_{\mathrm{norm}} = \Big\{(A, B, C) \in \mathcal{B} \;\Big|\; \gcd(A, B) = 1,\;\; A \equiv 3 \pmod{4},\;\; 16 \mid B\Big\} \subset \mathcal{B}.
$$

Both base spaces are non-empty infinite sets: for instance, $(1, 1, 2) \in \mathcal{B} \setminus \mathcal{B}_{\mathrm{norm}}$ ; for any odd prime $p \ge 5$ and any integer pair $(a, b)$ satisfying $a \neq 0,\; b \neq 0,\; a^p + b^p \neq 0$ (which for odd exponents is equivalent to $a + b \neq 0$ ), setting $A = a^p,\; B = b^p,\; C = a^p + b^p$ always produces an element $(A, B, C) \in \mathcal{B}$ ; and if furthermore $\gcd(a, b) = 1,\; a \equiv 3 \pmod 4,\; 2 \mid b$ , then because $a^p \equiv 3^p \equiv 3 \pmod 4$ , $16 \mid 2^p \mid b^p$ , and $\gcd(a^p, b^p) = 1$ , the resulting triple $(a^p, b^p, a^p + b^p)$ always belongs to the normalized subdomain $\mathcal{B}_{\mathrm{norm}} \subset \mathcal{B}$ . Lifting a base triple into the Frey-package source fiber, however, requires supplying in addition a non-zero integer $c$ and the $p$ -th power identity $C = c^p$ (the pullback subdomain of $a^p + b^p = c^p$ under the power map $\Phi_p(a, b, c) = (a^p, b^p, c^p)$ ), together with the prime threshold $p \ge 5$ , non-zero coprimality, $a \equiv 3 \pmod 4$ , and evenness of $b$ :

$$
\mathcal{F}_{\mathrm{FLT}}(p) = \Big\{(a, b, c) \in (\mathbb{Z}\setminus\{0\})^3 \;\Big|\; a^p + b^p = c^p,\;\; \gcd(a,b)=1,\;\; a \equiv 3 \pmod 4,\;\; 2 \mid b\Big\}.
$$

The source fiber is the pullback subdomain of that power equation and is neither a synonymous renaming nor a surjective image of the non-empty base $\mathcal{B}$ (or $\mathcal{B}_{\mathrm{norm}}$ ). At the fixed parameters $p = 11, a = 3, b = 4, c = 5$ , the non-empty additive base yields $A + B = 3^{11} + 4^{11} = 4371451$ (with base residual $0$ while satisfying all other listed arithmetic premises), whereas forcibly binding the sum to $5^{11} = 48828125$ produces the non-zero lifting residual $3^{11} + 4^{11} - 5^{11} = -44456674 \neq 0$ . Thus the non-empty bases $\mathcal{B}$ and $\mathcal{B}_{\mathrm{norm}}$ must never be conflated with or cited as positive inhabitants of the counterfactual source fiber.

#### Theorem 18 (Universal Negation Premise for Counterfactual Fiber Emptiness and Vacuous Truth Degeneration of Dependent Universal Propositions Theorem)
In dependent type theory, given a family of propositions $H(\alpha)$ , **only when an explicit universal negation theorem** $T : \forall \alpha,\, \neg H(\alpha)$ **is supplied as a premise** (merely attaching the English word "counterfactual" in comments or identifier names supplies no proof of negation) is the dependent total space $\Sigma_\alpha H(\alpha)$ proved to be uninhabited (since any element $(\alpha, h)$ yields $T(\alpha)(h) : \bot$ ). Once the total space is proved empty via $T$ , for any predicate family $Q$ over that space, both the universal statement $\forall x \in \Sigma_\alpha H(\alpha),\, Q(x)$ and its universal negation $\forall x \in \Sigma_\alpha H(\alpha),\, \neg Q(x)$ are simultaneously inhabited via the explosion eliminator $\mathrm{elim}_\bot$ (at the level of polynomial ideals, when a single residual $r$ is simultaneously constrained to vanish $r = 0$ and to equal unity $r - 1 = 0$ , every target polynomial $t$ belongs to the contradictory ideal $(r, r-1)$ via the identity $t r - t(r - 1) = t$ ). For a fixed odd prime exponent $n \ge 5$ , the required negation theorem $T$ is precisely the fixed-exponent Fermat's Last Theorem $\mathrm{FLT}(n)$ over non-zero integers: substituting the branch hypothesis $h_p : P.p = n$ into $P.h_{\mathrm{FLT}}$ and colliding it against $\mathrm{FLT}(n)$ derives $\bot$ (whereas Pythagorean solutions at $p = 2$ reside in the even-exponent domain and do not contradict conditional emptiness under the threshold $p \ge 5$ ).

#### Theorem 19 (Source-Dependency Isomorphism Theorem for the Four Small-Prime Cofixed-Line Exclusion Branches $p \in \{5, 7, 11, 13\}$ )
A line-by-line audit of the locally archived source files confirms that: in the "no cofixed line for small primes solution module" (lines 16 to 29), the common helper lemma extracts non-zero integer power-sum non-equality from the externally imported fixed-exponent Fermat theorem $\mathrm{FLT}(n)$ (instantiated at $n = 5, 7, 13$ ), rewrites the exponent using the branch hypothesis $h_p : P.p = n$ , and collides it against $P.h_{\mathrm{FLT}}$ via logical explosion; the "no cofixed line at eleven solution module" (lines 14 to 24) applies the exact same one-line elimination at $n = 11$ ; and the "Mazur–Frey irreducibility solution module" (lines 68 to 91), after deducing a cofixed line from reducibility in the $a \not\equiv 3 \pmod 8$ branch, splits into $(p = 5 \lor p = 7 \lor p = 13) \lor p = 11 \lor p \ge 17$ and invokes those modules to conclude by contradiction. Consequently, all four small-prime branches close over the counterfactual source fiber exclusively by invoking their respective external $\mathrm{FLT}(n)$ theorems (on the fixed non-empty base parameters $(a,b,c) = (3,4,5)$ , the power-lifting failure residuals at the four exponents are $3^5 + 4^5 - 5^5 = -1858$ , $3^7 + 4^7 - 5^7 = -59554$ , $3^{11} + 4^{11} - 5^{11} = -44456674$ , and $3^{13} + 4^{13} - 5^{13} = -1151999938$ ; deleting the external $\mathrm{FLT}(n)$ theorem from any one branch prevents that branch from closing via this explosion term), and therefore cannot be reported as geometric proofs of Mazur's rational isogeny classification on general elliptic curves.

#### Theorem 20 (Strict Inclusion Hierarchy Theorem Between Galois-Stable Lines, Trivial-Quotient Cofixed Lines, and Rational $p$ -Isogeny Kernels)
Let $V$ be a two-dimensional Galois representation, $L = \mathrm{im}(i) \subset V$ be a one-dimensional subspace, and $q : V \to V/L$ be the quotient projection:
1. **Galois-Stable Line Condition**: $L$ is Galois-stable if and only if $q \circ \rho(\sigma) \circ i = 0$ for every $\sigma$ (in a basis with $L$ as the first coordinate axis, stable-line matrices have the upper-triangular form $\begin{pmatrix} a & b \\ 0 & d \end{pmatrix}$ , and the projection of the first basis vector onto the quotient vanishes identically: $0 \cdot a + 0 \cdot 0 = 0$ );
2. **Trivial-Quotient Cofixed-Line Condition**: The requirement $\forall x \in V,\, \sigma x - x \in L$ in the repository's cofixed-line definition module is equivalent to triviality of the induced action on the quotient $V/L$ , namely $q \circ (\rho(\sigma) - \mathrm{id}_V) = 0$ (in the above upper-triangular basis, the quotient residual on an arbitrary vector $(x, y)^\top$ is $(0 \cdot x + d \cdot y) - y = (d - 1)y$ , so the quotient action is trivial if and only if the lower-right character satisfies $d = 1$ identically).

Trivial-quotient cofixedness ( $d = 1$ ) implies line stability, but the converse fails: the diagonal matrix $\mathrm{diag}(1, 2)$ ( $a = 1, b = 0, d = 2$ ) stabilizes the first coordinate axis while multiplying the quotient by $2$ (with non-zero quotient residual coefficient $d - 1 = 2 - 1 = 1 \neq 0$ ). On the $p$ -torsion module $E[p]$ of an elliptic curve $E/\mathbb{Q}$ , a Galois-stable cyclic subgroup $L$ defines a rational $p$ -isogeny $E \to E/L$ ; a line generated by a rational $p$ -torsion point has trivial action on the subspace $L$ itself ( $a = 1$ ), which occupies the dual diagonal entry from trivial action on the quotient $V/L$ ( $d = 1$ ) and requires an explicit transition via the dual isogeny or the Weil-pairing determinant $\det \rho = a d = \bar{\chi}_p$ together with local reduction analysis rather than direct identification.

---

### Fourth Group (Theorems 21 to 24): Exact Mathematical Theorems for the Third Structural Rupture (Homogeneous Weights Under Weierstrass Coordinate Transformations and the Minimal-Model Invariant Quotient)

#### Theorem 21 (Universal Five-Coefficient Generalized Weierstrass Invariant Polynomial Identity Over Arbitrary Commutative Rings and Its Complete Two-Step Algebraic Proof)
Over **any commutative ring** $R$ (including rings of characteristic $2$ and characteristic $3$ , without ever dividing by $2, 3,$ or $1728$ ), for any five coefficients $a_1, a_2, a_3, a_4, a_6 \in R$ , define Tate's auxiliary quantities and fundamental invariants by:

$$
\begin{aligned}
b_2 &= a_1^2 + 4a_2, & b_4 &= 2a_4 + a_1 a_3, & b_6 &= a_3^2 + 4a_6, \\
b_8 &= a_1^2 a_6 + 4a_2 a_6 - a_1 a_3 a_4 + a_2 a_3^2 - a_4^2, \\
c_4 &= b_2^2 - 24b_4, & c_6 &= -b_2^3 + 36b_2 b_4 - 216b_6, \\
\Delta &= -b_2^2 b_8 - 8b_4^3 - 27b_6^2 + 9b_2 b_4 b_6.
\end{aligned}
$$

Then in the integer polynomial ring $\mathbb{Z}[a_1, a_2, a_3, a_4, a_6]$ (and hence in every commutative ring $R$ ), the following exact polynomial identity holds identically:

$$
c_4^3 - c_6^2 = 1728\,\Delta.
$$

**Complete Two-Step Algebraic Proof**:
1. First expand $b_2 b_6 - b_4^2$ in terms of the five Weierstrass coefficients:

$$
\begin{aligned}
   b_2 b_6 - b_4^2 &= (a_1^2 + 4a_2)(a_3^2 + 4a_6) - (2a_4 + a_1 a_3)^2 \\
   &= \big(a_1^2 a_3^2 + 4a_1^2 a_6 + 4a_2 a_3^2 + 16a_2 a_6\big) - \big(4a_4^2 + 4a_1 a_3 a_4 + a_1^2 a_3^2\big) \\
   &= 4\big(a_1^2 a_6 + 4a_2 a_6 - a_1 a_3 a_4 + a_2 a_3^2 - a_4^2\big) = 4\,b_8.
   \end{aligned}
$$

2. Next expand $c_4^3 - c_6^2$ completely as a polynomial in $b_2, b_4, b_6$ :

$$
\begin{aligned}
   c_4^3 - c_6^2 &= (b_2^2 - 24b_4)^3 - (-b_2^3 + 36b_2 b_4 - 216b_6)^2 \\
   &= \big(b_2^6 - 72b_2^4 b_4 + 1728b_2^2 b_4^2 - 13824b_4^3\big) - \big(b_2^6 - 72b_2^4 b_4 + 1296b_2^2 b_4^2 + 432b_2^3 b_6 - 15552b_2 b_4 b_6 + 46656b_6^2\big) \\
   &= 432\,b_2^2(b_4^2 - b_2 b_6) - 13824\,b_4^3 - 46656\,b_6^2 + 15552\,b_2 b_4 b_6.
   \end{aligned}
$$

   Substituting the first step's identity $b_4^2 - b_2 b_6 = -4b_8$ into the leading term immediately factors out the common integer multiplier $1728$ :

$$
c_4^3 - c_6^2 = 432\,b_2^2(-4b_8) - 13824\,b_4^3 - 46656\,b_6^2 + 15552\,b_2 b_4 b_6 = 1728\big(-b_2^2 b_8 - 8b_4^3 - 27b_6^2 + 9b_2 b_4 b_6\big) = 1728\,\Delta.
$$

   Because every step uses pure integer polynomial arithmetic without division, the identity holds universally over any commutative ring $R$ (moreover, perturbing $b_8 \mapsto b_8 + 1$ shifts the residual $c_4^3 - c_6^2 - 1728\Delta$ by $1728 b_2^2$ , which is non-zero and immediately detected across all rings and parameters satisfying $1728 b_2^2 \neq 0$ , such as characteristic- $0$ rings $\mathbb{Z}, \mathbb{Q}$ with $b_2 \neq 0$ ).

#### Theorem 22 (Weight-4 and Weight-6 Homogeneous Transport Laws for $c_4, c_6$ Under Coordinate Scaling and the Invertible Unit Premise Theorem)
Under the weighted coefficient scaling $a_i' = u^i a_i$ ( $i \in \{1, 2, 3, 4, 6\}$ ), inspecting the monomial weights in Theorem 21 shows that every monomial of $b_2$ has weight $2$ , every monomial of $b_4$ has weight $4$ , every monomial of $b_6$ has weight $6$ , and every monomial of $b_8$ has weight $8$ . Thus for arbitrary $u$ :

$$
b_2(W_u) = u^2 b_2(W), \qquad b_4(W_u) = u^4 b_4(W), \qquad b_6(W_u) = u^6 b_6(W), \qquad b_8(W_u) = u^8 b_8(W).
$$

Substituting these into the polynomial definitions of $c_4$ and $c_6$ yields the universal weight- $4$ and weight- $6$ polynomial identities for arbitrary $u$ :

$$
c_4(W_u) = (u^2 b_2)^2 - 24(u^4 b_4) = u^4(b_2^2 - 24b_4) = u^4\,c_4(W),
$$

$$
c_6(W_u) = -(u^2 b_2)^3 + 36(u^2 b_2)(u^4 b_4) - 216(u^6 b_6) = u^6(-b_2^3 + 36b_2 b_4 - 216b_6) = u^6\,c_6(W).
$$

One must strictly distinguish the premise for the polynomial identity from the premise for an isomorphism of elliptic curves: while the polynomial identities hold for arbitrary $u$ (including $u = 0$ ), for the coordinate transformation $(x', y') = (u^2 x, u^3 y)$ (which multiplies both sides of the Weierstrass equation by $u^6$ ) to define an **invertible isomorphism of elliptic curves**, $u$ must be an invertible unit in the base ring (over $\mathbb{Q}$ , $u \in \mathbb{Q}^\times$ , i.e., $u \neq 0$ , with inverse given by $u^{-1}$ ; setting $u = 0$ collapses the equation to a singular degenerate curve and is not an isomorphism).

#### Theorem 23 (Weight-12 Homogeneous Transport Law for the Discriminant $\Delta$ and Conservation of the Equal-Weight $j$ -Invariant Quotient Theorem)
Under the weighted coefficient scaling $a_i' = u^i a_i$ of Theorem 22, all four monomials $-(u^2 b_2)^2(u^8 b_8)$ , $-8(u^4 b_4)^3$ , $-27(u^6 b_6)^2$ , and $9(u^2 b_2)(u^4 b_4)(u^6 b_6)$ of $\Delta(W_u)$ have homogeneous weight $12$ , yielding the universal weight- $12$ polynomial identity

$$
\Delta(W_u) = u^{12}\,\Delta(W),
$$

together with the division-free cross-product polynomial identity $(u^4 c_4)^3 \Delta - c_4^3 (u^{12} \Delta) = 0$ valid for all $u, c_4, \Delta$ without dividing at $u = 0$ or $\Delta = 0$ . When $u \in \mathbb{Q}^\times$ ( $u \neq 0$ ), composition of two rational scalings satisfies $u^2 v^2 = (uv)^2, u^3 v^3 = (uv)^3$ with two-sided inverse $v = u^{-1}$ , forming a group action that preserves non-singularity $\Delta \neq 0$ ; on the non-singular locus $\Delta(W) \neq 0$ , the equal-weight rational quotient (the $j$ -invariant of the elliptic curve) is strictly invariant:

$$
j(W_u) = \frac{c_4(W_u)^3}{\Delta(W_u)} = \frac{u^{12}\,c_4(W)^3}{u^{12}\,\Delta(W)} = \frac{c_4(W)^3}{\Delta(W)} = j(W),
$$

proving that the bare discriminant $\Delta$ depends on the chosen integral representative (for $E_{11}$ , $\Delta = -161051$ at $u = 1$ versus $\Delta' = -659664896$ at $u = 2$ ), whereas the equal-weight quotient $j$ is a true invariant of the isomorphism class.

#### Theorem 24 (Isomorphism Breakdown of the Bare Integral Semistability Predicate and Well-Defined Descent Across the Local Minimal Integral Model Equivalence Class Quotient Theorem)
The bare integral Weierstrass semistability predicate requires $\forall q,\; q \mid \Delta(W) \implies q \nmid c_4(W)$ . This condition characterizes good or multiplicative bad reduction (geometric semistability) **only on non-singular local minimal integral models**. For any integral model $W$ and any non-zero integer scaling factor $u \in \mathbb{Z}\setminus\{0\}$ divisible by a prime $q \mid u$ , one has $q \mid u^{12}\Delta(W) = \Delta(W_u)$ and $q \mid u^4 c_4(W) = c_4(W_u)$ , so the scaled isomorphic integral model $W_u$ necessarily fails the bare semistability predicate at $q$ (for instance, scaling the globally semistable model $E_{11}$ by $u = 2$ gives two integral representatives $E_{11}$ and $E_{11}^{(2)}$ of the exact same rational curve whose bare invariants shift from $(-161051, 496)$ to $(-659664896, 7936)$ and cannot factor through the representative-forgetting matrix $H = (1, 1)$ ). The mathematically sound repair is to apply at the unique carrier entry the idempotent quotient projection $\pi_{\min}$ ( $\pi_{\min}^2 = \pi_{\min}$ ) mapping every integral model to its **local minimal integral Weierstrass model equivalence class** at each prime $q$ (the equivalence class of $\mathbb{Q}_q$ -isomorphic integral models minimizing $v_q(\Delta)$ ): because any generalized Weierstrass transformation $(x, y) \mapsto (u^2 x + r,\, u^3 y + u^2 s x + t)$ between two local minimal integral representatives at $q$ has translation and shear parameters $r, s, t$ that leave $c_4, c_6, \Delta$ unchanged and a scaling factor $u \in \mathbb{Z}_q^\times$ that is a $q$ -adic unit ( $v_q(u) = 0$ ), the minimal valuations $v_q(\Delta_{\min})$ and $v_q(c_{4,\min})$ are strictly invariant across the rational isomorphism class (for $E_{11}$ and $E_{11}^{(2)}$ , the minimal invariant observation matrix $B_{\min} = \begin{pmatrix}-161051 & -161051 \\ 496 & 496\end{pmatrix}$ factors losslessly through $H = (1, 1)$ ).

---

### Fifth Group (Theorems 25 to 28): Complete Arithmetic Geometric Theorems for the Conductor-11 Semistable Elliptic Curve Specimen $E_{11}$ 

#### Theorem 25 (Closed-Form Verification Theorem for the Five-Coefficient Invariants of the Specimen Curve $E_{11}$ and Its Two-Fold Scaled Model $E_{11}^{(2)}$ )
For the elliptic curve $E_{11} : y^2 + y = x^3 - x^2 - 10x - 20$ with integral coefficient tuple $(0, -1, 1, -10, -20)$ , direct evaluation of the universal polynomials of Theorem 21 from the five coefficients yields the exact integer values:

$$
b_2 = -4, \quad b_4 = -20, \quad b_6 = -79, \quad b_8 = -21, \quad c_4 = 496, \quad c_6 = 20008, \quad \Delta = -161051 = -11^5,
$$

where $\Delta = -(-4)^2(-21) - 8(-20)^3 - 27(-79)^2 + 9(-4)(-20)(-79) = 336 + 64000 - 168507 - 56880 = -161051$ , satisfying $c_4^3 - c_6^2 = 496^3 - 20008^2 = 122023936 - 400320064 = -278296128 = 1728 \times (-161051) = 1728\,\Delta$ . Applying the $u = 2$ coordinate scaling yields the integral model $E_{11}^{(2)} = (0, -4, 8, -160, -1280)$ , whose five coefficients independently generate $c_4' = 7936, c_6' = 1280512, \Delta' = -659664896$ .

#### Theorem 26 (Step-by-Step Tangent-and-Secant Group-Law Trajectory of the Order-5 Rational Torsion Point in $E_{11}(\mathbb{Q})$ and Modulo-5 Reducibility Theorem)
On the curve $E_{11}$ , the rational point $P = (5, 5)$ is a finite affine point ( $5^2 + 5 = 30 = 5^3 - 5^2 - 50 - 20$ ). By the chord-and-tangent group law:
1. At $P = (5, 5)$ , the tangent slope is $\lambda_1 = (3\times 5^2 - 2\times 5 - 10)/(2\times 5 + 1) = 55/11 = 5$ (with non-zero denominator $11 \neq 0$ ); substituting the tangent line $y = 5x - 20$ into the curve equation gives $-(x-5)^2(x-16) = 0$ , so the third intersection is $(16, 60)$ and the group inverse $(x, y) \mapsto (x, -y-1)$ gives $2P = (16, -61)$ ;
2. The first secant line connecting $P = (5, 5)$ and $2P = (16, -61)$ has slope $\lambda_2 = (-61 - 5)/(16 - 5) = -66/11 = -6$ ; substituting $y = -6x + 35$ into the curve equation gives $-(x-5)(x-16)^2 = 0$ , so the third intersection is $(16, -61)$ and the group inverse gives $3P = P + 2P = (16, 60) = -2P$ ;
3. The second secant line connecting $P = (5, 5)$ and $3P = (16, 60)$ has slope $\lambda_3 = (60 - 5)/(16 - 5) = 55/11 = 5$ , giving $4P = P + 3P = (5, -6) = -P$ (satisfying the vertical inverse closure condition $v = y_{4P} + y_P + 1 = -6 + 5 + 1 = 0$ ), whence $5P = 4P + P = \mathcal{O}$ .
Because $P \neq \mathcal{O}$ and $5$ is prime, $P$ has exact order $5$ . Since every $\sigma \in \mathrm{Gal}(\overline{\mathbb{Q}}/\mathbb{Q})$ fixes the rational coordinates of $P$ and commutes with the algebraic group law, $\sigma$ fixes $kP$ pointwise; thus $\langle P \rangle \subset E_{11}[5]$ is a one-dimensional trivial Galois-stable subspace, proving that the modulo- $5$ Galois representation $\bar{\rho}_{E_{11}, 5}$ is reducible.

#### Theorem 27 (Projective Point Count of $E_{11}$ Over $\mathbb{F}_2$ , Frobenius Trace $a_2 = -2$ , and Complex-Conjugation Oddness Lifting to Modulo-7 Absolute Irreducibility Theorem)
The curve $E_{11}$ has good reduction at the prime $2$ , reducing over $\mathbb{F}_2$ to $y^2 + y = x^3 + x^2$ . Because $x^3 + x^2 = 0$ and $y^2 + y = 0$ for all $x, y \in \mathbb{F}_2$ , there are $4$ affine points plus $\mathcal{O}$ , giving $|E_{11}(\mathbb{F}_2)| = 5$ and $a_2(E_{11}) = 2 + 1 - 5 = -2$ . The characteristic polynomial of $\mathrm{Frob}_2$ on the $7$ -torsion module $E_{11}[7]$ is $P_2(T) = T^2 - a_2 T + 2 = T^2 + 2T + 2 \pmod 7$ . Evaluating $T^2 + 2T + 2 \bmod 7$ across all $T \in \mathbb{F}_7 = \{0, 1, 2, 3, 4, 5, 6\}$ yields the remainders $2, 5, 3, 3, 5, 2, 1$ (all satisfying $0 < r < 7$ ), so $P_2(T)$ has no root in $\mathbb{F}_7$ and $\bar{\rho}_{E_{11}, 7}$ is irreducible over $\mathbb{F}_7$ . Furthermore, by the Weil pairing, $\det \bar{\rho}_{E_{11}, 7} = \bar{\chi}_7$ , so complex conjugation $c$ satisfies $c^2 = 1$ and $\det \bar{\rho}_{E_{11}, 7}(c) = -1$ ; since the characteristic is $7 \neq 2$ , the two distinct eigenvalues $\pm 1$ of $c$ define two eigenlines already over $\mathbb{F}_7$ . Any putative Galois-stable line over $\overline{\mathbb{F}}_7$ must be an eigenline of $c$ , hence the scalar extension of one of those two $\mathbb{F}_7$ -lines, forcing the stability condition to hold already over $\mathbb{F}_7$ , a contradiction! Thus oddness promotes $\mathbb{F}_7$ -irreducibility to **absolute irreducibility** over $\overline{\mathbb{F}}_7$ .

#### Theorem 28 (Global Minimality of $E_{11}$ , Unique Multiplicative Bad Prime $q = 11$ , and Arithmetic Conductor $N = 11$ Theorem)
Because $|\Delta(E_{11})| = 11^5$ , every prime $\ell \neq 11$ satisfies $v_\ell(\Delta(E_{11})) = 0 < 12$ , while at the unique prime $\ell = 11$ dividing the discriminant one has $v_{11}(\Delta(E_{11})) = 5 < 12$ and $v_{11}(c_4(E_{11})) = v_{11}(496) = 0$ . Therefore $E_{11}$ is a global minimal Weierstrass model with good reduction at all $\ell \neq 11$ (conductor exponent $f_\ell = 0$ ) and semistable multiplicative bad reduction at $\ell = 11$ (conductor exponent $f_{11} = 1$ ), so its arithmetic conductor is the squarefree odd prime

$$
N(E_{11}) = \prod_{\ell} \ell^{f_\ell} = 11^1 = 11.
$$

---

### Sixth Group (Theorems 29 to 32): The Pythagorean Three-Model Specimen $(3, 4, 5;\, p=2)$ and the 2-Adic Valuation Gate Theorems for Integral Frey Models

#### Theorem 29 (Closed-Form Polynomial Identities for the Symbolic Discriminant and $c_4$ Invariant of the Raw Hellegouarch–Frey Cubic Equation)
For the raw cubic Weierstrass model defined by an arbitrary parameter pair $(A, B)$ ,

$$
W_{A,B}^{\mathrm{raw}} : y^2 = x(x - A)(x + B) = x^3 + (B - A)x^2 - ABx,
$$

with coefficient five-tuple $(0,\, B - A,\, 0,\, -AB,\, 0)$ , expanding the universal polynomials of Theorem 21 yields the exact polynomial identities:

$$
c_4\!\left(W_{A,B}^{\mathrm{raw}}\right) = 16\big(A^2 + AB + B^2\big), \qquad \Delta\!\left(W_{A,B}^{\mathrm{raw}}\right) = 16\,A^2 B^2 (A + B)^2.
$$

#### Theorem 30 (Strict Separation Theorem for the Three Weierstrass Models of the Pythagorean Specimen $(a, b, c) = (3, 4, 5)$ at Even Exponent $p = 2$ )
Over $\mathbb{Q}$ , applying the invertible affine coordinate transformation $x = 4X, y = 8Y + 4X$ (with inverse $X = x/4, Y = (y-x)/8$ ) to $y^2 = x(x-A)(x+B)$ and dividing by $64$ yields the rational normalized equation $Y^2 + XY = X^3 + \frac{B-A-1}{4}X^2 - \frac{AB}{16}X$ . At $(a, b, c, p) = (3, 4, 5, 2)$ , where $A = 9, B = 16, A + B = 25$ , three distinct models arise:
1. **The Raw Integral Model** $W_0 = (0, 7, 0, -144, 0)$ : direct evaluation from the five coefficients gives $(c_4, \Delta) = (7696, 207360000)$ ;
2. **The Rational Affine Transformed Model** $W_{\mathbb{Q}} = (1, 3/2, 0, -9, 0)$ : isomorphic to $W_0$ over $\mathbb{Q}$ , but its coefficient $a_2 = (16 - 9 - 1)/4 = 3/2 \notin \mathbb{Z}$ **is not an integer** (violating the modulo-4 integrality gate), with rational invariants $(c_4, \Delta) = (481, 50625)$ (and because $c_6 = -4879 \equiv 1 \not\equiv 3 \pmod 4$ , these invariants cannot arise from any local integral Weierstrass model at $2$ , so the odd rational discriminant $50625$ must never be misread as good integral reduction at $2$ );
3. **The Integer-Division Truncated Model** $W_{\mathbb{Z}/} = (1, 1, 0, -9, 0)$ : obtained by truncating integer division $\lfloor 6/4 \rfloor = 1$ rather than by a rational affine change of variables, with invariants $(c_4, \Delta) = (457, 48681)$ ; although $50625$ and $48681$ are both odd, the non-zero cross-product difference $481^3 \times 48681 - 457^3 \times 50625 = 585595462896 \neq 0$ proves that their $j$ -invariants differ and $W_{\mathbb{Z}/}$ is not isomorphic to the original curve.

#### Theorem 31 (The Odd-Prime Modulo-4 Integrality Gate $4 \mid (B - A - 1)$ and the Universal Invariant Identities of the Normalized Frey Model Theorem)
Let $p \ge 5$ be prime (hence odd), $a \equiv 3 \pmod 4$ , and $b$ be even, and set $A = a^p, B = b^p$ . Because $p$ is odd, $A = a^p \equiv 3^p \equiv 3 \pmod 4$ ; and because $2^p \mid B$ with $p \ge 5$ , one has $4 \mid B$ and $16 \mid AB$ . Thus the modulo-4 divisibility gate $4 \mid (B - A - 1)$ holds strictly, every coefficient of the normalized model $W_{a,b,p}^{\mathrm{int}} = \big(1, (B-A-1)/4, 0, -AB/16, 0\big)$ is an integer, and integer division coincides with exact rational division (note that this integrality theorem does not consume the counterfactual equation $a^p + b^p = c^p$ ; only replacing $A + B$ by $c^p$ consumes $h_{\mathrm{FLT}}$ ). Its Tate quantities are $b_2 = B - A, b_4 = -AB/8, b_6 = 0, b_8 = -A^2 B^2 / 256$ , yielding for all rational $A, B$ the polynomial identities:

$$
c_4 = (B - A)^2 - 24\!\left(-\frac{AB}{8}\right) = A^2 + AB + B^2, \qquad 256\,\Delta = A^2 B^2 (A + B)^2.
$$

#### Theorem 32 (Conditional 2-Adic Valuation Decomposition at the Prime 2, All-Prime Semistability, and the Exponent Threshold Theorem for the Normalized Integral Frey Model)
Under the premises of Theorem 31, adjoin $a, b, c \neq 0$ , coprimality, and $h_{\mathrm{FLT}} : a^p + b^p = c^p$ . Since $a$ is odd and $b$ is even, reduction modulo $2$ forces $c$ to be odd, so $v_2(abc) = v_2(b) \ge 1$ . Theorem 31 gives $\Delta = (abc)^{2p} / 2^8$ , and multiplicativity of valuations yields

$$
v_2(\Delta) = 2p\,v_2(abc) - 8 = 2p\big(v_2(b) - 1\big) + 2(p - 5) + 2 \ge 2p - 8 \ge 2 > 0.
$$

Simultaneously, $c_4 = A^2 + AB + B^2$ is odd ( $v_2(c_4) = 0$ ), so the normalized integral model has minimal multiplicative reduction at $2$ . At every odd prime $q$ , coprimality together with $a^p + b^p = c^p$ ensures that $q$ divides at most one of $a, b, c$ ; if $q \mid abc$ , then $c_4 \bmod q$ reduces to $B^2, A^2,$ or $A^2$ , all non-zero modulo $q$ ( $q \nmid c_4$ ), giving minimal multiplicative reduction at $q$ with minimal discriminant valuation $v_q(\Delta) = 2p\,v_q(abc)$ divisible by $p$ ; if $q \nmid abc$ , then $\Delta$ is a $q$ -adic unit. Hence the curve is semistable at all primes with arithmetic conductor $N_E = \mathrm{rad}(|abc|)$ . Comparing the formal valuation function $e(p) = 2p v - 8$ at fixed $v = v_2(4) = 2$ gives $e(5) = 2\times 5\times 2 - 8 = 12 > 0$ at the $h_{\mathrm{FLT}}$ -free arithmetic regression point $p = 5$ , versus $e(2) = 2\times 2\times 2 - 8 = 0$ at the Pythagorean exponent $p = 2$ , confirming that the positive even-discriminant lower bound cannot be generalized below the threshold $p \ge 5$ .

---

### Seventh Group (Theorems 33 to 36): Necessary and Sufficient Interfaces for Ribet Local Level-Lowering Guards and Single-Premise Necessity Separation Theorems

#### Theorem 33 (Classification Theorem Separating the Local Unramified Criterion at $q \neq p$ from the Finite-Flat Criterion at $q = p$ for Semistable Elliptic Curves)
Let $E/\mathbb{Q}$ be a semistable elliptic curve, $p$ be a prime, and $\Delta_{\min}$ be its minimal discriminant:
1. **Primes Distinct from** $p$ **(** $q \neq p$ **, the Local Unramified Gate)**: When $E$ has good reduction at $q \neq p$ , the finite étale $p$ -torsion group scheme of the smooth abelian scheme splits over the strictly Henselian local base, so $E[p]$ is unramified at $q$ . When $E$ has multiplicative bad reduction at $q \neq p$ , over an at most quadratic unramified extension it is isomorphic to the Tate curve $\overline{K}^\times / t^{\mathbb{Z}}$ , whose $p$ -torsion is generated by a primitive $p$ -th root of unity $\zeta_p$ and $t^{1/p}$ ; the inertia group fixes $\zeta_p$ , and writing the Tate parameter as $t = \varpi^n u$ (where $n = v_q(\Delta_{\min})$ and $u$ is a local unit which always possesses a $p$ -th root in the maximal unramified extension), the tame inertia action on $t^{1/p}$ vanishes (so $E[p]$ is unramified at $q$ ) **if and only if**

$$
p \;\big|\; v_q(\Delta_{\min})
$$

   (writing $n = pk + r$ , the upper-right inertia ramification remainder is governed by $r = n \bmod p$ ; for $E_{11}$ at $q = 11$ where $n = 5$ , the remainder is $5 - 5\times 1 = 0$ at $p = 5$ versus $5 - 7\times 0 = 5 \neq 0$ at $p = 7$ ). Crucially, **this equivalence at** $q \neq p$ **does not require global irreducibility of** $E[p]$ **as a premise**, and therefore applies legitimately to the reducible modulo- $5$ representation of $E_{11}$ .
2. **The Prime Equal to** $p$ **(** $q = p$ **, the Finite-Flat Gate)**: At the prime $p$ itself, one cannot use the $q \neq p$ unramified gate, but must use the finite-flat group scheme condition (corresponding to the repository's peu ramifiée predicate $\mathrm{IsPeuRamifieeAt}$ ). When $E$ has good reduction at $p$ (as $E_{11}$ does at both $p = 5$ and $p = 7$ ), $E[p]$ is the kernel of multiplication by $p$ on a smooth abelian scheme over $\mathbb{Z}_p$ and is automatically finite-flat over $\mathbb{Z}_p$ . When a general semistable elliptic curve has multiplicative bad reduction at $p$ **and** $E[p]$ **is irreducible**, by the standard theorem in the literature (Ribet–Stein, Theorem 2.10, whose irreducibility premise is explicitly retained here), $E[p]$ is finite-flat at $p$ if and only if $p \mid v_p(\Delta_{\min})$ .

#### Theorem 34 (Ribet–Stein Conductor-Level Optimization Input Theorem and the Five-Step Typed Bridge from the Repository's Trace-Congruence Predicate to Galois Representation Isomorphism)
1. **Standard Optimization Theorem Input**: By the standard weight, level, and character optimization theorem over $\mathbb{Q}$ for odd primes $p \ge 5$ (Ribet–Stein, Chapters 1 to 3), any continuous, odd, absolutely irreducible, modular two-dimensional residual Galois representation $\rho$ is realized by a normalized cusp eigenform at its exact Artin conductor $N(\rho) = \prod_{q \neq p} q^{a_q(\rho)}$ , Serre weight, and character. In our domain of semistable elliptic curves with cyclotomic determinant $\det \rho = \bar{\chi}_p$ and finite-flatness at $p$ , the Serre weight is $2$ and the character is trivial, so there exist a normalized weight- $2$ cusp eigenform $g \in S_2(\Gamma_0(N(\rho)))$ and a prime ideal $\lambda \mid p$ giving a representation isomorphism $\bar{\rho}_{g,\lambda} \simeq \rho$ over a common finite residue field (and if one lifts to any multiple level $M$ with $N(\rho) \mid M$ and $p \nmid M$ , oldspace inclusion together with $U$ -operator eigenvectors at the added primes yields a normalized old eigenform at level $M$ preserving all good-prime Hecke eigenvalues). Eliminating an odd prime $q \neq p$ from the level requires $a_q(\rho) = 0$ (unramifiedness at $q$ ), while eliminating $p$ is governed by the weight- $2$ finite-flat gate.
2. **The Five-Step Typed Bridge from the Repository's Trace-Congruence Predicate to Representation Isomorphism**: In the repository's modular representation preparation definition module (lines 75 to 80, and lines 62 to 69 for integral models), the residual modularity predicate $\mathrm{IsResiduallyModularOfLevel}$ is defined merely by the existence of a maximal ideal $\mathfrak{m} \ni p$ of the ring of all algebraic integers in $\overline{\mathbb{Q}}$ such that Hecke eigenvalues and Frobenius traces are congruent modulo $\mathfrak{m}$ at good primes $\ell \nmid \Delta(W), \ell \nmid M, \ell \neq p$ . Bridging this static trace-congruence predicate to the genuine two-dimensional representation isomorphism $\bar{\rho}_{E,p} \simeq \bar{\rho}_{f,\lambda}$ required by the optimization theorem demands closing five consecutive typed steps:
   - Step 1: Non-singularity of $E$ and primality of $p$ ;
   - Step 2: Contracting the maximal ideal $\mathfrak{m}$ of the full ring of algebraic integers (whose residue field is the infinite algebraically closed field $\overline{\mathbb{F}}_p$ ) to a prime ideal $\lambda \mid p$ of the ring of integers of the finite coefficient number field $K_f$ of the modular form $f$ ;
   - Step 3: Embedding both residue fields into a common finite residue field;
   - Step 4: Constructing the continuous two-dimensional Galois representations $\rho_E$ on $E[p]$ and $\rho_f$ attached to $f \bmod \lambda$ ;
   - Step 5: Combining trace congruence at good primes with the shared cyclotomic determinant $\det = \bar{\chi}_p$ to deduce equality of characteristic polynomials on all Frobenius elements outside a finite set of bad primes; because continuous representations into finite matrix groups factor through a finite Galois quotient, the Chebotarev density theorem implies equality of characteristic polynomials across the entire Galois group, which by the Brauer–Nesbitt theorem yields an **isomorphism of semisimplifications** $\rho_E^{\mathrm{ss}} \simeq \rho_f^{\mathrm{ss}}$ ; finally, **only by invoking the core premise that** $\rho_E$ **is absolutely irreducible** (so that its semisimplification consists of a single two-dimensional simple constituent and coincides with the representation itself) can semisimplification isomorphism be promoted to an actual representation isomorphism $\rho_E \simeq \rho_f$ ! When irreducibility fails, two upper-triangular representations $\begin{pmatrix}a & b \\ 0 & d\end{pmatrix}$ and $\begin{pmatrix}a & c \\ 0 & d\end{pmatrix}$ differing in their upper-right extension classes $b \neq c$ share the exact same characteristic polynomial $(T-a)(T-d) = T^2 - (a+d)T + ad$ , and the repository's bare trace-congruence predicate completely forgets the extension discrepancy $b - c \neq 0$ .

#### Theorem 35 (Single-Premise Necessity Separation Theorem for the "Absolute Irreducibility Guard" and the "Local Unramified Guard" Across Two Fixed Parameter Contracts)
Within the level-lowering contract of Theorem 34, we test single-premise necessity separately inside the fixed prime channel $p = 5$ and inside the fixed prime channel $p = 7$ (never conflating the change $p = 5 \leftrightarrow 7$ as a single-premise pair):
1. **First Fixed Contract (Fixing** $W = E_{11},\; p = 5,\; q = 11,\; M = 1$ **to Lock Down the Necessity of the Absolute Irreducibility Premise)**: The curve $E_{11}$ is non-singular, semistable, modular at level $11$ , odd with cyclotomic determinant $\bar{\chi}_5$ , and has good reduction (hence is finite-flat) at $p = 5$ ; at $q = 11$ , because $5 \mid v_{11}(\Delta_{\min}) = 5$ , Theorem 33 proves that $\bar{\rho}_{E_{11}, 5}$ is unramified at $11$ , and since it is unramified at all other primes $q \neq 5$ , its true Artin conductor is $N(\bar{\rho}_{E_{11}, 5}) = 1$ . Among all premises of Theorem 34, **the unique premise that fails is absolute irreducibility** (falsified by the order- $5$ rational torsion point $P = (5, 5)$ of Theorem 26 on the full representation $E_{11}[5]$ rather than its semisimplification). Removing the absolute irreducibility premise from Theorem 34 would produce a normalized weight- $2$ cusp form $g \in S_2(\Gamma_0(1))$ at level $M = 1$ , colliding directly against the vanishing theorem $S_2(\Gamma_0(1)) = \{0\}$ ( $g(X_0(1)) = 1 + 1/12 - 1/4 - 1/3 - 1/2 = 0$ ) of Theorem 16!
2. **Second Fixed Contract (Fixing** $W = E_{11},\; p = 7,\; q = 11,\; M = 1$ **to Lock Down the Necessity of the Local Unramified Premise at the Eliminated Prime)**: The curve $E_{11}$ has good reduction (hence is finite-flat) at $p = 7$ , Theorem 27 proves that $\bar{\rho}_{E_{11}, 7}$ is absolutely irreducible, and all remaining non-singularity, semistability, modularity, oddness, and cyclotomic determinant premises hold. **The unique guard that fails at the target prime** $q = 11$ **is local unramifiedness**, because $7 \nmid v_{11}(\Delta_{\min}) = 5$ (remainder $5 - 7\times 0 = 5 \neq 0$ , giving a non-trivial unipotent inertia matrix with $1$ -dimensional fixed subspace and zero wild ramification, so the Artin exponent is $a_{11} = 1$ and the true Artin conductor is $N(\bar{\rho}_{E_{11}, 7}) = 11 \nmid 1$ —a divisibility failure that is the direct consequence of the same failed unramified gate at $q = 11$ ). Ignoring this local unramified guard to eliminate $q = 11$ down to level $1$ equally collides against $S_2(\Gamma_0(1)) = \{0\}$ !

#### Theorem 36 (Step-by-Step Isomorphism Composition on a Fixed Source Representation, the Commutative Forgetful Diagram, and the Full-Order Closure Repair Master Theorem)
In the repaired typed arithmetic proof architecture, each valid level-lowering step returns a five-tuple carrying an explicit representation isomorphism:

$$
\big(M,\; g,\; \lambda,\; \phi : \rho \xrightarrow{\sim} \bar{\rho}_{g,\lambda},\; \text{remaining local evidence}\big).
$$

When a subsequent descent step produces $\psi : \bar{\rho}_{g,\lambda} \xrightarrow{\sim} \bar{\rho}_{h,\mu}$ , multi-step composition anchored on the fixed source representation $\rho$ is given by the composite isomorphism $\psi \circ \phi : \rho \xrightarrow{\sim} \bar{\rho}_{h,\mu}$ (for example, in the two-dimensional linear shear group realization $S_s(x, y) = (x + s y, y)$ , two-step composition satisfies $S_t(S_s(x, y)) = (x + (s+t)y, y) = S_{s+t}(x, y)$ with two-sided inverse $S_{-s}(S_s(x, y)) = (x, y)$ ); the Galois intertwining equations compose elementwise by associativity, conserving traces and determinants across every step. Applying the forgetful projection that drops the explicit isomorphism $\phi$ and retains only good-prime trace congruences makes the diagram commute down to the repository's $\mathrm{IsResiduallyModularOfLevel}$ predicate (whereas lifting backward from trace congruence to representation isomorphism requires re-establishing all five steps of Theorem 34). Simultaneously, every integral model change factors at the entry through the local minimal integral model equivalence class quotient $\pi_{\min}$ of Theorem 24 and rational isomorphism (rejecting non-integral truncations at $p = 2$ ), domain saturation and fiber descent of mixed words are guaranteed by Theorem 5, full-prefix invariant conservation is guaranteed by Theorem 8, redundant component elimination is governed by Theorem 9, and non-empty existence in the original domain is guarded by Theorem 11—jointly establishing a zero-leakage, non-vacuous formalization architecture for Fermat's Last Theorem.

---

### Eighth Group (Single-Premise Deprivation Control Experiments 1 to 6): Complete Analysis of the Six Paired Control Experiments and Quantitative Degradation Residuals

To translate the thirty-six theoretical theorems of the preceding seven groups into an exact experimental ruler, this section tabulates the six paired positive/negative control experiments—each holding all other premises strictly fixed while stripping away a single arithmetic guard—together with their exact quantitative degradation residuals:

| Control Experiment ID | Targeted Structural Rupture and Associated Theorems | Positive Baseline Configuration (All Guards Intact) | Negative Broken Configuration (Stripping Away Exactly One Premise) | Quantitative Degradation Residual and Arithmetic Collapse Behavior |
| :---: | :---: | :---: | :---: | :---: |
| Control Experiment 1 | Conductor-radical kernel leakage from existential quantifier erasure in the modularity predicate (Theorems 3, 12, 13, 14) | Retain conductor-level radical coupling (truncation switch $\lambda = 0$ ), applying transition operator $F_0 = (0, 1)$ to $H_+ = \begin{pmatrix}1 & 1 \\ 15 & 105\end{pmatrix}$ and kernel difference vector $v = (1, -1)^\top$ | Erase conductor-level radical coupling (truncation switch $\lambda = 1$ ), where degenerate projection $H_- = (1, 1)$ satisfies $H_- v = 0$ on $v = (1, -1)^\top$ | Positive factorization residual is $0$ ; negative configuration under identical static projection $H_- v = 0$ incurs non-zero conductor kernel-leakage residual $(B - F_1 H_+)v = 15 - 105 = -90 \neq 0$ |
| Control Experiment 2 | Separation between non-empty additive base and counterfactual Fermat fiber at exponent $p = 11$ (Theorems 17, 18, 19) | On the non-empty additive base $A + B = C$ at $a = 3, b = 4, p = 11$ , set $A = 3^{11} = 177147$ , $B = 4^{11} = 4194304$ , with true sum $C_+ = A + B = 4371451$ | Forcibly bind the endpoint to the counterfactual power $C_- = 5^{11} = 48828125$ and test the fiber residual $A + B - C_-$ | Positive base fiber residual is $A + B - C_+ = 0$ (non-empty consistent domain); negative binding incurs a massive non-zero residual $3^{11} + 4^{11} - 5^{11} = -44456674 \neq 0$ |
| Control Experiment 3 | Destruction of bare integral semistability predicate under rational isomorphism scaling (Theorems 22, 23, 24) | Evaluate the bare semistability gate $(\Delta \bmod 2,\, c_4 \bmod 2)$ at $\ell = 2$ on the global minimal model of $E_{11}$ ( $u = 1$ ) | Apply two-fold rational isomorphism scaling ( $u = 2$ ) to the exact same rational curve $E_{11}$ and evaluate the same bare gate $(\Delta' \bmod 2,\, c_4' \bmod 2)$ | Positive baseline at $u = 1$ gives $(\Delta \bmod 2, c_4 \bmod 2) = (1, 0)$ with bare semistability gate value $1$ (passes); negative scaling at $u = 2$ gives $\Delta' = 2^{12}\Delta, c_4' = 2^4 c_4$ , shifting modulo-2 remainders to $(0, 0)$ and collapsing the bare gate to $0$ (rejected) |
| Control Experiment 4 | Level-lowering collapse on conductor-11 curve $E_{11}$ in the $p = 5$ channel when stripping the irreducibility guard (Theorems 26, 35) | Generate the complete order-5 group-law trajectory of $P = (5, 5) \in E_{11}(\mathbb{Q})$ via tangent and two secants $P=(5,5) \to 2P=(16,-61) \to 3P=(16,60) \to 4P=(5,-6)$ with vertical inverse closure $v = y_{4P} + 5 + 1 = 0$ ( $5P=\mathcal{O}$ ), respect the irreducibility guard, and retain level-1 zero-space leading coefficient $a = 0$ | **Keep the exact same order-5 group-law trajectory** $P \to 2P \to 3P \to 4P$ and $v = 0$ (along with local unramifiedness $5 \mid v_{11}(\Delta) = 5$ ) completely unchanged, strip away only the irreducibility guard, and demand a normalized cusp form leading coefficient $a = 1$ at terminal level $M = 1$ | Positive baseline closes consistently at $v = 0$ and $a = 0$ ; negative configuration, under the identical order-5 rational torsion trajectory $v = 0$ , demands $a = 1$ at level $1$ and collides against $S_2(\Gamma_0(1)) = \{0\}$ ( $a = 0$ ) with exact algebraic mismatch residual $0 - 1 = -1 \neq 0$ |
| Control Experiment 5 | Level-lowering collapse on conductor-11 curve $E_{11}$ in the $p = 7$ channel when stripping the local valuation $p$ -divisibility unramified guard (Theorems 27, 33, 35) | On $E_{11}$ at $p = 7$ , verify via the non-zero remainder guard $0 < f < 7$ that all seven remainders $f \in (2,5,3,3,5,2,1)$ of the $\mathrm{Frob}_2$ characteristic polynomial $T^2+2T+2 \bmod 7$ are non-zero (yielding absolute irreducibility with oddness), compute the $q = 11$ inertia valuation remainder $r = v_{11}(\Delta) - 7\times 0 = 5$ , and match the inertia guard $r = w$ at the true ramification remainder $w = 5$ keeping level $N = 11$ | Keeping all seven $\mathbb{F}_7$ remainders $f \in (2,5,3,3,5,2,1)$ passing $0 < f < 7$ (absolute irreducibility intact) and the true inertia remainder $r = 5$ unchanged, substitute the unramified demand $w = 0$ into the inertia guard $r = w$ (demanding $r = 0$ ) to force descent to level $N = 1$ | Positive baseline verifies irreducibility via $0 < f < 7$ , matches the inertia guard $r = 5$ , and retains level $N = 11$ ; negative configuration demanding the unramified condition $r = 0$ against the true inertia remainder $r = 5 \neq 0$ triggers immediate guard rejection at $r = 0$ |
| Control Experiment 6 | 2-adic valuation collapse on the Pythagorean three-model specimen $(3, 4, 5;\, p = 2)$ when stripping the exponent threshold $p \ge 5$ (Theorems 30, 31, 32) | Compute from the five coefficients the invariants $(7696, 207360000)$ , $(481, 50625)$ , and $(457, 48681)$ of the three models $W_0, W_{\mathbb{Q}}, W_{\mathbb{Z}/}$ at $(3,4,5; p=2)$ , and under fixed $v = v_2(4) = 2$ and non-zero guard $e \neq 0$ evaluate the 2-adic valuation formula $e(5) = 2\times 5\times 2 - 8$ at the $h_{\mathrm{FLT}}$ **-free arithmetic regression parameter** $p = 5$ | Keep the three-model invariant computations and the guard $e \neq 0$ unchanged, strip away the exponent threshold $p \ge 5$ by setting the exponent to the even prime $p = 2$ where the genuine Pythagorean solution resides, and evaluate $e(2) = 2\times 2\times 2 - 8$ | Positive $h_{\mathrm{FLT}}$ -free valuation regression at $p = 5$ yields $e(5) = 12 \neq 0$ and passes the non-zero guard; negative configuration at the Pythagorean exponent $p = 2$ —in addition to losing integrality on $W_{\mathbb{Q}}$ and losing isomorphism on $W_{\mathbb{Z}/}$ —collapses the 2-adic valuation to $e(2) = 0$ and triggers immediate guard rejection at $e \neq 0$ |

Through the thirty-six closed-form theorems of the first seven groups and the six single-premise deprivation control experiments of the eighth group, the deep cross-stage arithmetic coupling flow, the static signature truncation ruptures, and the quantitative necessity of every single arithmetic guard in the thirteen-million-line formalization of Fermat's Last Theorem are established in a self-contained form independently verifiable by any mathematician.
