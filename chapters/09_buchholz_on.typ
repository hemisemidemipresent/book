#import "../shorthands.typ": *
= Ordinal Notations up to #TFBO
#let E = $epsilon_(Omega_omega + 1)$
We introduce a set of ordinal notations $OT$ along with a recursive way to order them $prec$,
such that $(OT, prec)$ is order isomorphic to $(C_0(#E),<)$



#definition[
    #let s = purplef[*$s$*]
    #let t = pinkf[*$t$*]

    Let $T$ be the set of terms and $PT$ be the set of all prinicpal terms (the terms in $PT$ are associated to additively principal ordinals).

    - $zero in T$
    - Given a principal term $s in PT$ and a term $t in T$, $s plus t in T$
    - Given a term $t in T$, $mu <=omega$, $bocf(mu,t) in T "and" PT$

    Let $prec$ be a binary relation on $T$.



    For terms $#s, #t in T$, $#s prec #t$ is defined as:
    - If $#s = zero$ then $#s prec #t$ if $#t != zero$
    - If $#t = zero$ then $#s prec #t$ is false
    - If $#s = a plus b$ where $a in PT$ and $b in T\\{zero}$, then
        - If $#t = c plus d$ for some $c in PT$ and $d in T\\{zero}$
            - If $a != c$ then $#s prec #t$ if and only if $a prec c$
            - If $a = c$ then $#s prec #t$ if and only if $b prec d$
        - If $#t in PT$ then $#s prec #t$ if and only if $a prec #t$
    - If $#s = bocf(mu,a)$ for some $a in T, mu <= omega$ then:
        - If $#t = c plus d$ for some $c in PT$ and $d in T\\{zero}$, then $#s prec #t$ if and only if $#s prec.eq c$
        - If $#t = bocf(nu,b)$ for some $b in T, nu <= omega$ then:
            - If $mu != nu$ then $#s prec #t$ if and only if $mu prec nu$
            - If $mu = nu$ then $#s prec #t$ if and only if $a prec b$

    For terms $#s, #t$, we have a family of the binary relations $ternary(#s,mu,#t)$ for $mu <= omega$ if and only if:

    - $#s prec bocf(mu,zero)$
    - $#s = a plus b$ for some $a in PT$ and $b in T\\{zero}$ and $ternary(a,mu,#t)$ and $ternary(b,mu,#t)$
    - $#s = bocf(nu,a)$ for some $a in T, nu <= omega$ and $ternary(a,mu,#t)$ and $b prec #t$

    Let $OT$ be a subset of $T$. $OT$ corresponds to the set of all ordinal notations of normal form.
    $OT$ is defined as:

    - $zero in OT$
    - If $a_0, ..., a_k in OT$ and $a_0, ..., a_k in PT$, if $a_k prec.eq ... prec.eq a_0$, their sum $a_0 plus ... plus a_k in OT$
    - For a term $a in T$, $bocf(mu, a) in OT$ if and only if $a in OT$ and $ternary(a, mu, a)$
]



We can now define a map to associate each ordinal notation to an ordinal below $TFBO$:

#definition[

The map $o : OT arrow.r.bar C_0(#E)$ is defined recursively as such:

+ $o(zero) := 0$
+ $o(a_0 plus ... plus a_k) = o(a_0) + ... + o(a_k)$
+ $o(bocf(nu, a)) = psi_nu (o(a))$
]
This should be fairly self-explanatory with the notation that has been chosen essentially being red versions of the usual ordinals.

In #link("https://doi.org/10.1016/0168-0072(86)90052-7")[Buchholz's original paper], where $o$ was originally defined,
he formally proved that $(OT, prec)$ is order isomorphic to $(C_0(#E),<)$, that they are well-ordered (no infinite descending sequence), and that these two sets have order type $TFBO$.
Note that he used $D_nu a$ instead of our red $bocf(nu, a)$,
and $G_nu (b)$ is somewhat analogous to $ C_nu (b)$. // [WIP: What is G_v in his paper?]
// [WIP: His proof is not that long, maybe we can break it down here?]



== Buchholz's Hydra

#let buchholz-hydra = tidy-tree-graph.with(
    draw-node: (
        tidy-tree-draws.circle-draw-node,
        tidy-tree-draws.label-match-draw-node.with(
          matches: (
            red: (fill: red),
            orange: (fill: orange),
            green: (fill: green),
            blue: (fill: lightblue),
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
          ),
          default: (stroke: black + 0.5pt)
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
            ]
        )]
    + If $a$ has label $u+1$, we go down the tree looking for a node $b$ whose label is $v <= u$.
        Let the subtree rooted in $b$ be called $S$. We make a copy of $S$ called $S'$.
        We re-label the $b$ inside $S'$ to $u$ and re-label the $a$ inside $S'$ to be $0$.
        We then replace $a$ in the original tree with $S'$

        Here's an illustration. If this is the hydra:

        #figure(
            buchholz-hydra[
                - $+$ #node-attr(rotate: -180deg)
                  - \u{200b}
                    - $b = v <= u$ <red>
                      + #metadata("red")
                      - \u{200b} <red>
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
        then the nodes highlighted in red (and a highlighted in blue) make up $S$. We then make a copy called $S'$ and make the changes accordingly:

        #figure(
            align(center + horizon)[#stack(
                dir: ltr,
                // spacing: 1em,
                buchholz-hydra[
                    - $b = v <= u$ #node-attr(rotate: -180deg) <red>
                      + #metadata("red")
                      - \u{200b} <red>
                        + #metadata("red")
                        - $a = u+1$ <blue>
                        + #metadata("red")
                        - $...$ <red>
                      + #metadata("red")
                      - $...$ <red>
                ],
                $arrow.r.long #h(2em)$,
                buchholz-hydra[
                    - $b' = u$ #node-attr(rotate: -180deg) <orange>
                      + #metadata("orange")
                      - \u{200b} <orange>
                        + #metadata("orange")
                        - $a' = 0$ <orange>
                        + #metadata("orange")
                        - $...$ <orange>
                      + #metadata("orange")
                      - $...$ <orange>
                ]
            )]
        )
        Then replacing the original $a$ with $S'$ gives:

        #align(center + horizon)[#stack(
            dir: ltr,
            // spacing: 1em,
            buchholz-hydra[
                - $+$ #node-attr(rotate: -180deg)
                  - \u{200b}
                    - $b = v <= u$ <red>
                      + #metadata("red")
                      - \u{200b} <red>
                        + #metadata("red")
                        - $a = u+1$ <blue>
                        + #metadata("red")
                        - $...$ <red>
                      + #metadata("red")
                      - $...$ <red>
                    - $...$
                  - $...$
            ],
            $xarrow(#h(3em) n=3 #h(3em))$,
            buchholz-hydra[
                - $+$ #node-attr(rotate: -180deg)
                  - \u{200b}
                    - $b = v <= u$ <red>
                      + #metadata("red")
                      - \u{200b} <red>
                        + #metadata("red")
                        - $b' = u$ <orange>
                          + #metadata("orange")
                          - \u{200b} <orange>
                            + #metadata("orange")
                            - $a' = 0$ <orange>
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
        )]


    + If $a$ has label $omega$, replace the label $omega$ with $n+1$

]

Similarly to the Kirby-Paris Hydra, we can associate each hydra with an ordinal notation by the following rules:

+ For each leaf node with a label $u$, we replace it with the ordinal notation $bocf(u,0)$
+ For a node with label $u$ with children of ordinal notations $a_0, ..., a_k$, we replace it with the ordinal notation $bocf(u, a_0 plus ... plus a_k)$
+ At the root node, the resulting ordinal expressions of each of the root's children $a_0, ..., a_k$ are summed up: $a_0 plus ... plus a_k$

Here are some examples of Buchholz's hydra and the associated ordinal notations and ordinals. The hydras have been rotated to save space.

#align(center)[
    #let angle = 90deg
    #table(
        columns: (auto, auto, auto),
        align: horizon,
        inset: 0.75em,
        table.header([*Buchholz Hydra*], [*Associated Ordinal Notation*], [*Associated Ordinal*]),
        buchholz-hydra[
            - \+
        ], zero, $0$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
        ], $bocf(0,zero)$, $1$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
              - 0
        ], $bocf(0,zero) plus bocf(0,zero)$, $2$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - 0
        ], $bocf(0,bocf(0,zero))$, $omega$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
              - 0
                - 0
        ], $bocf(0,bocf(0,zero)) plus bocf(0,zero)$, $omega+1$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - 0
              - 0
                - 0
        ], $bocf(0,bocf(0,zero)) plus bocf(0,bocf(0,zero))$, $omega 2$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - 0
                - 0
        ], $bocf(0,bocf(0,zero) plus bocf(0,zero))$, $omega^2$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - 0
                  - 0
        ], $bocf(0,bocf(0,bocf(0,zero)))$, $omega^omega$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - 0
                  - 0
                    - 0
        ], $bocf(0,bocf(0,bocf(0,bocf(0,zero))))$, $omega^omega^omega$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - 1
        ], $bocf(0,bocf(1,zero))$, $psi_0(Omega) = e0$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - 1
                - 1
        ], $bocf(0,bocf(1,zero) + bocf(1,zero))$, $psi_0(Omega 2) = epsilon_1$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - 1
                  - 1
        ], $bocf(0,bocf(1,bocf(1,zero)))$, $psi_0(Omega^2) = z0$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - 1
                  - 1
                    - 1
        ], $bocf(0,bocf(1,bocf(1,bocf(1,zero))))$, $psi_0(Omega^Omega) = G0$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - 1
                  - 1
                    - 1
                      - 1
        ], $bocf(0,bocf(1,bocf(1,bocf(1,bocf(1,zero)))))$, $psi_0(Omega^Omega^Omega) = LVO$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - 2
        ], $bocf(0,bocf(2,zero))$, $psi_0(Omega_2) = "BHO"$,
        buchholz-hydra[
            - \+ #node-attr(rotate: angle)
              - 0
                - $omega$
        ], $bocf(0,bocf(omega,zero))$, $BO = "BO"$,

    )
]

== The Hyper Primitive Sequence System (HPrSS)

== Limited Patcail's Hydra

== The Pair Sequence System (PSS)

The Pair Sequence System (PSS) can also be considered an extension to the primitive sequence system, where instead of it being a sequence of natural numbers,
the Pair Sequence System can be thought og as a sequence of _pairs_ of natural numbers. There are two common ways to write PSS, either inline, like
$(0,0)(1,1)(2,1)(2,0)$ or as a matrix like so:
$
    mat(0,1,2,2;0,1,1,0)
$

divergence at $psi_0(Omega_omega dot (Omega + 1))$

== Ordinal notation associated with Extended Buchholz's function

#definition[
    #let s = purplef[*$s$*]
    #let t = pinkf[*$t$*]
    #let u = lilacf[*$u$*]
    Let $T$ be the set of terms and $PT$ be the set of all prinicpal terms (terms whose associated ordinal are additively principal ordinals).

    - $zero in T$
    - Given a principal term $s in PT$ and a term $t in T$, $s plus t in T$
    - Given terms $s,t in T$, $bocf(s,t) in T "and" PT$

    Let $prec$ be a binary relation on $T$.



    For terms $#s, #t in T$, $#s prec #t$ is defined as:
    - If $#s = zero$ then $#s prec #t$ if $#t != zero$
    - If $#t = zero$ then $#s prec #t$ is false
    - If $#s = a plus b$ where $a in PT$ and $b in T\\{zero}$, then
        - If $#t = c plus d$ for some $c in PT$ and $d in T\\{zero}$
            - If $a != c$ then $#s prec #t$ if and only if $a prec c$
            - If $a = c$ then $#s prec #t$ if and only if $b prec d$
        - If $#t in PT$ then $#s prec #t$ if and only if $a prec #t$
    - If $#s = bocf(a,b)$ for some $a,b in T$ then:
        - If $#t = c plus d$ for some $c in PT$ and $d in T\\{zero}$, then $#s prec #t$ if and only if $#s prec.eq c$
        - If $#t = bocf(c,d)$ for some $c,d in T$ then:
            - If $a != c$ then $#s prec #t$ if and only if $a prec c$
            - If $a = c$ then $#s prec #t$ if and only if $b prec d$

    #let ternary(s,t,u) = $#s redf(in) redf(bold(C))_#t redf(\() #u redf(\))$
    For terms $#s, #t, #u$, we define the ternary relation $ternary(#s,#t,#u)$ if and only if:

    - $#s prec bocf(#t,zero)$
    - $#s = a plus b$ for some $a in PT$ and $b in T\\{zero}$ and $ternary(a,#t,#u)$ and $ternary(b,#t,#u)$
    - $#s = bocf(a,b)$ for some $a,b in T$ and $ternary(a,#t,#u)$ and $ternary(b,#t,#u)$ and $b prec #u$

    Let $OT$ be a subset of $T$. $OT$ corresponds to the set of all ordinal notations of normal form.
    For a term $#s$, $#s in OT$ is defined as:

    - If $#s = zero$ then $#s in OT$
    - If $#s = a plus b$ for some $a,b in PT$, then $#s in OT$ if and only if $a,b in OT$ and $b prec.eq a$
    - If $#s = a plus b plus c$ for some $a,b in PT$ and $c in T\\{zero}$ then $#s in OT$ if and only if $a,(b plus c) in OT$ and $b prec.eq a$
    - If $#s = bocf(a,b)$ for some $a,b in T$ then $#s in OT$ if and only if $a,b in OT$ and $ternary(b,a,b)$

]