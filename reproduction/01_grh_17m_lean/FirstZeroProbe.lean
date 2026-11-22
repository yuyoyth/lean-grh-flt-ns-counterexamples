import Main
import Mathlib.Tactic

set_option maxHeartbeats 100000
-- This search is an attempted witness construction, not evidence that no such witness exists.
example : ∃ s : ℂ, riemannZeta s = 0 ∧ 0 < s.re ∧ s.re < 1 ∧ 14 < s.im ∧ s.im < 15 := by
  exact?
