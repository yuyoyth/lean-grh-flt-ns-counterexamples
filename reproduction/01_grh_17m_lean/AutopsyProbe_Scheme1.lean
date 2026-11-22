/-
  Scheme 1 Verification Probe (AutopsyProbe_Scheme1.lean)
  -------------------------------------------------------
  [EN] Self-contained Lean 4 (v4.33.1 + Mathlib 0df444a360ea) verification probe for Scheme 1:
       (1) `raw_zero` & `raw_three_quarters`: proves that Mathlib `LSeries 1 s` evaluates identically
           to `0` on the non-summable half-plane `Re(s) <= 1` (in particular at `s = 3/4`);
       (2) `functions_differ`: proves `(fun s => LSeries 1 s) != riemannZeta` via `0 != -1/2` at `s = 0`;
       (3) `axis_principal_zero`: proves that the modulo-2 principal Dirichlet L-function vanishes on the
           imaginary axis at `s_0 = (2 * pi / log 2) * I` (`Re(s_0) = 0`);
       (4) `removing_guard_is_false`: proves that omitting the open critical-strip left boundary guard
           `0 < Re(s)` renders the universal critical-line statement provably false in Lean 4.
  [ZH] 方案一实机核查探针（Lean 4 v4.33.1 + Mathlib 0df444a360ea）：
       (1) `raw_zero` 与 `raw_three_quarters`：证明原始级数载体 `LSeries 1 s` 在不可和半平面 `Re(s) <= 1`
           （含 `s = 3/4`）上因默认总化规则恒等于 `0`；
       (2) `functions_differ`：由 `s = 0` 处 `0 != -1/2` 证明 `(fun s => LSeries 1 s) != riemannZeta`；
       (3) `axis_principal_zero`：证明模 2 主特征 L 函数在虚轴点 `s_0 = (2 * pi / log 2) * I` 处为零；
       (4) `removing_guard_is_false`：证明一旦省略左边界守卫 `0 < Re(s)`，全称临界线命题在 Lean 4 内即可证伪。
-/

import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.LSeries.Dirichlet
import Mathlib.Tactic

namespace Autopsy1
theorem raw_zero (s : ℂ) (h : s.re ≤ 1) : LSeries 1 s = 0 := by
  apply LSeries.eq_zero_of_not_LSeriesSummable
  rw [LSeriesSummable_one_iff]
  exact not_lt.mpr h

theorem raw_three_quarters : LSeries 1 (3 / 4 : ℂ) = 0 := by
  apply raw_zero
  norm_num

theorem raw_origin : LSeries 1 (0 : ℂ) = 0 := raw_zero 0 (by norm_num)
theorem continued_origin : riemannZeta 0 = -1 / 2 := riemannZeta_zero
theorem functions_differ : (fun s : ℂ => LSeries 1 s) ≠ riemannZeta := by
  intro h
  have hx := congrFun h 0
  rw [raw_origin, continued_origin] at hx
  norm_num at hx

noncomputable def axisPoint : ℂ := (2 * Real.pi / Real.log 2 : ℝ) * Complex.I
theorem axis_re : axisPoint.re = 0 := by
  change (((2 * Real.pi / Real.log 2 : ℝ) : ℂ) * Complex.I).re = 0
  rw [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, Complex.I_re, Complex.I_im]
  ring
theorem axis_not_one : axisPoint ≠ 1 := by
  intro h
  have := congrArg Complex.re h
  simpa [axis_re] using this
theorem axis_euler_factor : (2 : ℂ) ^ (-axisPoint) = 1 := by
  rw [Complex.cpow_def_of_ne_zero (by norm_num)]
  have hl : (Real.log 2 : ℂ) ≠ 0 := by
    exact_mod_cast (Real.log_pos (by norm_num : (1 : ℝ) < 2)).ne'
  have hc : Complex.log (2 : ℂ) = (Real.log 2 : ℂ) := by
    simpa using (Complex.ofReal_log (by norm_num : (0 : ℝ) ≤ 2)).symm
  rw [hc]
  have he : (Real.log 2 : ℂ) * (-axisPoint) = -(2 * Real.pi * Complex.I) := by
    unfold axisPoint
    push_cast
    field_simp [hl]
  rw [he, Complex.exp_neg, Complex.exp_two_pi_mul_I]
  norm_num
theorem axis_principal_zero : DirichletCharacter.LFunction (1 : DirichletCharacter ℂ 2) axisPoint = 0 := by
  change DirichletCharacter.LFunctionTrivChar 2 axisPoint = 0
  rw [DirichletCharacter.LFunctionTrivChar_eq_mul_riemannZeta axis_not_one]
  norm_num [Nat.primeFactors, axis_euler_factor]
theorem guard_excludes_axis : ¬ (0 < axisPoint.re) := by rw [axis_re]; exact lt_irrefl 0
theorem removing_guard_is_false :
    ¬ (∀ s : ℂ, DirichletCharacter.LFunction (1 : DirichletCharacter ℂ 2) s = 0 → s.re = 1/2) := by
  intro h
  have hh := h axisPoint axis_principal_zero
  rw [axis_re] at hh
  norm_num at hh

-- This is a logical test harness; the first-zero witness remains an explicit premise.
theorem mirror_with_witness (P : ℂ → Prop)
    (half : ∀ s, P s → s.re = 1/2)
    (mirror : ∀ s, P s → s.re = 3/4)
    (witness : ∃ s, P s ∧ 14 < s.im ∧ s.im < 15) : False := by
  obtain ⟨s, hs, _, _⟩ := witness
  have h1 := half s hs
  have h2 := mirror s hs
  linarith
#print axioms raw_three_quarters
#print axioms axis_principal_zero
#print axioms functions_differ
end Autopsy1
