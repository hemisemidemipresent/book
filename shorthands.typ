#import "@preview/beautiframe:0.1.0": *
#let warning(content) = remark(content)
#let proof(content) = corollary(content, number: "")

// tree
#import "@preview/tdtr:0.5.4" : *
// tree with circles
#let custom-tree-graph = tidy-tree-graph.with(
  node-inset: 4pt,
  node-width: 1.6em,
  spacing: (15pt, 15pt),
  draw-node: (
    tidy-tree-draws.circle-draw-node,
    tidy-tree-draws.metadata-match-draw-node.with(
      matches: (
        red: (fill: red),
        blue: (fill: blue),
      ),
      default: (fill: black),
    ),
    tidy-tree-draws.label-match-draw-node.with(
      matches: (
        red: (fill: red),
        blue: (fill: blue),
      ),
      default: (fill: black),
    ),
    ((label,)) => (label: text(color.white)[#label], stroke: none),
  ),
  draw-edge: (
    tidy-tree-draws.metadata-match-draw-edge.with(
      matches: (
        red: (stroke: red + 0.6pt),
      ),
      default: (stroke: black + 0.6pt)
    ),
    // tidy-tree-draws.label-match-draw-edge.with(
    //   matches: (
    //     red: (stroke: red + 0.6pt),
    //     nil: (post: x => none),
    //   ),
    //   default: (stroke: black + 0.6pt)
    // ),
    (marks: "-"),
  ),
)
// tree with text
#let text-tree-graph = tidy-tree-graph.with(
    draw-node: (
        tidy-tree-draws.label-match-draw-node.with(
          matches: (
            red: (fill: red),
            blue: (fill: blue),
            black: (fill: black),
          ),
      ),
    ),
    draw-edge: (
        (.., edge-label) => if edge-label != none { (label: text(green)[#edge-label]) },
        (marks: "-", stroke: .5pt),
    ),
    spacing: (1pt, 25pt),
    node-inset: 6pt,
)



// custom styling
#show link: set text(fill: blue, weight: 700)
#show link: underline
#set page(
  // height: auto,
  // fill: rgb("#efEaD2"),
)


#let maroon = color.rgb("#800000")
#let red = color.rgb("#f35667")
#let orange = color.rgb("#f78205")
#let green = color.rgb("#00B600")
#let lightblue = color.rgb("#90D5FF")
#let blue = color.rgb("#0000ff")
#let purple = color.rgb("#a854c1")
#let lilac = color.rgb("#d69dff")
#let pink = color.rgb("#ff6ec7")
// fill shorthands
#let maroonf(content) = text(content, fill:maroon)
#let redf(content) = text(content, fill: red)
#let orangef(content) = text(content, fill: orange)
#let greenf(content) = text(content, fill: green)
#let bluef(content) = text(content, fill: blue)
#let purplef(content) = text(content, fill: purple)
#let pinkf(content) = text(content, fill: pink)
#let lilacf(content) = text(content, fill: lilac)
#let blackf(content) = text(content, fill: black)
#let rainbowf(content) = text(content, fill: gradient.linear(..color.map.rainbow))
// predefined "macros"
#let up = $scripts(arrow.t)$ // knuth up arrow
#let cof = $"cof"$ // cofinality
#let ltx = $scripts(<)_X$ // lesser than (lt) x
#let gtx = $scripts(>)_X$ // greater than (gt) x
#let lty = $scripts(<)_Y$ // lt y
#let gty = $scripts(>)_Y$ // gt y
#let lex = $prec_"lex"$ // lexicographic ordering
#let lexgt = $succ_"lex"$ // gt version of lex
#let lexgteq = $succ.eq_"lex"$ // gt version of lex
// #let slex = $prec_"slex"$

#let sup = $limits(sup)^+$ // override supremum with strict supremum to avoid ambiguity

#let o = $circle.filled$ // used for fixed point


// Ordinals
#let e0 = $epsilon_0$
#let z0 = $zeta_0$
#let G0 = $Gamma_0$
#let SVO = $"SVO"$
// #let SVO.bocf = $psi_0(Omega^Omega^omega)$
#let LVO = $"LVO"$
#let BHO = $psi_0(epsilon_(Omega+1))$
#let BO = $psi_0(Omega_omega)$
#let TFBO = $psi_0(epsilon_(Omega_omega + 1))$
#let EBO = $psi_0(Omega_Omega_dots.down)$

#let Ord = $"Ord"$ // proper class of all ordinals
#let Lim = $"Lim"$ // proper class of all limit ordinals

// Ordinal Notations
#let zero = redf($bold(0)$)
#let plus = redf($+$)
#let wpow(content) = $redf(bold(omega))^#content$
#let OT = $O T$ // set of all ordinal terms
// BOCF Ordinal notations
#let PT = $P T$ // set of principal terms
#let bocf(nu, alpha) = $redf(bold(psi))_#nu redf(\() #alpha redf(\))$
#let ternary(s,t,u) = $#s redf(in) redf(bold(C))_#t redf(\() #u redf(\))$ // s in C_t(u)

// arrow
#import "@preview/xarrow:0.4.0": *