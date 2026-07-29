import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure ComplianceWeightOptimizationPackage where
  designDomain : Type u
  materialModel : Type v
  loadCase : Type w
  objectiveFunctional : Prop
  weightConstraint : Prop
  complianceMinimized : Prop
  admissibilityCondition : Prop

structure ComplianceWeightOptimizationEvidence (P : ComplianceWeightOptimizationPackage) where
  objectiveFunctionalDefined : P.objectiveFunctional
  weightConstraintDefined : P.weightConstraint
  complianceMinimizedDefined : P.complianceMinimized
  admissibilityConditionSatisfied : P.admissibilityCondition

def ComplianceWeightOptimizationClosed (P : ComplianceWeightOptimizationPackage) : Prop :=
  P.objectiveFunctional ∧ P.weightConstraint ∧ P.complianceMinimized ∧ P.admissibilityCondition

theorem compliance_weight_optimization_closed_from_evidence
    (P : ComplianceWeightOptimizationPackage)
    (E : ComplianceWeightOptimizationEvidence P) :
    ComplianceWeightOptimizationClosed P := by
  exact And.intro E.objectiveFunctionalDefined
    (And.intro E.weightConstraintDefined
      (And.intro E.complianceMinimizedDefined E.admissibilityConditionSatisfied))

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse