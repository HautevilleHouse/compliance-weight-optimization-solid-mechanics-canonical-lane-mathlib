import canonicalLaneMathlib.AdmissibleClass
import ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.SensitivityAnalysis

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure OptimizationAlgorithmPackage {C : ComplianceTopology} {S : SensitivityPackage C} where
  updateScheme : Prop
  convergenceCriterion : Prop
  moveLimit : Prop

structure OptimizationAlgorithmEvidence {C : ComplianceTopology} {S : SensitivityPackage C} (O : OptimizationAlgorithmPackage C S) where
  updateSchemeClosed : O.updateScheme
  convergenceCriterionClosed : O.convergenceCriterion
  moveLimitClosed : O.moveLimit

def OptimizationAlgorithmClosed {C : ComplianceTopology} {S : SensitivityPackage C} (O : OptimizationAlgorithmPackage C S) : Prop :=
  O.updateScheme ∧ O.convergenceCriterion ∧ O.moveLimit

theorem optimization_algorithm_closed_from_evidence {C : ComplianceTopology} {S : SensitivityPackage C} (O : OptimizationAlgorithmPackage C S) (E : OptimizationAlgorithmEvidence O) : OptimizationAlgorithmClosed O :=
  And.intro E.updateSchemeClosed (And.intro E.convergenceCriterionClosed E.moveLimitClosed)

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse