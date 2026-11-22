# Document Provenance, Pinned Revision, and Verification Scope
# 论文原件溯源、固定版本与结构核验范围

---

## 1. Audited Document and Cryptographic Digest / 受审文献原件与密码学摘要

The object of analysis in Part 03 is the 79-page manuscript *Finite-time blow-up for the Navier–Stokes equations* authored by Levent Alpöge and Tristan Buckmaster (dated November 20, 2026), retrieved from the public repository `https://github.com/tristanbuckmaster/navier-stokes`.

第三部分的数学分析对象为 Levent Alpöge 与 Tristan Buckmaster 署名的 79 页论文 *Finite-time blow-up for the Navier–Stokes equations*（标注日期 2026-11-20），取自公开仓库 `https://github.com/tristanbuckmaster/navier-stokes`。

**Pinned Git Commit / 固定提交哈希**: `ad53419de079eb8f95f60313473374624a348546`

**Upstream File Path / 原件路径**: `paper/finite-time-blow-up-navier-stokes.pdf`

**File Size / 字节数**: `1,615,293` bytes

**PDF SHA-256 Digest / PDF 原件 SHA-256**: `4a01929b2f8a595637bbbe1dfef9724e5de768d31283d62415ce045e2ed69901`

**Author Attribution Cross-Reference / 同作者声明交叉核对**: The four-page Generalized Riemann Hypothesis announcement at `https://alpo.ge/remark.pdf` (SHA-256: `3fc97784b71ddd44ff8aa0a177e99622a1c61b13cfa843a0989ee4a7a0cfeb8d`) and page 1 of `paper/finite-time-blow-up-navier-stokes.pdf` confirm common first-author attribution (Levent Alpöge).

**Upstream Companion Formal Specification Files / 上游伴随形式化规范文件**: In commit `ad53419de079eb8f95f60313473374624a348546`, the companion specification files `ExtendedCoerciveChallenge.lean` (lines 322–323) and `CellLayerChallenge.lean` (lines 2372–2378, 2505, 2509) specify global $C^2$ regularity (`ContDiff R 2`) and parity-signed cross-plane joining conditions (`IsJoinedScalar 2`) across $y _ 3 = 0$ .

---

## 2. Structure of the 79-Page Manuscript / 79 页论文结构索引

All page numbers in our analysis refer to the PDF page numbers (which coincide with the printed page numbers 1–79). Every multi-line equation (such as equation (B.16) on page 54, inequality (B.20) on pages 55–56, and the weighted row bound (B.40) on page 62, where the factor is $w _ i \sum _ j w _ j^{-1}(\cdots)$ ) has been cross-checked directly against the rendered PDF pages.

本部分所有页码均指该 79 页 PDF 原件的页码（与印刷页码 1–79 完全一致）。所有跨行与分式公式（如第 54 页公式 (B.16)、第 55–56 页不等式 (B.20) 以及第 62 页加权行界 (B.40) 中的权重比 $w _ i \sum _ j w _ j^{-1}(\cdots)$ ）均已对照原 PDF 渲染页面逐项核实。

| Section / 章节 | Start Page / 起始页 | Primary Mathematical Content / 主要数学内容 |
| :--- | :---: | :--- |
| Section 1 | 1 | Main blow-up statement (Theorem 1.1), self-similar profile hypotheses, and external certificate dependency / 主定理 1.1、自相似剖面假设与外部数值证书依赖 |
| Section 2 | 10 | Reduction to $\mathbb{R}^3$ , the torus $\mathbb{T}^3$ , and smoothness criteria / 归约至全空间 $\mathbb{R}^3$ 、三维环面 $\mathbb{T}^3$ 与光滑性判据 |
| Section 3 | 12 | Heat semigroup, bilinear operators, compactness, and mild solutions / 热半群、双线性算子、紧性与温和解 |
| Section 4 | 16 | Linearization, single-period evolution operator, and finite-codimension correction / 线性化、单周期演化算子与有限余维校正 |
| Section 5 | 22 | Compactly supported initial data on $\mathbb{R}^3$ / 全空间 $\mathbb{R}^3$ 上的紧支集初值构造 |
| Section 6 | 24 | Periodization and toroidal remainder estimates / 周期化与三维环面余项估计 |
| Section 7 | 29 | Conditional construction of an exact self-similar profile from a certificate (Theorem 7.1) / 从满足全部假设的证书构造精确自相似剖面（定理 7.1） |
| Appendix A | 47 | Proofs of auxiliary lemmas from Sections 2–3 / 第 2–3 节若干辅助引理的证明 |
| Appendix B | 49 | Harmonic expansion, spatial cells, multiplier weights $D, Z$ , inequality (B.20), and tree matrix conditions / 谐波展开、空间单元、乘子权函数 $D, Z$ 、不等式 (B.20) 与树状矩阵条件 |
| Appendix C | 70 | Numerical search procedure for approximate profiles / 近似自相似剖面的数值搜索过程说明 |
| References | 75 | Bibliographic references / 参考文献 |

---

## 3. Unreleased Upstream Inputs Documented in the Paper / 论文声明但未公开的外部输入

On pages 1, 4, 38–39, and 70, the manuscript refers to a finite-dimensional certificate witness $d \in \mathcal{D} _ B$ identified solely by the 64-character SHA-256 digest:

论文第 1、4、38–39 及 70 页提及的最上游有限维存在性证人 $d \in \mathcal{D} _ B$ 仅给出如下 64 位十六进制 SHA-256 摘要：

$$
\mathrm{SHA-256}(d) = \mathrm{3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5}.
$$

Neither the data file corresponding to this SHA-256 digest nor the external 128-bit interval-arithmetic verification program (Section 1.5, pages 4 and 10, using Arb / FLINT outside the formalization kernel) nor the LaTeX source of the paper is included in the pinned public repository `ad53419de079eb8f95f60313473374624a348546`.

As proved in Theorem 5.4 of our monograph (and verified by `suite_6_collar_smoothing_transfer_futility` in `verify_ns_counterexamples.py`), because the operator-kernel discrepancy in Proposition B.1 occurs at the level of the distributional Hessian integration-by-parts identity on $\mathbb{R}^3$ , unsealing the finite-dimensional spline coefficient table behind this SHA-256 digest or appending equatorial collar-smoothing patches cannot resolve the discrepancy within the static piecewise-multiplier framework.

在固定公开提交 `ad53419de079eb8f95f60313473374624a348546` 中，上述 SHA-256 摘要对应的原始证书数据文件、形式化内核之外的 128 位区间算术（Arb / FLINT）校验程序（第 1.5 节，第 4、10 页）以及论文 TeX 源码均未公开。如专著定理 5.4（及 `verify_ns_counterexamples.py` 中的 `suite_6_collar_smoothing_transfer_futility`）所严格证明，由于命题 B.1 的算子核偏差发生在 $\mathbb{R}^3$ 上的分布海森分部积分恒等式层，在现有静态分片乘子框架内，单纯解封该 SHA-256 摘要背后的有限维样条系数表或追加赤道薄层磨平补丁，均无法消除该结构性偏差。
