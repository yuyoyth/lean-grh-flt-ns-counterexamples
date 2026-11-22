/-
  Top-Level Proof-Body Target-Substitution Control Probe (TailMirrorOriginal.lean)
  --------------------------------------------------------------------------------
  [EN] Negative-control probe testing whether the top-level proof term `rhOfAll` in the original
       repository can be directly assigned to a modified statement (`MirrorRH`, replacing `s.re = 1/2`
       with `s.re = 3/4`).
  [ZH] 顶层证明项结论替换对照探针：测试原版仓库顶层证明项 `rhOfAll` 能否直接赋给将结论改为 `s.re = 3/4` 的镜像命题。
-/

import Statements
import Supplements.Kernels.MainTheoremsAll

def MirrorRH : Prop := ∀ s : ℂ, riemannZeta s = 0 →
  (¬∃ n : ℕ, s = -2 * ((n : ℂ)+1)) → s ≠ 1 → s.re = 3/4
-- Intentional negative control: the original proof body is kept, the conclusion changed.
theorem tail_mirror_original : MirrorRH := rhOfAll
