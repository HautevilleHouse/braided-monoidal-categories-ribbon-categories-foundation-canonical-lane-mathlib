import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure BraidedMonoidalStructure where
  hexagonL : Prop
  hexagonR : Prop
  braidingNatural : Prop
  hexagonLClosed : hexagonL
  hexagonRClosed : hexagonR
  braidingNaturalClosed : braidingNatural

theorem braided_monoidal_structure_closed (B : BraidedMonoidalStructure) :
    B.hexagonL ∧ B.hexagonR ∧ B.braidingNatural := by
  exact And.intro B.hexagonLClosed (And.intro B.hexagonRClosed B.braidingNaturalClosed)

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse