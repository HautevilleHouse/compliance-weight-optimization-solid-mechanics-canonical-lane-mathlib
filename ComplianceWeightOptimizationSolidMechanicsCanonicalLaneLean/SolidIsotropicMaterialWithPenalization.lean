import canonicalLaneMathlib.AdmissibleClass

/-!
# Solid Isotropic Material with Penalization (SIMP) Package
-/

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure SIMPPackage (D : DesignDomain) where
  penalizationPower : Nat
  filteringTechnique : Prop
  intermediateDensityPenalty : Prop
  meshIndependence : Prop
  convergenceToBlackWhite : Prop

structure SIMPEvidence {D : DesignDomain} (S : SIMPPackage D) where
  penalizationPowerClosed : S.penalizationPower
  filteringTechniqueClosed : S.filteringTechnique
  intermediateDensityPenaltyClosed : S.intermediateDensityPenalty
  meshIndependenceClosed : S.meshIndependence
  convergenceToBlackWhiteClosed : S.convergenceToBlackWhite

def SIMPClosed {D : DesignDomain} (S : SIMPPackage D) : Prop :=
  S.penalizationPower ∧ S.filteringTechnique ∧
  S.intermediateDensityPenalty ∧ S.meshIndependence ∧
  S.convergenceToBlackWhite

theorem simp_closed_from_evidence
    {D : DesignDomain} (S : SIMPPackage D)
    (E : SIMPEvidence S) : SIMPClosed S := by
  exact And.intro E.penalizationPowerClosed
    (And.intro E.filteringTechniqueClosed
      (And.intro E.intermediateDensityPenaltyClosed
        (And.intro E.meshIndependenceClosed E.convergenceToBlackWhiteClosed)))

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse