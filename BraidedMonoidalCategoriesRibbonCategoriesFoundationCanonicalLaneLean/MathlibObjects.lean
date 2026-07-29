import BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.FinalTheorem
import Mathlib.CategoryTheory.Monoidal.Braided

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

open Mathlib.CategoryTheory

structure RibbonAdmittedObject where
  category : Type u
  [instMonoidal : MonoidalCategory category]
  [instBraided : BraidedCategory category]
  [instRibbon : RibbonCategory category]
  conclusion : RibbonCategory category

def RibbonWitnessClosed (O : RibbonAdmittedObject) : Prop :=
  O.conclusion

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse