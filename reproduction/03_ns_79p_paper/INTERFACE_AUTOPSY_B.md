# Counterexample Family B: Mode- $\pm(2,1)$ Schwartz Gaussian Violation of Inequality (B.20) on the $Z$ -Weight Equatorial Seam
# 反例族 B 完整推导：施瓦茨高斯无散 $\pm(2,1)$ 模态场在一阶权 $Z$ 赤道接缝上对命题 B.1 不等式 (B.20) 的解析反例（ $\gt 400c$ ）

---

## 1. Scope and Construction of the Mode- $\pm(2,1)$ Schwartz Solenoidal Field / 适用范围与 $\pm(2,1)$ 模态施瓦茨无散场的构造

This document presents the self-contained analytical derivation of **Counterexample Family B** (verified mechanically in `suite_2_gaussian_Z_seam_counterexample` of `verify_ns_counterexamples.py`). It shows that the equatorial singular surface-measure discrepancy in Proposition B.1 / inequality (B.20) occurs independently on the first-order multiplier weight $Z$ and on non-zero angular harmonics $\iota = \pm(2,1)$ .

本文件给出**反例族 B** 的完整自足解析推导（由 `verify_ns_counterexamples.py` 中的 `suite_2_gaussian_Z_seam_counterexample` 自动化精确核验）。推导证明：命题 B.1 / 不等式 (B.20) 在赤道平面 $y _ 3 = 0$ 处的奇异面测度偏差不仅出现在二阶权 $D$ 与零谐波轴对称场上，而且同样独立地出现在一阶乘子权 $Z$ 与非零角度谐波模态 $\iota = \pm(2,1)$ 上。

Let $C _ 6(x,y) + i S _ 6(x,y) := (x + i y)^6$ and define the anisotropic Gaussian envelope $g(x,y,z) := \exp\bigl(-\frac{x^2 + y^2}{2} - 6z^2\bigr)$ . Construct the three-dimensional Schwartz vector field:

令复多项式实部与虚部为 $C _ 6(x,y) + i S _ 6(x,y) := (x + i y)^6$ ，各向异性高斯包络为 $g(x,y,z) := \exp\bigl(-\frac{x^2 + y^2}{2} - 6z^2\bigr)$ ，定义三维施瓦茨向量场：

$$
v(x,y,z) := g(x,y,z) \bigl(-2 z y C _ 6(x,y), 2 z x C _ 6(x,y), -S _ 6(x,y)\bigr). \tag{B.1}
$$

By the Cauchy–Riemann equations and Euler's homogeneous function identity for $(x+iy)^6$ , we have $x\partial _ y C _ 6 - y\partial _ x C _ 6 = -6 S _ 6$ . Consequently, the horizontal divergence $\partial _ x v _ 1 + \partial _ y v _ 2 = -12 z g S _ 6$ cancels the vertical divergence $\partial _ z v _ 3 = -\partial _ z(g S _ 6) = +12 z g S _ 6$ identically, so $\operatorname{div} v \equiv 0$ on $\mathbb{R}^3$ .

In cylindrical coordinates $(r, \varphi, z)$ , $v _ r = 0$ , $v _ \varphi = 2 z r^7 g \cos(6\varphi)$ , and $v _ 3 = -r^6 g \sin(6\varphi)$ . Under $\kappa = 3$ , $v$ is invariant under rotation by $\pi/3$ and under reflection $R _ {\ast} : (\varphi, z) \mapsto (-\varphi, -z)$ , and corresponds to the harmonic modes $\iota = \pm(2,1)$ in equation (B.2) on page 50, so $v \in \mathcal{S}(\mathbb{R}^3) \cap \mathcal{D} _ S^\Gamma$ .

由全纯多项式 $(x+iy)^6$ 的柯西－黎曼方程与欧拉齐次定理，有 $x\partial _ y C _ 6 - y\partial _ x C _ 6 = -6 S _ 6$ ，从而水平散度 $\partial _ x v _ 1 + \partial _ y v _ 2 = -12 z g S _ 6$ 与竖直散度 $\partial _ z v _ 3 = -\partial _ z(g S _ 6) = +12 z g S _ 6$ 精确相消，即 $\operatorname{div} v \equiv 0$ 。在柱坐标 $(r, \varphi, z)$ 下， $v _ r = 0$ ， $v _ \varphi = 2 z r^7 g \cos(6\varphi)$ ， $v _ 3 = -r^6 g \sin(6\varphi)$ 。

在 $\kappa = 3$ 下，该场对 $\pi/3$ 旋转及反射 $R _ {\ast} : (\varphi, z) \mapsto (-\varphi, -z)$ 严格不变，对应于论文第 50 页公式 (B.2) 的谐波模态 $\iota = \pm(2,1)$ ，故 $v \in \mathcal{S}(\mathbb{R}^3) \cap \mathcal{D} _ S^\Gamma$ 。

---

## 2. Half-Space $C^2$ Spline Weight $Z$ and Distributional Pairing / 分侧 $C^2$ 样条权函数 $Z$ 与分布配对恒等式

Retaining the baseline parameters $S = 1$ , $\kappa = 3$ , $W^r = 0$ , $D = 0$ , $P _ \lambda = P _ \mu = \varnothing$ , and $n = N = 0$ , define the half-space $C^2$ spline weight:

保持基准参数 $S = 1$ 、 $\kappa = 3$ 、 $W^r = 0$ 、 $D = 0$ 、 $P _ \lambda = P _ \mu = \varnothing$ 、 $n = N = 0$ ，定义分侧 $C^2$ 样条权函数：

$$
Z(y) := c P(\sigma) |\eta| = c P\left(\frac{\rho}{1+\rho}\right)\frac{|z|}{\rho} \qquad (c \gt 0), \tag{B.2}
$$

where $P(\sigma) = 0$ on $[0, \frac{1}{20}]$ , $P(\sigma) = h(20\sigma - 1)$ on $[\frac{1}{20}, \frac{1}{10}]$ , and $P(\sigma) = 1$ on $[\frac{1}{10}, 1)$ . Its distributional Hessian on $\mathbb{R}^3$ is $D^2 Z = H _ Z dy + [\partial _ z Z] _ \Sigma(e _ 3 \otimes e _ 3) dS _ \Sigma$ with normal derivative jump $[\partial _ z Z] _ \Sigma(r) = \frac{2c P(r/(1+r))}{r}$ . Hence the defect $\Delta := \mathrm{RHS} _ {\mathrm{B.20}}(v) - \mathrm{LHS} _ {\mathrm{B.20}}(v) = E _ Z(v)$ expands as:

其中 $P(\sigma)$ 在 $[0, \frac{1}{20}]$ 上为 $0$ ，在 $[\frac{1}{20}, \frac{1}{10}]$ 上为 $h(20\sigma - 1)$ ，在 $[\frac{1}{10}, 1)$ 上为 $1$ 。其在 $\mathbb{R}^3$ 上的分布海森测度为 $D^2 Z = H _ Z dy + [\partial _ z Z] _ \Sigma(e _ 3 \otimes e _ 3) dS _ \Sigma$ ，跨赤道平面的法向导数跳跃为 $[\partial _ z Z] _ \Sigma(r) = \frac{2c P(r/(1+r))}{r}$ 。因此不等式 (B.20) 的右端减左端差值 $\Delta := \mathrm{RHS} _ {\mathrm{B.20}}(v) - \mathrm{LHS} _ {\mathrm{B.20}}(v) = E _ Z(v)$ 精确展开为：

$$
\begin{aligned}
& \Delta = \int _ {\mathbb{R}^3} v(y)^T H _ Z(y) v(y) dy \cr
& - \int _ {\mathbb{R}^3} \Vert H _ Z(y)\Vert _ {\mathrm{op}} |v(y)|^2 dy \cr
& + \int _ {z=0} \frac{2c P\left(\frac{r}{1+r}\right)}{r} v _ 3(r, \varphi, 0)^2 dS _ \Sigma.
\end{aligned} \tag{B.3}
$$

---

## 3. Closed-Form Analytical Lower Bound $\Delta / c \gt \frac{26311}{64} \gt 400$ and Exact Gaussian Norms / 纯闭式解析下界 $\Delta / c \gt \frac{26311}{64} \gt 400$ 与精确高斯范数矩

**(1) Equatorial surface integral**: On $z = 0$ , $v _ 3(r, \varphi, 0) = -r^6 e^{-r^2/2}\sin(6\varphi)$ is strictly non-zero. The uncutoff Gaussian surface integral is:

**赤道界面积分**：在 $z = 0$ 上， $v _ 3(r, \varphi, 0) = -r^6 e^{-r^2/2}\sin(6\varphi)$ 严格非零。未截止的高斯界面积分为：

$$
A _ 0 = 2\pi c \int _ 0^\infty r^{12} e^{-r^2} dr = \frac{10395}{64}\pi^{3/2}c, \tag{B.4}
$$

and the core cutoff loss on $r \le \frac{1}{9}$ ( $\sigma \le \frac{1}{10}$ ) is at most $2\pi c \int _ 0^{1/9} r^{12} dr = \frac{2\pi c}{13\cdot 9^{13}}$ .

且核心区 $r \le \frac{1}{9}$ （ $\sigma \le \frac{1}{10}$ ）上的截止损失不超过 $2\pi c \int _ 0^{1/9} r^{12} dr = \frac{2\pi c}{13\cdot 9^{13}}$ 。

**(2) Exterior and transition Hessian bounds**: On $\rho \ge \frac{1}{9}$ , $Z = c\frac{|z|}{\rho}$ , and the eigenvalues of $\rho^2 H _ {|z|/\rho}$ are $\frac{-t \pm \sqrt{4-3t^2}}{2}$ and $-t$ ( $t = \frac{|z|}{\rho} \in [0, 1]$ ), whose maximum modulus is $\frac{2}{\sqrt{3}}$ , so $\Vert H _ Z(y)\Vert _ {\mathrm{op}} \le \frac{2c}{\sqrt{3}\rho^2}$ .

Since $J := \int _ {\mathbb{R}^3} \frac{|v|^2}{\rho^2} dy \le \frac{60}{\sqrt{3}}\pi^{3/2}$ , the two exterior bulk integrals in (B.3) subtract at most $2 \cdot \frac{2c}{\sqrt{3}} J = 80\pi^{3/2}c = \frac{5120}{64}\pi^{3/2}c$ . On the transition shell $\frac{1}{19} \le \rho \le \frac{1}{9}$ , $\Vert H _ Z\Vert _ {\mathrm{op}} \lt 9000c$ and $\int _ {\rho \le 1/9} |v|^2 dy \le \frac{8\pi}{15\cdot 9^{15}}$ , contributing at most $\frac{9600\pi c}{9^{15}}$ . Combining these exact bounds yields:

**外部区域与过渡壳层的体积海森上界**：在 $\rho \ge \frac{1}{9}$ 上， $Z = c\frac{|z|}{\rho}$ ， $\rho^2 H _ {|z|/\rho}$ 的本征值为 $\frac{-t \pm \sqrt{4-3t^2}}{2}$ 与 $-t$ （ $t = \frac{|z|}{\rho} \in [0, 1]$ ），最大绝对值为 $\frac{2}{\sqrt{3}}$ ，故 $\Vert H _ Z(y)\Vert _ {\mathrm{op}} \le \frac{2c}{\sqrt{3}\rho^2}$ 。由高斯积分 $J := \int _ {\mathbb{R}^3} \frac{|v|^2}{\rho^2} dy \le \frac{60}{\sqrt{3}}\pi^{3/2}$ ，外部区域两项体积积分至多扣除 $2 \cdot \frac{2c}{\sqrt{3}} J = 80\pi^{3/2}c = \frac{5120}{64}\pi^{3/2}c$ 。

在过渡球壳 $\frac{1}{19} \le \rho \le \frac{1}{9}$ 上， $\Vert H _ Z\Vert _ {\mathrm{op}} \lt 9000c$ 且 $\int _ {\rho \le 1/9} |v|^2 dy \le \frac{8\pi}{15\cdot 9^{15}}$ ，两项体积损失不超过 $\frac{9600\pi c}{9^{15}}$ 。合并立得：

$$
\begin{aligned}
& \frac{\Delta}{c} \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} \cr
& \gt \frac{26311}{64} \gt 400 \gt 0.
\end{aligned} \tag{B.5}
$$

**(3) Exact Gaussian squared norms**: Symbolic polynomial expansion and exact Gaussian moment integration (recorded in `EXACT_MOMENTS.json`) yield:

不等式 (B.20) 左端的精确 $L^2$ 高斯矩：符号多项式展开与精确高斯矩积分（记录于 `EXACT_MOMENTS.json`）给出：

$$
\begin{aligned}
& \Vert \nabla v\Vert _ {L^2}^2 = 14880 \frac{\pi^{3/2}}{2\sqrt{3}}, \cr
& \Vert \Delta v\Vert _ {L^2}^2 = 431280 \frac{\pi^{3/2}}{2\sqrt{3}}, \cr
& \mathrm{LHS} _ {\mathrm{B.20}} = \frac{47}{50}\Vert \Delta v\Vert _ {L^2}^2 + \frac{127}{625}\Vert \nabla v\Vert _ {L^2}^2 \cr
& = \frac{51053352}{125} \frac{\pi^{3/2}}{2\sqrt{3}}.
\end{aligned} \tag{B.6}
$$
