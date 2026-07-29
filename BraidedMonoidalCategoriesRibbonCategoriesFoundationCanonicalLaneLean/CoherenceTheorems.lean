import canonicalLaneMathlib.AdmissibleClass
import BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.BraidedMonoidalStructure

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure CoherencePackage (B : BraidedMonoidalCategory) where
  braidedCoherence : ∀ (X Y Z : B.C), (B.braiding X (B.tensor Y Z)) ∘ (B.braiding X Y) = (B.tensor (B.braiding X Y) Z) ∘ (B.braiding (B.tensor X Y) Z)
  hexagonCondition : Prop
  macLaneCoherence : Prop

structure CoherenceEvidence {B : BraidedMonoidalCategory} (C : CoherencePackage B) where
  braidedCoherenceClosed : C.braidedCoherence
  hexagonConditionClosed : C.hexagonCondition
  macLaneCoherenceClosed : C.macLaneCoherence

def CoherenceClosed {B : BraidedMonoidalCategory} (C : CoherencePackage B) : Prop :=
  C.braidedCoherence ∧ C.hexagonCondition ∧ C.macLaneCoherence

theorem coherence_closed_from_evidence {B : BraidedMonoidalCategory}
    (C : CoherencePackage B) (E : CoherenceEvidence C) : CoherenceClosed C := by
  exact And.intro E.braidedCoherenceClosed
    (And.intro E.hexagonConditionClosed E.macLaneCoherenceClosed)

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse