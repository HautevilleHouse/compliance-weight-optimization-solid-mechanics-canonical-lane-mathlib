import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure AdmissibleClass where
  object : ComplianceAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ComplianceWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse