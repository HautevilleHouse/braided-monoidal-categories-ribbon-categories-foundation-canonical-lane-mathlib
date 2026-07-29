import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.BraidedMonoidalCategories

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure RightDual (C : Type u) [Category C] (X Y : C) where
  eval : Y ⊗ X ⟶ 𝟙_C
  coeval : 𝟙_C ⟶ X ⊗ Y
  triangle : (coeval ▷ X) ≫ (α_ X Y X).hom ≫ (X ◁ eval) = 𝟙 X
  triangle' : (Y ◁ coeval) ≫ (α_ Y X Y).inv ≫ (eval ▷ Y) = 𝟙 Y

structure LeftDual (C : Type u) [Category C] (X Y : C) where
  eval : X ⊗ Y ⟶ 𝟙_C
  coeval : 𝟙_C ⟶ Y ⊗ X
  triangle : (X ◁ coeval) ≫ (α_ X Y X).inv ≫ (eval ▷ X) = 𝟙 X
  triangle' : (coeval ▷ Y) ≫ (α_ Y X Y).hom ≫ (Y ◁ eval) = 𝟙 Y

def HasRightDuals (C : Type u) [Category C] : Prop :=
  ∀ (X : C), ∃ (Y : C), Nonempty (RightDual C X Y)

def HasLeftDuals (C : Type u) [Category C] : Prop :=
  ∀ (X : C), ∃ (Y : C), Nonempty (LeftDual C X Y)

theorem right_dual_implies_left_dual (C : Type u) [Category C] (B : BraidedMonoidalCategory C) (h : HasRightDuals C) : HasLeftDuals C := by
  intro X
  rcases h X with ⟨Y, ⟨rd⟩⟩
  refine ⟨Y, ?_
  

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse