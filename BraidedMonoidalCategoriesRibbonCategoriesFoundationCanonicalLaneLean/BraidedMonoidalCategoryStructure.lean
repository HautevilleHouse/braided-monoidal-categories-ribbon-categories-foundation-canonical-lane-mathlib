import HautevilleHouse.BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure BraidedMonoidalCategoryStruct where
  Obj : Type u
  tensor : Obj → Obj → Obj
  unit : Obj
  associator : ∀ A B C : Obj, tensor (tensor A B) C → tensor A (tensor B C)
  leftUnitor : ∀ A : Obj, tensor unit A → A
  rightUnitor : ∀ A : Obj, tensor A unit → A
  braiding : ∀ A B : Obj, tensor A B → tensor B A
  braidingNaturality : Prop
  hexagonForward : Prop
  hexagonReverse : Prop

def BraidedMonoidalCategoryClosed (B : BraidedMonoidalCategoryStruct) : Prop :=
  B.braidingNaturality ∧ B.hexagonForward ∧ B.hexagonReverse

theorem braided_monoidal_category_closed_from_evidence (B : BraidedMonoidalCategoryStruct) (h1 : B.braidingNaturality) (h2 : B.hexagonForward) (h3 : B.hexagonReverse) : BraidedMonoidalCategoryClosed B := by
  exact And.intro h1 (And.intro h2 h3)

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse