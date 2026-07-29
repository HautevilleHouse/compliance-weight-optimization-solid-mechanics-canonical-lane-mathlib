import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure SensitivityPackage (C : ComplianceTopology) where
  derivativeCompliance : Type u
  adjointMethod : Prop
  filterRegularization : Prop
  convergenceRate : Prop

structure SensitivityEvidence {C : ComplianceTopology} (S : SensitivityPackage C) where
  adjointMethodClosed : S.adjointMethod
  filterRegularizationClosed : S.filterRegularization
  convergenceRateClosed : S.convergenceRate

def SensitivityClosed {C : ComplianceTopology} (S : SensitivityPackage C) : Prop :=
  S.adjointMethod ∧ S.filterRegularization ∧ S.convergenceRate

theorem sensitivity_closed_from_evidence {C : ComplianceTopology} (S : SensitivityPackage C) (E : SensitivityEvidence S) : SensitivityClosed S :=
  And.intro E.adjointMethodClosed (And.intro E.filterRegularizationClosed E.convergenceRateClosed)

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse