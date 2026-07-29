import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

def ConstrainedRibbonClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ribbon_endgame (A : AdmissibleClass) :
    ConstrainedRibbonClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse