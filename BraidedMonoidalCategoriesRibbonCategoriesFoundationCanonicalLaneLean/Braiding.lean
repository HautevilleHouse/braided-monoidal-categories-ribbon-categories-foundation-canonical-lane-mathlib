import BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.MonoidalCategory

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure BraidedMonoidalCategoryPackage (M : MonoidalCategoryPackage) where
  braiding : (X Y : M.objectType) → M.morphismType
  hexagonIdentities : Prop
  braidingNaturality : Prop

structure BraidedMonoidalCategoryEvidence {M : MonoidalCategoryPackage}
    (B : BraidedMonoidalCategoryPackage M) where
  hexagonClosed : B.hexagonIdentities
  braidingNaturalityClosed : B.braidingNaturality

def BraidedMonoidalCategoryClosed {M : MonoidalCategoryPackage}
    (B : BraidedMonoidalCategoryPackage M) : Prop :=
  B.hexagonIdentities ∧ B.braidingNaturality

theorem braided_monoidal_category_closed_from_evidence
    {M : MonoidalCategoryPackage} (B : BraidedMonoidalCategoryPackage M)
    (E : BraidedMonoidalCategoryEvidence B) : BraidedMonoidalCategoryClosed B := by
  exact And.intro E.hexagonClosed E.braidingNaturalityClosed

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse