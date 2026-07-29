import canonicalLaneMathlib.AdmissibleClass
import ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.ComplianceTopologyOptimization
import ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.SolidIsotropicMaterialWithPenalization

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

def ConstrainedComplianceWeightClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_compliance_weight_endgame (A : AdmissibleClass) :
    ConstrainedComplianceWeightClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse