# Anthropic 千万行级费马大定理（FLT）Lean 4 形式化库真机源码验尸与算术试件核验报告

- 审计目标仓库：`https://github.com/anthropics/fermats-last-theorem`（上游报告规模：`60475` 个模块、`29511` 条定理、`1450` 个定义模块）
- 本地真机抓取并审计核心源码文件数：`46` 个
- 本机 Lean 4.33.1 内核实测脚本：`evidence/lean4_flt_real_kernel_verification.lean`（SHA256 `9c46301cabd3b498e3626b84669f985920dd65ae18b4ab2c315cabe0763a0251`，退出码 `0`）

## 一、三大源码结构现象真机定位

### PHENOMENON_01_UNUSED_HEADLINE_ISMODULAR_AND_INTERNAL_LEVEL_LOWERING_CONTRADICTION
- **源码定位**：`P2M/Sol/S_FreyPackage_no_frey_package.lean:139-142`，`P2M/Sol/S_FreyPackage_level_lowering_to_two.lean:129-134`，`P2M/Sol/S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean:163-170`，`Definitions/Def_FLTPrelim_Modularity.lean:98-102`
- **已核实事实**：In S_FreyPackage_level_lowering_to_two.lean (lines 129-134), the explicit hypothesis (hmod : P.freyCurve.IsModular) passed from frey_isModular is silenced by `set_option linter.unusedVariables false in` and not consumed; instead, the proof invokes `P.modularRepOfConductorLevel` (which separately retains `P.IsConductorLevel N`). Furthermore, in S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean (lines 163-170), level lowering lowers N to M | 2 (M in {1, 2}), applies S2_Gamma0_eq_zero_of_dvd_two inside the lemma to derive a contradiction with hf.ne_zero, and uses `absurd` to return `exists f : CuspForm (Gamma0 2) 2, f != 0`.

### PHENOMENON_02_COUNTERFACTUAL_CARRIER_BUNDLING_AND_SMALL_PRIME_EX_FALSO_DISCHARGE
- **源码定位**：`Definitions/Def_FLTPrelim_FreyPackage.lean:12-34`，`P2M/Sol/S_FreyPackage_frey_no_cofixed_eleven.lean:14-24`，`P2M/Sol/S_FreyPackage_frey_no_cofixed_small.lean:16-29`，`P2M/Sol/S_FreyPackage_Mazur_Frey.lean:68-91`
- **已核实事实**：`FreyPackage` bundles the counterfactual equality `hFLT : a^p + b^p = c^p` directly into the carrier type. In `S_FreyPackage_frey_no_cofixed_eleven.lean` (lines 14-24) and `S_FreyPackage_frey_no_cofixed_small.lean` (lines 16-29), the absence of a Galois-stable cofixed line (`not HasGaloisStableCofixedLine`, where the 1-dimensional quotient has trivial G_Q-action) for p in {5, 7, 11, 13} is discharged not by modular curve isogeny analysis, but by importing standalone classical proofs `fermatLastTheoremEleven/Five/Seven/Thirteen`, deducing `P.p != p_0` from `P.hFLT`, and applying `absurd hp`.

### PHENOMENON_03_MODEL_DEPENDENT_INTEGRAL_WEIERSTRASS_PREDICATE
- **源码定位**：`Definitions/Def_FLTPrelim_Modularity.lean:82-97`，`Definitions/Def_FLTPrelim_ModularRep.lean:31-88`，`Definitions/Def_WeierstrassCurve_Mlc1RowStatement.lean:9-19`
- **已核实事实**：`IsGoodPrimeFor` and `IsSemistableModel` are defined directly on an integral equation `W : WeierstrassCurve Z` via `not (p | W.Delta)` and `(p | W.Delta -> not (p | W.c4))` without a global minimal model condition. Under an isomorphic coordinate scaling `(x,y) -> (u^2 x, u^3 y)` (such as u = 2 on E_11), `Delta` scales by `u^12` and `c4` by `u^4`, so `2 | Delta'` and `2 | c4'`, falsifying the raw equation predicate `IsSemistableModel` on the scaled model.

## 二、椭圆曲线试件 $E_{11}$（导子 $N=11$）与勾股三模型试件 $(3,4,5; p=2)$ 精确算术核验

- **$E_{11}: y^2 + y = x^3 - x^2 - 10x - 20$**：$\Delta = -161051 = -11^5$，$c_4 = 496 = 16 \times 31$，$c_6 = 20008$；有理五阶子群轨迹 $P=(5,5), 2P=(16,-61), 3P=(16,60), 4P=(5,-6), 5P=\mathcal{O}$；$u=2$ 缩放模型 $\Delta' = -659664896 = 2^{12}\Delta$，$c_4' = 7936 = 2^4 c_4$；$\mathrm{Frob}_2$ 模 $7$ 特征多项式 $T^2+2T+2 \bmod 7$ 余数表为 `[2, 5, 3, 3, 5, 2, 1]`（全非零）；对 $p \in \{2,3,5,7,13,17,19,23,29\}$ 全部满足 $a_p(E_{11}) = c_p(f_{11})$ 且 $5 \mid |E_{11}(\mathbb{F}_p)|$。
- **勾股三元组 $(3,4,5; p=2)$ 三种模型区分**：① 原始模型 $y^2=x(x-9)(x+16)$ 的 $\Delta=207360000, c_4=7696$；② 有理规范缩放因子 $(3\times 4\times 5)^4/2^8 = 50625 = 3^4\times 5^4$（奇数）；③ 整数除法模型 `[1, 1, 0, -9, 0]` 的 $\Delta=48681, c_4=457$（奇数）。
- **Frey 整模型恒等式抽样（$p=5, a=3, b=4$）**：$\Delta \cdot 2^8 = (a^5 b^5 (a^5+b^5))^2 = 99395263697780736$ 严格成立。
