import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.ComplianceTensor

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure TopologyOptimizationPackage {C : ComplianceTensorPackage} where
  designSpace : Type u
  densityField : Type v
  objectiveFunctional : Prop
  volumeConstraint : Prop
  sensitivityAnalysis : Prop
  optimalityCriteria : Prop

structure TopologyOptimizationEvidence {C : ComplianceTensorPackage}
    (T : TopologyOptimizationPackage C) where
  objectiveFunctionalClosed : T.objectiveFunctional
  volumeConstraintClosed : T.volumeConstraint
  sensitivityAnalysisClosed : T.sensitivityAnalysis
  optimalityCriteriaClosed : T.optimalityCriteria

def TopologyOptimizationClosed {C : ComplianceTensorPackage}
    (T : TopologyOptimizationPackage C) : Prop :=
  T.objectiveFunctional ∧ T.volumeConstraint ∧
  T.sensitivityAnalysis ∧ T.optimalityCriteria

theorem topology_optimization_closed_from_evidence
    {C : ComplianceTensorPackage} (T : TopologyOptimizationPackage C)
    (E : TopologyOptimizationEvidence T) : TopologyOptimizationClosed T := by
  exact And.intro E.objectiveFunctionalClosed
    (And.intro E.volumeConstraintClosed
      (And.intro E.sensitivityAnalysisClosed E.optimalityCriteriaClosed))

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse