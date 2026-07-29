import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.BraidedMonoidalStructure

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure RibbonCategoryStructure (B : BraidedMonoidalStructure) where
  twist : Prop
  ribbonCondition : Prop
  twistNatural : Prop
  twistClosed : twist
  ribbonConditionClosed : ribbonCondition
  twistNaturalClosed : twistNatural

def RibbonCategoryClosed (B : BraidedMonoidalStructure) (R : RibbonCategoryStructure B) : Prop :=
  B.hexagonL ∧ B.hexagonR ∧ B.braidingNatural ∧ R.twist ∧ R.ribbonCondition ∧ R.twistNatural

theorem ribbon_category_closed_from_structure (B : BraidedMonoidalStructure) (R : RibbonCategoryStructure B) :
    RibbonCategoryClosed B R := by
  have hB : B.hexagonL ∧ B.hexagonR ∧ B.braidingNatural := braided_monoidal_structure_closed B
  exact And.intro hB.1 (And.intro hB.2.1 (And.intro hB.2.2 (And.intro R.twistClosed (And.intro R.ribbonConditionClosed R.twistNaturalClosed))))

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse