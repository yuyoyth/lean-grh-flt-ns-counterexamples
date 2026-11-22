/-
  Real-Machine Lean 4.33.1 Kernel Verification of the Four Structural Phenomena
  in `anthropics/fermats-last-theorem`
-/

namespace AnthropicFLTAutopsy

/-!
## 1. Phenomenon II: Counterfactual Fiber Bundling (`P : FreyPackage`) & Local Ex-Falso Short-Circuiting
   Reproducing `Definitions/Def_FLTPrelim_FreyPackage.lean` (lines 12-34) and
   `P2M/Sol/S_FreyPackage_frey_no_cofixed_eleven.lean` (lines 14-24).
-/

def FermatLastTheoremFor (n : Nat) : Prop :=
  ∀ a b c : Int, a ≠ 0 → b ≠ 0 → c ≠ 0 → a ^ n + b ^ n ≠ c ^ n

structure FreyPackage where
  a : Int
  b : Int
  c : Int
  p : Nat
  hp5 : 5 ≤ p
  ha0 : a ≠ 0
  hb0 : b ≠ 0
  hc0 : c ≠ 0
  hFLT : a ^ p + b ^ p = c ^ p

theorem FreyPackage.p_ne_of_fermatLastTheoremFor
    (P : FreyPackage) {n : Nat} (h : FermatLastTheoremFor n) : P.p ≠ n := by
  intro hpn
  have h1 : P.a ^ n + P.b ^ n = P.c ^ n := hpn ▸ P.hFLT
  exact h P.a P.b P.c P.ha0 P.hb0 P.hc0 h1

-- Exact reproduction of `S_FreyPackage_frey_no_cofixed_eleven.lean` (lines 14-24):
theorem frey_no_cofixed_eleven_repro
    (HasGaloisStableCofixedLine : FreyPackage → Prop)
    (fermatLastTheoremEleven : FermatLastTheoremFor 11)
    (P : FreyPackage) (hp : P.p = 11) :
    ¬ HasGaloisStableCofixedLine P := by
  exact absurd hp (P.p_ne_of_fermatLastTheoremFor fermatLastTheoremEleven)

-- Kernel Proof that the EXACT SAME 1-line proof also proves the NEGATION (that a cofixed line DOES exist!)
-- and in fact proves ANY arbitrary proposition `Q : Prop` on the `P.p = 11` fiber:
theorem frey_yes_cofixed_eleven_collapse
    (HasGaloisStableCofixedLine : FreyPackage → Prop)
    (fermatLastTheoremEleven : FermatLastTheoremFor 11)
    (P : FreyPackage) (hp : P.p = 11) :
    HasGaloisStableCofixedLine P := by
  exact absurd hp (P.p_ne_of_fermatLastTheoremFor fermatLastTheoremEleven)

theorem frey_arbitrary_prop_at_eleven_collapse
    (fermatLastTheoremEleven : FermatLastTheoremFor 11)
    (P : FreyPackage) (hp : P.p = 11) (Q : Prop) :
    Q := by
  exact absurd hp (P.p_ne_of_fermatLastTheoremFor fermatLastTheoremEleven)

/-!
## 2. Phenomenon I: Unused Explicit `IsModular` Parameter (`set_option linter.unusedVariables false`)
   & Internal Contradiction Elimination inside `level_lowering_to_two_of_conductorLevel`
   Reproducing `P2M/Sol/S_FreyPackage_level_lowering_to_two.lean` (lines 129-134) and
   `P2M/Sol/S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean` (lines 163-170).
-/

structure CuspFormGamma0 (M : Nat) where
  val : Int

def CuspFormZero (M : Nat) : CuspFormGamma0 M := ⟨0⟩

theorem level_lowering_to_two_of_conductorLevel_repro
    (exists_level_dvd_two :
      ∃ M : Nat, 0 < M ∧ (M = 1 ∨ M = 2) ∧ ∃ f : CuspFormGamma0 M, f ≠ CuspFormZero M)
    (S2_Gamma0_eq_zero_of_dvd_two :
      ∀ M : Nat, 0 < M → (M = 1 ∨ M = 2) → ∀ f : CuspFormGamma0 M, f = CuspFormZero M) :
    ∃ f : CuspFormGamma0 2, f ≠ CuspFormZero 2 := by
   obtain ⟨M, hM0, hM2, f, hf_ne⟩ := exists_level_dvd_two
   exact absurd (S2_Gamma0_eq_zero_of_dvd_two M hM0 hM2 f) hf_ne

set_option linter.unusedVariables false in
theorem level_lowering_to_two_dead_wire_repro
    (IsModular : FreyPackage → Prop)
    (GaloisRepIsIrreducible : FreyPackage → Prop)
    (IsConductorLevel : FreyPackage → Nat → Prop)
    (ModularRepOfLevel : FreyPackage → Nat → Prop)
    (P : FreyPackage)
    (hmod : IsModular P)
    (hirr : GaloisRepIsIrreducible P)
    (modularRepOfConductorLevel : ∃ N : Nat, IsConductorLevel P N ∧ ModularRepOfLevel P N)
    (level_lowering_of_cond :
      GaloisRepIsIrreducible P →
      ∀ N : Nat, IsConductorLevel P N → ModularRepOfLevel P N →
        ∃ f : CuspFormGamma0 2, f ≠ CuspFormZero 2) :
    ∃ f : CuspFormGamma0 2, f ≠ CuspFormZero 2 := by
  obtain ⟨N, hcond, hmodN⟩ := modularRepOfConductorLevel
  exact level_lowering_of_cond hirr N hcond hmodN

/-!
## 3. Phenomenon III & IV: Integral Weierstrass Model Scaling, Trojan Curve `E_11` (Order-5 Subgroup
   Trajectory & Mod-7 Frobenius Characteristic Polynomial), and Three Pythagorean `(3,4,5; p=2)` Models
-/

structure WeierstrassIntModel where
  a1 : Int
  a2 : Int
  a3 : Int
  a4 : Int
  a6 : Int

def WeierstrassIntModel.b2 (W : WeierstrassIntModel) : Int := W.a1 * W.a1 + 4 * W.a2
def WeierstrassIntModel.b4 (W : WeierstrassIntModel) : Int := 2 * W.a4 + W.a1 * W.a3
def WeierstrassIntModel.b6 (W : WeierstrassIntModel) : Int := W.a3 * W.a3 + 4 * W.a6
def WeierstrassIntModel.b8 (W : WeierstrassIntModel) : Int :=
  W.a1 * W.a1 * W.a6 + 4 * W.a2 * W.a6 - W.a1 * W.a3 * W.a4 + W.a2 * W.a3 * W.a3 - W.a4 * W.a4
def WeierstrassIntModel.c4 (W : WeierstrassIntModel) : Int := W.b2 * W.b2 - 24 * W.b4
def WeierstrassIntModel.c6 (W : WeierstrassIntModel) : Int :=
  -W.b2 * W.b2 * W.b2 + 36 * W.b2 * W.b4 - 216 * W.b6
def WeierstrassIntModel.Delta (W : WeierstrassIntModel) : Int :=
  -W.b2 * W.b2 * W.b8 - 8 * W.b4 * W.b4 * W.b4 - 27 * W.b6 * W.b6 + 9 * W.b2 * W.b4 * W.b6

def WeierstrassIntModel.onCurve (W : WeierstrassIntModel) (x y : Int) : Prop :=
  y ^ 2 + W.a1 * x * y + W.a3 * y = x ^ 3 + W.a2 * x ^ 2 + W.a4 * x + W.a6

def WeierstrassIntModel.scale (W : WeierstrassIntModel) (u : Int) : WeierstrassIntModel :=
  { a1 := u * W.a1
    a2 := u * u * W.a2
    a3 := u * u * u * W.a3
    a4 := u ^ 4 * W.a4
    a6 := u ^ 6 * W.a6 }

-- Trojan Curve E_11: y^2 + y = x^3 - x^2 - 10x - 20 (conductor N = 11)
def E11 : WeierstrassIntModel := ⟨0, -1, 1, -10, -20⟩
def E11_scaled2 : WeierstrassIntModel := E11.scale 2

-- Kernel verification of exact invariants of E_11 and E_11_scaled2:
theorem E11_Delta_eq : E11.Delta = -161051 := rfl
theorem E11_Delta_factored : E11.Delta = -(11 ^ 5) := rfl
theorem E11_c4_eq : E11.c4 = 496 := rfl
theorem E11_c6_eq : E11.c6 = 20008 := rfl
theorem E11_semistable_at_11 : (E11.Delta % 11 = 0) ∧ (E11.c4 % 11 ≠ 0) := by decide

-- Exact scaling laws verified for E11 under u = 2:
theorem E11_scaled2_invariants :
    E11_scaled2.c4 = (2 ^ 4) * E11.c4 ∧
    E11_scaled2.Delta = (2 ^ 12) * E11.Delta ∧
    (E11_scaled2.Delta % 2 = 0) ∧
    (E11_scaled2.c4 % 2 = 0) := by decide

-- Full order-5 rational torsion subgroup trajectory on E_11:
-- P = (5, 5), 2P = (16, -61), 3P = (16, 60), 4P = (5, -6), 5P = O
-- Verified via curve membership, negation law -(x,y) = (x, -y - 1), and collinearity chords!
theorem E11_order5_points_on_curve :
    E11.onCurve 5 5 ∧
    E11.onCurve 16 (-61) ∧
    E11.onCurve 16 60 ∧
    E11.onCurve 5 (-6) := by
  refine ⟨rfl, rfl, rfl, rfl⟩

-- Tangent line at P=(5,5) on y^2 + y = x^3 - x^2 - 10x - 20 has slope lambda = (3*5^2 - 2*5 - 10)/(2*5 + 1) = 55/11 = 5,
-- so y - 5 = 5*(x - 5) => y = 5*x - 20. Its intersection with E_11 has x-roots 5, 5, 16 (since 5 + 5 + 16 = 5^2 + 1 = 26),
-- giving -2P = (16, 5*16 - 20) = (16, 60) = 3P and 2P = (16, -60 - 1) = (16, -61), while -P = (5, -5 - 1) = (5, -6) = 4P!
theorem E11_order5_group_law_identities :
    -- 1. Tangent slope at P=(5,5): (3*5^2 - 2*5 - 10) = 5 * (2*5 + 1)
    (3 * (5 : Int) ^ 2 - 2 * 5 - 10 = 5 * (2 * 5 + 1)) ∧
    -- 2. Vieta sum of roots for tangent line y = 5x - 20: x(P) + x(P) + x(2P) = 5^2 + 1 = 26 => x(2P) = 16
    (5 + 5 + 16 = (5 : Int) ^ 2 + 1) ∧
    -- 3. Third intersection point on tangent line y = 5x - 20 at x = 16 is (16, 60), so 2P = -(16, 60) = (16, -61)
    (5 * (16 : Int) - 20 = 60 ∧ -60 - 1 = -61) ∧
    -- 4. Negation at x = 5: -P = (5, -5 - 1) = (5, -6), and vertical line x = 16 joins 2P=(16,-61) and 3P=(16,60), so 2P + 3P = O => 5P = O!
    (-5 - 1 = (-6 : Int) ∧ -61 + 60 + 1 = (0 : Int)) := by decide

-- Mod-7 Frobenius trace at l = 2 on E_11:
-- Over F_2, the affine points on y^2 + y = x^3 + x^2 (mod 2) are (0,0), (0,1), (1,0), (1,1) (4 affine points + O = 5 points),
-- so a_2(E_11) = 2 + 1 - 5 = -2, and the characteristic polynomial of Frob_2 mod 7 is T^2 - a_2 T + 2 = T^2 + 2T + 2 (mod 7),
-- which has NO roots in Z/7Z (values are 2, 5, 3, 3, 5, 2, 1 mod 7, all nonzero)!
theorem E11_mod7_frob2_charpoly_irreducible :
    ((0 ^ 2 + 2 * 0 + 2) % 7 ≠ 0) ∧
    ((1 ^ 2 + 2 * 1 + 2) % 7 ≠ 0) ∧
    ((2 ^ 2 + 2 * 2 + 2) % 7 ≠ 0) ∧
    ((3 ^ 2 + 2 * 3 + 2) % 7 ≠ 0) ∧
    ((4 ^ 2 + 2 * 4 + 2) % 7 ≠ 0) ∧
    ((5 ^ 2 + 2 * 5 + 2) % 7 ≠ 0) ∧
    ((6 ^ 2 + 2 * 6 + 2) % 7 ≠ 0) := by decide

-- At p = 5, 5 divides v_11(Delta(E_11)) = 5; at p = 7, 7 does NOT divide v_11(Delta(E_11)) = 5:
theorem E11_valuation_guards : (5 % 5 = 0) ∧ (5 % 7 ≠ 0) := by decide

-- Three Pythagorean models at (a,b,c) = (3,4,5), p = 2:
-- (1) Raw model y^2 = x(x - 9)(x + 16) = x^3 + 7x^2 - 144x: Delta = 207360000 = 2^8 * 50625, c4 = 7696
-- (2) Rational scaled factor (3*4*5)^4 / 2^8 = 50625 (odd, 2 does not divide 50625)
-- (3) Integer-division freyCurveInt [1, (16-9-1)/4, 0, -(9*16)/16, 0] = [1, 1, 0, -9, 0]: Delta = 48681 (odd), c4 = 441
def W_pyth_raw : WeierstrassIntModel := ⟨0, 7, 0, -144, 0⟩
def W_pyth_intdiv : WeierstrassIntModel := ⟨1, 1, 0, -9, 0⟩

theorem Pythagorean_3_4_5_p2_three_models :
    (3 ^ 2 + 4 ^ 2 = 5 ^ 2) ∧
    (W_pyth_raw.Delta = 207360000 ∧ W_pyth_raw.c4 = 7696) ∧
    (((3 * 4 * 5) ^ (2 * 2)) / (2 ^ 8) = 50625 ∧ 50625 % 2 = 1) ∧
    (W_pyth_intdiv.Delta = 48681 ∧ W_pyth_intdiv.c4 = 457 ∧ W_pyth_intdiv.Delta % 2 = 1) := by decide

end AnthropicFLTAutopsy
