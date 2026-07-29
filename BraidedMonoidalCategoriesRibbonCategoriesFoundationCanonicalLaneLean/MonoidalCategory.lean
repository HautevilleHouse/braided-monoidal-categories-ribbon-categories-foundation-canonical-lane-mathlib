import BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure MonoidalCategoryPackage where
  objectType : Type u
  morphismType : Type v
  tensorProduct : objectType → objectType → objectType
  tensorUnit : objectType
  associator : (X Y Z : objectType) → morphismType
  leftUnitor : (X : objectType) → morphismType
  rightUnitor : (X : objectType) → morphismType
  pentagonCondition : Prop
  triangleCondition : Prop

structure MonoidalCategoryEvidence (M : MonoidalCategoryPackage) where
  pentagonClosed : M.pentagonCondition
  triangleClosed : M.triangleCondition

def MonoidalCategoryClosed (M : MonoidalCategoryPackage) : Prop :=
  M.pentagonCondition ∧ M.triangleCondition

theorem monoidal_category_closed_from_evidence
    (M : MonoidalCategoryPackage) (E : MonoidalCategoryEvidence M) :
    MonoidalCategoryClosed M := by
  exact And.intro E.pentagonClosed E.triangleClosed

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse