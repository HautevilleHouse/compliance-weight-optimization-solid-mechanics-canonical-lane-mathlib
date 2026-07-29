import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.TopologyOptimization

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure FiniteElementDiscretizationPackage {C : ComplianceTensorPackage}
    {T : TopologyOptimizationPackage C} where
  mesh : Type u
  elementType : Type v
  shapeFunctions : Prop
  stiffnessMatrixAssembly : Prop
  loadVector : Prop
  displacementSolution : Prop

structure FiniteElementDiscretizationEvidence {C : ComplianceTensorPackage}
    {T : TopologyOptimizationPackage C}
    (F : FiniteElementDiscretizationPackage C T) where
  shapeFunctionsClosed : F.shapeFunctions
  stiffnessMatrixAssemblyClosed : F.stiffnessMatrixAssembly
  loadVectorClosed : F.loadVector
  displacementSolutionClosed : F.displacementSolution

def FiniteElementDiscretizationClosed {C : ComplianceTensorPackage}
    {T : TopologyOptimizationPackage C}
    (F : FiniteElementDiscretizationPackage C T) : Prop :=
  F.shapeFunctions ∧ F.stiffnessMatrixAssembly ∧
  F.loadVector ∧ F.displacementSolution

theorem finite_element_discretization_closed_from_evidence
    {C : ComplianceTensorPackage} {T : TopologyOptimizationPackage C}
    (F : FiniteElementDiscretizationPackage C T)
    (E : FiniteElementDiscretizationEvidence F) :
    FiniteElementDiscretizationClosed F := by
  exact And.intro E.shapeFunctionsClosed
    (And.intro E.stiffnessMatrixAssemblyClosed
      (And.intro E.loadVectorClosed E.displacementSolutionClosed))

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse