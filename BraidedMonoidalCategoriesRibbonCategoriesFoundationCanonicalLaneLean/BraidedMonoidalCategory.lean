import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure BraidedMonoidalCategory (C : Type u) [Category C] where
  tensorProduct : C × C → C
  tensorUnit : C
  associator : ∀ (X Y Z : C), (tensorProduct (tensorProduct (X, Y), Z)) ≅ tensorProduct (X, tensorProduct (Y, Z))
  leftUnitor : ∀ (X : C), tensorProduct (tensorUnit, X) ≅ X
  rightUnitor : ∀ (X : C), tensorProduct (X, tensorUnit) ≅ X
  braiding : ∀ (X Y : C), tensorProduct (X, Y) ≅ tensorProduct (Y, X)
  pentagonCondition : Prop
  triangleCondition : Prop
  hexagonCondition : Prop
  braidingNaturality : Prop

structure BraidedMonoidalEvidence (C : Type u) [Category C] (B : BraidedMonoidalCategory C) where
  pentagonConditionClosed : B.pentagonCondition
  triangleConditionClosed : B.triangleCondition
  hexagonConditionClosed : B.hexagonCondition
  braidingNaturalityClosed : B.braidingNaturality

def BraidedMonoidalClosed (C : Type u) [Category C] (B : BraidedMonoidalCategory C) : Prop :=
  B.pentagonCondition ∧ B.triangleCondition ∧ B.hexagonCondition ∧ B.braidingNaturality

theorem braided_monoidal_closed_from_evidence (C : Type u) [Category C] (B : BraidedMonoidalCategory C)
    (E : BraidedMonoidalEvidence C B) : BraidedMonoidalClosed C B := by
  exact And.intro E.pentagonConditionClosed (And.intro E.triangleConditionClosed (And.intro E.hexagonConditionClosed E.braidingNaturalityClosed))

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse