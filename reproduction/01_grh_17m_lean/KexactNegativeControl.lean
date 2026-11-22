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
