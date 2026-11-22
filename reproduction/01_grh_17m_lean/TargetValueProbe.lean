/-
  Target Repository Off-Axis Non-Vanishing Instantiation Probe (TargetValueProbe.lean)
  ------------------------------------------------------------------------------------
  [EN] Instantiates the target repository theorem `LFunction_ne_zero_of_half_lt_re` at modulus `N = 1`,
       trivial character `χ = 1`, and `s = 3/4` (`1/2 < 3/4 < 1`) to verify that it derives
       `riemannZeta (3/4 : ℂ) ≠ 0` via `DirichletCharacter.LFunction_modOne_eq`.
  [ZH] 目标仓库离轴点 `s = 3/4` 非零性实例化探针：
       在模 `N = 1`、平凡特征 `χ = 1` 与 `s = 3/4` 处实例化目标仓库的 `LFunction_ne_zero_of_half_lt_re`，
       核验其通过 `DirichletCharacter.LFunction_modOne_eq` 导出 `riemannZeta (3/4 : ℂ) ≠ 0`。
-/

import Main
import Mathlib.Tactic

theorem autopsy_target_value_3quarters : riemannZeta (3/4 : ℂ) ≠ 0 := by
  have h := LFunction_ne_zero_of_half_lt_re 1 (1 : DirichletCharacter ℂ 1) (3/4)
    (by norm_num) (Or.inr (by norm_num))
  simpa only [DirichletCharacter.LFunction_modOne_eq] using h
#print axioms autopsy_target_value_3quarters
