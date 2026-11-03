
#import "scholia/lib.typ": *

#let theme = "dark"
#show: scholia.with(
  theme: theme,   // light (default) | dark (slate)
  // prose: "book",   // notes (default) | book (first-line indent, tight)
)

#cover(
  "Ordinal Googology",
  subtitle: "The mathematics behind the strength of googological systems",
  author: "hemidemisemipresent",
  date: "2026"
  // kicker: "Optimization · Notebook 4",
)

#set page(
  numbering: "1",
)

// Table of Contents
#show outline.entry.where(level: 1): set text(fill: palettes.dark.def, weight: "bold", size: 14pt)
#show outline.entry.where(level: 2): set text(size: 12pt)
#show outline.entry.where(level: 3): set text(fill: gray)
#outline()

// link styling only after contents so it doesnt get affected

#show link: set text(fill: aqua)
#show link: underline

#include "chapters/01_introduction.typ"
#include "chapters/02_hyperoperators.typ"
#include "chapters/03_intro_to_ordinals.typ"
#include "chapters/04_fgh.typ"
#include "chapters/05_formal_ordinals.typ"
#include "chapters/06_ordinal_notations.typ"
#include "chapters/07_veblen.typ"
#include "chapters/12_formal_cardinals.typ"
#include "chapters/08_buchholz_ocf.typ"
#include "chapters/09_buchholz_on.typ"
#include "chapters/10_extended_buchholz.typ"
#include "chapters/11_intro_to_bms.typ"
