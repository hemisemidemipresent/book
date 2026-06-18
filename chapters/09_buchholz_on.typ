#import "../shorthands.typ": *
= Ordinal Notations up to #BO

Technically Buchholz's OCF goes up to #TFBO but as we'll see later, #BO is a more "natural" stopping point.

== Ordinal Notation associated with BOCF

#let E = $epsilon_(Omega_omega + 1)$
We introduce a set of ordinal notations $OT$ corresponding to Buchholz's OCF, along with a recursive way to order them $prec$,
such that $(OT, prec)$ is order isomorphic to $(C_0(#E),in)$

#definition[
  #let s = purplef[*$s$*]
  #let t = pinkf[*$t$*]

  Let $T_B$ be the set of terms and $PT$ be the set of all _prinicpal terms_ (the terms in $PT$ are associated to additively principal ordinals).

  - $zero in T$
  - Given a term $t in T$, $mu <=omega$, $bocf(mu, t) in T "and" PT$
  - For principal terms $t_1,...,t_k in PT$, $t_1 plus ... plus t_k in T_B$

  Let $prec$ be a binary relation on $T$.

  For terms $#s, #t in T$, $#s prec #t$ is defined as:
  - If $#s = zero$ then $#s prec #t$ if $#t != zero$
  - If $#s = bocf(u, a)$ and $#t = bocf(v, b)$, then $#s prec t$ if:
    - $u < v$, or
    - $u = v$ and $a prec b$
  - If $#s = s_0 plus ... plus s_n, #t = t_0 plus ... plus t_m$, then we do it lexicographically, i.e., $#s prec #t$ if:
    - $s_i = t_i$ for all $i<=n$ and $n<m$, i.e. #s is a proper prefix of #t
    - $s_i = t_i$ for all $i<k$ and $s_k prec t_k$


  For terms $#s, #t$, we have a family of the binary relations $ternary(#s, mu, #t)$ for $mu <= omega$ if and only if:

  - $#s prec bocf(mu, zero)$
  - $#s = a plus b$ for some $a in PT$ and $b in T\\{zero}$ and $ternary(a, mu, #t)$ and $ternary(b, mu, #t)$
  - $#s = bocf(nu, a)$ for some $a in T, nu <= omega$ and $ternary(a, mu, #t)$ and $a prec #t$

  Let $OT$ be a subset of $T$. $OT$ corresponds to the set of all ordinal notations of normal form.
  $OT$ is defined as:

  - $zero in OT$
  - If $a_0, ..., a_k in OT$ and $a_0, ..., a_k in PT$, if $a_k prec.eq ... prec.eq a_0$, their sum $a_0 plus ... plus a_k in OT$
  - For a term $a in T$, $bocf(mu, a) in OT$ if and only if $a in OT$ and $ternary(a, mu, a)$
]

The definition of $OT$ basically restricts all the non-standard notation that are possible but causes headaches.
Examples of non-standard notation include:
- $bocf(0, zero) + bocf(0, bocf(1, zero)) ~ psi_0(0) + psi_0(psi_1(0)) = 1 + e0 = e0$
- $bocf(0, bocf(0, bocf(1, zero))) ~ psi_0(psi_0(psi_1(0))) = psi_0(e0) = e0$ (not normal form, $e0 in.not C_0(e0)$)

We can now define a map to associate each ordinal notation to an ordinal below $TFBO$:

#definition[
  The map $o : OT arrow.r.bar C_0(#E)$ is defined recursively as such:
  + $o(zero) := 0$
  + $o(a_0 plus ... plus a_k) = o(a_0) + ... + o(a_k)$
  + $o(bocf(nu, a)) = psi_nu (o(a))$
]

This should be fairly self-explanatory with the notation that has been chosen essentially being red versions of the usual ordinals.
$OT$ here reprsents all ordinal notations that recursively satisfy the normal form, i.e. $bocf(a, b)$ always satisfies $ternary(b, a, b)$.


From this, #link("https://doi.org/10.1016/0168-0072(86)90052-7")[Buchholz] showed that:
#theorem(name: [_*Correspondence of Ordinal Notation with Buchholz's OCF*_])[
  The set ${a in OT | a prec bocf(1, zero) }$ under $prec$ is :
  - order isomorphic to $(C_0(#E),in)$
  - a well-ordered set
  - has order type $TFBO$

  Additionally, for every ordinal notation $a prec bocf(1, zero)$, the ordinal $o(a)$ is the order type of the set ${x in OT | x prec a}$ under $prec$.
]
[WIP: His proofs is not that long, maybe we can break it down here? Maybe move it to an appendix or something]

// Note that Buchholz used $D_nu a$ instead of our red $bocf(nu, a)$, $\#$ instead of our #plus,
// and he uses $G_nu (b)$ is somewhat analogous to $C_nu (b)$.

#[
  #let dom(content) = $fuchsiaf(fira(cof \())content fuchsiaf(fira(\))))$

  Now just like how the fundamental sequence of an ordinal $alpha[n] < alpha$, we can similarly define a fundamental sequence $a[n]$ for each ordinal notation $a$,
  where $a[n] prec a$. This requires defining a computable version of _cofinality_ (denoted $"dom"$ in Buchholz's paper)
  #definition[
    We will define "cofinality" $dom(zws)$ of each ordinal notation term, and the fundamental sequence of an ordinal notation term $t[z]$.
    This is essentially a 1-to-1 copy of the fundamental sequence rules, except that since we are dealing with finite strings, they are recursive and computable.

    - $dom(zero) := emptyset$
    - $dom(a_0 plus ... plus a_k) = dom(a_k)$ ($a_i in OT$)

      $(a_0 plus ... plus a_k)[z] = a_0 plus ... plus (a_k [z])$
    - $dom(bocf(0, zero)) := {zero}$, and $bocf(0, zero)[0] = 0$
      (${zero}$ is analogous with $1$)
    - $dom(bocf(n+1, zero)) := T_u := {t in OT | t prec bocf(u+1, zero)}$ for $n in NN$ ($T_u$ is analogous with $Omega_(u+1)$), $bocf(n+1, zero)[z] = z$
    - $dom(bocf(omega, b)) := NN$ (i.e. $omega$), $bocf(omega, b)[n] = bocf(n, b)$
    - $dom(bocf(v, b))$ where $b != zero$ and $v in NN$
      - $dom(b) = {zero} => dom(bocf(v, b)) = NN$ (Analogous with rule 5) $bocf(v, b)[n] = bocf(v, b[0]) dot n$
      - If $dom(b) = NN$ or $dom(b) = T_u$ for some $u < v$ then $dom(bocf(v, b)) = dom(b)$ (Analogous with rule 6a),
        $bocf(v, b)[z] = bocf(v, b[z])$
      - If $dom(b) = T_u$ for some $u >= v$ then $dom(bocf(v, b)) = NN$ (Analogous with rule 6b),
        $bocf(v, b)[n] = bocf(v, b[G[n]])$, where $G[0] = 0, G[n+1] = bocf(u, b[G[n]])$
  ]
  // While we skipped over a lot of the formalism that was present, this ordinal notation is basically identical to the actual $psi$, just that it is computable.
  Another thing to note about the fundamental sequences is that for a term $t in OT$, all terms in its fundamental sequence $t[n] in OT$. (Also is Buchholz's paper)
  #lemma[
    If $a,z in OT$, and $z in dom(a)$, then $a[z] in OT$ and $a[z] prec a$
  ]

  Recall that when defining ordinal notations of order type $<e0$, we mainly build up in layers from the bottom-up with Cantor Normal Form,
  but for PrSS we introduced a "top-down" approach, where each standard form sequence was nested fundamental sequences of the limit of PrSS.
  Here, we go for a similar "top-down" approach, where every ordinal notation $a prec bocf(omega, zero)$ can be expressed as taking fundamental sequences:
  $
    a = bocf(omega, zero)[n_1][n_2]...[n_k]
  $
  For example, to get $bocf(0, bocf(1, zero) plus bocf(1, zero)) ~ epsilon_1$:

  #figure(
    box[
      #set text(font: "Dejavu Sans Mono", size: 8.5pt)
      #set par(leading: 0.4em)
      #set align(left)

      $bocf(0, bocf(omega, zero)) ~ BO$\
      ├─ $dots.v$\
      ├─[2]$bocf(0, bocf(2, zero)) ~ "BHO"$\
      │~~├─~$dots.v$\
      │~~├─[3]$bocf(0, bocf(1, bocf(1, bocf(1, zero)))) ~ G0$\
      │~~├─[2]$bocf(0, bocf(1, bocf(1, zero))) ~ z0$\
      │~~│~~├─ $dots.v$\
      │~~│~~├─[1]#box[$bocf(0, bocf(1, bocf(0, bocf(1, zero)))) ~ epsilon_e0$]\
      │~~│~~│~~├─ $dots.v$\
      │~~│~~│~~├─[1]$bocf(0, bocf(1, bocf(0, bocf(0, zero)))) ~ epsilon_(omega^omega)$\
      │~~│~~│~~└─[0]$bocf(0, bocf(1, bocf(0, zero))) ~ epsilon_omega$\
      │~~│~~│~~~~~├─~$dots.v$\
      │~~│~~│~~~~~├─[2]$bocf(0, bocf(1, zero) plus bocf(1, zero)) ~ epsilon_1$\
      │~~│~~│~~~~~├─[1]$bocf(0, bocf(1, zero)) ~ e0$\
      │~~│~~│~~~~~└─[0]$bocf(0, zero) ~ 1$\
      │~~│~~└─[0]$bocf(0, bocf(1, zero)) ~ e0$\
      │~~├─[1]$bocf(0, bocf(1, zero)) ~ e0$\
      │~~└─[0]$bocf(0, zero) ~ 1$\
      ├─[1]$bocf(0, bocf(1, zero)) ~ e0$\
      └─[0]$bocf(0, bocf(0, zero)) ~ omega$\
    ],
  )
]


== Buchholz's Hydra

#let buchholz-hydra = tidy-tree-graph.with(
  draw-node: (
    tidy-tree-draws.circle-draw-node,
    tidy-tree-draws.label-match-draw-node.with(
      matches: (
        red: (fill: red),
        orange: (fill: orange),
        green: (fill: green),
        blue: (fill: aqua),
        "none": (stroke: 0pt),
      ),
    ),
    // (stroke: 0pt),
  ),
  draw-edge: (
    // (.., edge-label) => if edge-label != none { (label: text(green)[#edge-label]) },
    tidy-tree-draws.metadata-match-draw-edge.with(
      matches: (
        red: (stroke: red + 0.75pt),
        orange: (stroke: orange + 0.75pt),
        green: (stroke: green + 0.75pt),
        blue: (stroke: blue + 0.75pt),
        "none": (stroke: 0pt),
      ),
      default: (stroke: black + 0.5pt),
    ),
    (marks: "-"),
  ),
  spacing: (10pt, 25pt),
  node-inset: 4pt,
)

#definition[
  This is somewhat similar to the Kirby-Paris hydra game we have earlier, but each node is labelled with an ordinal $<= omega$, the child nodes of the root must be labelled 0.

  At each step, we choose a leaf node $a$ to chop off. The hydra chooses some $n in NN$.

  + If $a$ has label 0, we proceed as in Kirby-Paris' game. Call the node's parent $b$, and its grandparent $c$ (if it exists).
    First we delete $a$. If $c$ exists (i.e. $b$ is not the root), we make $n$ copies of $b$ and all its children and attach them to $c$:


    #align(center + horizon)[#stack(
      dir: ltr,
      spacing: 1em,
      buchholz-hydra[
        - $c$ #node-attr(rotate: -180deg)
          + #metadata("red")
          - $b$ <red>
            - $a=0$ <blue>
            + #metadata("red")
            - $...$ <red>
      ],
      $xarrow(#h(3em) n=3 #h(3em))$,
      buchholz-hydra[
        - $c$ #node-attr(rotate: -180deg)
          + #metadata("red")
          - $b$ <red>
            + #metadata("red")
            - $...$ <red>
          + #metadata("red")
          - $b$ <red>
            + #metadata("red")
            - $...$ <red>
          + #metadata("red")
          - $b$ <red>
            + #metadata("red")
            - $...$ <red>
      ],
    )]
  + If $a$ has label $u+1$, we go down the tree looking for a node $b$ whose label is $v <= u$:

    #figure(
      buchholz-hydra[
        - $+$ #node-attr(rotate: -180deg)
          - #zws
            - $b = v <= u$ <red>
              + #metadata("red")
              - #zws <red>
                + #metadata("red")
                - $a = u+1$ <blue>
                + #metadata("red")
                - $...$ <red>
              + #metadata("red")
              - $...$ <red>
            - $...$
          - $...$
      ],
    )
    Let the subtree rooted in $b$ be called $S$. The nodes highlighted in red (and node $a$ highlighted in blue) make up $S$.

    Let's make a copy of $S$ called $S'$, and re-label the $b$ inside $S'$ to $u$.

    #figure(
      align(center + horizon)[#stack(
        dir: ltr,
        // spacing: 1em,
        buchholz-hydra[
          - $b = v <= u$ #node-attr(rotate: -180deg) <red>
            + #metadata("red")
            - #zws <red>
              + #metadata("red")
              - $a = u+1$ <blue>
              + #metadata("red")
              - $...$ <red>
            + #metadata("red")
            - $...$ <red>
        ],
        $xarrow(#h(4em)) #h(2em)$,
        buchholz-hydra[
          - $b' = u$ #node-attr(rotate: -180deg) <orange>
            + #metadata("orange")
            - #zws <orange>
              + #metadata("orange")
              - $a'$ <blue>
              + #metadata("orange")
              - $...$ <orange>
            + #metadata("orange")
            - $...$ <orange>
        ],
      )],
    )
    Now let's define the function $S(T)$ that takes in a tree $T$, and replaces $a'$ with $T$

    #box(align(horizon)[
      #stack(
        dir: ltr,
        [For example, if $T$ is ],
        buchholz-hydra[
          - 0 #node-attr(rotate: 180deg)
            - 0
            - 0
        ],
        [then $S(T)$ is ],
        buchholz-hydra[
          - $b' = u$ #node-attr(rotate: -180deg) <orange>
            + #metadata("orange")
            - #zws <orange>
              + #metadata("orange")
              - $0$
                - $0$
                - $0$
              + #metadata("orange")
              - $...$ <orange>
            + #metadata("orange")
            - $...$ <orange>
        ],
        [.],
      )
    ])
    #box(align(horizon)[
      #stack(
        dir: ltr,
        [Similarly, if $T$ is the empty tree then $S(T)$ just becomes],
        buchholz-hydra[
          - $b' = u$ #node-attr(rotate: -180deg) <orange>
            + #metadata("orange")
            - #zws <orange>
              + #metadata("orange")
              - $...$ <orange>
            + #metadata("orange")
            - $...$ <orange>
        ],
        [.],
      )
    ])


    When we cut off a head of label $u+1$, we replace it with
    $S^n ("empty tree")$ where $S^n$ denotes function iteration.


    An illustration of the whole process with $n=2$ is as such:

    #figure(align(center + horizon)[
      #set text(size: 8pt)
      #stack(
        dir: ltr,
        // spacing: 1em,
        buchholz-hydra[
          - $+$ #node-attr(rotate: -180deg)
            - #zws
              - $b = v <= u$ <red>
                + #metadata("red")
                - #zws <red>
                  + #metadata("red")
                  - $a = u+1$ <blue>
                  + #metadata("red")
                  - $...$ <red>
                + #metadata("red")
                - $...$ <red>
              - $...$
            - $...$
        ],
        $xarrow(#h(4em))$,
        buchholz-hydra[
          - $+$ #node-attr(rotate: -180deg)
            - #zws
              - $b$ <red>
                + #metadata("red")
                - #zws <red>
                  + #metadata("red")
                  - $S^2 ("empty tree")$ <blue>
                  + #metadata("red")
                  - $...$ <red>
                + #metadata("red")
                - $...$ <red>
              - $...$
            - $...$
        ],
      )])

    Which becomes
    #figure(
      buchholz-hydra[
        - $+$ #node-attr(rotate: -180deg)
          - #zws
            - $b = v <= u$ <red>
              + #metadata("red")
              - #zws <red>
                + #metadata("red")
                - $u$ <blue>
                  + #metadata("orange")
                  - #zws <orange>
                    + #metadata("orange")
                    - $u$ <blue>
                      + #metadata("orange")
                      - #zws <orange>
                        + #metadata("orange")
                        - $...$ <orange>
                      + #metadata("orange")
                      - $...$ <orange>
                    + #metadata("orange")
                    - $...$ <orange>
                  + #metadata("orange")
                  - $...$ <orange>
                + #metadata("red")
                - $...$ <red>
              + #metadata("red")
              - $...$ <red>
            - $...$
          - $...$
      ],
    )


  + If $a$ has label $omega$, replace the label $omega$ with $n+1$

]

Similarly to the Kirby-Paris Hydra, we can associate each hydra with an ordinal notation term $T$ by the following rules:

+ For each leaf node with a label $u$, we replace it with the ordinal notation $bocf(u, 0)$
+ For a node with label $u$ with children of ordinal notations $a_0, ..., a_k$, we replace it with the ordinal notation $bocf(u, a_0 plus ... plus a_k)$
+ At the root node, the resulting ordinal expressions of each of the root's children $a_0, ..., a_k$ are summed up: $a_0 plus ... plus a_k$

Note that case 2 in the definition above is different from the original definiton that Buchholz gave.
This difference basically corresponds to the differences in the system of fundamental sequence (Specifically "Rule 6(b)").

Here are some examples of Buchholz's hydra and the associated ordinal notations and ordinals. The hydras have been rotated to save space.

#align(center)[
  #let angle = 90deg
  #table(
    columns: (auto, auto, auto),
    align: horizon,
    inset: 0.75em,
    table.header(
      [*Buchholz Hydra*],
      [*Associated Ordinal Notation*],
      [*Associated Ordinal*],
    ),
    buchholz-hydra[
      - \+
    ],
    zero,
    $0$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
    ],
    $bocf(0, zero)$,
    $1$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
        - 0
    ],
    $bocf(0, zero) plus bocf(0, zero)$,
    $2$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - 0
    ],
    $bocf(0, bocf(0, zero))$,
    $omega$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
        - 0
          - 0
    ],
    $bocf(0, bocf(0, zero)) plus bocf(0, zero)$,
    $omega+1$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - 0
        - 0
          - 0
    ],
    $bocf(0, bocf(0, zero)) plus bocf(0, bocf(0, zero))$,
    $omega 2$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - 0
          - 0
    ],
    $bocf(0, bocf(0, zero) plus bocf(0, zero))$,
    $omega^2$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - 0
            - 0
    ],
    $bocf(0, bocf(0, bocf(0, zero)))$,
    $omega^omega$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - 0
            - 0
              - 0
    ],
    $bocf(0, bocf(0, bocf(0, bocf(0, zero))))$,
    $omega^omega^omega$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - 1
    ],
    $bocf(0, bocf(1, zero))$,
    $psi_0(Omega) = e0$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - 1
          - 1
    ],
    $bocf(0, bocf(1, zero) + bocf(1, zero))$,
    $psi_0(Omega 2) = epsilon_1$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - 1
            - 1
    ],
    $bocf(0, bocf(1, bocf(1, zero)))$,
    $psi_0(Omega^2) = z0$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - 1
            - 1
              - 1
    ],
    $bocf(0, bocf(1, bocf(1, bocf(1, zero))))$,
    $psi_0(Omega^Omega) = G0$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - 1
            - 1
              - 1
                - 1
    ],
    $bocf(0, bocf(1, bocf(1, bocf(1, bocf(1, zero)))))$,
    $psi_0(Omega^Omega^Omega) = LVO$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - 2
    ],
    $bocf(0, bocf(2, zero))$,
    $psi_0(Omega_2) = "BHO"$,

    buchholz-hydra[
      - \+ #node-attr(rotate: angle)
        - 0
          - $omega$
    ],
    $bocf(0, bocf(omega, zero))$,
    $BO = "BO"$,
  )
]

By restricting Buchholz Hydra to only those corresponding to $OT$ (rather than all of $T$), we can prove the termination of Buchholz Hydras.

=== Termination

It is obvious how case 1 would cause termiantion is just Kirby-Paris hydra all over again. The main complication comes from case 2:

#figure[
  #set align(horizon)
  #stack(
    dir: ltr,
    buchholz-hydra[
      - $+$ #node-attr(rotate: -180deg)
        - $v <= u$ <red>
          // + #metadata("red")
          - $mu>u$
            // + #metadata("red")
            - $u+1$ <blue>
            // + #metadata("red")
            - $xi_1$
          // + #metadata("red")
          - $xi_0$
    ],
    $&= psi_v (xi_0 + psi_mu (xi_1 + psi_(u+1)(0)))\ &= psi_v (xi_0 + psi_mu (xi_1 + Omega_(u+1)))$,
  )
]
And we have $S(T)$ as:
#figure[
  #set align(horizon)
  #stack(
    dir: ltr,
    spacing: 0.5em,
    $S(T) =$,
    buchholz-hydra[
      - $u$ <blue> #node-attr(rotate: -180deg)
        - $mu$
          - $T$ <none>
          - $xi_1$
        - $xi_0$
    ],
    $S(emptyset) =$,
    buchholz-hydra[
      - $u$ <blue> #node-attr(rotate: -180deg)
        - $mu$
          + #metadata("none")
          - #zws <none>
          - $xi_1$
        - $xi_0$
    ],
    $= psi_u (xi_0 + psi_mu (xi_1))$,
  )
]
#figure[
  #set align(horizon)
  #stack(
    dir: ltr,
    spacing: 0.5em,
    $S^2(emptyset) =$,
    buchholz-hydra[
      - $u$ <blue> #node-attr(rotate: -180deg)
        - $mu$
          - $S(emptyset)$ <none>
          - $xi_1$
        - $xi_0$
    ],
    $=$,
    buchholz-hydra[
      - $u$ <blue> #node-attr(rotate: -180deg)
        - $mu$
          - $u$ <blue>
            - $mu$
              + #metadata("none")
              - #zws <none>
              - $xi_1$
            - $xi_0$
          - $xi_1$
        - $xi_0$
    ],
    $&= psi_u (xi_0 + psi_mu (xi_1 + S(emptyset)))\ &= psi_u (xi_0 + psi_mu (xi_1 + psi_u (xi_0 + psi_mu (xi_1))))$,
  )
]

Since $psi_u (alpha) < Omega_(u+1) = psi_(u+1)(0)$, which is the ordinal notation corresponding to our original $u+1$ leaf node that we cut,
it stands to reason that cutting off the head decreases the associated ordinal notation of the whole tree as a result.

== The Hyper Primitive Sequence System (HPrSS)

The Hyper Primitive Sequence System (HPrSS) is an extension of the Primitive Sequence System (PrSS),
and much like how PrSS can be thought of as a linearized version of the Kirby-Paris Hydra,
HPrSS can be thought of as a linearized version of Buchholz's Hydra.

#definition[
  A sequence $s = (s_1, s_2, ..., s_m)$ is a valid HPrSS sequence (i.e. $s in T_"HPrSS"$) if $s$ is either empty $()$ or starts with $0$: $(0,...)$.

  We then define its fundamental sequence $s[n]$, which can be used to define a fast-growing function similarly to PrSS.

  We then take the last element of the sequence, $s_m$, and find its *parent*, the rightmost $s_i$ such that $s_i < s_m$ (same as PrSS).
  We then keep finding that parent's parent, and so on until we can no longer find a parent.

  We let $m=m_0$, then denote the index of $s_m_0$'s parent as $m_1$, the index $s_m_1$'s parent as $m_2$, and so on.\
  We end up with a table like this:

  #figure(
    table(
      columns: (auto, auto, auto),
      inset: 0.75em,
      align: center,
      table.header([*$k$*], [*$m_k$*], [*$s_m_k$*]),
      $0$, $m_0 = m$, $s_m_0$,
      $1$, $m_1$, $s_m_1$,
      $dots.v$, $dots.v$, $dots.v$,
      $k$, $m_k$, $s_m_k$,
    ),
  )

  Now let's define a *difference sequence* $N=(N_0,N_1,...,N_(k-1))$, where $N_i = S_m_i - S_m_(i+1)$.

  + If $N_0 = 1$, then we proceed as normal PrSS, with *good root* being $(s_1, ..., s_(m_1 - 1))$ and *bad root* being $(s_m_1, ..., s_(m_0-1))$.
    and if $m_1 = 0$ then good root is empty.
  + If $N_0 != 1$, then we take the difference sequence $N=(N_0,N_1,...,N_(k-1))$,
    and try to find the first element in the rest of the sequence $N_i$ such that $N_i < N_0$.
    Put more formally,
    $
      p = min{i | i in N "and" 0<i<=k-1 "and" N_i < N_0}
    $
    We then define $r$ and *ascension factor* $delta$ as such
    + If $p$ doesn't exist/no such $i$ exists (i.e., $N_i lt.not N_0$ for all $0<i<=k-1$), then we have $r=1$, and ascension factor $delta = S_m_0 - 1$
    + If $p$ does exist, then $r = m_p$ and ascension factor $delta = S_m_0 - S_m_p - 1$.

    We define *good root* $G = (s_1, ..., s_(r-1))$ for $r>1$, or just empty $G = ()$ if $r=1$.
    We then define *bad root* as a *function* $B(n) = (s_r + n dot delta, ..., s_(m_0-1) + n dot delta)$,
    i.e. $(s_r,...,s_(m_0-1))$ but add $n dot delta$ to each element.

    Finally, we define $s[n]$ as the concatenation of $G, B(0), ..., B(n)$.

  In the original $N_0 = 1$ case, where normal PrSS rules apply, we can think of it as $r = m_1$ and $delta = 0$.
]

Just like in PrSS, we can define a fast-growing function from these fundamental sequences also labelled $s[n]$:
$
  s[n] = (G,B_0,...,B_n)[f(n)]
$
where $f(n)$ is a fast-growing function, usually $f(n) = n + 1$.

#example[
  Expand the following HPrSS sequences:
  + $(0,2,1)[n]$
  + $(0,2)[n]$
  + $(0,2,1,3)[n]$

  Answers:
  + For $s = (0,2,1)$, the parent of $s_3 = 1$ is $s_1 = 0$, so we have:
    #figure(
      table(
        columns: (auto, auto, auto),
        inset: 0.75em,
        align: center,
        table.header(
          [*$k$*],
          [*$m_k$* (indices of parents)],
          [*$s_m_k$* (values of parents)],
        ),
        $0$, $m_0 = 3$, $s_m_0 = s_3 = 1$,
        $1$, $m_1 = 1$, $s_m_1 = s_1 = 0$,
      ),
    )

    Our difference sequence is just $N = (1)$, so by normal PrSS expansion we have good root $G = ()$ and bad root $B = (0,2)$, and as such
    $
      (0,2,1)[n] = underbrace((0,2,0,2,...), (0,2) "repeated" n "times")
    $
    Now using our new system, we have $r=m_1 = 1$ so we still have empty good root $G = ()$, and an ascension factor of $delta = 0$, so our bad root function
    $
      B(n) & = (s_r + n dot 0,...,s_(m_0-1) + n dot 0) \
           & = (s_1,...,s_(m_0-1)) \
           & = (0,2)
    $
    So we end up with the same result.
  + For $s = (0,2)$, the parent of $s_2 = 2$ is $s_1 = 0$, so we have
    #figure(
      table(
        columns: (auto, auto, auto),
        inset: 0.75em,
        align: center,
        table.header(
          [*$k$*],
          [*$m_k$* (indices of parents)],
          [*$s_m_k$* (values of parents)],
        ),
        $0$, $m_0 = 2$, $s_m_0 = s_2 = 2$,
        $1$, $m_1 = 1$, $s_m_1 = s_1 = 0$,
      ),
    )

    Our difference sequence is $N=(2)$, so we fall under the sub-case 1, where there exists no $i$ such that $N_i < N_0$.
    We then have $r=1$ which leads to an empty good root $G = ()$, and an ascension factor of $delta = s_m_0 - 1 = 2-1 = 1$.
    So our bad root function is:
    $
      B(n) & = (s_r + n dot delta, ..., s_(m_0-1) + n dot delta) \
           & = (s_1 + n dot 1) \
           & = (0 + n) \
           & = (n)
    $

    So concatenating $G, B(0), ...,B(n)$, we concatenate $(), (0), (1),...,(n)$:
    $
      (0,2)[n] = (0,1,2,3,...,n)
    $
  + For $s = (0,2,1,3)$, the parent of $s_4 = 3$ is $s_3=1$, whose parent is $s_1=0$, so we have
    #figure(
      table(
        columns: (auto, auto, auto),
        inset: 0.75em,
        align: center,
        table.header(
          [*$k$*],
          [*$m_k$* (indices of parents)],
          [*$s_m_k$* (values of parents)],
        ),
        $0$, $m_0 = 4$, $s_m_0 = s_4 = 3$,
        $1$, $m_1 = 2$, $s_m_1 = s_2 = 1$,
        $2$, $m_2 = 1$, $s_m_2 = s_1 = 0$,
      ),
    )
    Our difference sequence is $N = (2,1)$. Since for $i=1$, $N_i<N_0$, we have $p = 1$ can use the second sub-case,
    and we have $r = m_p = m_1$ and $delta = s_m_0 - s_m_p - 1 = s_4 - s_1 - 1 = 1$.

    You should be able to perform good root and bad root calculations by now, so concatenating $G=(0,2)$ and $B(n) = (n+1)$ we have:
    $
      (0,2,1,3)[n] = (0,2,1,2,3,...)
    $

]


#definition[
  The set of *standard form* of sequences in HPrSS, $OT_"HPrSS"$ is a subset of $T_"HPrSS"$ defined as such;
  + For any $n in NN, (0,n) in OT_"HPrSS"$.
  + For any $S in OT\\{()}$ and $n in NN$, $s[n] in OT_"HPrSS"$
]

Similar to our section on formalizing the order isomorphism of PrSS to #e0, the $OT$ here is built in a "top-down" approach.
We re-use the definition of $subset.sq$ from our PrSS section:

#definition[
  For two sequences $s, t$, we define the relation $s subset.sq t$ if and only if there exists $n_1,n_2,...,n_k in NN$ such that
  $
    s = t[n_1][n_2]...[n_k]
  $
  Then we define $s supset.sq t$ if and only if $t subset.sq s$.
]
And as such we can re-define $OT_"HPrSS"$:
#definition[
  The set of *standard form* of sequences in HPrSS, $OT_"HPrSS"$ is a subset of $T_"HPrSS"$ defined as such;
  $
    OT_"HPrSS" = {s in T_"HPrSS" | "There exists an" n in NN "such that" s subset.sq (0,n)}
  $
]

=== Order Isomorphism to #BO
We can prove that $(OT_"HPrSS", lex)$ is order isomorphic to $(BO, in)$ in a similar way as we did for PrSS.

[WIP] How to prove this is beyond me
// below was some of my attempts
// #[

//     #lemma[
//         For any $s in T_"HPrSS"$ and $n in NN$, $s[n] lex s$.

//         Note that this means $s subset.sq t => s lex t$, and its contrapositive $s lexgt t => s subset.sq.not t$
//     ]
//     #proof[
//         Let $s = (s_1,...,s_m)$. We can denote the good root as $G = (s_1,...,s_(r-1))$ and the bad root function as $(s_r,...,s_(m-1))$,
//         making $s=G^frown B^frown (s_m)$, where $zws^frown$ represents concatenation. Then the ascension factor $delta = s_m - s_r - 1$.

//         Then
//         $
//             s[n] &= \( underbrace(s_1\,...\,s_(r-1),G), underbrace(s_r\,...\,s_(m-1),B(0)), underbrace(s_r + delta\,...\,s_(m-1) + delta,B(1)),... \)\
//             &= \( underbrace(s_1\,...\,s_(r-1),G), underbrace(s_r\,...\,s_(m-1),B(0)), underbrace(s_r + s_m - s_r - 1\,...\,s_(m-1) + delta,B(1)),... \)\
//             &= \( underbrace(s_1\,...\,s_(r-1),G), underbrace(s_r\,...\,s_(m-1),B(0)), underbrace(s_m - 1\,...\,s_(m-1) + delta,B(1)),... \)\
//             &= (s_1,...,s_(m-1),s_m-1,...)\
//             &lex (s_1,...,s_(m-1),s_m) = s
//         $
//     ]
//     #lemma[
//         If $s lex t$ where $s$ is a proper prefix of $t$:
//         $
//             s &= (s_1,...,s_m)\
//             t &= (s_1,...,s_m,t_(m+1),...,t_l)
//         $
//         then $s subset.sq t$.
//     ]
//     #proof(name: [_Informal_])[
//         We can "chop off" the last term as we did for PrSS:

//         Let $t' = (s_1,...,s_m,t_(m+1))$. Then we have:
//         $
//             t'[0] = \( underbrace(s_1\,...\,s_(r-1), G), underbrace(s_r\,...\,s_m, B(0)) \) = s
//         $
//         So using this technique we can keep chopping off each term of $t$ until it reaches $s$.
//     ]
//     #lemma[
//         If $n_1 < n_2$, then $(0,n_1) subset.sq (0,n_2)$.
//     ]
//     #proof(name: [_Informal_])[
//         $(0,n_2)[1] = (0,(n_2-1))$. With this, we can keep decreasing $(0,n)$ until it reaches $(0,n_1)$
//     ]
//     #lemma[
//         Let $s in OT_"HPrSS"$. $(0,u) subset.sq s subset.sq (0,u+1)$ if and only if $s$ starts with (but not equals) $(0,u)$
//     ]
//     #proof[
//         By Induction:
//         - Base case: $(0,0) subset.sq s subset.sq (0,1)$ if and only if $s$ starts with but not equals $(0,0)$ -- trivial since $(0,1)[n] = (0,0,...)$.
//         - Successor case: prove $(0,u) subset.sq s subset.sq (0,u+1)$ if and only if $s$ starts with (but not equals) $(0,u)$ assuming it holds for all $v < u$.
//             - $=>$\
//                 - If $s$ starts with (but not equals) $(0,u')$ where $u' < u$, then by induction hypothesis
//                     $(0,u') subset.sq s subset.sq (0,u'+1) subset.sq.eq (0,u)$, a contradiction.
//                 - If $s$ starts with (but not equals) $(0,u')$ where $u' > u$, then $s lexgt (0,u+1) => s subset.sq.not (0,u+1)$, a contradiction

//                 Therefore $(0,u) subset.sq s subset.sq (0,u+1)$ implies that $s$ starts with (but not equals) $(0,u)$.

//             - $arrow.l.double$\
//                 If $s subset.sq (0,u)$ then $s lex (0,u)$ which contradicts when s starting with $(0,u)$.
//                 If $(0,u+1) subset.sq s$ then $(0,u+1) lex s$, also contradicts s starting with $(0,u)$
//     ]

//     #theorem[
//         $s lex t <=> s subset.sq t$ if $s,t in OT_"HPrSS"$.
//     ]
//     #proof[
//         Since $s[n] lex s$, $s subset.sq t => s lex t$ is already shown. We just need to show that $s lex t => s subset.sq t$.

//         Let $(0,u_1) subset.sq s subset.sq (0,u_1+1)$ and $(0,u_2) subset.sq t subset.sq (0,u_2+1)$

//         If $u_1 < u_2$ its obvious but if $u_1 = u_2$ ughhhhhhh
//     ]
//     // #lemma[
//     //     If $s in OT_"HPrSS"$, then $s subset.sq (0,n)$. Let $n'$ be the minimal such $n$ satisfying $s subset.sq (0,n')$.
//     //     Letting $u = n'-1$, then $s$ must start with $(0,u,2u,...,k dot u)$,
//     // ]
//     // #proof[
//     //     Every HPrSS sequence will start with $(0,u,2u,...,k dot u)$. For example, $(0,2,1)$ starts with $(0,2)$.
//     //     The contradiction is
//     // ]


// ]


#[
  As we saw earlier in PrSS, $(0,1,2,3,...)$ is equivalent to $omega^omega^dots.up = e0$. Since we now have $(0,2)[n]$ which expands to $(0,1,2,3,...)$,
  we have $(0,2)$ corresponding to $e0$. In fact, we can expand upon this and define larger and larger ordinals:
  #let one = $fira(redf(Omega)_0)$
  #let W = $fira(redf(Omega)_1)$
  #let W_2 = $fira(redf(Omega)_2)$
  #let W_3 = $fira(redf(Omega)_3)$
  We denote $fira(redf(Omega)_v)$ as $bocf(v, zero)$ for brevity.

  #table(
    columns: (auto, auto, auto),
    table.header([*HPrSS*], [*Ordinal Notation*], [*Ordinal*]),
    $()$, $zero$, $0$,
    $(0)$, $bocf(0, zero) = one$, $1$,
    $(0,0)$, $bocf(0, zero) plus bocf(0, zero)$, $2$,
    $(0,1)$, $bocf(0, bocf(0, zero))$, $omega$,
    $(0,1,2)$, $bocf(0, bocf(0, bocf(0, zero)))$, $omega^omega$,
    $(0,1,2,3)$,
    $bocf(0, bocf(0, bocf(0, bocf(0, zero))))$,
    $omega^omega^omega$,

    $(0,2)$, $bocf(0, #W)$, $e0$,
    $(0,2,1)$, $bocf(0, #W plus bocf(0, zero))$, $e0 dot omega$,
    $(0,2,1,2)$,
    $bocf(0, #W plus bocf(0, bocf(0, zero)))$,
    $e0 dot omega^omega$,

    $(0,2,1,2,3)$,
    $bocf(0, #W plus bocf(0, bocf(0, bocf(0, zero))))$,
    $e0 dot omega^omega^omega$,

    $(0,2,1,3)$, $bocf(0, #W plus bocf(0, #W))$, $e0^2$,
    $(0,2,1,3,2,4)$, $bocf(0, #W plus bocf(0, #W plus bocf(0, #W)))$, $e0^e0$,
    $(0,2,2)$, $bocf(0, #W plus #W)$, $epsilon_1$,

    $(0,2,2,2)$, $bocf(0, #W plus #W plus #W)$, $epsilon_2$,
    $(0,2,3)$, $bocf(0, bocf(1, one))$, $psi_0(Omega dot omega) = epsilon_omega$,
    $(0,2,3,5)$, $bocf(0, bocf(1, bocf(0, #W)))$, $psi_0(Omega dot psi_0(Omega)) = epsilon_e0$,
    $(0,2,4)$, $bocf(0, bocf(1, #W))$,$psi_0(Omega^2) = z0$,
    $(0,2,4,4)$, $bocf(0,bocf(1, #W + #W))$, $psi_0(Omega^3) = eta_0 = phi(3,0)$,
    $(0,2,4,5)$, $bocf(0,bocf(1,bocf(1,one)))$, $psi_0(Omega^omega) = phi(omega,0)$,
    $(0,2,4,5,7)$, $bocf(0,bocf(1,bocf(1,bocf(0,#W))))$, $psi_0(Omega^(psi_0(Omega))) = psi_0(Omega^e0) = phi(e0,0)$,
    $(0,2,4,6)$, $bocf(0,bocf(1,bocf(1,#W)))$, $psi_0(Omega^Omega) = G0$,
    $(0,2,4,6,8)$, $bocf(0,bocf(1,bocf(1,bocf(1,#W))))$, $psi_0(Omega^Omega^Omega) = LVO$,
    $(0,3)$, $bocf(0, #W_2)$, $psi_0(Omega_2) = BHO = "BHO"$,
    $(0,3,1)$, $bocf(0, #W_2 plus one)$, $psi_0(Omega_2 + 1) = BHO dot omega$,
    $(0,3,2)$, $bocf(0, #W_2 plus #W)$, $psi_0(Omega_2 + Omega)$,
    $(0,3,3)$, $bocf(0, #W_2 plus #W_2)$, $psi_0(Omega_2 dot 2)$,
    $(0,3,4)$, $bocf(0, bocf(2, one))$, $psi_0(Omega_2 dot omega)$,
    $(0,3,5)$, $bocf(0, bocf(2, #W))$, $psi_0(Omega_2 dot Omega)$,
    $(0,3,6)$, $bocf(0, bocf(2, #W_2))$, $psi_0(Omega_2^2)$,
    $(0,4)$, $bocf(0, #W_3)$, $psi_0(Omega_3)$,
    $(0,n+1)$, $bocf(0, fira(redf(Omega)_n))$, $psi_0(Omega_n)$
  )
]
=== Growth rate
=== Association with Buchholz Hydras
There is a somewhat weird way I came up with to associate HPrSS with Buchholz Hydras (unproven)
// torturous diagram drawing
#[
  Suppose we have a sequence: $(0,2,4,3,5,1)$. We label each element's parent:\ \
  $
    (
      mark(0, tag: #<s1>),
      mark(2, tag: #<s2>),
      mark(4, tag: #<s3>),
      mark(3, tag: #<s4>),
      mark(5, tag: #<s5>),
      mark(1, tag: #<s6>)
    )
  $

  #annot-cetz(
    (<s1>, <s2>, <s3>, <s4>, <s5>, <s6>),
    cetz,
    {
      import cetz.draw: *
      set-style(
        mark: (end: "straight", length: 0.2em, width: 0.2em),
        stroke: red + 0.75pt,
      )
      bezier-through(
        "s2.south",
        (rel: (x: -.2, y: -.15)),
        "s1.south",
        stroke: red + .75pt,
      )
      bezier-through(
        "s3.south",
        (rel: (x: -.2, y: -.15)),
        "s2.south",
        stroke: red + .75pt,
      )
      bezier-through(
        "s4.north",
        (rel: (x: -.3, y: .15)),
        "s2.north",
        stroke: red + .75pt,
      )
      bezier-through(
        "s5.south",
        (rel: (x: -.2, y: -.15)),
        "s4.south",
        stroke: red + .75pt,
      )
      bezier-through(
        "s6.north",
        (rel: (x: -.5, y: .25)),
        "s1.north",
        stroke: red + .75pt,
      )
    },
  )

  Then we draw a tree representing the parent relationships:

  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      spacing: (0.8em, 0.4em),
      edge-corner-radius: 8pt,

      node((-1, 1), `+`),
      node((0, 0), `0`),
      node((1, -2), `2`),
      node((2, -4), `4`),
      node((3, -3), `3`),
      node((4, -5), `5`),
      node((5, -1), `1`),

      edge((-1, 1), "r,u"),
      edge((0, 0), "r,u,u"),
      edge((0, 0), "r,u,u"),
      edge((0, 0), "r,r,r,r,r,u"),
      edge((1, -2), "r,u,u"),
      edge((1, -2), "r,r,u"),
      edge((3, -3), "r,u,u"),
    ),
  )

  So for example, $5$'s parent is $3$, whose parent is  $2$, whose parent is $0$.

  Now let's consider the different in values. If the a node's parent's value is $1$ less than its own value, we label the node $0$.
  If a node's parent's value is $2$ less than its own value, we label the node $1$.
  And in general, if a node's parent's value is $n$ less than its own value, we label the node $n-1$.
  This results in the following Buchholz Hydra:
  #figure[
    #set text(size: 7pt)
    #set align(horizon)
    #stack(
      dir: ltr,
      // spacing: 3em,
      diagram(
        node-stroke: 1pt,
        edge-stroke: 1pt,
        spacing: (0.8em, 0.4em),
        edge-corner-radius: 8pt,

        node((-1, 1), `+`),
        node((0, 0), `0`),
        node((1, -2), redf[*`2`*], stroke: red),
        node((2, -4), redf[*`4`*], stroke: red),
        node((3, -3), `3`),
        node((4, -5), redf[*`5`*], stroke: red),
        node((5, -1), `1`),

        edge((-1, 1), "r,u"),
        edge((0, 0), "r,u,u", redf($+2$), stroke: red, label-side: center),
        edge((0, 0), "r,r,r,r,r,u", $+1$, label-side: center, label-pos: 0.6),
        edge((1, -2), "r,u,u", redf($+2$), stroke: red, label-side: center),
        edge((1, -2), "r,r,u", $+1$, label-side: center),
        edge((3, -3), "r,u,u", redf($+2$), stroke: red, label-side: center),
      ),
      $#h(3em) xarrow(#h(10em))$,
      diagram(
        node-stroke: 1pt,
        edge-stroke: 1pt,
        spacing: (0.8em, 0.4em),
        edge-corner-radius: 8pt,

        node((-1, 1), `+`),
        node((0, 0), `0`),
        node((1, -2), redf[*`1`*], stroke: red),
        node((2, -4), redf[*`1`*], stroke: red),
        node((3, -3), `0`),
        node((4, -5), redf[*`1`*], stroke: red),
        node((5, -1), `0`),

        edge((-1, 1), "r,u"),
        edge((0, 0), "r,u,u", redf($+2$), stroke: red, label-side: center),
        edge((0, 0), "r,r,r,r,r,u", $+1$, label-side: center, label-pos: 0.6),
        edge((1, -2), "r,u,u", redf($+2$), stroke: red, label-side: center),
        edge((1, -2), "r,r,u", $+1$, label-side: center),
        edge((3, -3), "r,u,u", redf($+2$), stroke: red, label-side: center),
      ),
    )
  ]


  // #figure(buchholz-hydra[
  //     - \+ #node-attr(rotate:90deg)
  //         - 0
  //             - 0
  //             - 1
  //                 - 0
  //                     - 1
  //                 - 1
  // ])
]

== The Pair Sequence System (PSS)

// https://discord.com/channels/206932820206157824/206933380942528514/1288722679787950122

The Pair Sequence System (PSS) can also be considered an extension to the primitive sequence system, where instead of it being a sequence of natural numbers,
the Pair Sequence System can be thought og as a sequence of _pairs_ of natural numbers. There are two common ways to write PSS, either inline, like
$(0,0)(1,1)(2,1)(2,0)$ or as a matrix like so:
$
  mat(0, 1, 2, 2; 0, 1, 1, 0)
$

#definition[
  The *Pair Sequence System* is a two-row matrix $M$, which can also be thought of as a sequence of pairs.

  $
    M = mat(a_1, a_2, ..., a_m; b_1, b_2, ..., b_m)
  $

  The first row $(a_1,a_2,...,a_m)$ must satisfy PrSS rules, i.e.:
  1. the row must start with 0 (i.e. $a_1 = 0$)
  2. for each element in a row, the value of its parent must be 1 less than its own value
  For the second row, every element in the second row must be lesser than or equal to the corresponding value in the first row, i.e. $a_i >= b_i$ for all $1<=i<=m$.

  It's fundamental sequence $M[n]$ is defined as such:

  + If $mat(a_m; b_m)=mat(0; 0)$, then we just remove $mat(a_m; b_m)=mat(0; 0)$:

    $
      M[n] = mat(a_1, a_2, ..., a_(m-1); b_1, b_2, ..., b_(m-1))
    $
    This is similar to PrSS when a sequence ends with a $0$.

  + If $mat(a_m; b_m)$ if of the form $mat(a_m; 0)$, where $a_m>0$, then within row one we find the parent of $a_m$.
    Let's denote the index of the parent as $m_1$, and the value of the parent becomes $a_m_1$.
    We define *Good Root* $G$ and *Bad Root* $B$ as:

    $
      G = mat(a_1, ..., a_(m_1-1); b_1, ..., b_(m_1-1)), #h(1em) B = mat(a_m_1, ..., a_(m_1-1); b_m_1, ..., b_(m_1-1))
    $
    Then $s[n]$ becomes $G^frown underbrace(B^frown ...^frown B, n "times")$, where $zws^frown$ represents "matrix concatenation".
    This case, along with the previous case, basically the same mechanism as PrSS.

  + If $a_m>0$ and $b_m>0$, we first focus only on the first row of the matrix.
    Like HPrSS, we find the parent of $a_m$, then its parent, then its parent, all the way until $0$.
    Let's label $m_0 = m$, $m_1$ to be the index of $a_m_0$'s parent, etc..., similar to how we did HPrSS.

    $
      M = mat(a_m_k, ..., a_m_2, ..., a_m_1, ..., a_m_0; b_m_k, ..., b_m_2, ..., b_m_1, ..., b_m_0;)
    $

    Then now within the sequence $(b_m_k,...,b_m_2,b_m_1,b_m_0)$, we find the rightmost element such that $b_m_i < b_m_0$.
    The column that this element is part of, $mat(a_m_i, b_m_i)$, will serve as our separator between good root and bad root.
    Note how you first search for all of $a_m$'s "ancestors", then exclusively within those columns, we search for $b_m$'s parent.

    Continuing, the *Good Root* is then defined as
    $
      G = mat(a_0, ..., a_(m_i-1); b_0, ..., b_(m_i-1))
    $
    and the *Bad Root* is a function, with a similar definition to HPrSS. We define the *ascension factor* $delta$ and *ascension matrix* $Delta$ as:
    $
      delta & = a_m - a_m_i \
      Delta & = mat(delta; 0) = mat(a_m - a_m_i; 0)
    $
    Then, $B(n)$ is essentially adding $Delta$ to each pair in $B$ element-wise, i.e.,
    $
      B(0) &= mat(a_m_i, ..., a_(m-1); b_m_i, ..., b_(m-1))\
      B(1) &= mat(a_m_i + delta, ..., a_(m-1) + delta; b_m_i, ..., b_(m-1))\
      B(n) &= mat(a_m_i + delta dot n, ..., a_(m-1) + delta dot n; b_m_i, ..., b_(m-1))\
    $

    Case 2 can be thought of as a special case of this rule where $Delta = mat(0; 0)$.
]
That might have been too complex, so here are some examples:
// #example[

//   Expand the following PSS matrices:

//   + $mat(0, 1, 2, 2; 0, 1, 1, 0)[n]$

//     #[
//       The last column is $mat(2;0)$, so no ascension, just normal PrSS-like behavior:
//       #pin-matrix("gt0","gb0", color: green)
//       #pin-matrix("gt1","gb1", color: green)
//       #pin-matrix("bt0","bb0", color: teal)
//       #pin-matrix("bt1","bb1", color: teal)
//       #pin-matrix("bt2","bb2", color: teal)

//       $
//         // pins convention to marking out Good Roots and Bad Roots:
//         // gt = Good root Top
//         // gb = Good root Bottom
//         // bt = Bood root Top
//         // bb = Bad root Bottom

//         // Coordinate convention for mannot's marks:
//         // [ a0, a1, ... ]
//         // [ b0, b1, ... ]
//         mat(
//           #pin("gt0")0, #pin("bt0")mark(1, tag: #<a1>), 2, mark(2, tag: #<a3>);
//           mark(0, tag: #<b0>)#pin("gb0"),mark(1, tag: #<b1>),1#pin("bb0"),0
//         )[n]
//         =
//         mat(
//           #pin("gt1")0, #pin("bt1")1, 2, #pin("bt2")1, 2, ...;
//           mark(0, tag: #<d0>)#pin("gb1"), mark(1, tag: #<d1>), 1#pin("bb1"), mark(1, tag: #<d3>), 1#pin("bb2"), ...
//         )
//       $
//       #annot-cetz(
//         (<a1>,<a3>),
//         cetz,
//         {
//           import cetz.draw: *
//           set-style(
//             mark: (end: "straight", length: 0.2em, width: 0.2em),
//             stroke: fuchsia + .75pt,
//           )
//           bezier-through("a3.north", (rel: (x: -.2, y: .15)), "a1.north")

//         },
//       )
//       #annot(<b0>, pos: bottom, dy: 0.25em, text(fill: green)[$G$])
//       #annot(<d0>, pos: bottom, dy: 0.25em, text(fill: green)[$G$])
//       #annot(<b1>, pos: bottom, dy: 0.25em, dx: 0.5em, text(fill: teal)[$B$])
//       #annot(<d1>, pos: bottom, dy: 0.25em, dx: 0.5em, text(fill: teal)[$B$])
//       #annot(<d3>, pos: bottom, dy: 0.25em, dx: 0.5em, text(fill: teal)[$B$])
//     ]
//   + $mat(0, 1, 2, 2; 0, 1, 1, 1)[n]$

//     #[
//       The last column is $mat(2;1)$. We find the ancestors of $2$ on the top row, which are $fuchsiaf(1)$ and $fuchsiaf(0)$ as shown by the arrows.
//       $
//         mat(
//           mark(fuchsiaf(0), tag: #<a0>), mark(fuchsiaf(1), tag: #<a1>), 2, mark(2, tag: #<a3>);
//           mark(0, tag: #<b0>), mark(1, tag: #<b1>), 1, mark(1, tag: #<b3>)
//         )[n]
//       $

//       #annot-cetz(
//         (<a0>, <a1>, <a3>, <b0>, <b1>, <b3>),
//         cetz,
//         {
//           import cetz.draw: *
//           set-style(
//             mark: (end: "straight", length: 0.2em, width: 0.2em),
//             stroke: fuchsia + .75pt,
//           )
//           bezier-through("a1.north", (rel: (x: -.15, y: .15)), "a0.north")
//           bezier-through("a3.north", (rel: (x: -.2, y: .15)), "a1.north")
//         },
//       )

//       Then on the bottom row to find the parent of $1$, we only search within columns that contains ancestors of $2$, colored in #fuchsiaf[fuchsia].
//       Columns that we ignore and colored #grayf[gray].

//       $
//         mat(
//           mark(fuchsiaf(0), tag: #<a0>), mark(fuchsiaf(1), tag: #<a1>), grayf(2), mark(2, tag: #<a3>);
//           mark(fuchsiaf(0), tag: #<b0>), mark(fuchsiaf(1), tag: #<b1>), grayf(1), mark(1, tag: #<b3>)
//         )[n]
//       $

//       #annot-cetz(
//         (<a0>, <a1>, <a3>, <b0>, <b1>, <b3>),
//         cetz,
//         {
//           import cetz.draw: *
//           set-style(
//             mark: (end: "straight", length: 0.2em, width: 0.2em),
//             stroke: fuchsia + .75pt,
//           )
//           bezier-through("a1.north", (rel: (x: -.15, y: .15)), "a0.north")
//           bezier-through("a3.north", (rel: (x: -.2, y: .15)), "a1.north")
//           bezier-through("b3.south", (rel: (x: -.25, y: -.1)), "b0.south")

//         },
//       )
//       In this case, $fuchsiaf(0)$ is the only term in the bottom row in #fuchsiaf[fuchsia] that is $<1$, so the parent of $mat(2;1)$ is $mat(0;0)$.
//     ]

//     #[
//       We then have an ascension matrix of $Delta = mat(2;0)$, which results in:

//       \
//       \
//       // #pin-matrix("gt2","gb2", color: green)
//       // #pin-matrix("gt1","gb1", color: green)
//       #pin-matrix("bt3","bb3", color: teal)
//       #pin-matrix("bt4","bb4", color: teal)
//       #pin-matrix("bt5","bb5", color: teal)
//       // #pin-matrix("bt1","bb1", color: teal)
//       // #pin-matrix("bt2","bb2", color: teal)

//       $
//         mat(
//           #pin("bt3")mark(0, tag: #<a0>), mark(1, tag: #<a1>), 2, mark(2, tag: #<a3>);
//           mark(0, tag: #<b0>), mark(1, tag: #<b1>),1#pin("bb3"),mark(1, tag: #<b3>)
//         )[n]
//         =
//         mat(
//           #pin("bt4")0,1,2,#pin("bt5")2,3,4,...;
//           0,mark(1, tag: #<d1>),1#pin("bb4"),0,mark(1, tag: #<d4>),1#pin("bb5"),...
//         )
//       $
//       #annot-cetz(
//         (<a0>, <a1>, <a3>, <b0>, <b3>),
//         cetz,
//         {
//           import cetz.draw: *
//           set-style(
//             mark: (end: "straight", length: 0.2em, width: 0.2em),
//             stroke: fuchsia + .75pt,
//           )
//           bezier-through("a1.north", (rel: (x: -.15, y: .15)), "a0.north")
//           bezier-through("a3.north", (rel: (x: -.2, y: .15)), "a1.north")
//           bezier-through("b3.south", (rel: (x: -.25, y: -.1)), "b0.south")

//         },
//       )
//       // #annot(<b0>, pos: bottom, text(fill: green)[$G$])
//       #annot(<b1>, pos: bottom, dy: 0.25em, text(fill: teal)[$B(0)$])
//       #annot(<d1>, pos: bottom, dy: 0.25em, text(fill: teal)[$B(0)$])
//       #annot(<d4>, pos: bottom, dy: 0.25em, text(fill: teal)[$B(1)$])
//     ]
// ]

Note that when the bottom row is entirely $0$s, we just get regular PrSS.

=== PSS Hydra
We can correspond a PSS into its hydra form, by constructing a hydra such that for each pair, the top row represents the node's height, and the bottom row represents the node's value:
#[


  #figure[
    #set align(center + horizon)
    #stack(
      dir: ltr,
      spacing: 2em,
      $
        mat(0,1,2,3,2;0,1,1,1,0)
      $,
      $arrow.r.long$,
      [
        #set text(size: 8pt)
        #pss((0,1,2,3,2),(0,1,1,1,0))
      ]
    )
  ]
  Now if we were to interpret it as a Buchholz Hydra, we get $bocf(0,bocf(1,bocf(1,bocf(1,zero)) plus bocf(0,zero)))$,
  which suggests it corresponds to the ordinal $psi_0(Omega^Omega dot omega) = Gamma_omega$.
  This method will produce standard-form ordinal notation for notations less than $bocf(0,bocf(2,zero)) ~ "BHO"$

  #let smoltext(content) = [
    #set text(size: 8pt)
    #content
  ]
  #let supersmoltext(content) = [
    #set text(size: 6pt)
    #content
  ]

  #align(center)[
    // #set text(size: 8pt)
    #table(
      columns: 4,
      align: horizon,
      inset: 0.75em,
      table.header([*PSS*], [*Hydra*], [*Ordinal Notation*], [*Ordinal*]),
      $
        mat(0, 1; 0, 1)
      $,
      smoltext(pss((0,1),(0,1))),$bocf(0,bocf(1,zero))$,$psi_0(Omega) = e0$,
      $
        mat(0, 1, 0, 1; 0, 1, 0, 1)
      $,
      smoltext(pss((0,1,0,1),(0,1,0,1))),$bocf(0,bocf(1,zero)) plus bocf(0,bocf(1,zero))$,$psi_0(Omega) dot 2 = e0 dot 2$,
      $
        mat(0,1,1; 0,1,0)
      $,
      smoltext(pss((0,1,1),(0,1,0))),$bocf(0,bocf(1,zero) plus bocf(0,zero))$,$psi_0(Omega+1) = e0 dot omega$,


      $
        mat(0,1,1,2; 0,1,0,1)
      $,
      smoltext(pss((0,1,1,2),(0,1,0,1))),$bocf(0,bocf(1,zero) plus bocf(0,bocf(1,zero)))$,$psi_0(Omega + psi_0(Omega)) = e0^2$,

      $
        mat(0,1,1,2,2,3; 0,1,0,1,0,1)
      $,
      smoltext(pss((0,1,1,2,2,3),(0,1,0,1,0,1))),$bocf(0,bocf(1,zero) plus bocf(0,bocf(1,zero)))$,$psi_0(Omega + psi_0(Omega)) = e0^e0$,

      $
        mat(0,1,1;0,1,1)
      $,
      smoltext(pss((0,1,1),(0,1,1))),$bocf(0,bocf(1,zero) plus bocf(1,zero))$,$psi_0(Omega 2) = epsilon_1$,

      $
        mat(0,1,1,1;0,1,1,1)
      $,
      smoltext(pss((0,1,1,1),(0,1,1,1))),$bocf(0,bocf(1,zero) dot 3)$,$psi_0(Omega 3) = epsilon_2$,

      $
        mat(0,1,2;0,1,0)
      $,
      smoltext(pss((0,1,2),(0,1,0))),$bocf(0,bocf(1,bocf(0,zero)))$,$psi_0(Omega dot omega) = epsilon_omega$,

      $
        mat(0,1,2,3;0,1,0,1)
      $,
      smoltext(pss((0,1,2,3),(0,1,0,1))),$bocf(0,bocf(1,bocf(0,bocf(1,zero))))$,$psi_0(Omega dot psi_0(Omega)) = epsilon_e0$,

      $
        mat(0,1,2,3,4,5;0,1,0,1,0,1)
      $,
      smoltext(pss((0,1,2,3,4,5),(0,1,0,1,0,1))),
      smoltext($bocf(0,bocf(1,bocf(0,bocf(1,bocf(0,bocf(1,zero))))))$),
      smoltext($psi_0(Omega dot psi_0(Omega dot psi_0(Omega))) = epsilon_epsilon_e0$),

      $
        mat(0,1,2;0,1,1)
      $,
      smoltext(pss((0,1,2),(0,1,1))), $bocf(0,bocf(1,bocf(1,zero)))$, $psi_0(Omega^2) = z0$,

      $
        mat(0,1,2,1;0,1,1,1)
      $,
      smoltext(pss((0,1,2,1),(0,1,1,1))), $bocf(0,bocf(1,bocf(1,zero)) plus bocf(1,zero))$, $psi_0(Omega^2 + Omega) = epsilon_(z0+1)$,

      $
        mat(0,1,2,1,2;0,1,1,1,1)
      $,
      smoltext(pss((0,1,2,1,2),(0,1,1,1,1))), $bocf(0,bocf(1,bocf(1,zero)) dot 2)$, $psi_0(Omega^2 dot 2) = zeta_1$,

      $
        mat(0,1,2,2,3,4;0,1,1,0,1,1)
      $,
      smoltext(pss((0,1,2,2,3,4),(0,1,1,0,1,1))),
      smoltext($bocf(0,bocf(1,bocf(1,zero) plus bocf(0,bocf(1,bocf(1,zero)))))$),
      smoltext($psi_0(Omega^2 dot psi_0(Omega^2)) = zeta_z0$),

      $
        mat(0,1,2,2;0,1,1,1)
      $,
      smoltext(pss((0,1,2,2),(0,1,1,1))),
      smoltext($bocf(0,bocf(1,bocf(1,zero)+bocf(1,zero)))$),
      $
        psi_0(Omega^3)  &= phi(3,0) \ &= eta_0
      $,

      $
        mat(0,1,2,2,2;0,1,1,1,1)
      $,
      smoltext(pss((0,1,2,2,2),(0,1,1,1,1))),
      $bocf(0,bocf(1,bocf(1,zero) dot 3))$,
      $psi_0(Omega^4) = phi(4,0)$,

      $
        mat(0,1,2,3;0,1,1,0)
      $,
      smoltext(pss((0,1,2,3),(0,1,1,0))),
      $bocf(0,bocf(1,bocf(1,bocf(0,zero))))$,
      $psi_0(Omega^omega) = phi(omega,0)$,

      $
        mat(0,1,2,3,4;0,1,1,0,1)
      $,
      smoltext(pss((0,1,2,3,4),(0,1,1,0,1))),
      $bocf(0,bocf(1,bocf(1,bocf(0,bocf(1,zero)))))$,
      $
        psi_0(Omega^(psi_0(Omega)))\ = phi(e0,0)
      $,

      $
        mat(0,1,2,3,4,5;0,1,1,0,1,1)
      $,
      smoltext(pss((0,1,2,3,4,5),(0,1,1,0,1,1))),
      smoltext($bocf(0,bocf(1,bocf(1,bocf(0,bocf(1,bocf(1,zero))))))$),
      $
        psi_0(Omega^(psi_0(Omega^2)))\ = phi(z0,0)
      $,

      $
        mat(0,1,2,3;0,1,1,1)
      $,
      smoltext(pss((0,1,2,3),(0,1,1,1))),
      $bocf(0,bocf(1,bocf(1,bocf(1,zero))))$,
      $psi_0(Omega^Omega) = G0$,

      $
        mat(0,1,2,3,4;0,1,1,1,0)
      $,
      smoltext(pss((0,1,2,3,4),(0,1,1,1,0))),
      smoltext($bocf(0,bocf(1,bocf(1,bocf(1,bocf(0,zero)))))$),
      $psi_0(Omega^Omega^omega) = "SVO"$,

      $
        mat(0,1,2,3,4;0,1,1,1,1)
      $,
      smoltext(pss((0,1,2,3,4),(0,1,1,1,1))),
      smoltext($bocf(0,bocf(1,bocf(1,bocf(1,bocf(1,zero)))))$),
      $psi_0(Omega^Omega^Omega) = "LVO"$,
    )
  ]

  === Standardization
  But the problem begins at the Bachmann-Howard Ordinal. If you think of it as $psi_0(Omega^Omega^dots.up)$, in PSS that translates to:
  $
    psi_0(Omega) &~ mat(0,1;0,1)\
    psi_0(Omega^2) &~ mat(0,1,2;0,1,1)\
    psi_0(Omega^Omega) &~ mat(0,1,2,3;0,1,1,1)\
    psi_0(Omega^Omega^Omega) &~ mat(0,1,2,3,4;0,1,1,1,1)\
    psi_0(Omega^Omega^dots.up) &~ mat(0,1,2,3,4,...;0,1,1,1,1,...)
  $
  So we need a matrix with good root $G=mat(0;0)$, base bad root $B=mat(1;0)$, ascension $Delta=mat(1;0)$, which leads us to:
  $
    "BHO" ~ mat(0,1,2;0,1,2) ~ psi_0(psi_1(psi_2(0)))
  $
  which as we have already seen is non-standard.

  The standardization algorithm is as such:
  - Find the innermost non-standard term $fira(bocf(v,bocf(v+1,a_0+...+a_k)))$, such that $fira(bocf(v+1,a_0+...+a_k) in.not C_v (bocf(v+1,a_0 plus ... plus a_k)))$
  - Collect all terms $fira(a_0\,...\,a_i >= Omega_(v+2))$ (There will be such terms because otherwise it would be standard form)
    - If all terms $fira(a_0\,...\,a_k >= Omega_(v+2))$, then replace
      $
        fira(bocf(v,bocf(v+1,a_0+...+a_k)) -> bocf(v,a_0+...+a_k))
      $
    - If only some terms $fira(a_0\,...\,a_i >= Omega_(v+2))$, then replace
      $
        fira(bocf(v,bocf(v+1,a_0+...+a_k)) -> bocf(v,a_0+...+a_i+bocf(v+1,a_0+...+a_k)))
      $
  #example[
    Standardize the following:
    + $fira(bocf(0,bocf(1,Omega_2+Omega_1)))$

      $fira(bocf(1,Omega_2+Omega_1))$ is standard form since $fira(Omega_2 + Omega_1 in C_1 (Omega_2 + Omega_1))$\
      $fira(bocf(0,bocf(1,Omega_2+Omega_1)))$ is *not* standard form since $fira( Omega_2+Omega_1 in.not C_0(bocf(1,Omega_2+Omega_1)) )$
      as $fira(Omega_2 > bocf(1,x))$, so $fira(bocf(1,Omega_2+Omega_1) in.not C_0(bocf(1,Omega_2+Omega_1)))$.

      So we have $fira(Omega_2 >= Omega_2)$, while $fira(Omega_1 < Omega_2)$

      We convert our term to $fira(bocf(0,Omega_2+bocf(1,Omega_2 + Omega_1)))$

    + $fira(bocf(0,bocf(1,bocf(2,bocf(3,bocf(4,Omega_5) + Omega_4) + bocf(3,bocf(4, Omega_5) + Omega_3) + Omega_2))))$

      Terms highlighted represent the $a$'s that get modified
      $
        fira(
          &bocf(0,bocf(1,bocf(2,bocf(3,fuchsiaf(bocf(4,Omega_5)) + Omega_4) + bocf(3,bocf(4, Omega_5) + Omega_3) + Omega_2)))\
          &bocf(0,bocf(1,bocf(2,bocf(3,fuchsiaf(Omega_5) + Omega_4) + bocf(3,bocf(4, Omega_5) + Omega_3) + Omega_2)))\
          &bocf(0,bocf(1,bocf(2,tealf(bocf(3,Omega_5 + Omega_4)) + bocf(3,bocf(4, Omega_5) + Omega_3) + Omega_2)))\
          &bocf(0,bocf(1,bocf(2,tealf(Omega_5 + Omega_4) + bocf(3,bocf(4, Omega_5) + Omega_3) + Omega_2)))\
          &bocf(0,bocf(1,bocf(2,Omega_5 + Omega_4 + bocf(3,fuchsiaf(bocf(4, Omega_5)) + Omega_3) + Omega_2)))\
          &bocf(0,bocf(1,bocf(2,Omega_5 + Omega_4 + bocf(3,fuchsiaf(Omega_5) + Omega_3) + Omega_2)))\
          &bocf(0,bocf(1,tealf(bocf(2,Omega_5 + Omega_4 + bocf(3,Omega_5 + Omega_3) + Omega_2))))\
          &bocf(0,bocf(1,tealf(Omega_5 + Omega_4 + bocf(3,Omega_5 + Omega_3) + bocf(2,Omega_5 + Omega_4 + bocf(3,Omega_5 + Omega_3) + Omega_2))))\
          &bocf(0,fuchsiaf(bocf(1,Omega_5 + Omega_4 + bocf(3,Omega_5 + Omega_3) + bocf(2,Omega_5 + Omega_4 + bocf(3,Omega_5 + Omega_3) + Omega_2))))\
          &bocf(0,fuchsiaf(Omega_5 + Omega_4 + bocf(3,Omega_5 + Omega_3) + bocf(2,Omega_5 + Omega_4 + bocf(3,Omega_5 + Omega_3) + Omega_2)))\
        )
      $
  ]

  This "raw" form (i.e. $bocf(0,bocf(1,bocf(2,zero)))$ instead of $bocf(0,bocf(2,zero))$) is also known as PSS Hydra
  since its basically another way to write the hydra diagram.

  For post-BHO expressions we will include both the "raw" PSS hydra form and the standardized form, with PSS Hydra on top and standardized below.
  #align(center)[
    // #set text(size: 8pt)
    #table(
      columns: 4,
      align: horizon,
      inset: 0.75em,
      table.header([*PSS*], [*Hydra*], [*Ordinal Notation*], [*Ordinal*]),
      $
        mat(0,1,2; 0,1,2)
      $,
      smoltext(pss((0,1,2),(0,1,2))),
      [
        $fira(bocf(0,bocf(1,Omega_2)))$\
        $fira(bocf(0,Omega_2))$\
      ],
      $psi_0(Omega_2) = "BHO"$,

      $
        mat(0,1,2,1,2; 0,1,2,1,2)
      $,
      smoltext(pss((0,1,2,1,2),(0,1,2,1,2))),
      [
        $fira(bocf(0,bocf(1,Omega_2) plus bocf(1,Omega_2)))$\
        $fira(bocf(0,Omega_2 plus bocf(1,Omega_2)))$\
      ],
      $psi_0(Omega_2 + psi_1(Omega_2))$,

      $
        mat(0,1,2,2,3; 0,1,2,1,2)
      $,
      smoltext(pss((0,1,2,2,3),(0,1,2,1,2))),
      [
        $fira(bocf(0,bocf(1,Omega_2 plus bocf(1,Omega_2))))$\
        #smoltext($fira(bocf(0,Omega_2 plus bocf(1,Omega_2 plus bocf(1,Omega_2))))$)\
      ],
      smoltext[
        $
          psi_0(Omega_2 + psi_1(Omega_2 + psi_1(Omega_2)))\ = psi_0(Omega_2 + psi_1(Omega_2)^2)
        $
      ],

      smoltext[$
        mat(0,1,2,2,3,3,4; 0,1,2,1,2,1,2)
      $],
      smoltext(pss((0,1,2,2,3,3,4),(0,1,2,1,2,1,2))),
      [
        #smoltext($fira(bocf(0,bocf(1,Omega_2 + bocf(1,Omega_2+bocf(1,Omega_2)))))$)\
        #supersmoltext($fira(bocf(0,Omega_2+bocf(1,Omega_2+bocf(1,Omega_2+bocf(1,Omega_2)))))$)\
      ],
      [
        #supersmoltext($psi_0(Omega_2 + psi_1(Omega_2 + psi_1(Omega_2 + psi_1(Omega_2))))$)\
        #smoltext($= psi_0(Omega_2 + psi_1(Omega_2)^(psi_1(Omega_2)))$)\
      ],

      $
        mat(0,1,2,2; 0,1,2,2)
      $,
      smoltext(pss((0,1,2,2),(0,1,2,2))),
      [
        $fira(bocf(0,bocf(1,Omega_2 + Omega_2)))$\
        $fira(bocf(0,Omega_2+Omega_2))$\
      ],
      $psi_0(Omega_2 dot 2)$,

      $
        mat(0,1,2,3; 0,1,2,0)
      $,
      smoltext(pss((0,1,2,3),(0,1,2,0))),
      [
        $fira(bocf(0,bocf(1,bocf(2,Omega_0))))$\
        $fira(bocf(0,bocf(2,Omega_0)))$\
      ],
      $psi_0(Omega_2 dot omega)$,

      $
        mat(0,1,2,3; 0,1,2,1)
      $,
      smoltext(pss((0,1,2,3),(0,1,2,1))),
      [
        $fira(bocf(0,bocf(1,bocf(2,Omega_1))))$\
        $fira(bocf(0,bocf(2,Omega_1)))$\
      ],
      $psi_0(Omega_2 dot Omega)$,

      $
        mat(0,1,2,3,4; 0,1,2,2,2)
      $,
      smoltext(pss((0,1,2,3,4),(0,1,2,2,2))),
      [
        $fira(bocf(0,bocf(1,bocf(2,bocf(2,Omega_2)))))$\
        $fira(bocf(0,bocf(2,bocf(2,Omega_2))))$\
      ],
      $psi_0(Omega_2^Omega_2)$,

      $
        mat(0,1,2,3; 0,1,2,3)
      $,
      smoltext(pss((0,1,2,3),(0,1,2,3))),
      [
        $fira(bocf(0,bocf(1,bocf(2,Omega_3))))$\
        $fira(bocf(0,Omega_3))$\
      ],
      $psi_0(Omega_3)$,

      $
        mat(0,1,...,n;0,1,...,n)
      $,
      smoltext(
        pss(
          (0,1),(0,1),
          node(
            (2,-2),
            $...$,
            stroke: none
          ),
          node(
            (3,-3),
            $n$,
            // stroke: none
          ),
          edge((1,-1),"r,u"),
          edge((2,-2),"r,u"),
        )
      ),
      [
        $fira(bocf(0,bocf(1,... bocf(n-1,Omega_n) ... )))$\
        $fira(bocf(0, Omega_n))$
      ],
      $psi_0(Omega_n)$
    )
  ]

  We see that the limit of PSS is also #BO.

]




== Patcail's Hydra/Mini-Nuclear Array Notation

```
# FSes FOR PATCAIL NOTATION
## Normalization function
The function Norm(x) is defined as follows:
1. Norm(0) = 0
2. If x = [[0,a],b]:
   Norm(x) = [c,[A,b]], where
   A = Norm(a)
   c = A but all instances of b are replaced with [A,b].
3. Otherwise, Norm([a,b]) = [Norm(a),b]
## FSes
The function FS(x,k) is defined as follows:
1. FS(0,k) = 0
2. FS([0,a],c) = a
3. FS(n,k) = k
4. FS([a,b],k) = FS(Norm(x),k) if Norm(a) is of the form [0,c].
5. Otherwise, FS([a,b],k) = [FS(a,k),b].
Note that n is a term, equivalent to ω.
```
