#import "../shorthands.typ": *
= Introduction to the Bashicu Matrix System
So far we have considered both the Primitive Sequence System (PrSS) and the Pair Sequence System (PSS).
We can generalize this to any number of rows as part of the *Bashicu Matrix System*, invented by a wikia (now fandom) user Bashicu in 2014.

== Root-finding rule

In PSS, we have the rule that 1-ancestors is only considered among 0-ancestors.
In general, $n+1$-ancestors are only selected among $n$-ancestors.

So to find the bad root of the last column in this matrix:

$
  mat(
    0,1,2,3,1,2,bold(3);
    0,1,2,2,1,2,bold(2);
    0,1,2,2,0,1,bold(1)
  )
$

We first identify the columns who are 0-ancestors of the last column:

$
  mat(
    redf(0),cancel(1),cancel(2),cancel(3),redf(1),redf(2),bold(3);
    0,cancel(1),cancel(2),cancel(2),1,2,bold(2);
    0,cancel(1),cancel(2),cancel(2),0,1,bold(1)
  )
$

Then identify columns who are 1-ancestors of the last column:

$
  mat(
    redf(0),grayf(cancel(1)),grayf(cancel(2)),grayf(cancel(3)),redf(1),redf(2),bold(3);
    redf(0),grayf(cancel(1)),grayf(cancel(2)),grayf(cancel(2)),redf(1),cancel(2),bold(2);
    0,grayf(cancel(1)),grayf(cancel(2)),grayf(cancel(2)),0,cancel(1),bold(1)
  )
$

Then identify columns that are 2-ancestors of the last column:

$
  mat(
    redf(0),grayf(cancel(1)),grayf(cancel(2)),grayf(cancel(3)),redf(1),redf(2),bold(3);
    redf(0),grayf(cancel(1)),grayf(cancel(2)),grayf(cancel(2)),redf(1),grayf(cancel(2)),bold(2);
    cancel(0),grayf(cancel(1)),grayf(cancel(2)),grayf(cancel(2)),redf(0),grayf(cancel(1)),bold(1)
  )
$

So the $(1,1,0)$ column is the bad root.

What if the last column has 0s at the end? For a matrix like $(0,0,0)(1,1,1)(2,1,0)$:

$
  mat(
    0,1,2;
    0,1,1;
    0,1,0
  )
$

The last column is counted as only having 2 rows, so the bad root would be $(0,0,0)$:

$
  mat(
    redf(0),redf(1),2;
    redf(0),cancel(1),1;
    grayf(0),grayf(1),grayf(0)
  )
$

== Ascension rule

Previously in PSS, we have talked about the ascension term.
For higher rows of BMS, this still applies, but there is a caveat: the ascenscion only applies to *descendents of the bad root*.

Let's take $(0,0,0)(1,1,1)(2,0,0)(1,1,1)$ as an example.
The bad root is $(0,0,0)$, so we would expect an ascension matrix like $(1,1,0)$, where it would expand like:

$
  mat(
    0,1,2,1,2,3,2,3,4,...;
    0,1,0,1,2,1,2,3,2,...;
    0,1,0,0,1,0,0,1,0,...;
    augment: #(
      vline: (3, 6, 9),
    )
  )
$

However, the $redf(0)$ in $(2,redf(0),0)$ is not a descendent of the bad root (i.e. $(2,0,0)$ is not a 1-parent of the bad root $(0,0,0)$),
so it should not have the ascension applied to it. It should instead expand as:

$
  mat(
    0,1,2,1,2,3,2,3,4,...;
    0,1,0,1,2,redf(0),2,3,redf(0),...;
    0,1,0,0,1,0,0,1,0,...;
    augment: #(
      vline: (3, 6, 9),
    )
  )
$

If not for this rule, BMS would not terminate.

// https://discord.com/channels/206932820206157824/437684636320137226/794724356064149515
// for example, (0,0)(1,1)(2,1) repeats (0,0)(1,1) but increases it by (2,0) every time, so you get (0,0)(1,1)(2,0)(3,1)(4,0)(5,1)...
// but this would be a problem with 3 rows
// (0,0,0)(1,1,1)(2,1,0)(1,1,1) would expand into (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,2,0)(2,2,0)(3,3,1)(4,3,0)...
// (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,2,0), which is a part of that sequence, would expand into (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,1,0)(4,2,1)...
// etc...
// so you have a long sequence of expansions, but eventually you get to (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,1,0)(2,2,1)
// which expands very similarly to (0,0,0)(1,1,1)(2,1,0)(1,1,1)
// it expands into (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,1,0)(2,2,0)(3,3,1)(4,2,0)(3,3,0)(4,4,1)(5,3,0)...
// which is the same thing as (0,0,0)(1,1,1)(2,1,0)(1,1,1) except the m in (n,n,1)(n,m,0) gets decreased by 1



// it wouldnt terminate

// yes
// so
// the ascension matrix makes some things not increase when expanding
// so that (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,1,0)(2,2,1) would actually expand into (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,1,0)(2,2,0)(3,3,1)(4,**1**,0)(3,3,0)(4,4,1)(5,**1**,0)...

== Wrangling with upgrading

#warning[
  Note that *ALL* correspondences between BMS and ordinals are conjectures past $psi_0(Omega_omega)$.
]

We initially have $(0,0,0)(1,1,1)$ being $psi_0(Omega_omega)$, so we may (naively) conjecture that an $(x,1,1)$ functions the same way as PSS,
with an $omega$ at height $x$. So $(0,0,0)(1,1,1)(1,1,1)$ corresponds to $psi_0(Omega_omega 2)$,
then $(0,0,0)(1,1,1)(2,0,0)$ corresponds to $psi_0(psi_omega (1)) = psi_0(Omega_omega omega)$.

#[
  #set align(center)
  #table(
    columns: (auto, auto, auto),
    inset: 1em,
    align: horizon,
    table.header([*BMS*], [*"PSS" Hydra*], [*EBOCF*]),
    $ mat(0,1,1;0,1,1;0,1,1) $, pss((0,1,1),(0,[ω],[ω])), $psi_0(Omega_omega 2)$,
    $ mat(0,1,2;0,1,0;0,1,0) $, pss((0,1,2),(0,[ω],0)), $psi_0(psi_omega (1))$,
    $ mat(0,1,2;0,1,1;0,1,0) $, pss((0,1,2),(0,[ω],1)), $psi_0(psi_omega (Omega))$,
    $ mat(0,1,2,1;0,1,1,1;0,1,0,0) $, pss((0,1,2,1),(0,[ω],1,1)), $psi_0(psi_omega (Omega) + Omega)$,
    $ mat(0,1,2,1,2;0,1,1,1,2;0,1,0,0,0) $, pss((0,1,2,1,2),(0,[ω],1,1,2)), $psi_0(psi_omega (Omega) + Omega_2)$,
    $ mat(0,1,2,1,2,3;0,1,1,1,2,3;0,1,0,0,0,0) $, pss((0,1,2,1,2,3),(0,[ω],1,1,2,3)), $psi_0(psi_omega (Omega) + Omega_3)$,
    $ mat(0,1,2,1;0,1,1,1;0,1,0,1) $, pss((0,1,2,1),(0,[ω],1,[ω])), $psi_0(psi_omega (Omega) + Omega_omega)?$,
  )
]

e.g. for $(0,0,0)(1,1,1)(2,1,0)$, treating $(1,1,1)$ as an $omega$ label at height $1$, the corresponding PSS hydra expansion (where teal squares are the bad parts):

#hbox(
  pss(
    (0,1,2),
    (0,[ω],1),
    enclosing-node(((0, 0), (1, -1)), teal),
  ),
  xarrow(h(5em)),
  pss(
    (0,1,2,3,4),
    (0,[ω],0,[ω],[#sym.dots]),
    enclosing-node(((0, 0), (1, -1)), teal),
    enclosing-node(((2, -2), (3, -3)), teal),
  ),
)

Now, what if the child node is $omega$? A label of $omega$, as we conjectued, is a column of the form $(x,1,1)$, so it always as a 2-parent of the form $(x,0,0)$, which corresponds to a node of label $0$. This means that it will have an ascension matrix of $(1,1,0)$, so the *label also increases* (as labels are determined by the second row).
As a trivial example, consider $psi_0(Omega_omega) ~ (0,0,0)(1,1,1)$:

#hbox(
  pss(
    (0,1),
    (0,[ω]),
    enclosing-node(((0,0), (0,0)),teal),
  ),
  xarrow(h(5em)),
  pss(
    (0,1),
    (0,redf[1]),
    enclosing-node(((0,0), (0,0)),teal),
    enclosing-node(((1,-1), (1,-1)),teal),
  ),
  pss(
    (0,1,2),
    (0,redf[1],redf[2]),
    enclosing-node(((0,0), (0,0)),teal),
    enclosing-node(((1,-1), (1,-1)),teal),
    enclosing-node(((2,-2), (2,-2)),teal),
  ),
  pss(
    (0,1,2,3),
    (0,redf[1],redf[2],redf[3]),
    enclosing-node(((0,0), (0,0)),teal),
    enclosing-node(((1,-1), (1,-1)),teal),
    enclosing-node(((2,-2), (2,-2)),teal),
    enclosing-node(((3,-3), (3,-3)),teal),
  ),
  $...$
)
In this case, the bad part is just the bad root, so the bad part height and label increase.

#example[
  $(0,0,0)(1,1,1)(1,1,1)$
  #hbox(
    pss(
      (0,1,1),
      (0,[ω],[ω]),
      enclosing-node(((0,0), (1,-1)),teal),
    ),
    xarrow(h(5em)),
    pss(
      (0,1,1,2),
      (0,[ω],redf[1],[ω]),
      enclosing-node(((0,0), (1,-1)),teal),
      enclosing-node(((2,-1), (3,-2)),teal),
    ),
    pss(
      (0,1,1,2,2,3),
      (0,[ω],redf[1],[ω],redf[2],[ω]),
      enclosing-node(((0,0), (1,-1)),teal),
      enclosing-node(((2,-1), (3,-2)),teal),
      enclosing-node(((4,-2), (5,-3)),teal),
    ),
    $...$
  )
]



However, a problem arises with $(0,0,0)(1,1,1)(2,1,0)(1,1,1)$, if we look at its expansion, it expands like so:

$
  mat(
    0,1,2,1,2,3,2,3,4,...;
    0,1,1,1,2,2,2,3,3,...;
    0,1,0,0,1,0,0,1,0,...;
    augment: #(
      vline: (3,6,9)
    )
  )
$
which when translated to our hydra form, behaves like so:

#hbox(
  pss(
    (0,1,2),
    (0,[ω],1),
    enclosing-node(((0,0),(2,-2)), teal),
  ),
  pss(
    (0,1,2,1,2,3),
    (0,[ω],1,redf[1],[ω],orangef[2]),
    enclosing-node(((0,0),(2,-2)), teal),
    enclosing-node(((3,-1),(5,-3)), teal),
  ),
  pss(
    (0,1,2,1,2,3,2,3,4),
    (0,[ω],1,redf[1],[ω],orangef[2],redf[2],[ω],orangef[3]),
    enclosing-node(((0,0),(2,-2)), teal),
    enclosing-node(((3,-1),(5,-3)), teal),
    enclosing-node(((6,-2),(8,-4)), teal),
  ),
  alignment: center + bottom
)

However, the actual hydra (by our modified PSS rules)
expands as:

#hbox(
  pss(
    (0,1,2,1),
    (0,[ω],1,[ω]),
    enclosing-node(((0,0),(2,-2)), teal),
  ),
  xarrow(h(5em)),
  hbox(
    pss(
      (0,1,2),
      (0,[ω],1),
      enclosing-node(((0,0),(2,-2)), teal),
    ),
    pss(
      (0,1,2,1,2,3),
      (0,[ω],1,redf[1],[ω],orangef[1]),
      enclosing-node(((0,0),(2,-2)), teal),
      enclosing-node(((3,-1),(5,-3)), teal),
    ),
    pss(
      (0,1,2,1,2,3,2,3,4),
      (0,[ω],1,redf[1],[ω],orangef[1],redf[2],[ω],orangef[1]),
      enclosing-node(((0,0),(2,-2)), teal),
      enclosing-node(((3,-1),(5,-3)), teal),
      enclosing-node(((6,-2),(8,-4)), teal),
    ),
    alignment: bottom
  ),
)

Note that on top of the expected increases in labels (shown in red), we have unexpectedly have an increase in labels (shown in orange),
so the actual EBOCF value that corresponding to $(0,0,0)(1,1,1)(2,1,0)(1,1,1)$ is $psi_0(psi_omega (Omega_omega))$, or:

#hbox(
  tree-from-list[
    - $0$
      - $omega$
        - $omega$
  ]
)

The common framework for thinking about this is that the last $(1,1,1)$ column acts as an "upgrader",
which "upgrades" the $(2,1,0)$ column from a label of $1$ to a label of $omega$.

I shall plug my own website to explore upgraders (up to EBO): https://hemisemidemipresent.github.io/bms/ .
Note that the upgrading algorithm are conjectures.

== Multicolored Hydras

We see that each column has different $n$-parent relationships with each other.
Another way to understand how "expansion" works is to encode BMS matrices with multicolored hydras.
In this example, we have the base color being 0-parent, red being 1-parent, green being 2-parent.

#context[
  // ---------- edge helper ----------
  // Draws start -> corner -> end, where the corner takes the larger
  // first coordinate and the smaller second coordinate of the two endpoints.
  #let conn(start, end, stroke: auto, shift: 0pt) = {
    let corner = (
      calc.max(start.at(0), end.at(0)),
      calc.min(start.at(1), end.at(1)),
    )
    edge(start, corner, end, stroke: stroke, shift: shift)
  }

  // shared strokes / shifts
  #let orange-thin   = orange.transparentize(50%)
  #let green-thin = green.transparentize(50%)
  #let shift0 = 3pt
  #let shift1 = 0pt
  #let shift2 = -3pt


  #{
    let r  = (-1,-1)
    let n0 = (0,0)
    let n1 = (1,1)
    let n2 = (2,2)
    let n3 = (3,3)

    diagram(
      node-stroke: 0.6pt + text.fill,
      spacing: (0.5em, 1.5em),
      axes: (ltr, btt),
      edge-stroke: 1pt + text.fill,
      node(r,  $R$, shape: rect),
      node(n0, $(0,0,0)$, shape: rect),
      node(n1, $(1,1,1)$, shape: rect),
      node(n2, $(2,1,0)$, shape: rect),
      node(n3, $(3,1,0)$, shape: rect),

      // 0-parent
      conn(n0, r, shift: shift0),
      conn(n1, n0, shift: shift0),
      conn(n2, n1, shift: shift0),
      conn(n3, n2, shift: shift0),

      // 1-parent
      conn(n0, r,  stroke: orange-thin, shift: shift1),
      conn(n1, n0, stroke: orange, shift: shift1),
      conn(n2, n0, stroke: orange, shift: shift1),
      conn(n3, n0, stroke: orange, shift: shift1),

      // 2-parent
      conn(n0, r,  stroke: green-thin, shift: shift2),
      conn(n1, n0, stroke: green, shift: shift2),
      conn(n2, r,  stroke: green-thin, shift: shift2),
      conn(n3, r,  stroke: green-thin, shift: shift2),
    )
  }

  the rightmost node is the child. we find the bad root.
  It’s highest tier connection to a non-root node is red, so if we go down the red path, we get the bad root.

  #{
    let r  = (-1,-1)
    let n0 = (0,0)
    let n1 = (1,1)
    let n2 = (2,2)
    let n3 = (3,3)

    diagram(
      node-stroke: 0.6pt + text.fill,
      spacing: (1em, 1.5em),
      axes: (ltr, btt),
      edge-stroke: 1pt + text.fill,
      node(r,  $R$, shape: rect),
      node(n0, [b], shape: rect),
      node(n1, $quad$, shape: rect),
      node(n2, $quad$, shape: rect),
      node(n3, [c], shape: rect),

      // 0-parent
      conn(n0, r, shift: shift0),
      conn(n1, n0, shift: shift0),
      conn(n2, n1, shift: shift0),
      conn(n3, n2, shift: shift0),

      // 1-parent
      conn(n0, r,  stroke: orange-thin, shift: shift1),
      conn(n1, n0, stroke: orange, shift: shift1),
      conn(n2, n0, stroke: orange, shift: shift1),
      conn(n3, n0, stroke: orange, shift: shift1),

      // 2-parent
      conn(n0, r,  stroke: green-thin, shift: shift2),
      conn(n1, n0, stroke: green, shift: shift2),
      conn(n2, r,  stroke: green-thin, shift: shift2),
      conn(n3, r,  stroke: green-thin, shift: shift2),
    )
  }

  cut the child and all of its connections:

  #{
    let r  = (-1,-1)
    let n0 = (0,0)
    let n1 = (1,1)
    let n2 = (2,2)
    let n3 = (3,3)

    diagram(
      node-stroke: 0.6pt + text.fill,
      spacing: (1em, 1.5em),
      axes: (ltr, btt),
      edge-stroke: 1pt + text.fill,
      node(r,  $R$, shape: rect),
      node(n0, [b], shape: rect),
      node(n1, $quad$, shape: rect),
      node(n2, $quad$, shape: rect),
      node(n3, [c], shape: rect, stroke: (dash: "dashed")),

      // 0-parent
      conn(n0, r, shift: shift0),
      conn(n1, n0, shift: shift0),
      conn(n2, n1, shift: shift0),
      conn(n3, n2, shift: shift0, stroke: (dash: "dashed")),

      // 1-parent
      conn(n0, r,  stroke: orange-thin, shift: shift1),
      conn(n1, n0, stroke: orange, shift: shift1),
      conn(n2, n0, stroke: orange, shift: shift1),
      conn(n3, n0, stroke: (paint: orange, dash: "dashed"), shift: shift1),

      // 2-parent
      conn(n0, r,  stroke: green-thin, shift: shift2),
      conn(n1, n0, stroke: green, shift: shift2),
      conn(n2, r,  stroke: green-thin, shift: shift2),
      conn(n3, r,  stroke: (paint: green-thin, dash: "dashed"), shift: shift2),
    )
  }

  Then we make many copies of the bad root

  #{
    let r  = (-1,-1)
    let n0 = (0,0)
    let n1 = (1,1)
    let n2 = (2,2)

    diagram(
      node-stroke: 0.6pt + text.fill,
      spacing: (1em, 1.5em),
      axes: (ltr, btt),
      edge-stroke: 1pt + text.fill,
      node(r,  $R$, shape: rect),
      node(n0, $b$, shape: rect),
      node(n1, $quad$, shape: rect),
      node(n2, $quad$, shape: rect),

      // 0-parent
      conn(n0, r, shift: shift0),
      conn(n1, n0, shift: shift0),
      conn(n2, n1, shift: shift0),

      // 1-parent
      conn(n0, r,  stroke: orange-thin, shift: shift1),
      conn(n1, n0, stroke: orange, shift: shift1),
      conn(n2, n0, stroke: orange, shift: shift1),

      // 2-parent
      conn(n0, r,  stroke: green-thin, shift: shift2),
      conn(n1, n0, stroke: green, shift: shift2),
      conn(n2, r,  stroke: green-thin, shift: shift2),
    )
  }
  #{
    let r  = (-1,-1)
    let n0 = (0,0)
    let n1 = (1,1)
    let n2 = (2,2)

    diagram(
      node-stroke: 0.6pt + text.fill,
      spacing: (1em, 1.5em),
      axes: (ltr, btt),
      edge-stroke: 1pt + text.fill,
      node(r,  $quad$, shape: rect, stroke: none),
      node(n0, $b$, shape: rect),
      node(n1, $quad$, shape: rect),
      node(n2, $quad$, shape: rect),

      // 0-parent
      conn(n0, r, shift: shift0),
      conn(n1, n0, shift: shift0),
      conn(n2, n1, shift: shift0),

      // 1-parent
      conn(n0, r,  stroke: orange-thin, shift: shift1),
      conn(n1, n0, stroke: orange, shift: shift1),
      conn(n2, n0, stroke: orange, shift: shift1),

      // 2-parent
      conn(n0, r,  stroke: green-thin, shift: shift2),
      conn(n1, n0, stroke: green, shift: shift2),
      conn(n2, r,  stroke: green-thin, shift: shift2),
    )
  }
  #{
    let r  = (-1,-1)
    let n0 = (0,0)
    let n1 = (1,1)
    let n2 = (2,2)

    diagram(
      node-stroke: 0.6pt + text.fill,
      spacing: (1em, 1.5em),
      axes: (ltr, btt),
      edge-stroke: 1pt + text.fill,
      node(r,  $quad$, shape: rect, stroke: none),
      node(n0, $b$, shape: rect),
      node(n1, $quad$, shape: rect),
      node(n2, $quad$, shape: rect),

      // 0-parent
      conn(n0, r, shift: shift0),
      conn(n1, n0, shift: shift0),
      conn(n2, n1, shift: shift0),

      // 1-parent
      conn(n0, r,  stroke: orange-thin, shift: shift1),
      conn(n1, n0, stroke: orange, shift: shift1),
      conn(n2, n0, stroke: orange, shift: shift1),

      // 2-parent
      conn(n0, r,  stroke: green-thin, shift: shift2),
      conn(n1, n0, stroke: green, shift: shift2),
      conn(n2, r,  stroke: green-thin, shift: shift2),
    )
  }

  connect hanging root connections to the root note

  #{
    let r  = (-1,-1)
    let n0 = (0,0)
    let n1 = (1,1)
    let n2 = (2,2)
    let n3 = (3,0)
    let n4 = (4,1)
    let n5 = (5,2)
    let n6 = (6,0)
    let n7 = (7,1)
    let n8 = (8,2)

    diagram(
      node-stroke: 0.6pt + text.fill,
      spacing: (1em, 1.5em),
      axes: (ltr, btt),
      edge-stroke: 1pt + text.fill,
      node(r,  $R$, shape: rect),
      node(n0, $b$, shape: rect),
      node(n1, $quad$, shape: rect),
      node(n2, $quad$, shape: rect),
      node(n3, $b$, shape: rect),
      node(n4, $quad$, shape: rect),
      node(n5, $quad$, shape: rect),
      node(n6, $b$, shape: rect),
      node(n7, $quad$, shape: rect),
      node(n8, $quad$, shape: rect),

      // 0-parent
      conn(n0, r, shift: shift0),
      conn(n1, n0, shift: shift0),
      conn(n2, n1, shift: shift0),

      conn(n4, n3, shift: shift0),
      conn(n5, n4, shift: shift0),

      conn(n7, n6, shift: shift0),
      conn(n8, n7, shift: shift0),

      // 1-parent
      conn(n0, r,  stroke: orange-thin, shift: shift1),
      conn(n1, n0, stroke: orange, shift: shift1),
      conn(n2, n0, stroke: orange, shift: shift1),

      conn(n3, r,  stroke: orange-thin, shift: shift1),
      conn(n4, n3, stroke: orange, shift: shift1),
      conn(n5, n3, stroke: orange, shift: shift1),

      conn(n6, r,  stroke: orange-thin, shift: shift1),
      conn(n7, n6, stroke: orange, shift: shift1),
      conn(n8, n6, stroke: orange, shift: shift1),

      // 2-parent
      conn(n0, r,  stroke: green-thin, shift: shift2),
      conn(n1, n0, stroke: green, shift: shift2),
      conn(n2, r,  stroke: green-thin, shift: shift2),

      conn(n3, r,  stroke: green-thin, shift: shift2),
      conn(n4, n3, stroke: green, shift: shift2),
      conn(n5, r,  stroke: green-thin, shift: shift2),

      conn(n6, r,  stroke: green-thin, shift: shift2),
      conn(n7, n6, stroke: green, shift: shift2),
      conn(n8, r,  stroke: green-thin, shift: shift2),
    )
  }

  #{
    let r  = (-1,-1)
    let n0 = (0,0)
    let n1 = (1,1)
    let n2 = (2,2)
    let n3 = (3,3)
    let n4 = (4,4)
    let n5 = (5,5)
    let n6 = (6,6)
    let n7 = (7,7)
    let n8 = (8,8)

    diagram(
      node-stroke: 0.6pt + text.fill,
      spacing: (1em, 1.5em),
      axes: (ltr, btt),
      edge-stroke: 1pt + text.fill,
      node(r,  $R$, shape: rect),
      node(n0, $b$, shape: rect),
      node(n1, $quad$, shape: rect),
      node(n2, $quad$, shape: rect),
      node(n3, $b$, shape: rect),
      node(n4, $quad$, shape: rect),
      node(n5, $quad$, shape: rect),
      node(n6, $b$, shape: rect),
      node(n7, $quad$, shape: rect),
      node(n8, $quad$, shape: rect),

      // 0-parent
      conn(n0, r, shift: shift0),
      conn(n1, n0, shift: shift0),
      conn(n2, n1, shift: shift0),
      conn(n3, n2, shift: shift0),
      conn(n4, n3, shift: shift0),
      conn(n5, n4, shift: shift0),
      conn(n6, n5, shift: shift0),
      conn(n7, n6, shift: shift0),
      conn(n8, n7, shift: shift0),

      // 1-parent
      conn(n0, r,  stroke: orange-thin, shift: shift1),
      conn(n1, n0, stroke: orange, shift: shift1),
      conn(n2, n0, stroke: orange, shift: shift1),

      conn(n3, r,  stroke: orange-thin, shift: shift1),
      conn(n4, n3, stroke: orange, shift: shift1),
      conn(n5, n3, stroke: orange, shift: shift1),

      conn(n6, r,  stroke: orange-thin, shift: shift1),
      conn(n7, n6, stroke: orange, shift: shift1),
      conn(n8, n6, stroke: orange, shift: shift1),

      // 2-parent
      conn(n0, r,  stroke: green-thin, shift: shift2),
      conn(n1, n0, stroke: green, shift: shift2),
      conn(n2, r,  stroke: green-thin, shift: shift2),

      conn(n3, r,  stroke: green-thin, shift: shift2),
      conn(n4, n3, stroke: green, shift: shift2),
      conn(n5, r,  stroke: green-thin, shift: shift2),

      conn(n6, r,  stroke: green-thin, shift: shift2),
      conn(n7, n6, stroke: green, shift: shift2),
      conn(n8, r,  stroke: green-thin, shift: shift2),
    )
  }
]