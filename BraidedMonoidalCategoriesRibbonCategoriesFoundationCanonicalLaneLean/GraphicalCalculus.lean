import HautevilleHouse.BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.RibbonCategoryStructure

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure GraphicalCalculusPackage (B : BraidedMonoidalCategoryStruct) (R : RibbonCategoryStruct B) where
  stringDiagrams : Prop
  isotopyInvariance : Prop
  graphicalEvaluation : Prop
  strandAlgebra : Prop

def GraphicalCalculusClosed (B : BraidedMonoidalCategoryStruct) (R : RibbonCategoryStruct B) (G : GraphicalCalculusPackage B R) : Prop :=
  G.stringDiagrams ∧ G.isotopyInvariance ∧ G.graphicalEvaluation ∧ G.strandAlgebra

theorem graphical_calculus_closed_from_evidence (B : BraidedMonoidalCategoryStruct) (R : RibbonCategoryStruct B) (G : GraphicalCalculusPackage B R) (h1 : G.stringDiagrams) (h2 : G.isotopyInvariance) (h3 : G.graphicalEvaluation) (h4 : G.strandAlgebra) : GraphicalCalculusClosed B R G := by
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse