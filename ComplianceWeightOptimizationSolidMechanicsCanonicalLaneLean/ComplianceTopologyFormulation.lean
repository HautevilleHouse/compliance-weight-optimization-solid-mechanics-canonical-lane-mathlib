import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure ComplianceTopologyDesign (Ω : Type) where
  designDomain : Set Ω
  materialDistribution : Ω → ℝ
  youngModulus : ℝ
  poissonRatio : ℝ
  loadVector : Ω → ℝᵛ
  boundaryConditions : Ω → ℝᵛ

structure ComplianceFunctional (d : ComplianceTopologyDesign Ω) where
  strainEnergy : ℝ
  workDone : ℝ
  complianceValue : ℝ := strainEnergy
  sensitivity : Ω → ℝ

def ComplianceClosed (d : ComplianceTopologyDesign Ω) : Prop :=
  d.youngModulus > 0 ∧ d.poissonRatio ≥ 0 ∧ d.poissonRatio < 0.5

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse