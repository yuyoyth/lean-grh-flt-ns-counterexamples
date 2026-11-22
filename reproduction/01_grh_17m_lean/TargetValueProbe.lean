import Main
import Mathlib.Tactic

theorem autopsy_target_value_3quarters : riemannZeta (3/4 : ℂ) ≠ 0 := by
  have h := LFunction_ne_zero_of_half_lt_re 1 (1 : DirichletCharacter ℂ 1) (3/4)
    (by norm_num) (Or.inr (by norm_num))
  simpa only [DirichletCharacter.LFunction_modOne_eq] using h
#print axioms autopsy_target_value_3quarters
