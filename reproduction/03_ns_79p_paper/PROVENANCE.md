# 原件身份、固定版本与可追溯边界

本次对象为 Levent Alpöge 与 Tristan Buckmaster 署名的 *Finite-time blow-up for the Navier–Stokes equations*，PDF 79 页，作者标注版本为 2026-11-20。公开仓库为 <https://github.com/tristanbuckmaster/navier-stokes>。

- 固定提交：`ad53419de079eb8f95f60313473374624a348546`。
- 原件路径：`paper/finite-time-blow-up-navier-stokes.pdf`。
- 原件字节数：`1615293`。
- 原件 SHA-256：`4a01929b2f8a595637bbbe1dfef9724e5de768d31283d62415ce045e2ed69901`。
- 从 `main` 与上述固定提交两次取得的 PDF 字节完全相同；保留为 `originals/finite-time-blow-up-navier-stokes.pdf` 和 `originals/pinned-paper.pdf`。
- `originals/commit.json` 与 `originals/repository_tree.json` 是 GitHub API 原始响应；后者的 `truncated=false`，其中 `paper/` 下只列出该 PDF，没有 TeX 源码。
- `originals/README.md`、`originals/repository.html`、`originals/alpoge_homepage.html` 保留原始网页/文本响应；相关 HTTP 响应头在 `evidence/`。

GRH 同作者线索由指定旧工作台中的 `community_NOTES.md` 指向 <https://alpo.ge/remark.pdf>。本次重新取得该 4 页声明，SHA-256 为 `3fc97784b71ddd44ff8aa0a177e99622a1c61b13cfa843a0989ee4a7a0cfeb8d`，与旧工作台记录相同；原件和提取文本分别为 `originals/grh_announcement_remark.pdf`、`text/GRH_ANNOUNCEMENT.txt`。NS 的作者身份直接见 PDF 第一页。此身份核对不预设 GRH 或 NS 宣称正确。

## 全文与目录

`text/FULL_TEXT.txt` 和逐页 `text/page_NNN.txt` 是 pypdf 的布局提取。`text/secondary/FULL_TEXT.txt` 与同目录逐页文件是 PyMuPDF 独立提取。`text/secondary/BOOKMARKS.json` 保留 PDF 书签。公式的上下标、分式和二维布局可能在文本提取中错序；审查关键公式时以原 PDF 和 `evidence/pages/` 的页面渲染为准。例如 (B.40) 的正确权重是 \(w_i\sum_jw_j^{-1}(\cdots)\)，不能按提取后顺序误读成其倒数。

`text/STRUCTURE_EXTRACTED.json` 是自动检出的标题候选，包含正文引用造成的误匹配；`text/NAMED_RESULTS.json` 是清理后的 47 个命名定理/命题/引理/推论定位，不是 47 项通过证明。

| 部分 | 起页 | 主要任务 |
|---|---:|---|
| §1 | 1 | 爆破宣称、剖面假设及证书依赖 |
| §2 | 10 | 归约到 R3、环面与光滑性 |
| §3 | 12 | 热流、双线性算子、紧性与 mild 解 |
| §4 | 16 | 线性化、单周期算子、有限余维校正 |
| §5 | 22 | R3 上紧支初值 |
| §6 | 24 | 周期化和环面修正 |
| §7 | 29 | 从满足全部条件的证书到精确剖面 |
| Appendix A | 47 | §2–3 若干引理的证明 |
| Appendix B | 49 | 谐波、单元、尾界和矩阵树证书条件 |
| Appendix C | 70 | 近似剖面的数值寻找过程 |
| References | 75 | 外部文献依赖 |

## 本次未取得的输入

PDF 第 1、4、70 页给出的证书摘要是 `3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5`。这不是 PDF 的摘要。本次没有取得与它对应的证书字节，也没有取得区间算术验证程序；不能由摘要反推出这些对象。作者 README 明示未把这些材料及论文 TeX 放入仓库。受限于本次检索，结论是“所固定公开仓库及实际取得材料中缺失”，而不是声称已穷尽一切私人或未来发布位置。

## 本地参考版本

用户指定的 `03_纳维斯托克斯存在性与光滑性_涡度拉伸对偶湮灭与随流协变耗散闭合正典.md` 在该路径不存在。本次只读找到当前文件 `03_纳维斯托克斯存在性与光滑性_同源逆度规纯平方耗散闭合与粗粒化双模型屏障正典.md`，保存读取副本 `references/current_ns_canon.md`；未认定二者为同一版本。指定副卷存在，副本为 `references/ns_companion.md`。规范快照为 `references/GEMINI.md.snapshot`。所有副本仅写入本工作台，原库未被修改。

## 跨面接合线索的追加来源

初审后另查作者仓库issue2、issue3，取得具体的权函数接合反例线索。原始API列表、评论及固定提交的 `ExtendedCoerciveChallenge.lean`、`CellLayerChallenge.lean` 保存在 `reopened_sources/`，SHA-256见其中 `MANIFEST.json`。读取这些源码只用于确认前件；未执行Lean。新的解析反例独立推导见两份 `INTERFACE_AUTOPSY_*.md`，没有把issue中的数值声明或判断直接当作已证事实。

新线索出现前冻结的219项及初次Gate报告完整保存在 `../stage1/baseline_before_join_review/`；当前主报告是重开后的版本，不能用旧清单冒充当前新增文件的全量摘要。
