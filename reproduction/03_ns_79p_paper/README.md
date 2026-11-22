# Part 03 Reproduction Package: 79-Page Navier–Stokes Finite-Time Blow-Up Paper Kernel-Leakage Audit & Closed-Form Counterexamples
# 第三部分复现证据包：同作者 79 页纳维－斯托克斯（NS）方程有限时爆破纸面证明核漏审查与闭式反例

---

## 1. Quick 1-Second Reproduction / 一秒极速复现

Run the zero-dependency Python 3 exact rational & symbolic verification script (`fractions.Fraction` only):

运行零外部依赖的 Python 3 精确有理数与符号多项式核验脚本（仅使用标准库 `fractions.Fraction`）：

```bash
python3 -B reproduction/03_ns_79p_paper/verify_ns_counterexamples.py
```

### Verified Suites / 自动化精确核验套件

1. **`suite_1_axisymmetric_D_seam_counterexample`**:
   - Verifies Counterexample Family A ($C_c^2(\mathbb{R}^3)$ axisymmetric divergence-free perturbation $v_\varepsilon$ with $a(t) = (1-t^2)_+^4$ and half-space $C^2$ twin weights $D_\pm = \frac{1}{2} \pm \frac{1}{4}\chi(\sigma)|\eta|$):
     - Exact rational moment: $A = \int_{-1}^1 a'(s)^2\,ds = \frac{131072}{45045}$;
     - Exact 5-component cylindrical gradient squared bound: $K = \left(\frac{28}{3}\right)^2 + 16^2 + \left(\frac{4}{3}\right)^2 + \left(\frac{104}{9}\right)^2 + 8^2 = \frac{43936}{81}$;
     - At $\varepsilon = 2^{-16} = \frac{1}{65536}$ and $M = 3$:
       $$\frac{E_{D_+}(v_\varepsilon)}{\pi\varepsilon} \ge \frac{16}{25}A - 16 M K \varepsilon = \frac{633509743}{432432000} > 0,$$
       strictly violating Proposition B.1 inequality (B.20) ($\mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}} \le 0$) under the unjoined half-space $C^2$ spline contract, and establishing opposite-sign dual-model separation $E_{D_+}(v_\varepsilon) - E_{D_-}(v_\varepsilon) \ge \frac{\pi}{32768}\cdot\frac{633509743}{432432000} > 0$ under identical reduced readout $q_{\mathrm{red}}(D_+) = q_{\mathrm{red}}(D_-)$.
2. **`suite_2_gaussian_Z_seam_counterexample`**:
   - Verifies Counterexample Family B (Schwartz divergence-free mode-$\pm(2,1)$ Gaussian field $v = g(-2zyC_6, 2zxC_6, -S_6)$ with $C_6 + i S_6 = (x+iy)^6$, $g = e^{-(x^2+y^2)/2 - 6z^2}$, and half-space $C^2$ weight $Z = c P(\sigma)|\eta|$, $c > 0$):
     - Exact polynomial identity $x\partial_y C_6 - y\partial_x C_6 = -6 S_6 \implies \operatorname{div} v = -12zgS_6 + 12zgS_6 \equiv 0$;
     - Exact Gaussian surface integral $A_0 = \frac{10395}{64}\pi^{3/2}c$, exterior bulk loss bound $80\pi^{3/2}c = \frac{5120}{64}\pi^{3/2}c$, and net violation lower bound:
       $$\frac{\Delta}{c} \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} > \frac{26311}{64} > 400 > 0;$$
     - Exact $L^2$ Gaussian norm factors $\|\nabla v\|_{L^2}^2 = 14880\,\frac{\pi^{3/2}}{2\sqrt{3}}$, $\|\Delta v\|_{L^2}^2 = 431280\,\frac{\pi^{3/2}}{2\sqrt{3}}$, and $\mathrm{LHS}_{\mathrm{B.20}} = \frac{51053352}{125}\,\frac{\pi^{3/2}}{2\sqrt{3}}$.
3. **`suite_3_global_C2_collar_curvature_tax`**:
   - Verifies the unique even quartic collar spline $s_\delta(\eta) = \frac{3\delta}{8} + \frac{3\eta^2}{4\delta} - \frac{\eta^4}{8\delta^3}$ on $|\eta| \le \delta$:
     - Exact second-order jet matching with $|\eta|$ at $\eta = \pm\delta$;
     - Peak normal second derivative $s_\delta''(0) = \frac{3}{2\delta} = O(\delta^{-1})$;
     - Invariant total normal curvature mass $\int_{-\delta}^{\delta} s_\delta''(\eta)\,d\eta = 2$ for all $\delta > 0$.
4. **`suite_4_static_readout_sign_blindness`**:
   - Verifies the 4-mode divergence-free twin initial data $u_0^\pm = \pm 17 U$ on $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$:
     - Identical static Euclidean readout $q_{\mathrm{full}}(u_0^+) = q_{\mathrm{full}}(u_0^-)$ ($E = \frac{1445}{2}$, $Y = 867$, $Z = 1156$, $H = 0$, matched shell spectrum);
     - Instantaneous enstrophy derivative split at $\nu = 1$: $Y_+'(0) = \frac{289}{2} > 0$, $Y_-'(0) = -\frac{9537}{2} < 0$, divergence $Y_+'(0) - Y_-'(0) = 4913 \neq 0$, plus quartic damped Young remainder coefficient $\frac{50653}{122472}$.
5. **`suite_5_covariant_inverse_metric_dissipation`**:
   - Verifies the comoving covariant inverse-metric $g = C^{-1}$ pure-square viscous dissipation identity $2\nu\omega^T C^{-1}\Delta\omega - \nu\Delta(\omega^T C^{-1}\omega) - \nu z^T(\Delta C)z = -2\nu \sum_{i=1}^3 (\partial_i z)^T C (\partial_i z) \le 0$ ($z = C^{-1}\omega$) versus the indefinite static Hessian cross-term $\nu\,\mathrm{Tr}((\nabla\omega)^T(\nabla\omega)H_\Phi)$.

---

## 2. Contents of This Directory / 目录文件清单

- `verify_ns_counterexamples.py`: Zero-dependency exact rational & polynomial verification script for all 5 suites above.
- `PROVENANCE.md`: Cryptographic provenance of the 79-page PDF *Finite-time blow-up for the Navier–Stokes equations* (commit `ad53419de079eb8f95f60313473374624a348546`, `1,615,293` bytes, SHA-256 `4a01929b2f8a595637bbbe1dfef9724e5de768d31283d62415ce045e2ed69901`) and author attribution audit (`alpo.ge/remark.pdf`, SHA-256 `3fc97784b71ddd44ff8aa0a177e99622a1c61b13cfa843a0989ee4a7a0cfeb8d`).
- `NS_PAPER_KERNEL_LEAKAGE_AUTOPSY.md`: Consolidated kernel-leakage autopsy of the 79-page PDF across pages 38–42, 47–57, and 67–71.
- `INTERFACE_AUTOPSY_A.md`: Full analytical derivation of Counterexample Family A ($D$-weight equatorial seam, exact rational margin $\frac{\pi}{65536}\frac{633509743}{432432000} > 0$, $q_{\mathrm{red}}$ dual-model separation, and quartic collar spline $s_\delta(\eta)$ positive control).
- `INTERFACE_AUTOPSY_B.md`: Full analytical derivation of Counterexample Family B ($Z$-weight equatorial seam, mode-$\pm(2,1)$ Schwartz Gaussian field, and $> 400c$ analytical lower bound).
- `COUNTEREXAMPLE_DOMAIN_AUDIT.md`: Domain classification separating the paper's Proposition B.1 / (B.20) equatorial interface kernel leak from the true 3D Navier–Stokes static Euclidean readout sign-blindness twin counterexample $u_0^\pm = \pm 17 U$.
- `EXACT_MOMENTS.json`, `STATIC_READOUT_WITNESS.json`, `PDF_METADATA.json`: Machine-readable exact rational witnesses and PDF metadata.
