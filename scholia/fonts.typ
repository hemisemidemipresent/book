// Font roles as fallback lists: the "nice" face first, an embedded face last.
// Typst embeds Libertinus Serif, New Computer Modern (+ Math), DejaVu Sans Mono —
// so every list degrades to something that exists everywhere, zero install.
// (A Typst package cannot ship fonts; downstream users only have embedded +
//  their own system fonts. Missing first choices just warn and fall back.)

#let default-fonts = (
  body: ("Libertinus Serif",),
  math: ("New Computer Modern Math",),
  heading: ("Libertinus Serif",),
  sans: ("Optima",), // the informal "intuition voice"
  // sans: ("Libertinus Serif",), // the informal "intuition voice"
  mono: ("Menlo", "DejaVu Sans Mono"),
  cjk: ("Songti SC",), // appended after body/sans for 中文 glyph fallback
)

// shallow-merge user overrides over the defaults
#let resolve-fonts(overrides) = {
  let f = default-fonts
  if overrides != none {
    for (k, v) in overrides { f.insert(k, v) }
  }
  f
}