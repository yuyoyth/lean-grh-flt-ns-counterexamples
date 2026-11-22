/-
  Scheme 6 Verification Probe (AutopsyProbe_Scheme6.lean)
  -------------------------------------------------------
  [EN] Finite arithmetic, imprimitive Gauss-sum degeneracy, and rational Gram matrix probe for Scheme 6:
       Certifies modulus-zero exclusion `¬Nonempty (NeZero 0)`, the exact rational Rouché margin
       `(1/8)^2 - (1/16)^2 = 3/256 > 0`, modulo-4 principal character Gauss-sum vanishing
       (`principal_mod4_gauss = 0`), and the exact rational `LDL^T` positive-definite decomposition
       of the prime-basis `{17, 19, 23}` Gram matrix (`gram_ldlt`, `gram_positive`).
  [ZH] 方案六实机核查探针（有限模数边界、非本原 Gauss 和退化与有理正定 Gram 矩阵验证）：
       在 Lean 4 内机械验证模零排除 `¬Nonempty (NeZero 0)`、有理矩形围道 Rouché 裕量 `3/256 > 0`、
       模 4 主特征 Gauss 和退化为零（`principal_mod4_gauss = 0`），以及素数基 `{17, 19, 23}` 上有理
       Gram 矩阵的 `LDL^T` 平方和分解（`gram_ldlt`）与严格正定性（`gram_positive`）。
-/

import Mathlib

namespace Autopsy6
noncomputable section
theorem finite_moduli : Nat.totient 0 = 0 ∧ Nat.totient 1 = 1 ∧ Nat.totient 2 = 1 ∧
    Nat.totient 4 = 2 ∧ Nat.totient 5 = 4 := by decide
theorem modulus_zero_excluded : ¬ Nonempty (NeZero (0 : ℕ)) := by
  rintro ⟨h⟩
  exact h.out rfl
theorem rouche_margin : (1/8 : ℚ)^2 - (1/16)^2 = 3/256 ∧ (0 : ℚ) < 3/256 := by norm_num
theorem reciprocal_root : (1 : ℚ) - (5/2)*(1/2) + (1/2)^2 = 0 := by norm_num
theorem dh_defect (κ : ℝ) : 1 - (-κ)*κ = 1 + κ^2 ∧ 0 < 1 + κ^2 := by
  constructor
  · ring
  · positivity
def gram (x y z : ℝ) : ℝ := 3/68*x^2 + 2*(41/1292)*x*y + 2*(21/1564)*x*z +
  3/76*y^2 + 2*(37/1748)*y*z + 3/92*z^2
theorem gram_ldlt (x y z : ℝ) : gram x y z =
    3/68*(x+41/57*y+7/23*z)^2 + 613/36822*(y+9747/14099*z)^2 + 6669/324277*z^2 := by
  unfold gram
  ring
theorem gram_positive (x y z : ℝ) (h : x ≠ 0 ∨ y ≠ 0 ∨ z ≠ 0) : 0 < gram x y z := by
  rw [gram_ldlt]
  have h1 := sq_nonneg (x+41/57*y+7/23*z)
  have h2 := sq_nonneg (y+9747/14099*z)
  by_cases hz : z = 0
  · subst z
    simp only [mul_zero, add_zero, zero_pow (by decide : 2 ≠ 0)] at *
    by_cases hy : y = 0
    · subst y
      have hx : x ≠ 0 := by simpa using h
      nlinarith [sq_pos_of_ne_zero hx]
    · nlinarith [sq_pos_of_ne_zero hy]
  · nlinarith [sq_pos_of_ne_zero hz]
theorem gram_moment_vector : gram 34 (-57) 23 = 39 := by norm_num [gram]
theorem prime_basis : Nat.Prime 17 ∧ Nat.Prime 19 ∧ Nat.Prime 23 := by norm_num
theorem principal_mod4_gauss :
    gaussSum (1 : DirichletCharacter ℂ 4) (ZMod.stdAddChar (N := 4)) = 0 := by
  classical
  let ψ := ZMod.stdAddChar (N := 4)
  have hψ2 : ψ 2 = -1 := by
    have he := ZMod.stdAddChar_coe (N := 4) (2 : ℤ)
    have ha : (2 * Real.pi * Complex.I * (2 : ℤ) / (4 : ℕ) : ℂ) = Real.pi * Complex.I := by
      push_cast
      ring
    rw [ha, Complex.exp_pi_mul_I] at he
    exact he
  have hψ3 : ψ 3 = -(ψ 1) := by
    have he := ψ.map_add_eq_mul (1 : ZMod 4) 2
    norm_num at he
    rw [hψ2] at he
    simpa using he
  have h0 : (1 : DirichletCharacter ℂ 4) 0 = 0 := (1 : DirichletCharacter ℂ 4).map_zero' (by decide)
  have h2 : (1 : DirichletCharacter ℂ 4) 2 = 0 := by
    apply MulChar.map_nonunit
    change ¬ IsUnit ((2 : ℕ) : ZMod 4)
    rw [ZMod.isUnit_iff_coprime]
    decide
  have h3 : (1 : DirichletCharacter ℂ 4) 3 = 1 := by
    apply MulChar.one_apply
    change IsUnit ((3 : ℕ) : ZMod 4)
    rw [ZMod.isUnit_iff_coprime]
    decide
  change (∑ a : Fin 4, (1 : DirichletCharacter ℂ 4) a * ψ a) = 0
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, add_zero]
  change (1 : DirichletCharacter ℂ 4) 0 * ψ 0 +
    ((1 : DirichletCharacter ℂ 4) 1 * ψ 1 +
    ((1 : DirichletCharacter ℂ 4) 2 * ψ 2 + (1 : DirichletCharacter ℂ 4) 3 * ψ 3)) = 0
  rw [h0,h2,h3,hψ3,map_one]
  ring
#print axioms gram_positive
#print axioms finite_moduli
#print axioms principal_mod4_gauss
end
end Autopsy6
