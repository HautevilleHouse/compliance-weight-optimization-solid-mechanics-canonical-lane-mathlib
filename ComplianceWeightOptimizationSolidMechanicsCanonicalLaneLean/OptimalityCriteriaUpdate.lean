import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.SensitivityFilter

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure OptimalityCriteriaUpdatePackage {C : ComplianceTensorPackage}
    {T : TopologyOptimizationPackage C}
    {F : FiniteElementDiscretizationPackage C T}
    {S : SensitivityFilterPackage C T F} where
  lagrangianMultiplier : ℝ
  heuristicUpdate : Prop
  convergenceCriterion : Prop
  volumePreserving : Prop
  monotoneDecrease : Prop

structure OptimalityCriteriaUpdateEvidence {C : ComplianceTensorPackage}
    {T : TopologyOptimizationPackage C}
    {F : FiniteElementDiscretizationPackage C T}
    {S : SensitivityFilterPackage C T F}
    (O : OptimalityCriteriaUpdatePackage C T F S) where
  heuristicUpdateClosed : O.heuristicUpdate
  convergenceCriterionClosed : O.convergenceCriterion
  volumePreservingClosed : O.volumePreserving
  monotoneDecreaseClosed : O.monotoneDecrease

def OptimalityCriteriaUpdateClosed {C : ComplianceTensorPackage}
    {T : TopologyOptimizationPackage C}
    {F : FiniteElementDiscretizationPackage C T}
    {S : SensitivityFilterPackage C T F}
    (O : OptimalityCriteriaUpdatePackage C T F S) : Prop :=
  O.heuristicUpdate ∧ O.convergenceCriterion ∧
  O.volumePreserving ∧ O.monotoneDecrease

theorem optimality_criteria_update_closed_from_evidence
    {C : ComplianceTensorPackage} {T : TopologyOptimizationPackage C}
    {F : FiniteElementDiscretizationPackage C T}
    {S : SensitivityFilterPackage C T F}
    (O : OptimalityCriteriaUpdatePackage C T F S)
    (E : OptimalityCriteriaUpdateEvidence O) :
    OptimalityCriteriaUpdateClosed O := by
  exact And.intro E.heuristicUpdateClosed
    (And.intro E.convergenceCriterionClosed
      (And.intro E.volumePreservingClosed E.monotoneDecreaseClosed))

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse