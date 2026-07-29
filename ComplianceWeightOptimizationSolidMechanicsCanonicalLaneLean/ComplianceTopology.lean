import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure ComplianceTopology where
  designDomain : Type u
  boundaryConditions : Prop
  loadApplication : Prop
  topology : TopologicalSpace designDomain

def ComplianceAdmittedObject where
  topology : ComplianceTopology
  complianceDefined : Prop
  weightConstraint : Prop
  optimizationWellPosed : Prop
  conclusion : optimizationWellPosed

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse