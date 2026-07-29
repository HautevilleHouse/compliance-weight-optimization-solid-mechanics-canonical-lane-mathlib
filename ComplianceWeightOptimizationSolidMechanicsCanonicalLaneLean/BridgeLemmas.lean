import ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ComplianceWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse