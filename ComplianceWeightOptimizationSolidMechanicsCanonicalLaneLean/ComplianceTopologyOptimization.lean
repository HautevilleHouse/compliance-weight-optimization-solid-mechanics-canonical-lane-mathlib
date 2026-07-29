import canonicalLaneMathlib.AdmissibleClass

/-!
# Topology Optimization for Compliance Minimization Package
-/

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure ComplianceTopologyPackage (D : DesignDomain) where
  designVariableField : Type u
  volumeConstraint : Prop
  complianceFunctional : Type v
  sensitivityFiltered : Prop
  optimalityConditions : Prop
  convergenceCriterion : Prop

structure ComplianceTopologyEvidence {D : DesignDomain} (C : ComplianceTopologyPackage D) where
  volumeConstraintClosed : C.volumeConstraint
  complianceFunctionalDefined : C.complianceFunctional
  sensitivityFilteredClosed : C.sensitivityFiltered
  optimalityConditionsClosed : C.optimalityConditions
  convergenceCriterionClosed : C.convergenceCriterion

def ComplianceTopologyClosed {D : DesignDomain} (C : ComplianceTopologyPackage D) : Prop :=
  C.volumeConstraint ∧ C.complianceFunctional ∧
  C.sensitivityFiltered ∧ C.optimalityConditions ∧
  C.convergenceCriterion

theorem compliance_topology_closed_from_evidence
    {D : DesignDomain} (C : ComplianceTopologyPackage D)
    (E : ComplianceTopologyEvidence C) : ComplianceTopologyClosed C := by
  exact And.intro E.volumeConstraintClosed
    (And.intro E.complianceFunctionalDefined
      (And.intro E.sensitivityFilteredClosed
        (And.intro E.optimalityConditionsClosed E.convergenceCriterionClosed)))

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse