import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure BraidedCategoryData where
  carrier : Type u
  tensorProduct : carrier → carrier → carrier
  unitObject : carrier
  associator : ∀ a b c : carrier, (tensorProduct (tensorProduct a b) c) ≅ tensorProduct a (tensorProduct b c)
  leftUnitor : ∀ a : carrier, tensorProduct unitObject a ≅ a
  rightUnitor : ∀ a : carrier, tensorProduct a unitObject ≅ a
  braiding : ∀ a b : carrier, tensorProduct a b ≅ tensorProduct b a
  pentagonEquation : Prop
  triangleEquation : Prop
  hexagonEquation1 : Prop
  hexagonEquation2 : Prop

structure BraidedCategoryEvidence (B : BraidedCategoryData) where
  pentagonClosed : B.pentagonEquation
  triangleClosed : B.triangleEquation
  hexagon1Closed : B.hexagonEquation1
  hexagon2Closed : B.hexagonEquation2

def BraidedCategoryClosed (B : BraidedCategoryData) : Prop :=
  B.pentagonEquation ∧ B.triangleEquation ∧ B.hexagonEquation1 ∧ B.hexagonEquation2

theorem braided_category_closed_from_evidence (B : BraidedCategoryData) (E : BraidedCategoryEvidence B) :
    BraidedCategoryClosed B := by
  exact And.intro E.pentagonClosed (And.intro E.triangleClosed (And.intro E.hexagon1Closed E.hexagon2Closed))

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse