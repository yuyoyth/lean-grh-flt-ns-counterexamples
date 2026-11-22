/-
  Custom Metaprogramming Assignment Tactic Control Probe (KexactNegativeControl.lean)
  -----------------------------------------------------------------------------------
  [EN] Reproduces verbatim the custom tactic `kexactB` from `HeckeNonvanishing/Imports.lean` (lines 5-8),
       which elaborates a term with expected type `none` and calls `g.assign` directly on the goal
       metavariable without frontend `isDefEq` checking, testing how the post-elaboration kernel
       responds when an ill-typed term (`True.intro` for goal `False`) is assigned.
  [ZH] 自定义元编程直接赋值策略 `kexactB` 对照实验探针：
       原样复现目标仓库 `HeckeNonvanishing/Imports.lean` 第 5-8 行的 `kexactB` 策略（以期望类型 `none`
       阐述项并直接调用 `g.assign` 对目标元变量赋值，跳过前端阐述器期望类型核对），测试其对类型不匹配项的行为。
-/

import Lean
open Lean Elab Tactic Meta
-- Exact tactic body from original HeckeNonvanishing/Imports.lean, lines 5-8.
elab "kexactB " e:term : tactic => withMainContext do
  let g ← getMainGoal
  let v ← Term.elabTermAndSynthesize e none
  g.assign (← instantiateMVars v)
-- Intentional ill-typed assignment: the kernel must reject the declaration.
theorem kexact_negative_control : False := by
  kexactB True.intro
