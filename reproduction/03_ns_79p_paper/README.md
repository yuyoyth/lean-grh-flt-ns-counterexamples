# Part 03 Reproduction Package: 79-Page Navier–Stokes Finite-Time Blow-Up Manuscript — Structural Analysis, Operator-Kernel Audit, and Closed-Form Counterexamples
# 第三部分可复现证据包：同作者 79 页纳维－斯托克斯（NS）方程有限时爆破纸面证明结构分析、分部积分算子核检验与闭式反例

---

## 1. Quick 1-Second Reproduction / 一秒极速复现

Run the zero-dependency Python 3 exact rational and symbolic polynomial verification script (`fractions.Fraction` only):

运行零外部依赖的 Python 3 精确有理数与符号多项式核验脚本（仅使用标准库 `fractions.Fraction`）：

```bash
python3 -B reproduction/03_ns_79p_paper/verify_ns_counterexamples.py

```

### Verified Suites / 自动化精确核验套件

#### 1. Counterexample Family A / 反例族 A

Suite: `suite_1_axisymmetric_D_seam_counterexample`

Verifies Counterexample Family A ( $C _ c^2(\mathbb{R}^3)$ axisymmetric divergence-free perturbation $v _ \varepsilon$ with $a(t) = (1-t^2) _ +^4$ and half-space $C^2$ twin weights $D _ \pm = \frac{1}{2} \pm \frac{1}{4}\chi(\sigma)|\eta|$ ):

精确核验反例族 A（ $C _ c^2(\mathbb{R}^3)$ 紧支轴对称无散扰动场 $v _ \varepsilon$ 与分侧 $C^2$ 双权函数 $D _ \pm = \frac{1}{2} \pm \frac{1}{4}\chi(\sigma)|\eta|$ ）：

**Exact rational moment / 精确有理一维矩**: $A = \int _ {-1}^1 a'(s)^2 ds = \frac{131072}{45045}$ ;

**Exact 5-component cylindrical gradient squared bound / 五分量柱坐标梯度平方上界**:

$$
\begin{aligned}
& K = \left(\frac{28}{3}\right)^2 + 16^2 + \left(\frac{4}{3}\right)^2 + \left(\frac{104}{9}\right)^2 + 8^2 \cr
& = \frac{43936}{81};
\end{aligned}
$$

At $\varepsilon = 2^{-16} = \frac{1}{65536}$ and $M = 3$ :

$$
\begin{aligned}
& \frac{E _ {D _ +}(v _ \varepsilon)}{\pi\varepsilon} \ge \frac{16}{25}A - 16 M K \varepsilon \cr
& = \frac{633509743}{432432000} \gt 0,
\end{aligned}
$$

violating Proposition B.1 inequality (B.20) ( $\mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}} \le 0$ ) under the unjoined half-space $C^2$ spline contract, and establishing opposite-sign dual-weight separation

$$
E _ {D _ +}(v _ \varepsilon) - E _ {D _ -}(v _ \varepsilon) \ge \frac{\pi}{32768}\cdot\frac{633509743}{432432000} \gt 0
$$

under identical reduced readout $q _ {\mathrm{red}}(D _ +) = q _ {\mathrm{red}}(D _ -)$ .

#### 2. Counterexample Family B / 反例族 B

Suite: `suite_2_gaussian_Z_seam_counterexample`

Verifies Counterexample Family B (Schwartz divergence-free mode- $\pm(2,1)$ Gaussian field $v = g(-2zyC _ 6, 2zxC _ 6, -S _ 6)$ with $C _ 6 + i S _ 6 = (x+iy)^6$ , $g = e^{-(x^2+y^2)/2 - 6z^2}$ , and half-space $C^2$ weight $Z = c P(\sigma)|\eta|$ , $c \gt 0$ ):

精确核验反例族 B（施瓦茨无散 $\pm(2,1)$ 模态高斯场与分侧 $C^2$ 权函数 $Z = c P(\sigma)|\eta|$ ）：

**Polynomial identity**: Exact polynomial identity

$$
x\partial _ y C _ 6 - y\partial _ x C _ 6 = -6 S _ 6 \implies \operatorname{div} v = -12zgS _ 6 + 12zgS _ 6 \equiv 0;
$$

**Gaussian surface integral**: Exact Gaussian surface integral $A _ 0 = \frac{10395}{64}\pi^{3/2}c$ , exterior bulk loss bound $80\pi^{3/2}c = \frac{5120}{64}\pi^{3/2}c$ , and net violation lower bound:

$$
\begin{aligned}
& \frac{\Delta}{c} \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} \cr
& \gt \frac{26311}{64} \gt 400 \gt 0;
\end{aligned}
$$

**Gaussian squared norms**: Exact $L^2$ Gaussian norm factors $\Vert \nabla v\Vert _ {L^2}^2 = 14880 \frac{\pi^{3/2}}{2\sqrt{3}}$ , $\Vert \Delta v\Vert _ {L^2}^2 = 431280 \frac{\pi^{3/2}}{2\sqrt{3}}$ , and $\mathrm{LHS} _ {\mathrm{B.20}} = \frac{51053352}{125} \frac{\pi^{3/2}}{2\sqrt{3}}$ .

#### 3. Collar Curvature Conservation / 薄层曲率守恒

Suite: `suite_3_global_C2_collar_curvature_tax`

Verifies the unique even quartic collar spline $s _ \delta(\eta) = \frac{3\delta}{8} + \frac{3\eta^2}{4\delta} - \frac{\eta^4}{8\delta^3}$ on $|\eta| \le \delta$ :

核验 $|\eta| \le \delta$ 上唯一满足二阶射流匹配的偶对称四次过渡样条 $s _ \delta(\eta)$ ：

**Second-order jet matching**: Exact second-order jet matching with $|\eta|$ at $\eta = \pm\delta$ ;

**Peak normal curvature**: Peak normal second derivative $s _ \delta''(0) = \frac{3}{2\delta} = O(\delta^{-1})$ ;

**Conserved curvature mass**: Invariant total normal curvature mass $\int _ {-\delta}^{\delta} s _ \delta''(\eta) d\eta = 2$ for all $\delta \gt 0$ .

#### 4. Static Readout Sign Blindness / 静态读口反号盲区

Suite: `suite_4_static_readout_sign_blindness`

Verifies the eight-frequency divergence-free twin initial data $u _ 0^\pm = \pm 17 U$ on $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ :

核验 $\mathbb{T}^3$ 上的正负孪生无散初值 $u _ 0^\pm = \pm 17 U$ ：

**Identical static readout**: Identical static Euclidean readout $q _ {\mathrm{static}}(u _ 0^+) = q _ {\mathrm{static}}(u _ 0^-)$ ( $E = \frac{1445}{2}$ , $Y = 867$ , $Z = 1156$ , $H = 0$ , matched single-mode Fourier Hermitian tensors);

**Enstrophy derivative difference**: Instantaneous enstrophy derivative difference at $\nu = 1$ : $Y _ +'(0) = \frac{289}{2} \gt 0$ , $Y _ -'(0) = -\frac{9537}{2} \lt 0$ , difference $Y _ +'(0) - Y _ -'(0) = 4913 \neq 0$ , plus quartic damped Young remainder coefficient $\frac{50653}{122472}$ .

#### 5. Covariant Inverse-Metric Dissipation / 协变逆度规耗散

Suite: `suite_5_covariant_inverse_metric_dissipation`

Verifies the comoving covariant inverse-metric $g = C^{-1}$ pure-square viscous dissipation identity

$$
\begin{aligned}
& 2\nu\omega^T C^{-1}\Delta\omega - \nu\Delta(\omega^T C^{-1}\omega) - \nu z^T(\Delta C)z \cr
& = -2\nu \sum _ {i=1}^3 (\partial _ i z)^T C (\partial _ i z) \le 0
\end{aligned}
$$

( $z = C^{-1}\omega$ ) versus the indefinite static Hessian cross-term $\nu \mathrm{Tr}((\nabla\omega)^T(\nabla\omega)H _ \Phi)$ .

#### 6. Collar Transfer and Certificate Unsealing / 薄层转移与证书解封

Suite: `suite_6_collar_smoothing_transfer_futility`

Verifies Theorem 5.4 on the structural invariance of the operator-kernel discrepancy under unsealing the SHA-256 certificate (`3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5`) or applying a thin equatorial $C^2$ collar smoothing:

精确核验定理 5.4（解封 SHA-256 证书或追加薄层 $C^2$ 磨平补丁下奇异曲率质量向体积海森的转移与 $I _ 1$ 系数上界）：

**Sum-of-squares identity**: Exact sum-of-squares polynomial inequality

$$
b(t) := \frac{d}{dt}[t(1-t^2)^4] = 1 - 12t^2 + t^4\bigl(9(t^2 - \frac{14}{9})^2 + \frac{74}{9}\bigr) \ge 1 - 12t^2
$$

for all $t \in \mathbb{R}$ ;

**Collar smoothing**: When the equatorial kink $|z|$ (or $|\eta|$ ) is smoothed inside a thin collar $|z| \le \delta = \lambda\varepsilon$ (with $\lambda = \frac{1}{8}$ , $\varepsilon = 2^{-16} = \frac{1}{65536}$ , $\delta = 2^{-19} = \frac{1}{524288}$ ) by the globally $C^2$ quartic collar spline $s _ \delta(z)$ , the singular surface curvature mass transfers into the pure-bulk collar Hessian integral with exact rational transfer factor:

$$
\begin{aligned}
& I _ {\mathrm{collar}}\left(\frac{1}{8}\right) \cr
& = \int _ {-1}^{1} \frac{3}{4}(1 - \tau^2) b\left(\frac{\tau}{8}\right)^2 d\tau \cr
& = \frac{2787617180779875667}{3000241776758882304} \gt 1 - \frac{24}{5}\left(\frac{1}{8}\right)^2 = \frac{37}{40} \gt 0,
\end{aligned}
$$

violating inequality (B.20) on the **exact same solenoidal field** $v _ \varepsilon \in \mathcal{D} _ S^\Gamma$ with pure-bulk rational violation margin:

$$
\begin{aligned}
& \frac{E _ {D _ \delta}^{\mathrm{cert}}(v _ \varepsilon)}{\pi\varepsilon} \cr
& \ge \frac{16}{25}I _ {\mathrm{collar}}\left(\frac{1}{8}\right)A - 16 M K \varepsilon \cr
& = \frac{2147573301937507667}{1611064563204096000} \gt \frac{2865558827}{2162160000} \gt \frac{13}{10} \gt 0;
\end{aligned}
$$

**Gradient coefficient bound**: Absorbing the collar Hessian peak $\Vert H _ {D _ \delta}(1,0)\Vert _ {\mathrm{op}} \ge \frac{3}{8\delta} = 196608$ into the pointwise coefficient $I _ 1(y) = Z(y) - \Vert H _ {D _ \delta}(y)\Vert _ {\mathrm{op}} - \frac{3w}{50}$ of equation (B.16) (where $I _ 1' = \frac{1}{4} - Z \ge 0 \implies Z \le \frac{1}{4}$ and $w \ge 0$ ) yields $I _ 1(1,0) \le \frac{1}{4} - 196608 = -\frac{786431}{4} \lt 0$ .

---

## 2. Contents of This Directory / 目录文件清单

**Verification script / 核验脚本**: `verify_ns_counterexamples.py`: Zero-dependency exact rational and polynomial verification script for all 6 suites above. / 零依赖精确有理数与多项式核验脚本（涵盖上述全部 6 套核验套件）。

**Provenance / 原件溯源**: `PROVENANCE.md`: Bilingual cryptographic provenance of the 79-page PDF *Finite-time blow-up for the Navier–Stokes equations* (commit `ad53419de079eb8f95f60313473374624a348546`, `1,615,293` bytes, SHA-256 `4a01929b2f8a595637bbbe1dfef9724e5de768d31283d62415ce045e2ed69901`) and section structure ledger. / 79 页论文原件密码学溯源与章节结构索引（中英双语）。

**Structural audit / 结构审查**: `NS_PAPER_KERNEL_LEAKAGE_AUTOPSY.md`: Bilingual consolidated structural and operator-kernel analysis of the 79-page PDF across Sections 1–7 and Appendices A–C. / 79 页论文逐节结构分析与分部积分算子核检验总报告（中英双语）。

**Family A / 反例族 A**: `INTERFACE_AUTOPSY_A.md`: Bilingual analytical derivation of Counterexample Family A ( $D$ -weight equatorial seam, exact rational margin $\frac{\pi}{65536}\frac{633509743}{432432000} \gt 0$ , $q _ {\mathrm{red}}$ dual-weight separation, and quartic collar spline $s _ \delta(\eta)$ transfer analysis). / 反例族 A 完整解析推导与薄层样条曲率转移分析（中英双语）。

**Family B / 反例族 B**: `INTERFACE_AUTOPSY_B.md`: Bilingual analytical derivation of Counterexample Family B ( $Z$ -weight equatorial seam, mode- $\pm(2,1)$ Schwartz Gaussian field, and $\gt 400c$ analytical lower bound). / 反例族 B 完整解析推导与高斯矩计算（中英双语）。

**Domain audit / 反例域审查**: `COUNTEREXAMPLE_DOMAIN_AUDIT.md`: Bilingual domain classification separating the Proposition B.1 / (B.20) equatorial interface counterexamples from the 3D Navier–Stokes static Euclidean readout twin initial data $X _ \pm = \pm 17 U$ . / 反例域界定：命题 B.1 赤道接缝反例与三维环面静态读口双初值 $\pm 17 U$ 的方法论边界（中英双语）。

**Machine-readable evidence / 机器可读证据**: `EXACT_MOMENTS.json`, `STATIC_READOUT_WITNESS.json`, `PDF_METADATA.json`: Machine-readable exact rational witnesses and PDF metadata. / 机器可读精确有理数核验回执与 PDF 元数据。
