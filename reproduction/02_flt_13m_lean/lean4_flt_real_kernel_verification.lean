/-
  Lean 4.33.1 Kernel Verification of the Three Structural Phenomena and Arithmetic Specimens
  in `anthropics/fermats-last-theorem`
  针对 `anthropics/fermats-last-theorem` 三大源码结构现象与算术几何试件的 Lean 4.33.1 内核复现核验脚本
-/

namespace AnthropicFLTVerification

/-!
## 1. Phenomenon II: Counterfactual Carrier Embedding (`P : FreyPackage`) & Ex-Falso Discharge on Small-Prime Branches
## 第一节（现象二）：基础载体反事实等式内置（`P : FreyPackage`）与小素数分支的爆炸原理（Ex Falso Quodlibet）消去

   EN: Reproduces the structural dependency skeleton of `Definitions/Def_FLTPrelim_FreyPackage.lean` (lines 12-34)
       and `P2M/Sol/S_FreyPackage_frey_no_cofixed_eleven.lean` (lines 14-24).
   ZH: 原样复现 `Definitions/Def_FLTPrelim_FreyPackage.lean`（第 12-34 行）与
       `P2M/Sol/S_FreyPackage_frey_no_cofixed_eleven.lean`（第 14-24 行）的最小依赖骨架。
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

-- EN: Exact reproduction of `S_FreyPackage_frey_no_cofixed_eleven.lean` (lines 14-24):
-- ZH: 原样复现 `S_FreyPackage_frey_no_cofixed_eleven.lean`（第 14-24 行）的单行证明：
theorem frey_no_cofixed_eleven_repro
    (HasGaloisStableCofixedLine : FreyPackage → Prop)
    (fermatLastTheoremEleven : FermatLastTheoremFor 11)
    (P : FreyPackage) (hp : P.p = 11) :
    ¬ HasGaloisStableCofixedLine P := by
  exact absurd hp (P.p_ne_of_fermatLastTheoremFor fermatLastTheoremEleven)

-- EN: Kernel verification that the exact same 1-line proof term simultaneously proves the opposite statement
--     (`HasGaloisStableCofixedLine P`) and any arbitrary proposition `Q : Prop` on the `P.p = 11` branch:
-- ZH: 内核复现核验：完全相同的单行证明项在 `P.p = 11` 分支上可一字不改地同时证明其反命题
--     （`HasGaloisStableCofixedLine P`）以及任意给定的命题 `Q : Prop`：
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
## 2. Phenomenon I: Unreferenced Explicit `IsModular` Parameter (`set_option linter.unusedVariables false`)
##    & Internal Contradiction Elimination Inside `level_lowering_to_two_of_conductorLevel`
## 第二节（现象一）：未消费的显式 `IsModular` 形参（关闭未使用变量检查）与导子降水平引理内部的提前矛盾消去

   EN: Reproduces `P2M/Sol/S_FreyPackage_level_lowering_to_two.lean` (lines 129-134) and
       `P2M/Sol/S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean` (lines 163-170).
   ZH: 复现 `P2M/Sol/S_FreyPackage_level_lowering_to_two.lean`（第 129-134 行）与
       `P2M/Sol/S_FreyPackage_level_lowering_to_two_of_conductorLevel.lean`（第 163-170 行）的调用结构。
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
## 3. Phenomenon III & Arithmetic Specimens: Integral Weierstrass Model Scaling, Elliptic Curve `E_11`
##    (Order-5 Rational Torsion Trajectory & Mod-7 Frobenius Characteristic Polynomial), and Three Pythagorean `(3,4,5; p=2)` Models
## 第三节（现象三与算术试件）：整系数 Weierstrass 模型同构缩放、导子 11 椭圆曲线试件 `E_11`
##    （5 阶有理挠子群轨迹与模 7 Frobenius 特征多项式）以及勾股三元组 `(3,4,5; p=2)` 的三种模型区分
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

-- EN: Elliptic Curve Specimen E_11: y^2 + y = x^3 - x^2 - 10x - 20 (conductor N = 11)
-- ZH: 导子 N = 11 的椭圆曲线试件 E_11: y^2 + y = x^3 - x^2 - 10x - 20
def E11 : WeierstrassIntModel := ⟨0, -1, 1, -10, -20⟩
def E11_scaled2 : WeierstrassIntModel := E11.scale 2

-- EN: Kernel verification of exact invariants of E_11 and its u = 2 scaled model E11_scaled2:
-- ZH: E_11 及其 u = 2 同构缩放模型 E11_scaled2 的精确不变量内核核验：
theorem E11_Delta_eq : E11.Delta = -161051 := rfl
theorem E11_Delta_factored : E11.Delta = -(11 ^ 5) := rfl
theorem E11_c4_eq : E11.c4 = 496 := rfl
theorem E11_c6_eq : E11.c6 = 20008 := rfl
theorem E11_semistable_at_11 : (E11.Delta % 11 = 0) ∧ (E11.c4 % 11 ≠ 0) := by decide

-- EN: Exact scaling laws verified for E11 under u = 2 (both Delta' and c4' become divisible by 2):
-- ZH: u = 2 同构缩放定律核验（缩放后 Delta' 与 c4' 同时被 2 整除，使未规范化的整模型半稳定谓词退化）：
theorem E11_scaled2_invariants :
    E11_scaled2.c4 = (2 ^ 4) * E11.c4 ∧
    E11_scaled2.Delta = (2 ^ 12) * E11.Delta ∧
    (E11_scaled2.Delta % 2 = 0) ∧
    (E11_scaled2.c4 % 2 = 0) := by decide

-- EN: Full order-5 rational torsion subgroup trajectory on E_11:
--     P = (5, 5), 2P = (16, -61), 3P = (16, 60), 4P = (5, -6), 5P = O
-- ZH: E_11 上 5 阶有理挠子群的完整群律轨迹核验：
--     P = (5, 5), 2P = (16, -61), 3P = (16, 60), 4P = (5, -6), 5P = O
theorem E11_order5_points_on_curve :
    E11.onCurve 5 5 ∧
    E11.onCurve 16 (-61) ∧
    E11.onCurve 16 60 ∧
    E11.onCurve 5 (-6) := by
  refine ⟨rfl, rfl, rfl, rfl⟩

-- EN: Group-law chord-and-tangent identities certifying 2P = (16,-61), 3P = (16,60), 4P = (5,-6), 5P = O:
-- ZH: 证明 2P = (16,-61), 3P = (16,60), 4P = (5,-6), 5P = O 的切线与割线代数恒等式：
theorem E11_order5_group_law_identities :
    -- 1. Tangent slope at P=(5,5) / P=(5,5) 处的切线斜率: (3*5^2 - 2*5 - 10) = 5 * (2*5 + 1)
    (3 * (5 : Int) ^ 2 - 2 * 5 - 10 = 5 * (2 * 5 + 1)) ∧
    -- 2. Vieta sum of roots for tangent line y = 5x - 20 / 切线交点韦达定理根之和: 5 + 5 + 16 = 5^2 + 1
    (5 + 5 + 16 = (5 : Int) ^ 2 + 1) ∧
    -- 3. Third intersection point (16, 60) and negation 2P = (16, -61) / 第三交点与求逆:
    (5 * (16 : Int) - 20 = 60 ∧ -60 - 1 = -61) ∧
    -- 4. Negation -P = (5, -6) = 4P and vertical line 2P + 3P = O => 5P = O / 竖直线消去证得 5P = O:
    (-5 - 1 = (-6 : Int) ∧ -61 + 60 + 1 = (0 : Int)) := by decide

-- EN: Mod-7 Frobenius trace at l = 2 on E_11:
--     |E_11(F_2)| = 5 => a_2(E_11) = 2 + 1 - 5 = -2; characteristic polynomial T^2 + 2T + 2 (mod 7) has no roots in F_7.
-- ZH: E_11 在素数 l = 2 处的模 7 Frobenius 特征多项式不可约性核验：
--     |E_11(F_2)| = 5 => a_2(E_11) = -2；特征多项式 T^2 + 2T + 2 (mod 7) 在 F_7 上处处非零。
theorem E11_mod7_frob2_charpoly_irreducible :
    ((0 ^ 2 + 2 * 0 + 2) % 7 ≠ 0) ∧
    ((1 ^ 2 + 2 * 1 + 2) % 7 ≠ 0) ∧
    ((2 ^ 2 + 2 * 2 + 2) % 7 ≠ 0) ∧
    ((3 ^ 2 + 2 * 3 + 2) % 7 ≠ 0) ∧
    ((4 ^ 2 + 2 * 4 + 2) % 7 ≠ 0) ∧
    ((5 ^ 2 + 2 * 5 + 2) % 7 ≠ 0) ∧
    ((6 ^ 2 + 2 * 6 + 2) % 7 ≠ 0) := by decide

-- EN: Valuation divisibility guards at p = 5 (5 | v_11(Delta) = 5) vs. p = 7 (7 does not divide 5):
-- ZH: 局部判别式估值整除守卫在 p = 5（整除）与 p = 7（不整除）处的分离：
theorem E11_valuation_guards : (5 % 5 = 0) ∧ (5 % 7 ≠ 0) := by decide

-- EN: Three models of the Pythagorean triple (a,b,c) = (3,4,5) at exponent p = 2:
--     (1) Raw cubic model y^2 = x(x - 9)(x + 16): Delta = 207360000 = 2^12 * 50625, c4 = 7696
--     (2) Rational scaled factor (3*4*5)^4 / 2^8 = 50625 (odd)
--     (3) Integer-division truncated model [1, 1, 0, -9, 0]: Delta = 48681 (odd), c4 = 457
-- ZH: 勾股三元组 (a,b,c) = (3,4,5) 在偶指数 p = 2 下的三种模型不变量分离核验：
def W_pyth_raw : WeierstrassIntModel := ⟨0, 7, 0, -144, 0⟩
def W_pyth_intdiv : WeierstrassIntModel := ⟨1, 1, 0, -9, 0⟩

theorem Pythagorean_3_4_5_p2_three_models :
    (3 ^ 2 + 4 ^ 2 = 5 ^ 2) ∧
    (W_pyth_raw.Delta = 207360000 ∧ W_pyth_raw.c4 = 7696) ∧
    (((3 * 4 * 5) ^ (2 * 2)) / (2 ^ 8) = 50625 ∧ 50625 % 2 = 1) ∧
    (W_pyth_intdiv.Delta = 48681 ∧ W_pyth_intdiv.c4 = 457 ∧ W_pyth_intdiv.Delta % 2 = 1) := by decide

end AnthropicFLTVerification
