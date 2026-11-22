/-
  First Non-Trivial Zero Existential Search Probe (FirstZeroProbe.lean)
  ---------------------------------------------------------------------
  [EN] Tests whether the target repository provides a constructive existence theorem for the first
       non-trivial zero of `riemannZeta` in the strip `0 < Re(s) < 1, 14 < Im(s) < 15` via `exact?`.
  [ZH] 首非平凡零点存在性检索探针：通过 `exact?` 检测目标仓库是否提供 `14 < Im(s) < 15` 内首零点的存在性引理。
-/

import Main
import Mathlib.Tactic

set_option maxHeartbeats 100000
-- This search is an attempted witness construction, not evidence that no such witness exists.
example : ∃ s : ℂ, riemannZeta s = 0 ∧ 0 < s.re ∧ s.re < 1 ∧ 14 < s.im ∧ s.im < 15 := by
  exact?
