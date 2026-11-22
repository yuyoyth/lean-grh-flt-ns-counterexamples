/-
  Scheme 3 Verification Probe (AutopsyProbe_Scheme3.lean)
  -------------------------------------------------------
  [EN] Target-repository axiom and signature inspection probe for Scheme 3:
       Prints the exact formal definitions and recursive axiom dependencies (`#print axioms`) of the
       five top-level GRH theorems in `Main` (`riemannHypothesis`, `riemannZeta_eq_zero_re`,
       `LFunction_ne_zero_of_half_lt_re`, `LFunction_eq_zero_re`, `LFunction_eq_zero_re_of_isPrimitive`).
  [ZH] 方案三实机核查探针（顶层目标定理签名与公理依赖核查）：
       在导入目标仓库 `Main` 后，打印五大顶层 GRH 定理的形式化定义与递归公理依赖集合（`#print axioms`）。
-/

import Main
import Mathlib.Tactic

#print riemannHypothesis
#print riemannZeta_eq_zero_re
#print LFunction_ne_zero_of_half_lt_re
#print LFunction_eq_zero_re
#print LFunction_eq_zero_re_of_isPrimitive
#print axioms riemannHypothesis
#print axioms riemannZeta_eq_zero_re
#print axioms LFunction_ne_zero_of_half_lt_re
#print axioms LFunction_eq_zero_re
#print axioms LFunction_eq_zero_re_of_isPrimitive
