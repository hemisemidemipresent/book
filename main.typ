// editorial notes:
// - sections with [WIP] are work in progress/needs help
// - := usage not standardized for definitions

// packages for textbook-like formatting of chapters and sections
#import "@preview/beautitled:0.1.0": *
#beautitled-setup(
  style: "modern",
  chapter-prefix: "Chapter",
  chapter-pagebreak: true,
  section-below: 1em,
)
#show: beautitled-init

// package for textbook-like formatting of defintions, theorems, lemmas, examples etc
#import "@preview/beautiframe:0.1.0": *
#let spacing = 0em
#beautiframe-setup(
  style: "colorful",
  theorem-variant: "accent",
  definition-variant: "accent",
  proposition-variant: "accent",
  corollary-variant: "accent",
  lemma-variant: "accent",

  definition-above: spacing,
  definition-below: spacing,
  example-above: spacing,
  example-below: spacing,
  proposition-above: spacing,
  proposition-below: spacing,
  // proof-above: spacing,
  // proof-below: spacing,
  remark-above: spacing,
  remark-below: spacing,
  corollary-above: spacing,
  corollary-below: spacing,
  lemma-above: spacing,
  lemma-below: spacing,
  theorem-above: spacing,
  theorem-below: spacing,

  // we change remark to warning
  remark-variant: "accent",
  remark-color: rgb("#f35667"),
  remark-label: "WARNING",

  // we change corollary to proof, there is a proof in beautiframe but its not customizable
  corollary-label: [_Proof_],
)

#set page(numbering: "1")


// actual layout starts here
#align(center)[
  #text(size:4em)[Ordinal Googology]
]
#beautitled-toc(title: "Contents")
#pagebreak()

// link styling only after contents so it doesnt get affected
#show link: set text(fill: blue)
#show link: underline

#include "chapters/01_introduction.typ"
#include "chapters/02_hyperoperators.typ"
#include "chapters/03_intro_to_ordinals.typ"
#include "chapters/04_fgh.typ"
#include "chapters/05_formal_ordinals.typ"
#include "chapters/06_ordinal_notations.typ"
#include "chapters/07_veblen.typ"
#include "chapters/08_buchholz_ocf.typ"
#include "chapters/09_buchholz_on.typ"
#include "chapters/10_bms.typ"
