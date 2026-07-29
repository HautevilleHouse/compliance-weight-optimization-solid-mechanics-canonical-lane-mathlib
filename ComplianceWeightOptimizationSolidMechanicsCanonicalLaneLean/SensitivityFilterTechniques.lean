import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure SensitivityFilter (Ω : Type) where
  filterType : String
  filterRadius : ℝ
  weightFunction : ℝ → ℝ
  kernelNormalized : Bool

structure FilteredSensitivity (Ω : Type) where
  originalSensitivity : Ω → ℝ
  filteredSensitivity : Ω → ℝ
  filterApplied : Bool

structure SensitivityFilterEvidence (f : SensitivityFilter Ω) (fs : FilteredSensitivity Ω) where
  filterRadiusClosed : f.filterRadius > 0
  kernelNormalizedClosed : f.kernelNormalized = true
  filterAppliedClosed : fs.filterApplied = true

def SensitivityFilterClosed (f : SensitivityFilter Ω) (fs : FilteredSensitivity Ω) : Prop :=
  f.filterRadius > 0 ∧ f.kernelNormalized ∧ fs.filterApplied

theorem sensitivity_filter_closed_from_evidence (f : SensitivityFilter Ω) (fs : FilteredSensitivity Ω) (e : SensitivityFilterEvidence f fs) : SensitivityFilterClosed f fs := by
  exact And.intro e.filterRadiusClosed (And.intro e.kernelNormalizedClosed e.filterAppliedClosed)

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse