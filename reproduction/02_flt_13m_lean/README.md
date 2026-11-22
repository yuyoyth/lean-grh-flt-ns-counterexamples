# Part 2 Reproduction Package: 13-Million-Line Fermat's Last Theorem (FLT) Lean 4 Formalization — Internal Mathematical Paradoxes and Real-Machine Autopsy
# 第二部分可复现证据包：1,300 万行费马大定理（FLT）Lean 4 形式化数学内部原理性悖论与真机验尸

---

## 1. Overview / 概述

This directory contains the standalone, reproducible Lean 4 kernel verification probe and machine-readable autopsy reports for **Part 2** of the repository: the mathematical audit of the 13,004,119-line Lean 4 repository `anthropics/fermats-last-theorem` (4,598 `.lean` files).

本目录收录本仓库**第二部分**（针对 `anthropics/fermats-last-theorem` 共 4,598 个 `.lean` 文件、总计 13,004,119 行 Lean 4 代码的数学内部原理性审计）的独立可复现 Lean 4 核心验证探针与结构化真机验尸报告。

- **English Monograph / 英文版专著**: [`../../en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md`](../../en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md)
- **Chinese Monograph / 中文版专著**: [`../../zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md`](../../zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md)

---

## 2. Files in This Directory / 目录文件清单

| File / 文件名 | Description / 说明 |
| :--- | :--- |
| `lean4_flt_real_kernel_verification.lean` | Self-contained Lean 4 (`v4.33.1`) kernel verification probe (`0 sorry`, `0 axiom`, exit code `0`) reproducing the exact definitions from `anthropics/fermats-last-theorem` and mechanically proving their three principal mathematical defects and concrete counterexample witnesses. / 零依赖自足 Lean 4（`v4.33.1`）内核验证探针（`0 sorry`、`0 axiom`，退出码 `0`），原样复现目标仓库定义并在内核中机械证出三大核心数学破缺与显式反例见证。 |
| `flt_real_machine_autopsy_report.json` | Machine-readable JSON ledger containing repository-wide physical statistics (`4,598` files, `13,004,119` lines), SHA256 digests of audited upstream files, line-by-line autopsy findings, and kernel verification results. / 机器可读 JSON 审计总账，包含全库物理统计（`4,598` 个文件、`13,004,119` 行）、受审上游文件 SHA256 摘要、逐行验尸结论及内核重验结果。 |
| `flt_real_machine_autopsy_report.md` | Concise bilingual human-readable summary of the real-machine autopsy findings and theorem dependency diagnostics. / 真机验尸结论与定理依赖链诊断简明报告。 |

---

## 3. One-Command Kernel Reproduction / 一键真机内核复现

### Prerequisites / 环境要求
- Lean 4 toolchain (`v4.33.1` or compatible Lean 4 release; standard core library only, no external dependencies required).
- Lean 4 工具链（`v4.33.1` 或兼容版本；仅使用标准核心库，无需下载任何外部依赖）。

### Command / 执行命令

```bash
lean lean4_flt_real_kernel_verification.lean
```

**Expected Output / 预期输出**:
- Exit code `0` with zero warnings, zero `sorry`, and zero custom `axiom` declarations.
- 退出码 `0`，零警告、零 `sorry`、零自定义 `axiom`。

### What `lean4_flt_real_kernel_verification.lean` Mechanically Proves / 内核探针机械证明的四大定理模块

1. **Section 1 — Degenerate Modularity Encoding (`IsModular` & `ConductorLevel`) / 第一节——退化模性编码与导子投影核塌缩**:
   - Reproduces `Newform.atLevel` (`Defs_ModularityPrep.lean:88-93`), `IsModular` (`Defs_ModularityPrep.lean:101-102`), and `ConductorLevel` (`Defs_ConductorLevel.lean:12-26`) verbatim.
   - Proves `isModular_degenerate_iff`: $\mathrm{IsModular}(E, p) \Longleftrightarrow p \ge 2 \land \exists N \ge 1, N \equiv 0 \pmod{2}$, demonstrating that `IsModular E p` does not depend on any arithmetic invariant of the curve $E$.
   - Proves `isModular_true_for_all_curves`: for every curve $E$ and every integer $p \ge 2$, `IsModular E p` holds identically via the fixed witness $N = 2$ and $f = (2, 2, 0)$.
   - Proves `conductorLevel_eq_two`: for every curve $E$, `ConductorLevel E = 2`, and proves `level_lowering_to_two_is_trivial`: the repository's Ribet level-lowering theorem (`S_FreyPackage_level_lowering_to_two.lean:129-134`) reduces to a zero-step substitution along $2 = 2$.

2. **Section 2 — Level-2 Modular Form Vacancy Paradox / 第二节——水平 2 尖点新形式空集悖论**:
   - Proves `dim_S2_Gamma0_2_eq_zero`: the complex dimension of weight-$2$ cusp forms $S_2(\Gamma_0(2))$ is $0$, whereas `Newform 2` in the repository is nonempty (`newform_level_two_nonempty`, witnessed by $\langle 2, 2, 0, \dots \rangle$).

3. **Section 3 — Complete Decoupling of `FreyPackage` from the Diophantine Triple $(a,b,c)$ / 第三节——`FreyPackage` 与丢番图三元组 $(a,b,c)$ 的完全解耦**:
   - Reproduces `WeierstrassCurve` and `FreyPackage` (`Defs_FreyPackage.lean:12-44`) verbatim.
   - Proves `freyCurve_independent_of_abc`: two packages with distinct triples $(a_1,b_1,c_1) = (1, 1, 2)$ and $(a_2,b_2,c_2) = (2, -1, 1)$ (satisfying $2^5 + (-1)^5 = 31 \neq 1 = 1^5$ at $p = 5$) have identical underlying curve fields `E` and `galoisRep`.

4. **Section 4 — Non-faithful Galois Representation Proxy (`galoisRep : Nat → Int`) and Counterexamples to `Mazur_Frey` / 第四节——非忠实伽罗瓦表示代理与 `Mazur_Frey` 反例**:
   - Proves `mazur_frey_false_on_non_diophantine_witness`: constructs a valid `FreyPackage` instance with $p = 23$, $(a,b,c) = (2,-1,1)$, and constant representation $\mathrm{galoisRep}(n) = 1$, proving that `Mazur_Frey` (`S_FreyPackage_Mazur_Frey.lean:68-73`) evaluates to $23 \le 7 \lor 23 = 11 \lor 23 = 13 \lor 23 = 17 \lor 23 = 19$, which is `False`.
   - Proves `mazur_frey_fails_on_real_diophantine_solution_with_constant_rep`: even when $(a,b,c) = (1,0,1)$ satisfies the true Fermat equation $1^{23} + 0^{23} = 1^{23}$ and $a \equiv -1 \pmod{4}$ ($1 \equiv -1 \pmod{2}$), `FreyPackage` imposes no link between $(a,b,c)$ and `galoisRep`, allowing $\mathrm{galoisRep}(n) = 1$ (`cofixed 23`), which falsifies the conclusion of `Mazur_Frey` while demonstrating that `Mazur_Frey` succeeds in the upstream code solely because $a^p + b^p = c^p$ (`P.hFlt`) is already contradictory for $a > 0, b \neq 0, p = 23$.

---

## 4. Audited Upstream Source File Index (`anthropics/fermats-last-theorem`) / 受审上游源码索引表

| Upstream Path / 上游源码路径 | Line Range / 行号 | SHA256 Digest / SHA256 摘要 | Audited Mathematical Object & Defect / 受审数学对象与原理性破缺 |
| :--- | :--- | :--- | :--- |
| `Flt/Defs_ModularityPrep.lean` | `82–102` | `f683104c5cb62939fcfa9a4fc72bf7b49730e27c68c1130df9e48036bc5bb9ca` | `Newform`, `Newform.atLevel`, and `IsModular`: defines a newform as three integers `(level, weight, eigenSeed)` with `weight = 2`, and defines `IsModular E p` without referencing any arithmetic invariant of `E`. / 将尖点新形式定义为三元整数记录，且 `IsModular E p` 完全不依赖椭圆曲线 `E` 的任何算术不变量。 |
| `Flt/Defs_ConductorLevel.lean` | `12–26` | `ff150e5c8e0f103d14138368b07b0811e7d9f029f781de4941990f452dc6d78a` | `ConductorLevel`: defined via `Classical.choose` on the witness $N = 2$ from `IsModular E 2`, collapsing `ConductorLevel E` to the constant `2` for every curve `E`. / 对任意椭圆曲线 `E`，导子水平算子恒塌缩为常数 `2`。 |
| `Flt/S_FreyPackage_level_lowering_to_two.lean` | `129–134` | `dc23c37be1a94643f6b77ab7ef6df1000462fc63110d24e76cc68089f8bc29db` | `FreyPackage.level_lowering_to_two`: outputs `Newform 2` by rewriting along `ConductorLevel P.E = 2` (`level_lowering_to_two_of_conductorLevel`), bypassing Ribet's level-lowering theorem and demonstrating the nonempty `Newform 2` contradiction against $\dim_{\mathbb{C}} S_2(\Gamma_0(2)) = 0$. / 借 `ConductorLevel P.E = 2` 恒等代换跳过 Ribet 降水平定理，并导出非空 `Newform 2` 与 $\dim_{\mathbb{C}} S_2(\Gamma_0(2)) = 0$ 的直接冲突。 |
| `Flt/S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean` | `98–170` | `8f6b56c2685673307c39178f4b2cf274db2ddbe89477d17a4eb3bc08f239d1fd` | `FreyPackage.level_lowering_to_two_of_conductorLevel`: performs direct equality substitution `hN : ConductorLevel P.E = 2` into the existential witness of `ConductorLevel_spec`. / 直接用 `ConductorLevel P.E = 2` 代入存在量词见证，零算术降水平步骤。 |
| `Flt/Defs_FreyPackage.lean` | `12–44` | `35f3ce7b114d67c53ebddbb6454fd4937000eb45907f023c1b0276ebdb76810d` | `FreyPackage`: bundles `(a, b, c, p)` together with `E : WeierstrassCurve` and `galoisRep : Nat → Int` without any field equating `E` to $Y^2 = X(X - a^p)(X + b^p)$ or connecting `galoisRep` to the $p$-torsion $E[p]$ or Frobenius traces $a_\ell(E)$. / 未建立 `E` 与 Frey 曲线方程 $Y^2 = X(X - a^p)(X + b^p)$ 的任何连接，亦未建立 `galoisRep` 与 $p$-挠群或 Frobenius 迹的任何耦合。 |
| `Flt/S_FreyPackage_Mazur_Frey.lean` | `68–91` | `caab7df477092ff2bf47dc76071d87f67eb37ff8569f06253c1bb0ed8ba103d3` | `FreyPackage.Mazur_Frey`: asserts that `cofixed P.p P.galoisRep` implies $p \in \{2,3,5,7,11,13,17,19\}$ without invoking `P.galoisRep`; instead dispatches by `rcases` to pre-existing small-exponent Fermat solver files that contradict `P.hFlt : a^p + b^p = c^p`. / 证明体内完全不读取 `P.galoisRep`，而是直接对小指数费马方程 `a^p + b^p = c^p` 调取现成反证分支（外延爆炸捷径）。 |
| `Flt/S_FreyPackage_frey_no_cofixed_eleven.lean` | `14–24` | `b49581a0841aa90bd9b7b0ccdf58df6fb30f4c09ec25d946e0470b144314e4a5` | `FreyPackage.frey_no_cofixed_eleven`: ignores `_h : cofixed 11 P.galoisRep` and proves `False` directly by invoking `flt_eleven P.a P.b P.c ... P.hFlt`. / 忽略伽罗瓦表示假设 `_h`，直接调用 11 次幂初等/分圆费马证明推导矛盾。 |
| `Flt/S_FreyPackage_frey_no_cofixed_small.lean` | `16–29` | `62a7cfbf43a4018298fb0f6a08b90cf7ab0d53775d7226d1aa4053e0415c99f5` | `FreyPackage.frey_no_cofixed_small`: ignores `_h : cofixed P.p P.galoisRep` and dispatches $p \in \{3,5,7\}$ directly to `flt_three`, `flt_five`, and `flt_seven` on `P.hFlt`. / 忽略伽罗瓦表示假设 `_h`，直接对 $p \in \{3,5,7\}$ 调用初等费马定理证伪 `P.hFlt`。 |
| `Flt/S_FreyPackage_no_frey_package.lean` | `139–142` | `d180076524e6292a22fa01f531438bc19fa19234fd02350e0e018c2e3357df76` | `FreyPackage.no_frey_package`: top-level contradiction combining the vacuous modularity/level-lowering chain with the extensional `Mazur_Frey` bypass. / 顶层反证合流点，将退化模性链与 `Mazur_Frey` 假前提爆炸链拼接。 |
| `verification/comparator/Challenge.lean` | `1–14` | `ef3f4692ed74cfbb9d03daaa61cc2cb9f101a08785cb14dc80dc5e0d4137a6f3` | Surface statement comparator: inspects only the final top-level type signature of `fermats_last_theorem`, leaving all intermediate algebraic-geometric definitions (`Newform`, `IsModular`, `ConductorLevel`, `FreyPackage`, `galoisRep`) uninspected. / 表层签名比对器：仅检查最顶层定理语句，对中间层的全部算术几何定义零语义审计。 |
