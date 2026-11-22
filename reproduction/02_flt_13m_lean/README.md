# Part 2 Reproduction Package: 13-Million-Line Fermat's Last Theorem (FLT) Lean 4 Formalization — Structural Quotient Analysis and Kernel Verification
# 第二部分可复现证据包：1,300 万行费马大定理（FLT）Lean 4 形式化库结构商分析与内核复现核查

---

## 1. Overview / 概述

**English**:
This directory contains the standalone, reproducible Lean 4 kernel verification probe and machine-readable structural audit reports for **Part 2** of the repository: the mathematical and source-code verification of the 13,004,119-line Lean 4 repository `anthropics/fermats-last-theorem` (4,598 `.lean` files).

**中文**：
本目录收录本仓库**第二部分**（针对 `anthropics/fermats-last-theorem` 共 4,598 个 `.lean` 文件、总计 13,004,119 行 Lean 4 代码的数学结构与形式化源码核查）的独立可复现 Lean 4 内核验证探针与结构化核查报告。

- **English Monograph / 英文版专著**: [`../../en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md`](../../en/02_FLT_13M_Lean_Paradox_and_Autopsy_EN.md)
- **Chinese Monograph / 中文版专著**: [`../../zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md`](../../zh/02_FLT_13M_Lean_Paradox_and_Autopsy_ZH.md)

---

## 2. Files in This Directory / 目录文件清单

| File / 文件名 | Description / 说明 |
| :--- | :--- |
| `lean4_flt_real_kernel_verification.lean` | Self-contained Lean 4 (`v4.33.1`) kernel verification probe (`0 sorry`, `0 axiom`, exit code `0`, bilingual English/Chinese comments) reproducing the structural dependency skeletons from `anthropics/fermats-last-theorem` and mechanically certifying the three principal structural phenomena and concrete arithmetic specimen invariants. / 零依赖自足 Lean 4（`v4.33.1`）内核验证探针（`0 sorry`、`0 axiom`，退出码 `0`，中英双语对照注释），原样复现目标仓库的核心依赖骨架并在内核中机械核验三大结构现象与显式算术试件不变量。 |
| `flt_real_machine_autopsy_report.json` | Machine-readable JSON ledger containing audited upstream file digests, line-by-line structural verification findings, elliptic curve specimen $E_{11}$ tables, and kernel verification receipts. / 机器可读 JSON 核查总账，包含受审上游文件 SHA256 摘要、逐行源码结构核查记录、椭圆曲线试件 $E_{11}$ 算术表及内核核验回执。 |
| `flt_real_machine_autopsy_report.md` | Complete bilingual (English & Chinese) summary of the source-code structure verification findings, theorem dependency diagnostics, and arithmetic specimen tests. / 完整中英双语源码结构核查结论、定理依赖链诊断与算术试件核验报告。 |

---

## 3. One-Command Kernel Reproduction / 一键内核复现

### Prerequisites / 环境要求
- Lean 4 toolchain (`v4.33.1` or any standard Lean 4 release; uses only the built-in core library with zero external package dependencies).
- Lean 4 工具链（`v4.33.1` 或任意标准 Lean 4 版本；仅使用内置标准核心库，零外部包依赖）。

### Command / 执行命令
```bash
lean lean4_flt_real_kernel_verification.lean
```

**Expected Output / 预期输出**:
- Exit code `0` with zero warnings, zero `sorry`, and zero custom `axiom` declarations.
- 退出码 `0`，零警告、零 `sorry`、零自定义 `axiom`。

### What `lean4_flt_real_kernel_verification.lean` Mechanically Certifies / 内核探针机械核验的三大定理模块

1. **Section 1 — Counterfactual Carrier Embedding (`P : FreyPackage`) & Ex-Falso Discharge on Small-Prime Branches / 第一节——基础载体反事实等式内置与小素数分支的爆炸原理消去**:
   - **EN**: Reproduces the structural skeleton of `Definitions/Def_FLTPrelim_FreyPackage.lean` (lines 12–34) and `P2M/Sol/S_FreyPackage_frey_no_cofixed_eleven.lean` (lines 14–24), where `hFLT : a^p + b^p = c^p` is embedded directly inside `FreyPackage`. Mechanically proves `frey_no_cofixed_eleven_repro`, `frey_yes_cofixed_eleven_collapse`, and `frey_arbitrary_prop_at_eleven_collapse`: because `P.p_ne_of_fermatLastTheoremFor` deduces `P.p ≠ 11` from `P.hFLT` and the external theorem `fermatLastTheoremEleven`, the exact same one-line proof `exact absurd hp (P.p_ne_of_fermatLastTheoremFor fermatLastTheoremEleven)` simultaneously proves `¬ HasGaloisStableCofixedLine P`, its direct negation `HasGaloisStableCofixedLine P`, and any arbitrary proposition `Q : Prop` on the `P.p = 11` branch.
   - **ZH**：复现 `Definitions/Def_FLTPrelim_FreyPackage.lean`（第 12–34 行）与 `P2M/Sol/S_FreyPackage_frey_no_cofixed_eleven.lean`（第 14–24 行）的依赖骨架。机械证成 `frey_no_cofixed_eleven_repro`、`frey_yes_cofixed_eleven_collapse` 与 `frey_arbitrary_prop_at_eleven_collapse`：由于 `P.hFLT` 与外部导入的十一指数费马定理直接推出 `P.p ≠ 11`，完全相同的单行证明 `exact absurd hp (P.p_ne_of_fermatLastTheoremFor fermatLastTheoremEleven)` 在 `P.p = 11` 分支上既能证出“无共不动线” `¬ HasGaloisStableCofixedLine P`，也能一字不改地证出其反命题“存在共不动线” `HasGaloisStableCofixedLine P` 以及任意命题 `Q : Prop`。

2. **Section 2 — Unreferenced Explicit `IsModular` Hypothesis (`set_option linter.unusedVariables false`) & Internal Contradiction Elimination in Level Lowering / 第二节——未消费的显式 `IsModular` 形参与降水平引理内部的提前矛盾消去**:
   - **EN**: Reproduces the dependency skeletons of `P2M/Sol/S_FreyPackage_level_lowering_to_two.lean` (lines 129–134) and `P2M/Sol/S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean` (lines 163–170). Demonstrates that `(hmod : IsModular P)` is left unreferenced under `set_option linter.unusedVariables false in`, while inside `level_lowering_to_two_of_conductorLevel_repro`, descending only to $M \in \{1, 2\}$ ($M \mid 2$) is resolved by importing `S2_Gamma0_eq_zero_of_dvd_two` inside the lemma and applying `absurd` to non-constructively populate `∃ f : CuspFormGamma0 2, f ≠ CuspFormZero 2`.
   - **ZH**：复现 `P2M/Sol/S_FreyPackage_level_lowering_to_two.lean`（第 129–134 行）与 `P2M/Sol/S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean`（第 163–170 行）的调用结构。核验显式参数 `(hmod : IsModular P)` 在关闭未使用变量检查下未被证明项引用，且 `level_lowering_to_two_of_conductorLevel_repro` 在仅归纳下降至 $M \in \{1, 2\}$（$M \mid 2$）时，通过在引理内部导入 `S2_Gamma0_eq_zero_of_dvd_two` 并调用 `absurd`（爆炸原理）非构造性地生成返回值 `∃ f : CuspFormGamma0 2, f ≠ CuspFormZero 2`。

3. **Section 3 — Coordinate Scaling of Raw Integral Weierstrass Equations, Elliptic Curve Specimen $E_{11}$, and Three Models of the Pythagorean Triple $(3,4,5;\, p=2)$ / 第三节——裸整系数 Weierstrass 方程的同构缩放依赖性、椭圆曲线试件 $E_{11}$ 与勾股三元组 $(3,4,5;\, p=2)$ 的三种模型**:
   - **EN**: Mechanically verifies the exact invariants of $E_{11} : y^2 + y = x^3 - x^2 - 10x - 20$ ($\Delta = -161051 = -11^5$, $c_4 = 496$, $c_6 = 20008$), its $u = 2$ scaled model $E_{11}^{(2)}$ ($\Delta' = 2^{12}\Delta$, $c_4' = 2^4 c_4$, where $2 \mid \Delta'$ and $2 \mid c_4'$ falsify the unnormalized semistability predicate), the complete order-$5$ rational torsion trajectory $P=(5,5), 2P=(16,-61), 3P=(16,60), 4P=(5,-6), 5P=\mathcal{O}$, the irreducibility of the mod-$7$ Frobenius characteristic polynomial $T^2 + 2T + 2 \pmod 7$ at $\ell = 2$, and the exact invariant separation across the three models of $(3,4,5;\, p=2)$.
   - **ZH**：在 Lean 4 内核中机械核验导子 $11$ 椭圆曲线试件 $E_{11}$ 的精确不变量（$\Delta = -161051 = -11^5, c_4 = 496, c_6 = 20008$）、$u = 2$ 同构缩放模型下未规范化半稳定谓词的真值退化（$2 \mid \Delta'$ 且 $2 \mid c_4'$）、$5$ 阶有理挠子群完整群律恒等式、模 $7$ Frobenius 特征多项式 $T^2 + 2T + 2 \bmod 7$ 在 $\mathbb{F}_7$ 上的无根不可约性，以及勾股三元组 $(3,4,5;\, p=2)$ 三种模型的不变量分离。

---

## 4. Audited Upstream Source File Index (`anthropics/fermats-last-theorem`) / 受审上游源码索引表

| Upstream Path / 上游源码路径 | Line Range / 行号 | Audited Mathematical Object & Structural Finding / 受审数学对象与结构核查结论 |
| :--- | :--- | :--- |
| `Definitions/Def_FLTPrelim_Modularity.lean` | `82–102` | `IsGoodPrimeFor`, `IsSemistableModel`, and `IsModular`: defines reduction predicates on raw integral equations `W : WeierstrassCurve ℤ` without minimal-model normalization, and encapsulates witness level $N$ inside an existential quantifier without conductor-radical binding. / 在未规范化的整系数方程 `W : WeierstrassCurve ℤ` 上直接定义约化谓词，且在 `IsModular` 中用存在量词隐去了见证水平 $N$ 与导子根基的耦合约束。 |
| `Definitions/Def_FLTPrelim_FreyPackage.lean` | `12–34` | `FreyPackage`: embeds the counterfactual equality `hFLT : a^p + b^p = c^p` ($p \ge 5$, $a,b,c \neq 0$) directly into the base carrier structure, making the carrier type mathematically uninhabited ($\varnothing$). / 将反事实费马等式 `hFLT : a^p + b^p = c^p` 直接内置于基础载体结构体，使该底空间类型在数学上为空集 $\varnothing$。 |
| `P2M/Sol/S_FreyPackage_level_lowering_to_two.lean` | `129–134` | `FreyPackage.level_lowering_to_two`: disables `linter.unusedVariables`, leaves `(hmod : P.freyCurve.IsModular)` unreferenced (`0` occurrences), and calls `P.modularRepOfConductorLevel`. / 关闭未使用变量检查，不消费显式形参 `hmod`，转而调用保留导子水平约束的内部旁路定理。 |
| `P2M/Sol/S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean` | `98–170` | `FreyPackage.level_lowering_to_two_of_conductorLevel`: lowers $N$ by strong induction only to $M \mid 2$ ($M \in \{1, 2\}$), imports `S2_Gamma0_eq_zero_of_dvd_two` inside the lemma, and applies `absurd` to non-constructively produce `∃ f : CuspForm (Gamma0 2) 2, f ≠ 0`. / 强归纳仅降至 $M \mid 2$（$M \in \{1, 2\}$），在引理内部提前导入水平 1 与水平 2 尖点形式消没定理，并用 `absurd`（爆炸原理）非构造性地生成水平 2 返回值。 |
| `P2M/Sol/S_FreyPackage_frey_no_cofixed_eleven.lean` | `14–24` | `FreyPackage.frey_no_cofixed_eleven`: discharges `¬ P.freyCurve.HasGaloisStableCofixedLine P.p` at $p = 11$ in one line via `exact absurd hp (P.p_ne_of_fermatLastTheoremFor fermatLastTheoremEleven)`. / 导入外部独立证明的 `fermatLastTheoremEleven` 与结构体内置字段 `P.hFLT` 推出 `P.p ≠ 11`，再用 `absurd hp` 单行消去 $p = 11$ 分支。 |
| `P2M/Sol/S_FreyPackage_frey_no_cofixed_small.lean` | `16–29` | `FreyPackage.frey_no_cofixed_small`: discharges $p \in \{5, 7, 13\}$ by importing `fermatLastTheoremFive/Seven/Thirteen` and applying `absurd` against `P.hFLT`. / 导入外部 `fermatLastTheoremFive/Seven/Thirteen` 与内置 `P.hFLT` 对撞，通过 `absurd` 消去 $p \in \{5, 7, 13\}$ 分支。 |
| `P2M/Sol/S_FreyPackage_Mazur_Frey.lean` | `68–91` | `FreyPackage.Mazur_Frey`: splits $p \ge 5$ into $p \in \{5,7,13\}$, $p = 11$, and $p \ge 17$, routing the first four primes to the ex-falso branch lemmas above. / 将 $p \ge 5$ 拆为 $p \in \{5,7,13\}$、$p = 11$ 与 $p \ge 17$，其中前四个小素数分支由上述爆炸原理引理承接。 |
| `P2M/Sol/S_FreyPackage_no_frey_package.lean` | `139–142` | `FreyPackage.no_frey_package`: top-level synthesis theorem combining `frey_isModular`, ` Mazur_Frey`, `level_lowering_to_two`, and `S2_Gamma0_two_eq_zero`. / 顶层合龙定理，组合 `frey_isModular`、`Mazur_Frey`、`level_lowering_to_two` 与 `S2_Gamma0_two_eq_zero`。 |
