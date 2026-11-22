# Domain Classification: Full-Spectrum Static Euclidean Readout Twin Pair $\pm 17 U$ vs. Proposition B.1 Equatorial Seam Counterexamples
# 反例域界定：三维纳维－斯托克斯流全谱静态欧氏读口双初值 $\pm 17 U$ 与论文命题 B.1 赤道接缝反例的严格区分

---

## 1. Purpose and Scope of This Domain Classification / 本文件的作用域界定

This document establishes the exact mathematical boundary between two distinct families of analytical results verified in this repository:
1. **Direct counterexamples to the unjoined half-space $C^2$ spline version of Proposition B.1 / inequality (B.20) in the 79-page paper** (Counterexample Family A on the $D$ -weight seam and Counterexample Family B on the $Z$ -weight seam, documented in `INTERFACE_AUTOPSY_A.md` and `INTERFACE_AUTOPSY_B.md`);
2. **A foundational fluid-dynamical counterexample to full-spectrum static Euclidean quadratic readouts on the three-dimensional torus $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$** (the twin initial data $X_\pm = \pm 17 U$ , verified in `suite_4_static_readout_sign_blindness` of `verify_ns_counterexamples.py` and stored in `STATIC_READOUT_WITNESS.json`).

本文件严格界定本仓库所验证的两类数学结果各自的定义域与适用边界：
1. **针对 79 页论文附录 B 命题 B.1 / 不等式 (B.20) 在分侧无跨面接合 $C^2$ 样条合同下的直接解析反例**（即作用在二阶权 $D$ 赤道接缝上的反例族 A 与作用在一阶权 $Z$ 赤道接缝上的反例族 B，详见 `INTERFACE_AUTOPSY_A.md` 与 `INTERFACE_AUTOPSY_B.md`）；
2. **针对三维周期环面 $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ 上全谱静态欧氏二次能谱读口的流体动力学方法论反例**（即正负孪生光滑无散初值 $X_\pm = \pm 17 U$ ，由 `verify_ns_counterexamples.py` 中的 `suite_4_static_readout_sign_blindness` 与 `STATIC_READOUT_WITNESS.json` 精确核验）。

---

## 2. Exact Construction of the Twin Initial Data $X_\pm = \pm 17 U$ on $\mathbb{T}^3$ / 三维环面双初值 $X_\pm = \pm 17 U$ 的精确构造

On the volume-normalized three-dimensional torus $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ with unit viscosity $\nu = 1$ , define the eight-mode smooth divergence-free zero-mean velocity field:

在体积归一化的三维周期环面 $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ （取黏性系数 $\nu = 1$ ）上，定义仅含八个非零傅里叶频率的光滑无散零均值速度场：

$$
U(x,y,z) := \bigl(\sin y + \sin z,\ \sin x,\ \sin x - \sin(x+y)\bigr), \qquad X_\pm := \pm 17\,U.
$$

Define the full-spectrum static quadratic readout $q_{\mathrm{static}}$ and the initial time derivative of enstrophy $f(u)$ along the true local smooth Navier–Stokes solution evolving from $u$ :

定义全谱静态二次读口 $q_{\mathrm{static}}$ 以及沿真实局部光滑纳维－斯托克斯解的初始时刻平方涡量（拟能）时间导数 $f(u)$ ：

$$
q_{\mathrm{static}}(u) := \Bigl(\bigl\{\widehat{u}(k)\widehat{u}(k)^*\bigr\}_{k \in \mathbb{Z}^3},\ \|u\|_{L^2}^2,\ \|\omega\|_{L^2}^2,\ \|\nabla\omega\|_{L^2}^2,\ \langle u, \omega\rangle\Bigr),
$$

$$
f(u) := \left.\frac{d}{dt}\|\nabla u(t)\|_{L^2}^2\right|_{t=0} = 2\langle \omega,\, (\omega \cdot \nabla)u\rangle - 2\nu\|\nabla\omega\|_{L^2}^2.
$$

Because simultaneous sign reversal of all Fourier coefficients leaves every single-mode Hermitian outer product $\widehat{u}(k)\widehat{u}(k)^*$ invariant, we have $q_{\mathrm{static}}(X_+) = q_{\mathrm{static}}(X_-)$ . Taking the curl of $U$ yields:

由于将全部傅里叶系数同时反号不改变任何单模厄米外积矩阵 $\widehat{u}(k)\widehat{u}(k)^*$ ，故必有 $q_{\mathrm{static}}(X_+) = q_{\mathrm{static}}(X_-)$ 。直接求 $U$ 的旋度得：

$$
\omega_U = \bigl(-\cos(x+y),\ \cos z - \cos x + \cos(x+y),\ \cos x - \cos y\bigr).
$$

By trigonometric orthogonality on $\mathbb{T}^3$ , the unique non-vanishing triadic vortex-stretching resonance comes from $\langle \cos x \cos y \cos(x+y)\rangle = \frac{1}{4}$ , yielding the normalized base invariants:

由 $\mathbb{T}^3$ 上的三角正交性，唯一非零的三波涡度拉伸共振项来自 $\langle \cos x \cos y \cos(x+y)\rangle = \frac{1}{4}$ ，从而基底场 $U$ 的各项积分不变量为：

$$
E(U) = \frac{5}{2}, \qquad Y(U) = 3, \qquad Z(U) = 4, \qquad H(U) = 0, \qquad \mathcal{T}(U) := \langle \omega_U, (\omega_U \cdot \nabla)U\rangle = \frac{1}{4}.
$$

By quadratic and cubic homogeneity at amplitude $a = 17$ and viscosity $\nu = 1$ , exact rational arithmetic produces:

由二次与三次齐次性，在振幅 $a = 17$ 、黏性 $\nu = 1$ 下，精确有理算术给出：

| Observable / 观测量 | $X_+ = +17 U$ | $X_- = -17 U$ | Comparison / 对比结论 |
| :--- | :---: | :---: | :--- |
| Kinetic energy $E = \langle \mid u \mid^2 \rangle$ / 动能 | $1445/2$ | $1445/2$ | Identical / 完全相同 |
| Enstrophy $Y = \langle \mid \omega \mid^2 \rangle$ / 拟能 | $867$ | $867$ | Identical / 完全相同 |
| Palinstrophy $Z = \langle \mid \nabla\omega \mid^2 \rangle$ / 涡度梯度平方 | $1156$ | $1156$ | Identical / 完全相同 |
| Helicity $H = \langle u, \omega \rangle$ / 螺旋度 | $0$ | $0$ | Identical / 完全相同 |
| Cubic stretching $\mathcal{T} = \langle \omega, (\omega\cdot\nabla)u \rangle$ / 三次涡拉伸 | $+4913/4$ | $-4913/4$ | Opposite sign / 符号相反 |
| Initial enstrophy derivative $f = Y'(0)$ / 拟能初导数 | $+289/2$ | $-9537/2$ | Difference $4913 \neq 0$ / 差值 $4913 \neq 0$ |

Thus $q_{\mathrm{static}}(X_+) = q_{\mathrm{static}}(X_-)$ whereas $f(X_+) - f(X_-) = 17^3 = 4913 \neq 0$ , proving that the equivalence relation of the full-spectrum static quadratic readout is not contained in the equivalence relation of the instantaneous Navier–Stokes enstrophy evolution: $\operatorname{Eq}(q_{\mathrm{static}}) \not\subseteq \operatorname{Eq}(f)$ .

由此严格证明 $q_{\mathrm{static}}(X_+) = q_{\mathrm{static}}(X_-)$ 但 $f(X_+) - f(X_-) = 17^3 = 4913 \neq 0$ ，即全谱静态二次能谱读口的同值等价关系不包含于真实纳维－斯托克斯拟能演化算子的同值关系： $\operatorname{Eq}(q_{\mathrm{static}}) \not\subseteq \operatorname{Eq}(f)$ 。

---

## 3. Methodological Boundary Relative to the 79-Page Paper / 该流体动力学定理与 79 页论文之间的严格方法论边界

In accordance with rigorous scientific standards, we explicitly record why $X_\pm = \pm 17 U$ is a theorem on general Navier–Stokes static readouts rather than a direct counterexample to Theorem 7.1 of the 79-page paper:
- In Section 7.3 and Appendix B of the 79-page paper, the certificate input includes a fixed signed approximate self-similar profile $W_\alpha^a$ and a fixed reference profile $W_\alpha^r$ .
- Although the linearized perturbation functional $J_{W^r}(v)$ in equation (B.18) (page 55) is quadratic in the perturbation $v$ and hence even under global perturbation sign reversal $v \mapsto -v$ ( $J_{W^r}(-v) = J_{W^r}(v)$ ), the fields $X_\pm = \pm 17 U$ on $\mathbb{T}^3$ are not constructed as solutions of the self-similar profile equations of Section 7.
- Therefore, in our monograph, $X_\pm = \pm 17 U$ (Theorem 6.1) is presented strictly in Chapter 6 to illustrate the fluid-dynamical origin of static readout sign-blindness and its resolution via the comoving covariant inverse metric $g = C^{-1}$ (Theorem 6.2), while the direct mathematical refutation of the unjoined half-space $C^2$ spline version of Proposition B.1 / inequality (B.20) is carried entirely by Counterexample Families A and B (Theorems 3.2, 3.3, and 5.4).

秉持严格的科学实证标准，我们在此明确说明为何 $X_\pm = \pm 17 U$ 是关于三维纳维－斯托克斯静态读口的一般方法论定理，而不直接混同于针对 79 页论文定理 7.1 的证书反例：
- 79 页论文第 7.3 节与附录 B 的输入包含固定的有符号近似自相似剖面 $W_\alpha^a$ 与参考剖面 $W_\alpha^r$ 。
- 尽管论文第 55 页公式 (B.18) 中围绕固定背景场 $W^r$ 的线性化泛函 $J_{W^r}(v)$ 关于扰动 $v$ 仍为二次偶泛函（满足 $J_{W^r}(-v) = J_{W^r}(v)$ ），但 $\mathbb{T}^3$ 上的八模态场 $X_\pm = \pm 17 U$ 并非第七节自相似剖面方程的解。
- 因此，在专著中，我们将 $X_\pm = \pm 17 U$ （定理 6.1）严格置于第六章，用于阐明流体动力学中静态二次读口反号盲区的数学根源及其在随流协变逆度规 $g = C^{-1}$ （定理 6.2）下的纯平方耗散闭合；而对论文附录 B 命题 B.1 / 不等式 (B.20) 分侧样条架构的直接数学反驳，则完全由满足命题 B.1 全部定义域条件的反例族 A 与反例族 B（定理 3.2、定理 3.3 与定理 5.4）独立承担。
