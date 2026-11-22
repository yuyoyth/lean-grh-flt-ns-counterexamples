import Mathlib

namespace Autopsy5
noncomputable section
def P (s : ℂ) : ℂ := (s - 1/2)^2 - 1/16
def trojan (H : ℂ → ℂ) (s : ℂ) : ℂ := P s * H s
theorem polynomial_symmetric (s : ℂ) : P (1-s) = P s := by unfold P; ring
theorem trojan_symmetric (H : ℂ → ℂ) (h : ∀ s, H (1-s) = H s) (s : ℂ) :
    trojan H (1-s) = trojan H s := by simp [trojan, polynomial_symmetric, h]
theorem trojan_root (H : ℂ → ℂ) : trojan H (3/4) = 0 := by norm_num [trojan, P]
theorem polynomial_entire : Differentiable ℂ P := by unfold P; fun_prop
theorem trojan_entire (H : ℂ → ℂ) (h : Differentiable ℂ H) : Differentiable ℂ (trojan H) :=
  polynomial_entire.mul h
theorem polynomial_growth (s : ℂ) : ‖P s‖ ≤ (‖s‖ + 1)^2 := by
  have hb : ‖s - (1/2 : ℂ)‖ ≤ ‖s‖ + 1/2 := by
    simpa [norm_div] using norm_sub_le s (1/2 : ℂ)
  have ht : ‖P s‖ ≤ ‖s - (1/2 : ℂ)‖^2 + 1/16 := by
    have h := norm_sub_le ((s - (1/2 : ℂ))^2) (1/16 : ℂ)
    rw [Complex.norm_pow] at h
    norm_num [norm_div] at h
    exact h
  nlinarith [norm_nonneg s, norm_nonneg (s - (1/2 : ℂ))]
def WeakRule : Prop := ∀ F : ℂ → ℂ,
    Differentiable ℂ F → (∀ s, F (1-s) = F s) → (∀ s, ‖F s‖ ≤ (‖s‖+1)^2) →
    ∀ s, 0 < s.re → s.re < 1 → F s = 0 → s.re = 1/2
theorem conditional_real_collision (h : WeakRule) : (3/4 : ℝ) = 1/2 := by
  simpa using h P polynomial_entire polynomial_symmetric polynomial_growth (3/4)
    (by norm_num) (by norm_num) (by norm_num [P])
theorem weak_rule_inconsistent (h : WeakRule) : False := by
  have hh := h P polynomial_entire polynomial_symmetric polynomial_growth (3/4)
    (by norm_num) (by norm_num) (by norm_num [P])
  norm_num at hh
theorem conditional_integer_collision (h : WeakRule) : (0 : ℤ) = 1 :=
  (weak_rule_inconsistent h).elim
theorem weak_rule_refuted : ¬ WeakRule := weak_rule_inconsistent
theorem dh_coefficient_defect (κ : ℝ) : 0 < 1 - (-κ)*κ := by nlinarith [sq_nonneg κ]
def dhCoefficient (κ : ℝ) (n : ℕ) : ℝ :=
  if n % 5 = 1 then 1 else if n % 5 = 2 then κ else if n % 5 = 3 then -κ else if n % 5 = 4 then -1 else 0
theorem dh_not_multiplicative (κ : ℝ) :
    ¬ (∀ m n, dhCoefficient κ (m*n) = dhCoefficient κ m * dhCoefficient κ n) := by
  intro h
  have hh := h 2 3
  norm_num [dhCoefficient] at hh
  nlinarith [sq_nonneg κ]
def evenR : ℂ := Complex.exp ((Real.log 2 : ℂ)/4)
def evenY (s : ℂ) : ℂ := Complex.exp ((1/2-s)*(Real.log 2 : ℂ))
def evenF (s : ℂ) : ℂ := (1-(evenR+evenR⁻¹)*evenY s+(evenY s)^2)*riemannZeta s
theorem even_root : evenF (3/4) = 0 := by
  have hy : evenY (3/4) = evenR⁻¹ := by
    unfold evenY evenR
    rw [show ((1/2 : ℂ)-3/4)*(Real.log 2 : ℂ) = -((Real.log 2 : ℂ)/4) by ring,
      Complex.exp_neg]
  have hr : evenR ≠ 0 := Complex.exp_ne_zero _
  unfold evenF
  rw [hy]
  have hp : (1 : ℂ)-(evenR+evenR⁻¹)*evenR⁻¹+(evenR⁻¹)^2 = 0 := by
    field_simp
    ring
  rw [hp,zero_mul]
def evenCompleted (s : ℂ) : ℂ :=
  (Complex.exp ((Real.log 2 : ℂ)*s)+Complex.exp ((Real.log 2 : ℂ)*(1-s))-
    (evenR+evenR⁻¹)*(Real.sqrt 2 : ℂ))*completedRiemannZeta s
theorem even_completed_reflection (s : ℂ) : evenCompleted (1-s) = evenCompleted s := by
  simp only [evenCompleted, sub_sub_cancel, completedRiemannZeta_one_sub]
  ring
-- These statements explicitly refute a defined weak rule. They do not assume or refute Main.
#print axioms weak_rule_refuted
#print axioms conditional_integer_collision
#print axioms conditional_real_collision
#print axioms even_root
end
end Autopsy5
