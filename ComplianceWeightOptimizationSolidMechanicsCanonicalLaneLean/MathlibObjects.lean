import ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ComplianceSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ComplianceAdmittedObject where
  space : ComplianceSpace
  linearElasticBody : Prop
  complianceFunctionalDefined : Prop
  loadCase : Type
  loadTopology : TopologicalSpace loadCase
  weightMinimized : Prop
  conclusion : weightMinimized

structure ComplianceEndgameState where
  object : ComplianceAdmittedObject

def ComplianceWitnessClosed (O : ComplianceAdmittedObject) : Prop :=
  O.weightMinimized

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse