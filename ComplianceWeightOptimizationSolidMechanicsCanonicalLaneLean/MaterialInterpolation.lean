import canonicalLaneMathlib.AdmissibleClass
import ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.ComplianceTopology

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure MaterialInterpolationPackage {C : ComplianceTopology} where
  densityField : C.designDomain → ℝ
  youngModulus : ℝ → ℝ
  penalizationPower : Prop
  intermediateDensityControl : Prop

structure MaterialInterpolationEvidence {C : ComplianceTopology} (M : MaterialInterpolationPackage C) where
  penalizationPowerClosed : M.penalizationPower
  intermediateDensityControlClosed : M.intermediateDensityControl

def MaterialInterpolationClosed {C : ComplianceTopology} (M : MaterialInterpolationPackage C) : Prop :=
  M.penalizationPower ∧ M.intermediateDensityControl

theorem material_interpolation_closed_from_evidence {C : ComplianceTopology} (M : MaterialInterpolationPackage C) (E : MaterialInterpolationEvidence M) : MaterialInterpolationClosed M :=
  And.intro E.penalizationPowerClosed E.intermediateDensityControlClosed

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse