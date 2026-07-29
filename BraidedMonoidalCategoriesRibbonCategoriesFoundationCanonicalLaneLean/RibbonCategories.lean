import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.BraidedMonoidalCategories

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure RibbonCategory (C : Type u) [Category C] (B : BraidedMonoidalCategory C) where
  twist : ∀ (X : C), X ≅ X
  ribbonCondition : ∀ (X Y : C), (twist (X ⊗ Y)).hom = (twist X).hom ⊗ (twist Y).hom ≫ (B.braiding Y X).hom ≫ (twist Y).hom ⊗ (twist X).hom ≫ (B.braiding X Y).hom
  twistCompatibility : ∀ (X : C), (B.braiding X X).hom ≫ (twist X).hom ⊗ (twist X).hom = (twist X).hom ⊗ (twist X).hom ≫ (B.braiding X X).hom

def RibbonCategoryClosed (C : Type u) [Category C] (B : BraidedMonoidalCategory C) (R : RibbonCategory C B) : Prop :=
  ∀ (X : C), (R.twist X).hom ≫ (R.twist X).inv = 𝟙 X ∧ (R.twist X).inv ≫ (R.twist X).hom = 𝟙 X

theorem ribbon_category_closed_from_twist (C : Type u) [Category C] (B : BraidedMonoidalCategory C) (R : RibbonCategory C B) :
    RibbonCategoryClosed C B R := by
  intro X
  exact And.intro (Iso.hom_inv_id (R.twist X)) (Iso.inv_hom_id (R.twist X))

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse