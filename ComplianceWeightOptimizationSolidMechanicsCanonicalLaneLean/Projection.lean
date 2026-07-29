import ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def complianceProjection : Projection ComplianceEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem compliance_projection_idempotent (x : ComplianceEndgameState) :
    complianceProjection.toFun (complianceProjection.toFun x) = complianceProjection.toFun x := by
  exact complianceProjection.idempotent x

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse