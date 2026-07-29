import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure SIMPParameters where
  penalizationPower : ℝ
  minimumDensity : ℝ
  filterRadius : ℝ
  projectionBeta : ℝ
  projectionEta : ℝ

structure SIMPDensityField (Ω : Type) where
  density : Ω → ℝ
  penalizedStiffness : Ω → ℝ
  filterApplied : Bool
  projectionApplied : Bool

structure SIMPEvidence (s : SIMPParameters) (d : SIMPDensityField Ω) where
  penalizationPowerClosed : s.penalizationPower ≥ 1
  minimumDensityClosed : s.minimumDensity > 0
  densityBoundsClosed : ∀ x, d.density x ≥ s.minimumDensity ∧ d.density x ≤ 1

def SIMPClosed (s : SIMPParameters) (d : SIMPDensityField Ω) : Prop :=
  s.penalizationPower ≥ 1 ∧ s.minimumDensity > 0 ∧ (∀ x, d.density x ≥ s.minimumDensity ∧ d.density x ≤ 1)

theorem simp_closed_from_evidence (s : SIMPParameters) (d : SIMPDensityField Ω) (e : SIMPEvidence s d) : SIMPClosed s d := by
  exact And.intro e.penalizationPowerClosed (And.intro e.minimumDensityClosed e.densityBoundsClosed)

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse