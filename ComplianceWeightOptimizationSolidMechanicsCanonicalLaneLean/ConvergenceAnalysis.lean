import canonicalLaneMathlib.AdmissibleClass
import ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.OptimizationAlgorithm

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure ConvergenceAnalysisPackage {C : ComplianceTopology} {S : SensitivityPackage C} {O : OptimizationAlgorithmPackage C S} where
  monotonicDecrease : Prop
  stationaryPointCondition : Prop
  meshIndependence : Prop

structure ConvergenceAnalysisEvidence {C : ComplianceTopology} {S : SensitivityPackage C} {O : OptimizationAlgorithmPackage C S} (K : ConvergenceAnalysisPackage C S O) where
  monotonicDecreaseClosed : K.monotonicDecrease
  stationaryPointConditionClosed : K.stationaryPointCondition
  meshIndependenceClosed : K.meshIndependence

def ConvergenceAnalysisClosed {C : ComplianceTopology} {S : SensitivityPackage C} {O : OptimizationAlgorithmPackage C S} (K : ConvergenceAnalysisPackage C S O) : Prop :=
  K.monotonicDecrease ∧ K.stationaryPointCondition ∧ K.meshIndependence

theorem convergence_analysis_closed_from_evidence {C : ComplianceTopology} {S : SensitivityPackage C} {O : OptimizationAlgorithmPackage C S} (K : ConvergenceAnalysisPackage C S O) (E : ConvergenceAnalysisEvidence K) : ConvergenceAnalysisClosed K :=
  And.intro E.monotonicDecreaseClosed (And.intro E.stationaryPointConditionClosed E.meshIndependenceClosed)

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse