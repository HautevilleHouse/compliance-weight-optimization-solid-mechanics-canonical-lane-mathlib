import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure OptimalityCriteriaUpdate where
  densityOld : ℝ
  densityNew : ℝ
  complianceSensitivity : ℝ
  weightSensitivity : ℝ
  lagrangeMultiplier : ℝ
  moveLimit : ℝ

structure OptimalityCriteriaState (Ω : Type) where
  densityField : Ω → ℝ
  compliance : ℝ
  volumeFraction : ℝ
  lagrangeMultiplier : ℝ
  iteration : ℕ
  converged : Bool

structure OptimalityCriteriaEvidence (s : OptimalityCriteriaState Ω) where
  moveLimitClosed : s.lagrangeMultiplier > 0
  densityBoundsClosed : ∀ x, s.densityField x ≥ 0 ∧ s.densityField x ≤ 1
  convergenceCriterionClosed : s.compliance > 0

def OptimalityCriteriaClosed (s : OptimalityCriteriaState Ω) : Prop :=
  s.lagrangeMultiplier > 0 ∧ (∀ x, s.densityField x ≥ 0 ∧ s.densityField x ≤ 1) ∧ s.compliance > 0

theorem optimality_criteria_closed_from_evidence (s : OptimalityCriteriaState Ω) (e : OptimalityCriteriaEvidence s) : OptimalityCriteriaClosed s := by
  exact And.intro e.moveLimitClosed (And.intro e.densityBoundsClosed e.convergenceCriterionClosed)

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse