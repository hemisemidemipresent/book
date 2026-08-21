
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
  // date: datetime.today().display("[month repr:long] [day], [year]"),
  date: "2026"
  // kicker: "Optimization · Notebook 4",
)

#set page(
  numbering: "1",
  // fill: rgb("#f3ead3")
)

#outline()
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
#include "chapters/10_extended_buchholz.typ"
// #include "chapters/11_intro_to_bms.typ"
