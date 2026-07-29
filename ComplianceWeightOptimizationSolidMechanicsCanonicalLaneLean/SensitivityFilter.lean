import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.FiniteElementDiscretization

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure SensitivityFilterPackage {C : ComplianceTensorPackage}
    {T : TopologyOptimizationPackage C}
    {F : FiniteElementDiscretizationPackage C T} where
  filterRadius : ℝ
  weightingFunction : Type u
  filteredSensitivities : Prop
  chainRuleApplied : Prop
  smoothingPreservesOptimality : Prop

structure SensitivityFilterEvidence {C : ComplianceTensorPackage}
    {T : TopologyOptimizationPackage C}
    {F : FiniteElementDiscretizationPackage C T}
    (S : SensitivityFilterPackage C T F) where
  filteredSensitivitiesClosed : S.filteredSensitivities
  chainRuleAppliedClosed : S.chainRuleApplied
  smoothingPreservesOptimalityClosed : S.smoothingPreservesOptimality

def SensitivityFilterClosed {C : ComplianceTensorPackage}
    {T : TopologyOptimizationPackage C}
    {F : FiniteElementDiscretizationPackage C T}
    (S : SensitivityFilterPackage C T F) : Prop :=
  S.filteredSensitivities ∧ S.chainRuleApplied ∧
  S.smoothingPreservesOptimality

theorem sensitivity_filter_closed_from_evidence
    {C : ComplianceTensorPackage} {T : TopologyOptimizationPackage C}
    {F : FiniteElementDiscretizationPackage C T}
    (S : SensitivityFilterPackage C T F)
    (E : SensitivityFilterEvidence S) : SensitivityFilterClosed S := by
  exact And.intro E.filteredSensitivitiesClosed
    (And.intro E.chainRuleAppliedClosed E.smoothingPreservesOptimalityClosed)

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse