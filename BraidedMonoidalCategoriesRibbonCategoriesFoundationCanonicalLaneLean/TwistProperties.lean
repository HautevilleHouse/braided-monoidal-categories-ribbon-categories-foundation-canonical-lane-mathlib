import canonicalLaneMathlib.AdmissibleClass
import BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.RibbonCategoryStructure

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure TwistPropertyPackage (R : RibbonCategory) where
  balancingIdentity : ∀ X Y : R.C, R.twist (R.tensor X Y) = (R.tensor (R.twist X) (R.twist Y)) ∘ (R.braiding X Y) ∘ (R.braiding Y X)
  twistInvolutive : ∀ X : R.C, R.twist X ∘ R.twist X = R.id X
  naturalityTransparent : ∀ (f : X → Y), R.twist Y ∘ f = f ∘ R.twist X

structure TwistPropertyEvidence {R : RibbonCategory} (T : TwistPropertyPackage R) where
  balancingIdentityClosed : T.balancingIdentity
  twistInvolutiveClosed : T.twistInvolutive
  naturalityTransparentClosed : T.naturalityTransparent

def TwistPropertyClosed {R : RibbonCategory} (T : TwistPropertyPackage R) : Prop :=
  T.balancingIdentity ∧ T.twistInvolutive ∧ T.naturalityTransparent

theorem twist_property_closed_from_evidence {R : RibbonCategory}
    (T : TwistPropertyPackage R) (E : TwistPropertyEvidence T) : TwistPropertyClosed T := by
  exact And.intro E.balancingIdentityClosed
    (And.intro E.twistInvolutiveClosed E.naturalityTransparentClosed)

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse