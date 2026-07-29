import HautevilleHouse.BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.BraidedMonoidalCategoryStructure

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure RibbonCategoryStruct (B : BraidedMonoidalCategoryStruct) where
  twist : ∀ A : B.Obj, B.tensor A A → B.tensor A A
  twistNaturality : Prop
  ribbonCondition : ∀ A : B.Obj, B.braiding A A ∘ twist A ∘ B.braiding A A = twist A
  twistCompatibilityWithUnit : twist B.unit = id

def RibbonCategoryClosed (B : BraidedMonoidalCategoryStruct) (R : RibbonCategoryStruct B) : Prop :=
  R.twistNaturality ∧ R.ribbonCondition ∧ R.twistCompatibilityWithUnit

theorem ribbon_category_closed_from_evidence (B : BraidedMonoidalCategoryStruct) (R : RibbonCategoryStruct B) (h1 : R.twistNaturality) (h2 : R.ribbonCondition) (h3 : R.twistCompatibilityWithUnit) : RibbonCategoryClosed B R := by
  exact And.intro h1 (And.intro h2 h3)

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse