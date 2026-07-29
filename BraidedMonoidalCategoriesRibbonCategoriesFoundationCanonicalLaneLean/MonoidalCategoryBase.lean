import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure MonoidalCategoryPackage where
  tensorProduct : Type u → Type u → Type u
  unit : Type u
  associator : {X Y Z : Type u} → (tensorProduct (tensorProduct X Y) Z) → (tensorProduct X (tensorProduct Y Z))
  leftUnitor : {X : Type u} → (tensorProduct unit X) → X
  rightUnitor : {X : Type u} → (tensorProduct X unit) → X
  triangleIdentity : Prop
  pentagonIdentity : Prop
  associatorNaturality : Prop
  leftUnitorNaturality : Prop
  rightUnitorNaturality : Prop

structure MonoidalCategoryEvidence (M : MonoidalCategoryPackage) where
  triangleIdentityClosed : M.triangleIdentity
  pentagonIdentityClosed : M.pentagonIdentity
  associatorNaturalityClosed : M.associatorNaturality
  leftUnitorNaturalityClosed : M.leftUnitorNaturality
  rightUnitorNaturalityClosed : M.rightUnitorNaturality

def MonoidalCategoryClosed (M : MonoidalCategoryPackage) : Prop :=
  M.triangleIdentity ∧ M.pentagonIdentity ∧ M.associatorNaturality ∧
  M.leftUnitorNaturality ∧ M.rightUnitorNaturality

theorem monoidal_category_closed_from_evidence (M : MonoidalCategoryPackage) (E : MonoidalCategoryEvidence M) :
    MonoidalCategoryClosed M := by
  exact And.intro E.triangleIdentityClosed
    (And.intro E.pentagonIdentityClosed
      (And.intro E.associatorNaturalityClosed
        (And.intro E.leftUnitorNaturalityClosed E.rightUnitorNaturalityClosed)))

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse