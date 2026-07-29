import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  RibbonCategoryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse