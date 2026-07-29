import complianceWeightOptimizationSolidMechanicsCanonicalLaneLean.ComplianceWeightOptimization

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure TopologyOptimizationSensitivityPackage
    {P : ComplianceWeightOptimizationPackage} (C : ComplianceWeightOptimizationEvidence P) where
  designSensitivity : Prop
  adjointMethod : Prop
  filterRegularization : Prop
  projectionMethod : Prop

structure TopologyOptimizationSensitivityEvidence
    {P : ComplianceWeightOptimizationPackage} {C : ComplianceWeightOptimizationEvidence P}
    (S : TopologyOptimizationSensitivityPackage C) where
  designSensitivityComputed : S.designSensitivity
  adjointMethodApplied : S.adjointMethod
  filterRegularizationApplied : S.filterRegularization
  projectionMethodApplied : S.projectionMethod

def TopologyOptimizationSensitivityClosed
    {P : ComplianceWeightOptimizationPackage} {C : ComplianceWeightOptimizationEvidence P}
    (S : TopologyOptimizationSensitivityPackage C) : Prop :=
  S.designSensitivity ∧ S.adjointMethod ∧ S.filterRegularization ∧ S.projectionMethod

theorem topology_optimization_sensitivity_closed_from_evidence
    {P : ComplianceWeightOptimizationPackage} {C : ComplianceWeightOptimizationEvidence P}
    (S : TopologyOptimizationSensitivityPackage C)
    (E : TopologyOptimizationSensitivityEvidence S) :
    TopologyOptimizationSensitivityClosed S := by
  exact And.intro E.designSensitivityComputed
    (And.intro E.adjointMethodApplied
      (And.intro E.filterRegularizationApplied E.projectionMethodApplied))

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse