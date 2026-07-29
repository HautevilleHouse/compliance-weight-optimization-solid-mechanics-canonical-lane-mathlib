import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure ComplianceTensorPackage where
  materialDomain : Type u
  stressSpace : Type v
  strainSpace : Type w
  elasticityTensor : Type x
  complianceTensor : Type y
  hookesLawValid : Prop
  positiveDefiniteCompliance : Prop
  symmetriesSatisfied : Prop
  invertibilityCondition : Prop

structure ComplianceTensorEvidence (C : ComplianceTensorPackage) where
  hookesLawValidClosed : C.hookesLawValid
  positiveDefiniteComplianceClosed : C.positiveDefiniteCompliance
  symmetriesSatisfiedClosed : C.symmetriesSatisfied
  invertibilityConditionClosed : C.invertibilityCondition

def ComplianceTensorClosed (C : ComplianceTensorPackage) : Prop :=
  C.hookesLawValid ∧ C.positiveDefiniteCompliance ∧
  C.symmetriesSatisfied ∧ C.invertibilityCondition

theorem compliance_tensor_closed_from_evidence (C : ComplianceTensorPackage)
    (E : ComplianceTensorEvidence C) : ComplianceTensorClosed C := by
  exact And.intro E.hookesLawValidClosed
    (And.intro E.positiveDefiniteComplianceClosed
      (And.intro E.symmetriesSatisfiedClosed E.invertibilityConditionClosed))

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse