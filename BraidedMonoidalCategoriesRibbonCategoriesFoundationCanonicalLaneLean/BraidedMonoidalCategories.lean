import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure BraidedMonoidalCategory (C : Type u) [Category C] where
  braiding : ∀ (X Y : C), X ⊗ Y ≅ Y ⊗ X
  hexagonL : ∀ (X Y Z : C), (α_ X Y Z).hom ≫ (braiding X (Y ⊗ Z)).hom ≫ (α_ Y Z X).hom =
    ((braiding X Y).hom ▷ Z) ≫ (α_ Y X Z).hom ≫ (Y ◁ (braiding X Z).hom)
  hexagonR : ∀ (X Y Z : C), (α_ X Y Z).inv ≫ (braiding (X ⊗ Y) Z).inv ≫ (α_ Z X Y).inv =
    ((braiding X Z).inv ◁ Y) ≫ (α_ X Z Y).inv ≫ (X ◁ (braiding Y Z).inv)

def BraidedMonoidalCategoryClosed (C : Type u) [Category C] (B : BraidedMonoidalCategory C) : Prop :=
  ∀ (X Y : C), (B.braiding X Y).hom ≫ (B.braiding Y X).hom = 𝟙 (X ⊗ Y) ∧
  (B.braiding Y X).hom ≫ (B.braiding X Y).hom = 𝟙 (Y ⊗ X)

theorem braided_monoidal_category_closed_from_braiding (C : Type u) [Category C] (B : BraidedMonoidalCategory C) :
    BraidedMonoidalCategoryClosed C B := by
  refine fun X Y => ?_
  have h1 : (B.braiding X Y).hom ≫ (B.braiding Y X).hom = 𝟙 (X ⊗ Y) := by
    apply Iso.hom_inv_id
  have h2 : (B.braiding Y X).hom ≫ (B.braiding X Y).hom = 𝟙 (Y ⊗ X) := by
    apply Iso.hom_inv_id
  exact And.intro h1 h2

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse