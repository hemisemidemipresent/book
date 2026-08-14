#import "@preview/beautiframe:0.1.0": *
#let warning(content) = remark(content)
#let proof(name: none, content) = corollary(content, number: "", name: name)


// trees
#import "@preview/cetz:0.4.2"
#import "@preview/mannot:0.3.2": mark, annot, annot-cetz
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/tdtr:0.5.5": *
#import "@preview/pinit:0.2.2": pin, pinit-highlight, pinit-point-from

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
)

// spacing
#let zws = [\u{200b}] // zero width space

// Change Math font
#let fira(body) = {
  set text(font: "Fira Math")
  body
}

// Matrix highlighting with `pinit`
// https://github.com/typst/packages/tree/main/packages/preview/pinit/0.2.2
#let pin-matrix(a, b, color: teal, stroke-width: 0.075em) = pinit-highlight(
  a,
  b,
  dx: -0.125em,
  dy: -1em,
  extended-width: 0.25em,
  fill: color.lighten(90%),
  stroke: color + 0.075em,
)

// colors
// #let maroon = color.rgb("#800000")
// #let red = color.rgb("#f85552")
// #let orange = color.rgb("#f78205")
// #let green = color.rgb("#00B600")
#let lightblue = color.rgb("#90D5FF")
// #let blue = color.rgb("#0000ff")
// #let purple = color.rgb("#a854c1")
#let lilac = color.rgb("#d69dff")
#let pink = color.rgb("#ff6ec7")

// fill shorthands
// #let maroonf(content) = text(content, fill:maroon)
#let redf(content) = text(content, fill: red)
#let orangef(content) = text(content, fill: orange)
#let greenf(content) = text(content, fill: green)
#let lightbluef(content) = text(content, fill: aqua)
#let tealf(content) = text(content, fill: teal)
#let bluef(content) = text(content, fill: blue)
#let purplef(content) = text(content, fill: purple)
#let fuchsiaf(content) = text(content, fill: fuchsia)
#let pinkf(content) = text(content, fill: pink)
#let lilacf(content) = text(content, fill: lilac)
#let grayf(content) = text(content, fill: gray)
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
#let zero = $fira(0)$
#let plus = $fira(+)$
#let wpow(content) = $fira(omega)^#content$
#let OT = "OT" // set of all ordinal terms
// BOCF Ordinal notations
#let PT = $P T$ // set of principal terms

// since its buchholz, not extended, we include 0,1,...,omega into the fira math font since these indices are "fixed"
#let bocf = (a, b) => {
  return $fira(psi_#a) fira(\() #b fira(\))$
}
// since its buchholz, not extended, we include subscripts into the fira math font since these indices are "fixed"
#let ternary(s,t,u) = $#s fira(in) fira(C_#t) fira(\() #u fira(\))$
// #let ternary(s,t,u) = $#s redf(sans(in)) redf(bold(sans(C)))_#t redf(\() #u redf(\))$ // s in C_t(u)

// arrow
#import "@preview/xarrow:0.4.0": *

// bms-type trees
#let parent = (row, value, index) => {
  let results = ()
  for (i, v) in row.enumerate() {
    if (v == value - 1 and i < index) {
      results.push((i, v))
    }
  }

  return results.at(results.len() - 1)
}

#let pss = (toprow, bottomrow, ..args) => {
  let NODE_WIDTH = 1.25em

  let nodes = (
    node(
      (-1, 1),
      `+`,
      width: NODE_WIDTH,
      shape: "circle",
      name: label("root"),
    ),
  ) // array of nodes
  let edges = ()
  for (i, height) in toprow.enumerate() {
    let value = bottomrow.at(i)

    // make nodes
    nodes.push(
      node(
        (i, -height),
        width: NODE_WIDTH,
        shape: "circle",
        text(font: "Fira Code")[#value],
        name: label("circle" + str(i)),
      ),
    )

    // make edge
    if (height == 0) {
      let directions = ("r",) * (i + 1) + ("u",)
      let direction_string = directions.intersperse(",").join("")
      edges.push(edge((-1, 1), direction_string))
    } else {
      let (parent_index, parent_value) = parent(toprow, height, i)
      let directions = ("r",) * (i - parent_index) + ("u",)
      let direction_string = directions.intersperse(",").join("")
      edges.push(edge((parent_index, -height + 1), direction_string))
    }
  }

  diagram(
    node-stroke: 1pt,
    edge-stroke: 1pt,
    spacing: (0.8em, 0.4em),
    node-inset: 0.4em,
    edge-corner-radius: 8pt,
    ..nodes,
    ..edges,
    ..args,
  )
}

#let prss = (row, ..args) => {
    pss(row, row, ..args)
}