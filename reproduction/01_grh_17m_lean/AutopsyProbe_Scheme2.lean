import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.LSeries.Dirichlet

namespace Autopsy2
theorem dirichlet_bridge {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N)
    {s : ℂ} (hs : 1 < s.re) : χ.LFunction s = LSeries (χ ·) s :=
  DirichletCharacter.LFunction_eq_LSeries χ hs
theorem zeta_bridge {s : ℂ} (hs : 1 < s.re) : LSeries 1 s = riemannZeta s :=
  LSeries_one_eq_riemannZeta hs
theorem continued_functional_equation {s : ℂ}
    (h : ∀ n : ℕ, s ≠ -n) (h1 : s ≠ 1) :
    riemannZeta (1-s) = 2 * (2 * Real.pi) ^ (-s) * Complex.Gamma s *
      Complex.cos (Real.pi * s / 2) * riemannZeta s := riemannZeta_one_sub h h1
#print DirichletCharacter.LFunction
#print ZMod.LFunction
#print riemannZeta
#print LSeries
#check DirichletCharacter.IsPrimitive.completedLFunction_one_sub
#print axioms dirichlet_bridge
#print axioms continued_functional_equation
end Autopsy2
