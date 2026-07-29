import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure RibbonCategoryData (B : BraidedCategoryData) where
  leftDuality : ∀ a : B.carrier, ∃ a' : B.carrier, Unit → B.tensorProduct a' a
  rightDuality : ∀ a : B.carrier, ∃ a' : B.carrier, Unit → B.tensorProduct a a'
  twist : ∀ a : B.carrier, B.tensorProduct a (B.unitObject) ≅ B.tensorProduct a (B.unitObject)
  twistNatural : Prop
  ribbonCondition : ∀ a : B.carrier, twist (B.braiding a a) = twist (B.braiding a a)⁻¹
  balancedCondition : Prop

structure RibbonCategoryEvidence {B : BraidedCategoryData} (R : RibbonCategoryData B) where
  twistNaturalClosed : R.twistNatural
  ribbonConditionClosed : R.ribbonCondition
  balancedConditionClosed : R.balancedCondition

def RibbonCategoryClosed {B : BraidedCategoryData} (R : RibbonCategoryData B) : Prop :=
  R.twistNatural ∧ R.ribbonCondition ∧ R.balancedCondition

theorem ribbon_category_closed_from_evidence {B : BraidedCategoryData} (R : RibbonCategoryData B) (E : RibbonCategoryEvidence R) :
    RibbonCategoryClosed R := by
  exact And.intro E.twistNaturalClosed (And.intro E.ribbonConditionClosed E.balancedConditionClosed)

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse