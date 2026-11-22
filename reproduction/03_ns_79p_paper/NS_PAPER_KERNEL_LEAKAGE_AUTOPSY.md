# Structural and Operator-Kernel Analysis of the 79-Page Navier–Stokes Manuscript
# 同作者 79 页纳维－斯托克斯（NS）方程纸面证明原件的结构与分部积分算子核分析

---

## 1. Executive Summary of Mathematical Findings / 数学分析核心结论概要

This document summarizes our line-by-line structural and operator-kernel analysis of the 79-page manuscript *Finite-time blow-up for the Navier–Stokes equations* by Levent Alpöge and Tristan Buckmaster (dated November 20, 2026; see `PROVENANCE.md` for cryptographic provenance).

本文件汇总对 Levent Alpöge 与 Tristan Buckmaster 于 2026 年 11 月 20 日发布的 79 页论文 *Finite-time blow-up for the Navier–Stokes equations*（原件密码学溯源见 `PROVENANCE.md`）的逐节结构分析与分部积分算子核检验结论。

**(1) Equatorial interface discrepancy**: On page 53, the multiplier weights $D$ and $Z$ are parameterized as piecewise polynomials on the upper and lower half-space charts $y _ 3 > 0$ and $y _ 3 < 0$ . On page 54 (equation (B.16)) and pages 55–56 (Proposition B.1, inequality (B.20)), integration by parts is bounded exclusively via the open-set bulk Hessian operator norms $\Vert H _ D\Vert _ {\mathrm{op}}$ and $\Vert H _ Z\Vert _ {\mathrm{op}}$ .

When the half-space spline representation is evaluated without enforcing cross-plane normal-derivative joining across $\Sigma = \lbrace y _ 3 = 0\rbrace$ , the distributional Hessian $D^2 W = H _ W dy + [\partial _ z W] _ \Sigma(e _ 3 \otimes e _ 3) dS _ \Sigma$ contains a non-vanishing Dirac surface measure on $\Sigma$ that lies in the kernel of the bulk Hessian readout $q _ {\mathrm{bulk}}(D^2 W) = H _ W$ .

Two closed-form solenoidal counterexample families (`INTERFACE_AUTOPSY_A.md` and `INTERFACE_AUTOPSY_B.md`) directly violate inequality (B.20) under this unjoined half-space contract:

$$
\begin{aligned}
& E _ {D _ +}(v _ \varepsilon) \ge \frac{\pi}{65536}\cdot\frac{633509743}{432432000} > 0, \qquad \frac{\Delta}{c} \cr
& \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} > \frac{26311}{64} > 400 > 0.
\end{aligned}
$$

**命题 B.1 / 不等式** (B.20) 的跨赤道平面奇异面测度偏差（第 53–56 页）：第 53 页将乘子权函数 $D, Z$ 表示为上下半空间上的分侧样条，而第 54 页 (B.16) 与第 55–56 页 (B.20) 仅使用开区域体积海森算子范数 $\Vert H _ D\Vert _ {\mathrm{op}}$ 与 $\Vert H _ Z\Vert _ {\mathrm{op}}$ 控制分部积分。若删去跨赤道平面 $\Sigma = \lbrace y _ 3 = 0\rbrace$ 的法向导数接合前件，分布海森测度 $D^2 W = H _ W dy + [\partial _ z W] _ \Sigma(e _ 3 \otimes e _ 3) dS _ \Sigma$ 中的奇异面测度落在体积读口 $q _ {\mathrm{bulk}}$ 的零空间内，并被两族显式闭式无散反例（详见 `INTERFACE_AUTOPSY_A.md` 与 `INTERFACE_AUTOPSY_B.md`）按上式正裕量直接证伪。

**(2) Collar curvature conservation under global joining**: If global $C^2(\mathbb{R}^3)$ regularity across $\Sigma = \lbrace y _ 3 = 0\rbrace$ is enforced (as specified in the companion files `ExtendedCoerciveChallenge.lean` and `CellLayerChallenge.lean`), rounding off the equatorial kink inside a collar $|\eta| \le \delta$ via the minimal even quartic spline $s _ \delta(\eta) = \frac{3\delta}{8} + \frac{3\eta^2}{4\delta} - \frac{\eta^4}{8\delta^3}$ eliminates the surface measure $[\partial _ z W _ \delta] _ \Sigma = 0$ , but conserves the integrated normal curvature $\int _ {-\delta}^{\delta} s _ \delta''(\eta) d\eta = 2$ and induces an $O(\delta^{-1})$ bulk Hessian spike $\max s _ \delta'' = \frac{3}{2\delta}$ .

全局 $C^2(\mathbb{R}^3)$ 强接合下的 $O(\delta^{-1})$ 薄层曲率守恒律：若按伴随规范文件施加跨赤道平面的全局 $C^2(\mathbb{R}^3)$ 接合条件，在薄层 $|\eta| \le \delta$ 内用极小四次偶样条 $s _ \delta(\eta)$ 磨平尖角虽能消除奇异面测度，但法向总曲率质量 $\int _ {-\delta}^{\delta} s _ \delta''(\eta) d\eta = 2$ 严格守恒，并在薄层内产生峰值 $\max s _ \delta'' = \frac{3}{2\delta}$ 的体积海森代价。

**(3) Unclosed dependencies and supplementary materials**: The conditional implication chain of the 79-page manuscript is:

$$
\begin{aligned}
& \exists d \in \mathcal{D} _ B \mathsf{Valid} _ B(d) \implies \exists c \in \mathcal{C} _ 7 \mathsf{Cert} _ 7(c) \cr
& \implies \exists (W, q) \mathsf{Profile}(W, q) \implies \mathsf{Blowup} _ {\mathbb{R}^3, \mathbb{T}^3}.
\end{aligned}
$$

In the 79-page PDF, the upstream witness $d \in \mathcal{D} _ B$ is represented only by the 64-character SHA-256 digest `3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5` (pages 1, 4, 38–39, 70), the error-absorption coefficients of (B.16) (page 54) and full proofs of Propositions B.1 and B.4 (pages 55–60) are omitted from the paper text, and page 70 lists seven additional certificate conditions not expanded in the manuscript.

Furthermore, Theorem 5.4 (verified in `suite_6_collar_smoothing_transfer_futility`) proves that within this static piecewise-multiplier architecture, publishing the raw spline coefficient table behind the SHA-256 digest, appending a thin-collar $C^2$ smoothing patch (which transfers the surface integral into the collar bulk Hessian with factor $I _ {\mathrm{collar}}(\frac{1}{8}) = \frac{2787617180779875667}{3000241776758882304} > \frac{37}{40}$ or drives $I _ 1(1,0) \le -\frac{786431}{4} < 0$ ), or accumulating outer auxiliary lemmas cannot resolve the operator-level discrepancy.

**纸面未闭合环节与追加外围材料的静态不变性**（定理 5.4）：论文的顶层蕴涵链以 $\exists d \in \mathcal{D} _ B \mathsf{Valid} _ B(d)$ 为最左端前件，而 PDF 原件仅印出 $d$ 的 64 位 SHA-256 摘要，并省略了 (B.16) 误差系数、命题 B.1 与 B.4 的完整证明及第 70 页的 7 项附加条件。定理 5.4（由 `suite_6_collar_smoothing_transfer_futility` 精确核验）进一步证明：在现有静态分片乘子架构内，单纯解封该 SHA-256 有限维系数表、追加薄层 $C^2$ 磨平补丁（将奇异面积分以因子 $I _ {\mathrm{collar}}(\frac{1}{8}) > \frac{37}{40}$ 转移为薄层纯体积海森积分或导致 $I _ 1(1,0) \le -\frac{786431}{4} < 0$ ）或堆砌外围辅助引理，均不改变上述分部积分算子层的结构约束。

---

## 2. Section-by-Section Structural Verification Ledger / 逐节结构核验明细表

To maintain complete objectivity, we record both the sections of the 79-page manuscript whose algebraic mechanisms are mathematically sound under their stated hypotheses and the exact locations where unclosed external dependencies or operator-kernel discrepancies arise:

为保持完全客观的学术评估，下表同时记录该 79 页论文中在声明假设下代数机制成立的环节，以及存在未闭合外部依赖或分部积分算子核偏差的精确位置：

| Manuscript Section & Pages / 论文位置 | Mathematical Mechanism Audited / 核验的数学机制 | Verification Assessment / 核验评估结论 |
| :--- | :--- | :--- |
| Section 1.2 (p. 3, eq. (1.4)) | Self-similar coordinate transformation $y = x/\sqrt{T-t}$ , $s = \log(T/(T-t))$ / 自相似坐标变换 | Invertible diffeomorphism on every $t < T$ ; rescales norms without discarding Fourier modes. / 在任意 $t < T$ 上为可逆微分同胚，仅改变范数尺度而不丢失模态。 |
| Section 2.1 (p. 10, eq. (2.3)) & Section 4.1 (p. 18, eq. (4.7)) | Symmetrized bilinear operator $K(\tau)(u,v)$ and linearized perturbation expansion / 对称化双线性算子与线性化扰动展开 | Evaluates on the diagonal $u = v$ to the exact Navier–Stokes nonlinearity and retains both $2B(u^{\ast}, v)$ and $B(v,v)$ . / 在对角线 $u = v$ 上精确还原原方程非线性项，并同时保留线性与二次相互作用。 |
| Section 4.2 (pp. 18–21, Lemmas 4.4–4.6, Prop. 4.3) | Finite-codimension Riesz spectral projection $P _ u$ of the single-period operator $M$ / 单周期算子有限余维谱投影分裂 | Solves $P _ u \chi _ n$ backward and $(I - P _ u)\chi _ n$ forward without discarding the stable subspace. / 不稳定方向后向求解、稳定方向前向递推，未丢弃稳定子空间。 |
| Section 7.1 (p. 30, eq. (7.2)) & Section 7.8 (eq. (7.33)) | Equality modulo pressure gradients via divergence-free test fields / 模压力梯度等价关系与无散测试场 | Mathematically consistent with Leray projection onto solenoidal fields. / 与无散空间上的 Leray 正交投影严格一致。 |
| Section 7.4 (pp. 37–38, Prop. 7.5) & Section 7.6 (pp. 42–43, Prop. 7.10) | Local $L^2$ strong compactness from $H^1$ bounds and weak convergence of quadratic products / 局部紧性与非线性弱极限过渡 | Combines local strong $L^2$ convergence $v _ k \to v$ with weak gradient convergence $\nabla v _ k \rightharpoonup \nabla v$ . / 结合局部强 $L^2$ 收敛与梯度弱收敛处理二次乘积项。 |
| Appendix B.1–B.2 (pp. 53–56, eq. (B.16), Prop. B.1, ineq. (B.20)) | Half-space spline weights $D, Z$ and integration-by-parts bound via bulk Hessian norms $\Vert H _ D\Vert _ {\mathrm{op}}, \Vert H _ Z\Vert _ {\mathrm{op}}$ / 分侧样条权函数与体积海森分部积分 | Equatorial interface measure discrepancy: omits $[\partial _ z W] _ \Sigma(e _ 3\otimes e _ 3) dS _ \Sigma$ under the unjoined half-space contract (refuted by Counterexample Families A and B), or incurs the $O(\delta^{-1})$ collar curvature tax under global $C^2$ joining (Theorems 3.2, 3.3, 4.1, 5.4). / 跨赤道平面奇异面测度偏差：在无跨面接合分侧合同下遗漏 $[\partial _ z W] _ \Sigma$ （被反例族 A 与 B 证伪），在全局 $C^2$ 强接合下则须支付 $O(\delta^{-1})$ 薄层体积海森曲率代价（定理 3.2、3.3、4.1、5.4）。 |
| Appendix B.3 (pp. 57–60, Prop. B.4) & Section B.5 (p. 70, post-Thm. B.14) | Reduction to spatial cell unknowns, harmonic tail bounds (B.32)–(B.34), and 7 additional conditions on page 70 / 空间单元归约、谐波尾界与第 70 页附加条件 | **Unclosed on paper**: full proofs of Propositions B.1 and B.4, explicit error coefficients in (B.16), and the 7 post-B.14 conditions on page 70 are omitted from the PDF text. / **纸面未闭合**：命题 B.1 与 B.4 的完整证明、(B.16) 显式误差系数及第 70 页列出的 7 项附加条件在 PDF 中被省略。 |
| Appendix B.4 (pp. 62–64, Lemma B.7 & Prop. B.8) | Tree-structured quadratic-form telescoping and free-block direct-sum compensation $X = S \oplus F$ / 树状二次型传递消去与自由块直和补偿 | Algebraically reconstructed in Theorem 5.1; holds if and only if irredundant observation rows satisfy $\ker(H _ {-i}J) \subseteq \ker(BJ)$ (Theorem 5.2) and restricted Rayleigh thresholds satisfy $\tau = 2d _ j b^T Q _ S^{-1} b < 1$ (Theorem 5.3). / 定理 5.1 给出了完整代数重建，其成立充要条件由定理 5.2（同域无核漏）与定理 5.3（受限瑞利阈值 $\tau < 1$ ）精确刻画。 |
| Pages 1, 4, 10, 70 | Existential certificate witness $d \in \mathcal{D} _ B$ (`3f7a335b...`) and external 128-bit interval checker / 外部存在性数值证书与区间算术校验器 | Unreleased external data: zero certificate bytes are disclosed in the PDF or repository; Theorem 5.4 proves that unsealing $d$ cannot alter the distributional Hessian identity of Proposition B.1. / 外部数据未公开：PDF 与仓库未提供证书字节；且定理 5.4 证明解封该有限维系数表无法消除命题 B.1 的分布海森算子核偏差。 |
