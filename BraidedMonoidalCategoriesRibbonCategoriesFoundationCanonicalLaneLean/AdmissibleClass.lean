import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : RibbonCategoryObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  RibbonCategoryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse