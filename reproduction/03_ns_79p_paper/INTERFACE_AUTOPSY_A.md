# Counterexample Family A: Exact Rational Violation of Inequality (B.20) on the $D$ -Weight Equatorial Seam and $O(\delta^{-1})$ Collar Curvature Transfer
# 反例族 A 完整推导：分侧 $C^2$ 样条权函数 $D$ 在赤道接缝上对命题 B.1 不等式 (B.20) 的精确有理反例与 $O(\delta^{-1})$ 薄层曲率转移分析

---

## 1. Scope and Admissible Baseline Data for Proposition B.1 / 命题 B.1 的适用范围与合法基准参数

This document provides the complete, self-contained analytical derivation of **Counterexample Family A** (verified mechanically in `suite_1_axisymmetric_D_seam_counterexample`, `suite_3_global_C2_collar_curvature_tax`, and `suite_6_collar_smoothing_transfer_futility` of `verify_ns_counterexamples.py`).

It demonstrates that under the half-space $C^2$ spline representation on page 53 of the 79-page paper—when cross-plane normal-derivative joining across $\Sigma = \lbrace y _ 3 = 0\rbrace$ is omitted—the bulk Hessian readout $q _ {\mathrm{bulk}}(D^2 D) = H _ D$ misses the singular Dirac surface measure $[\partial _ z D] _ \Sigma (e _ 3 \otimes e _ 3) dS _ \Sigma$ , leading to an explicit rational violation of inequality (B.20) in Proposition B.1 (pages 55–56).

Furthermore, when cross-plane $C^2$ regularity is restored via an even quartic collar spline $s _ \delta(\eta)$ across $|\eta| \le \delta$ , the singular surface mass transfers into an $O(\delta^{-1})$ pure-bulk collar Hessian integral.

本文件给出**反例族 A** 的完整自足解析推导（由 `verify_ns_counterexamples.py` 中的 `suite_1_axisymmetric_D_seam_counterexample`、`suite_3_global_C2_collar_curvature_tax` 与 `suite_6_collar_smoothing_transfer_futility` 自动化精确核验）。推导表明：按照 79 页论文第 53 页的分侧 $C^2$ 多项式样条表示，若未施加跨赤道平面 $\Sigma = \lbrace y _ 3 = 0\rbrace$ 的法向导数接合条件，则仅读取开区域体积海森矩阵的算子读口 $q _ {\mathrm{bulk}}(D^2 D) = H _ D$ 会遗漏奇异狄拉克面测度 $[\partial _ z D] _ \Sigma (e _ 3 \otimes e _ 3) dS _ \Sigma$ ，从而导致第 55–56 页命题 B.1 的主不等式 (B.20) 被显式紧支无散场严格违反。

进一步地，当在赤道薄层 $|\eta| \le \delta$ 内通过偶对称四次样条 $s _ \delta(\eta)$ 恢复全局 $C^2(\mathbb{R}^3)$ 接合时，该奇异面测度质量将守恒地转化为薄层内部呈 $O(\delta^{-1})$ 标度的纯体积海森积分。

Let $\rho = |y|$ , $r = \sqrt{y _ 1^2 + y _ 2^2}$ , $z = y _ 3$ , $\sigma = \frac{\rho}{1+\rho}$ , and $\eta = \frac{z}{\rho}$ .

Fix the admissible baseline parameters of Appendix B (pages 50–55): time period $S = 1$ , rotation fold $\kappa = 3$ , symmetry group $\Gamma = \langle (R _ {\pi/3}, 1/2), (R _ {\ast}, 0) \rangle$ with reflection $R _ {\ast} = \mathrm{diag}(1, -1, -1)$ , reference profile $W^r = 0$ , index sets $P _ \lambda = P _ \mu = \varnothing$ , first-order weight $Z = 0$ , dimensions $n = N = 0$ , $K = \mathbb{R}^0$ , empty auxiliary lists, $c _ \mu = \frac{1}{2}$ , and $n _ \lambda = n _ {\nabla\lambda} = n _ \mu = 0$ .

For a time-independent compactly supported divergence-free vector field $v \in \mathcal{D} _ S^\Gamma$ , the operators in Proposition B.1 reduce to:

记 $\rho = |y|$ ， $r = \sqrt{y _ 1^2 + y _ 2^2}$ ， $z = y _ 3$ ， $\sigma = \frac{\rho}{1+\rho}$ ， $\eta = \frac{z}{\rho}$ 。取论文附录 B（第 50–55 页）的合法基准参数：时间周期 $S = 1$ ，旋转重数 $\kappa = 3$ ，对称群 $\Gamma = \langle (R _ {\pi/3}, 1/2), (R _ {\ast}, 0) \rangle$ （其中反射算子 $R _ {\ast} = \mathrm{diag}(1, -1, -1)$ ），参考剖面 $W^r = 0$ ，索引集 $P _ \lambda = P _ \mu = \varnothing$ ，一阶权 $Z = 0$ ，自由维数 $n = N = 0$ ， $K = \mathbb{R}^0$ ，辅助场列表为空， $c _ \mu = \frac{1}{2}$ ， $n _ \lambda = n _ {\nabla\lambda} = n _ \mu = 0$ 。

对时间不变的紧支集无散场 $v \in \mathcal{D} _ S^\Gamma$ ，命题 B.1 中的算子简化为：

$$
\begin{aligned}
& F = T _ 1 v = \frac{1}{2}v + \frac{1}{2}(y \cdot \nabla)v - \Delta v, \qquad M v = -\Delta v, \qquad J = 0, \cr
& \Vert v\Vert _ \mu = 0, \qquad c _ M^2 = \frac{50}{3}, \qquad w _ {\ast} = \frac{39}{50}.
\end{aligned}
$$

With $Z = 0$ , the five coefficients in equation (B.16) on page 54 are $I _ 2 = D - \frac{3}{50}$ , $I _ 2' = 1 - D$ , $I _ 1' = \frac{1}{4}$ , $I _ 1 = -\Vert H _ D\Vert _ {\mathrm{op}} - \frac{3w}{50}$ , and $I _ 0 = 0$ .

Using the solenoidal Parseval identity $\langle T _ 1 v, -\Delta v\rangle = \Vert \Delta v\Vert _ {L^2}^2 + \frac{1}{4}\Vert \nabla v\Vert _ {L^2}^2$ , the auxiliary constant $w$ and the $\frac{3}{50}$ terms cancel identically, and the difference $E _ D(v) := \mathrm{RHS} _ {\mathrm{B.20}}(v) - \mathrm{LHS} _ {\mathrm{B.20}}(v)$ (which Proposition B.1 asserts must be $\le 0$ ) reduces to:

在 $Z = 0$ 下，第 54 页公式 (B.16) 的五项系数为 $I _ 2 = D - \frac{3}{50}$ 、 $I _ 2' = 1 - D$ 、 $I _ 1' = \frac{1}{4}$ 、 $I _ 1 = -\Vert H _ D\Vert _ {\mathrm{op}} - \frac{3w}{50}$ 、 $I _ 0 = 0$ 。利用无散场帕塞瓦尔恒等式 $\langle T _ 1 v, -\Delta v\rangle = \Vert \Delta v\Vert _ {L^2}^2 + \frac{1}{4}\Vert \nabla v\Vert _ {L^2}^2$ ，辅助常数 $w$ 与 $\frac{3}{50}$ 完全相消，不等式 (B.20) 的“右端减左端”差值泛函 $E _ D(v) := \mathrm{RHS} _ {\mathrm{B.20}}(v) - \mathrm{LHS} _ {\mathrm{B.20}}(v)$ （命题 B.1 要求 $E _ D(v) \le 0$ ）精确化为：

$$
\begin{aligned}
& E _ D(v) = \int _ {\mathbb{R}^3} D(y)\bigl(|\nabla^2 v|^2 - |\nabla\mathrm{curl} v|^2\bigr) dy \cr
& - \int _ {\mathbb{R}^3} \Vert H _ D(y)\Vert _ {\mathrm{op}} |\nabla v|^2 dy.
\end{aligned} \qquad (\mathrm{A.1})
$$

---

## 2. Half-Space $C^2$ Twin Weights $D _ \pm$ and the Distributional Hessian Identity / 分侧 $C^2$ 双权函数 $D _ \pm$ 与分布海森恒等式

Let $h(t) = 6t^5 - 15t^4 + 10t^3$ be the quintic Hermite step polynomial on $[0, 1]$ , and define the radial cutoff $\chi(\sigma) = 0$ for $\sigma \le \frac{1}{4}$ , $\chi(\sigma) = h(12\sigma - 3)$ for $\frac{1}{4} \lt \sigma \lt \frac{1}{3}$ , and $\chi(\sigma) = 1$ for $\sigma \ge \frac{1}{3}$ . Define the twin half-space $C^2$ spline weights:

令五次埃尔米特阶跃多项式为 $h(t) = 6t^5 - 15t^4 + 10t^3$ ，定义径向截断函数 $\chi(\sigma)$ 在 $\sigma \le \frac{1}{4}$ 时为 $0$ ，在 $\frac{1}{4} \lt \sigma \lt \frac{1}{3}$ 时为 $h(12\sigma - 3)$ ，在 $\sigma \ge \frac{1}{3}$ 时为 $1$ 。定义分侧 $C^2$ 双权函数：

$$
\begin{aligned}
& D _ \pm(y) := \frac{1}{2} \pm \frac{1}{4}\chi(\sigma) |\eta| \cr
& = \frac{1}{2} \pm \frac{1}{4}\chi\left(\frac{\rho}{1+\rho}\right)\frac{|z|}{\rho}, \qquad D _ \pm(0) = \frac{1}{2}.
\end{aligned} \qquad (\mathrm{A.2})
$$

On the region $\rho \ge \frac{1}{2}$ ( $\sigma \ge \frac{1}{3}$ ), $\chi(\sigma) = 1$ , and the normal derivative jump of $D _ \pm$ across the equatorial plane $\Sigma = \lbrace z = 0\rbrace$ is $[\partial _ z D _ \pm] (r) = \pm \frac{1}{2r}$ . Integrating by parts twice on $\mathbb{R} _ +^3$ and $\mathbb{R} _ -^3$ for each partial derivative $u = \partial _ k v$ ( $k = 1, 2, 3$ ) yields the exact distributional identity:

在 $\rho \ge \frac{1}{2}$ （即 $\sigma \ge \frac{1}{3}$ ）区域内， $\chi(\sigma) = 1$ ， $D _ \pm$ 跨赤道平面 $\Sigma = \lbrace z = 0\rbrace$ 的法向一阶导数跳跃为 $[\partial _ z D _ \pm] (r) = \pm \frac{1}{2r}$ 。在上下半空间 $\mathbb{R} _ +^3$ 与 $\mathbb{R} _ -^3$ 上对每个偏导数无散场 $u = \partial _ k v$ （ $k = 1, 2, 3$ ）执行两次分部积分，得到精确分布恒等式：

$$
\begin{aligned}
& E _ D(v) = \sum _ {k=1}^3 \int _ {\mathbb{R}^3} (\partial _ k v)^T H _ D (\partial _ k v) dy \cr
& - \int _ {\mathbb{R}^3} \Vert H _ D\Vert _ {\mathrm{op}} |\nabla v|^2 dy \cr
& + \int _ {z=0} [\partial _ z D] |\nabla v _ 3|^2 dS _ \Sigma.
\end{aligned} \qquad (\mathrm{A.3})
$$

---

## 3. Compactly Supported Axisymmetric Solenoidal Perturbation $v _ \varepsilon$ and Exact Rational Margin / 紧支集轴对称无散扰动场 $v _ \varepsilon$ 与精确有理破坏裕量

Let $a(t) := (1 - t^2) _ +^4 \in C _ c^3(\mathbb{R})$ (supported on $[-1, 1]$ with $a(0) = 1$ ). For $0 \lt \varepsilon \le \frac{1}{4}$ , define the axisymmetric stream function and cylindrical velocity components $(v _ r, v _ \varphi, v _ 3)$ :

取偶多项式母函数 $a(t) := (1 - t^2) _ +^4 \in C _ c^3(\mathbb{R})$ （支集为 $[-1, 1]$ ， $a(0) = 1$ ）。对 $0 \lt \varepsilon \le \frac{1}{4}$ ，定义轴对称流函数与柱坐标速度分量 $(v _ r, v _ \varphi, v _ 3)$ ：

$$
\begin{aligned}
& \psi _ \varepsilon(r, z) := \varepsilon z a\left(\frac{r-1}{\varepsilon}\right) a\left(\frac{z}{\varepsilon}\right), \cr
& v _ r = -\frac{1}{r}\partial _ z \psi _ \varepsilon, \qquad v _ \varphi = 0, \cr
& v _ 3 = \frac{1}{r}\partial _ r \psi _ \varepsilon.
\end{aligned} \qquad (\mathrm{A.4})
$$

In local coordinates $s = \frac{r-1}{\varepsilon} \in [-1, 1]$ and $t = \frac{z}{\varepsilon} \in [-1, 1]$ , we have $v _ r = -\frac{\varepsilon}{r}a(s)(a(t) + t a'(t))$ and $v _ 3 = \frac{\varepsilon}{r}t a'(s)a(t)$ . Because $v _ 3$ is odd in $z$ , $v _ \varepsilon$ is invariant under $R _ {\ast}$ and belongs to $\mathcal{D} _ S^\Gamma$ ; yet on the equatorial plane $z = 0$ ( $t = 0$ ), its normal derivative is $\partial _ z v _ 3(r, 0) = \frac{a'(s)}{r} \neq 0$ . Consequently, the equatorial surface integral satisfies:

在局部标度坐标 $s = \frac{r-1}{\varepsilon} \in [-1, 1]$ 与 $t = \frac{z}{\varepsilon} \in [-1, 1]$ 下， $v _ r = -\frac{\varepsilon}{r}a(s)(a(t) + t a'(t))$ ， $v _ 3 = \frac{\varepsilon}{r}t a'(s)a(t)$ 。因 $v _ 3$ 关于 $z$ 为奇函数， $v _ \varepsilon$ 严格满足 $R _ {\ast}$ 反射对称性且属于 $\mathcal{D} _ S^\Gamma$ ；但在赤道平面 $z = 0$ （ $t = 0$ ）上，其法向导数 $\partial _ z v _ 3(r, 0) = \frac{a'(s)}{r} \neq 0$ 。因此赤道界面积分为：

$$
\begin{aligned}
& T _ \varepsilon = \int _ {z=0} \frac{|\nabla v _ 3|^2}{2r} dS _ \Sigma \cr
& = \pi\varepsilon \int _ {-1}^1 \frac{a'(s)^2}{1 + \varepsilon s} ds \ge \frac{16\pi}{25}\varepsilon A, \cr
& A = \int _ {-1}^1 a'(s)^2 ds = \frac{131072}{45045}.
\end{aligned} \qquad (\mathrm{A.5})
$$

On the toroidal support $\lbrace |r-1| \le \varepsilon, |z| \le \varepsilon\rbrace$ (where $\rho \ge r \ge \frac{3}{4}$ and volume is $8\pi\varepsilon^2$ ), the open-set bulk Hessian norm satisfies $\Vert H _ {D _ +}\Vert _ {\mathrm{op}} \le \frac{3}{2\rho^2} \le \frac{8}{3} \lt 3 =: M$ , and the five cylindrical gradient components satisfy

$$
\begin{aligned}
& |\nabla v _ \varepsilon|^2 \le K := \left(\frac{28}{3}\right)^2 + 16^2 + \left(\frac{4}{3}\right)^2 \cr
& + \left(\frac{104}{9}\right)^2 + 8^2 = \frac{43936}{81}.
\end{aligned}
$$

Choosing $\varepsilon = 2^{-16} = \frac{1}{65536}$ yields the exact rational lower bound:

在环形支集 $\lbrace |r-1| \le \varepsilon, |z| \le \varepsilon\rbrace$ （此处 $\rho \ge r \ge \frac{3}{4}$ ，体积为 $8\pi\varepsilon^2$ ）上，开区域体积海森算子范数满足 $\Vert H _ {D _ +}\Vert _ {\mathrm{op}} \le \frac{3}{2\rho^2} \le \frac{8}{3} \lt 3 =: M$ ，五项柱坐标梯度平方和满足

$$
\begin{aligned}
& |\nabla v _ \varepsilon|^2 \le K := \left(\frac{28}{3}\right)^2 + 16^2 + \left(\frac{4}{3}\right)^2 \cr
& + \left(\frac{104}{9}\right)^2 + 8^2 = \frac{43936}{81}.
\end{aligned}
$$

取 $\varepsilon = 2^{-16} = \frac{1}{65536}$ ，得到精确闭式有理下界：

$$
\begin{aligned}
& E _ {D _ +}(v _ \varepsilon) \ge \pi\varepsilon\left(\frac{16}{25}A - 16 M K \varepsilon\right) \cr
& = \frac{\pi}{65536}\cdot\frac{633509743}{432432000} \gt 0,
\end{aligned} \qquad (\mathrm{A.6})
$$

while $E _ {D _ -}(v _ \varepsilon) \le -\frac{\pi}{65536}\cdot\frac{633509743}{432432000} \lt 0$ , giving a dual-weight separation

$$
E _ {D _ +}(v _ \varepsilon) - E _ {D _ -}(v _ \varepsilon) \ge \frac{\pi}{32768}\cdot\frac{633509743}{432432000} \gt 0
$$

under identical reduced readout $q _ {\mathrm{red}}(D _ +) = q _ {\mathrm{red}}(D _ -)$ . (Replacing $a(t)$ by the $C _ c^\infty$ bump $a _ \infty(t) = \exp(1 - (1-t^2)^{-1})\mathbf{1} _ {|t|\lt1}$ at $\varepsilon = 10^{-15}$ likewise gives $E _ {D _ +}(v _ \varepsilon) \ge \frac{4\pi}{9}\times 10^{-15} \gt 0$ .)

同时对负权函数有 $E _ {D _ -}(v _ \varepsilon) \le -\frac{\pi}{65536}\cdot\frac{633509743}{432432000} \lt 0$ ，从而在相同简化读口 $q _ {\mathrm{red}}(D _ +) = q _ {\mathrm{red}}(D _ -)$ 下给出双权分离

$$
E _ {D _ +}(v _ \varepsilon) - E _ {D _ -}(v _ \varepsilon) \ge \frac{\pi}{32768}\cdot\frac{633509743}{432432000} \gt 0.
$$

（若将 $a(t)$ 替换为 $C _ c^\infty$ 光滑隆起函数 $a _ \infty(t) = \exp(1 - (1-t^2)^{-1})\mathbf{1} _ {|t|\lt1}$ 并取 $\varepsilon = 10^{-15}$ ，同样有 $E _ {D _ +}(v _ \varepsilon) \ge \frac{4\pi}{9}\times 10^{-15} \gt 0$ 。）

---

## 4. Quartic Collar Spline $s _ \delta$ and 100% Curvature-Tax Transfer into the Bulk Hessian / 四次薄层磨平样条 $s _ \delta$ 与奇异曲率质量向体积海森的守恒转移

If one restores global $C^2(\mathbb{R}^3)$ regularity by replacing $|\eta|$ (or $|z|$ ) inside a thin equatorial collar $|z| \le \delta = \lambda\varepsilon$ ( $0 \lt \lambda \le \frac{1}{4}$ ) with the even quartic spline $s _ \delta(z) = \frac{3\delta}{8} + \frac{3z^2}{4\delta} - \frac{z^4}{8\delta^3}$ , then $[\partial _ z D _ \delta] _ \Sigma = 0$ , but $\int _ {-\delta}^{\delta} s _ \delta''(z) dz = 2$ and $\max _ {|z|\le\delta} s _ \delta''(z) = \frac{3}{2\delta}$ .

On the same solenoidal field $v _ \varepsilon$ , since $\partial _ z v _ 3(r,z) = \frac{a'(s)}{r} b(t)$ with

$$
b(t) = \frac{d}{dt}[t(1-t^2)^4] = 1 - 12t^2 + t^4\bigl(9(t^2 - \frac{14}{9})^2 + \frac{74}{9}\bigr) \ge 1 - 12t^2,
$$

the collar vertical integral transfers the surface term into the pure-bulk collar Hessian integral with factor

$$
\begin{aligned}
& I _ {\mathrm{collar}}(\lambda) = \int _ {-1}^1 \frac{3}{4}(1-\tau^2)b(\lambda\tau)^2 d\tau \cr
& \ge 1 - \frac{24}{5}\lambda^2.
\end{aligned}
$$

At $\lambda = \frac{1}{8}$ ( $\delta = 2^{-19} = \frac{1}{524288}$ ), $I _ {\mathrm{collar}}(\frac{1}{8}) = \frac{2787617180779875667}{3000241776758882304} \gt \frac{37}{40}$ , yielding a pure-bulk violation margin

$$
\begin{aligned}
& \frac{E _ {D _ \delta}^{\mathrm{cert}}(v _ \varepsilon)}{\pi\varepsilon} \cr
& \ge \frac{2147573301937507667}{1611064563204096000} \gt \frac{13}{10} \gt 0
\end{aligned}
$$

against the unsmoothed bulk bound $M = 3$ , while absorbing $\Vert H _ {D _ \delta}(1,0)\Vert _ {\mathrm{op}} \ge \frac{3}{8\delta} = 196608$ into $I _ 1 = Z - \Vert H _ {D _ \delta}\Vert _ {\mathrm{op}} - \frac{3w}{50}$ drives $I _ 1(1,0) \le \frac{1}{4} - 196608 = -\frac{786431}{4} \lt 0$ .

若在赤道薄层 $|z| \le \delta = \lambda\varepsilon$ （ $0 \lt \lambda \le \frac{1}{4}$ ）内用偶对称四次样条 $s _ \delta(z) = \frac{3\delta}{8} + \frac{3z^2}{4\delta} - \frac{z^4}{8\delta^3}$ 替换 $|z|$ （或 $|\eta|$ ）以恢复全局 $C^2(\mathbb{R}^3)$ 正则性，虽有 $[\partial _ z D _ \delta] _ \Sigma = 0$ ，但总曲率质量 $\int _ {-\delta}^{\delta} s _ \delta''(z) dz = 2$ 严格守恒且峰值达到 $\max _ {|z|\le\delta} s _ \delta''(z) = \frac{3}{2\delta}$ 。

对同一无散场 $v _ \varepsilon$ ，由 $\partial _ z v _ 3(r,z) = \frac{a'(s)}{r} b(t)$ 及平方和分解 $b(t) = 1 - 12t^2 + t^4\bigl(9(t^2 - \frac{14}{9})^2 + \frac{74}{9}\bigr) \ge 1 - 12t^2$ ，薄层竖直积分将原面积分转移为薄层内的纯体积海森积分，转移因子为

$$
\begin{aligned}
& I _ {\mathrm{collar}}(\lambda) = \int _ {-1}^1 \frac{3}{4}(1-\tau^2)b(\lambda\tau)^2 d\tau \cr
& \ge 1 - \frac{24}{5}\lambda^2.
\end{aligned}
$$

在 $\lambda = \frac{1}{8}$ （ $\delta = 2^{-19} = \frac{1}{524288}$ ）下， $I _ {\mathrm{collar}}(\frac{1}{8}) = \frac{2787617180779875667}{3000241776758882304} \gt \frac{37}{40}$ ，在原开域海森界 $M = 3$ 下仍给出纯体积正偏差

$$
\begin{aligned}
& \frac{E _ {D _ \delta}^{\mathrm{cert}}(v _ \varepsilon)}{\pi\varepsilon} \cr
& \ge \frac{2147573301937507667}{1611064563204096000} \gt \frac{13}{10} \gt 0;
\end{aligned}
$$

而若将薄层曲率峰值 $\Vert H _ {D _ \delta}(1,0)\Vert _ {\mathrm{op}} \ge \frac{3}{8\delta} = 196608$ 计入 $I _ 1 = Z - \Vert H _ {D _ \delta}\Vert _ {\mathrm{op}} - \frac{3w}{50}$ ，则使 $I _ 1(1,0) \le \frac{1}{4} - 196608 = -\frac{786431}{4} \lt 0$ 。
