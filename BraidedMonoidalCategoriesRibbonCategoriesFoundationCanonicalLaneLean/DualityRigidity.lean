import canonicalLaneMathlib.AdmissibleClass
import BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.RibbonCategoryStructure

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure DualityEvidence (R : RibbonCategory) where
  unitCounit : ∀ X : R.C, (R.unit → R.tensor X (R.dual X)) × (R.tensor (R.dual X) X → R.unit)
  snakeEquations : ∀ X : R.C, (R.tensor (R.dual X) (R.unit)) ∘ (R.tensor (R.dual X) (unitCounit.1 X)) = R.id (R.tensor (R.dual X) X)
  rigidity : ∀ X : R.C, IsRigid X

structure RigidityEvidence {R : RibbonCategory} (D : DualityEvidence R) where
  unitCounitClosed : D.unitCounit
  snakeEquationsClosed : D.snakeEquations
  rigidityClosed : D.rigidity

def RigidityClosed {R : RibbonCategory} (D : DualityEvidence R) : Prop :=
  D.unitCounit ∧ D.snakeEquations ∧ D.rigidity

theorem rigidity_closed_from_evidence {R : RibbonCategory}
    (D : DualityEvidence R) (E : RigidityEvidence D) : RigidityClosed D := by
  exact And.intro E.unitCounitClosed
    (And.intro E.snakeEquationsClosed E.rigidityClosed)

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse