import ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

deriving Repr, DecidableEq

end ComplianceWeightOptimizationSolidMechanicsCanonicalLaneLean
end HautevilleHouse