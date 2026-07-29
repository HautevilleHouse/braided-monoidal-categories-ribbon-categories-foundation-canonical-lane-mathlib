import HautevilleHouse.BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean.GraphicalCalculus

namespace HautevilleHouse
namespace BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean

structure QuantumTracePackage (B : BraidedMonoidalCategoryStruct) (R : RibbonCategoryStruct B) (G : GraphicalCalculusPackage B R) where
  traceMap : ∀ A : B.Obj, B.tensor (B.tensor A (B.unit)) (B.tensor (B.unit) A) → B.unit
  traceCompatibility : Prop
  quantumDimension : ∀ A : B.Obj, B.unit → B.unit
  ribbonTraceFormula : Prop

def QuantumTraceClosed (B : BraidedMonoidalCategoryStruct) (R : RibbonCategoryStruct B) (G : GraphicalCalculusPackage B R) (Q : QuantumTracePackage B R G) : Prop :=
  Q.traceCompatibility ∧ Q.ribbonTraceFormula

theorem quantum_trace_closed_from_evidence (B : BraidedMonoidalCategoryStruct) (R : RibbonCategoryStruct B) (G : GraphicalCalculusPackage B R) (Q : QuantumTracePackage B R G) (h1 : Q.traceCompatibility) (h2 : Q.ribbonTraceFormula) : QuantumTraceClosed B R G Q := by
  exact And.intro h1 h2

end BraidedMonoidalCategoriesRibbonCategoriesFoundationCanonicalLaneLean
end HautevilleHouse