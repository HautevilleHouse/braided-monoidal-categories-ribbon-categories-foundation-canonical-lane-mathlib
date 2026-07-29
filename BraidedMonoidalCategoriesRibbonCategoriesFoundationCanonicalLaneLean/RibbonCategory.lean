import BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.Braiding

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure RibbonCategoryPackage {M : MonoidalCategoryPackage}
    (B : BraidedMonoidalCategoryPackage M) where
  twist : (X : M.objectType) → M.morphismType
  ribbonCondition : Prop
  balancingCondition : Prop

structure RibbonCategoryEvidence {M : MonoidalCategoryPackage}
    {B : BraidedMonoidalCategoryPackage M} (R : RibbonCategoryPackage B) where
  ribbonConditionClosed : R.ribbonCondition
  balancingConditionClosed : R.balancingCondition

def RibbonCategoryClosed {M : MonoidalCategoryPackage}
    {B : BraidedMonoidalCategoryPackage M} (R : RibbonCategoryPackage B) : Prop :=
  R.ribbonCondition ∧ R.balancingCondition

theorem ribbon_category_closed_from_evidence
    {M : MonoidalCategoryPackage} {B : BraidedMonoidalCategoryPackage M}
    (R : RibbonCategoryPackage B) (E : RibbonCategoryEvidence R) :
    RibbonCategoryClosed R := by
  exact And.intro E.ribbonConditionClosed E.balancingConditionClosed

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse