#import "../shorthands.typ": *
= Ordinal Notations up to #TFBO
#let E = $epsilon_(Omega_omega + 1)$
We introduce a set of ordinal notations $OT$ corresponding to Buchholz's OCF, along with a recursive way to order them $prec$,
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
$OT$ here reprsents all ordinal notations that recursively satisfy the normal form, i.e. $bocf(a,b)$ always satisfies $ternary(b,a,b)$.
We call this #OT the subset of *standard form* terms.

From this, #link("https://doi.org/10.1016/0168-0072(86)90052-7")[Buchholz] showed that $({a in OT | a prec bocf(1,zero) }, prec)$ is order isomorphic to $(C_0(#E),<)$,
that they are well-ordered (no infinite descending sequence), and that these two sets have order type $TFBO$.
He additionally showed that for every ordinal notation $a prec bocf(1,zero)$, the ordinal $o(a)$ is the order type of ${x in OT | x prec a}$ under $prec$.

[WIP: His proofs is not that long, maybe we can break it down here? This section isn't as formal as the one on $<e0$]

Note that Buchholz used $D_nu a$ instead of our red $bocf(nu, a)$, $\#$ instead of our #plus,
and he uses $G_nu (b)$ is somewhat analogous to $C_nu (b)$. [WIP: What is $G_v$ in his paper?]

Now just like how the fundamental sequence of an ordinal $alpha[n] < alpha$, we can similarly define a fundamental sequence $a[n]$ for each ordinal notation $a$,
where $a[n] prec a$. This requires defining a computable version of _cofinality_ ($"dom"$ in Buchholz's paper)
// While we skipped over a lot of the formalism that was present, this ordinal notation is basically identical to the actual $psi$, just that it is computable.
Another thing to note about the fundamental sequences is that for a term $t in OT$, all terms in its fundamental sequence $t[n] in OT$.
[WIP: no proof/proof is left as an exercise]

Recall that when defining ordinal notations $<e0$, we build up in layers from the bottom-up with Cantor Normal Form.
Here, we go for a more "top-down" approach, where every ordinal notation $a prec bocf(omega,zero)$ can be expressed as taking fundamental sequences:
$
    a = bocf(omega,zero)[n_1][n_2]...[n_k]
$
For example, to get $bocf(0,bocf(1,zero) plus bocf(1,zero)) ~ epsilon_1$, (using David_Exmachina's fundamental sequences):

- $bocf(0,bocf(omega,zero)) ~ BO$
    - $dots.v$
    - `[2]` $bocf(0,bocf(2,zero)) ~ "BHO"$
        - $dots.v$
        - `[4]` $bocf(0,bocf(1,bocf(1,bocf(1,zero)))) ~ psi_0(Omega^Omega) = G0$
        - `[3]` $bocf(0,bocf(1,bocf(1,zero))) ~ psi_0(Omega^2) = z0$
            - $dots.v$
            - `[2]` $bocf(0,bocf(1,bocf(0,bocf(1,zero)))) ~ psi_0(Omega dot e0) = epsilon_e0$
                - $dots.v$
                - `[2]` $bocf(0,bocf(1,bocf(0,bocf(0,zero)))) ~ psi_0(Omega omega^omega) = epsilon_(omega^omega)$
                - `[1]` $bocf(0,bocf(1,bocf(0,zero))) ~ psi_0(Omega omega) = epsilon_omega$
                    - $dots.v$
                    - #box(fill: yellow, inset: 0.25em)[`[2]` $bocf(0,bocf(1,zero) plus bocf(1,zero)) ~ psi_0(Omega 2) = epsilon_1$]
                    - `[1]` $bocf(0,bocf(1,zero)) ~ psi_0(Omega) = e0$
                    - `[0]` $bocf(0,zero) ~ 1$
                - `[0]` $bocf(0,bocf(1,zero)) ~ psi_0(Omega) = e0$
            - `[1]` $bocf(0,bocf(1,zero)) ~ psi_0(Omega) = e0$
            - `[0]` $zero ~ 0$
        - `[2]` $bocf(0,bocf(1,zero)) ~ psi_0(Omega)$
        - `[1]` $bocf(0,zero) ~ 1$
        - `[0]` $zero ~ 0$
    - `[1]` $bocf(0,bocf(1,zero)) ~ psi_0(Omega) = e0$
    - `[0]` $bocf(0,bocf(0,zero)) ~ psi_0(1) = omega$

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
                ]
            )]
        )
        Now let's define the function $S(T)$ that takes in a tree $T$, and replaces $a'$ with $T$

        #box(align(horizon)[
                #stack(
                    dir: ltr,
                    [For example, if $T$ is ],
                    buchholz-hydra[
                     - 0 #node-attr(rotate:180deg)
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
                [.]
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

+ For each leaf node with a label $u$, we replace it with the ordinal notation $bocf(u,0)$
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

By restricting Buchholz Hydra to only those corresponding to $OT$ (rather than all of $T$), we can prove the termination of Buchholz Hydras.




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
            table.header([*$k$*],[*$m_k$*], [*$s_m_k$*]),
            $0$, $m_0 = m$, $s_m_0$,
            $1$, $m_1$, $s_m_1$,
            $dots.v$, $dots.v$, $dots.v$,
            $k$, $m_k$, $s_m_k$,
        )
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
                table.header([*$k$*],[*$m_k$* (indices of parents)], [*$s_m_k$* (values of parents)]),
                $0$, $m_0 = 3$, $s_m_0 = s_3 = 1$,
                $1$, $m_1 = 1$, $s_m_1 = s_1 = 0$,
            )
        )

        Our difference sequence is just $N = (1)$, so by normal PrSS expansion we have good root $G = ()$ and bad root $B = (0,2)$, and as such
        $
            (0,2,1)[n] = underbrace((0,2,0,2,...), (0,2) "repeated" n "times")
        $
        Now using our new system, we have $r=m_1 = 1$ so we still have empty good root $G = ()$, and an ascension factor of $delta = 0$, so our bad root function
        $
            B(n) &= (s_r + n dot 0,...,s_(m_0-1) + n dot 0)\
            &= (s_1,...,s_(m_0-1))\
            &= (0,2)
        $
        So we end up with the same result.
    + For $s = (0,2)$, the parent of $s_2 = 2$ is $s_1 = 0$, so we have
        #figure(
            table(
                columns: (auto, auto, auto),
                inset: 0.75em,
                align: center,
                table.header([*$k$*],[*$m_k$* (indices of parents)], [*$s_m_k$* (values of parents)]),
                $0$, $m_0 = 2$, $s_m_0 = s_2 = 2$,
                $1$, $m_1 = 1$, $s_m_1 = s_1 = 0$,
            )
        )

        Our difference sequence is $N=(2)$, so we fall under the sub-case 1, where there exists no $i$ such that $N_i < N_0$.
        We then have $r=1$ which leads to an empty good root $G = ()$, and an ascension factor of $delta = s_m_0 - 1 = 2-1 = 1$.
        So our bad root function is:
        $
            B(n) &= (s_r + n dot delta, ..., s_(m_0-1) + n dot delta)\
            &= (s_1 + n dot 1)\
            &= (0 + n)\
            &= (n)
        $

        So concatenating $G, B(0), ...,B(n)$, we concatenate $(), (0), (1),...,(n)$:
        $
            (0,2)[n] = underbrace((0,1,2,3,...), "of length" n)
        $
    + For $s = (0,2,1,3)$, the parent of $s_4 = 3$ is $s_3=1$, whose parent is $s_1=0$, so we have
        #figure(
            table(
                columns: (auto, auto, auto),
                inset: 0.75em,
                align: center,
                table.header([*$k$*],[*$m_k$* (indices of parents)], [*$s_m_k$* (values of parents)]),
                $0$, $m_0 = 4$, $s_m_0 = s_4 = 3$,
                $1$, $m_1 = 2$, $s_m_1 = s_2 = 1$,
                $2$, $m_2 = 1$, $s_m_2 = s_1 = 0$,
            )
        )
        Our difference sequence is $N = (2,1)$. Since for $i=1$, $N_i<N_0$, we have $p = 1$ can use the second sub-case,
        and we have $r = m_p = m_1$ and $delta = s_m_0 - s_m_p - 1 = s_4 - s_1 - 1 = 1$.

        You should be able to perform good root and bad root calculations by now, so concatenating $G=(0,2)$ and $B(n) = (n+1)$ we have:
        $
            (0,2,1,3)[n] = (0,2,1,2,3,...)
        $

]

#definition[
    The *standard form* of sequences in HPrSS $OT_"HPrSS"$ is a subset of $T_"HPrSS"$ defined as such;
    + For any $n in NN, (0,n) in OT_"HPrSS"$.
    + For any $S in OT\\{()}$ and $n in NN$, $s[n] in OT_"HPrSS"$
]

Again, the $OT$ here is built in a "top-down" approach. It might not seem like a "top-down" approach,
but it will make more sense when we define a correspondence with the ordinal notation.


=== Association with Ordinal Notation and Buchholz Hydras
#[
    #let trans = $"Trans"$
    #definition[
        We can define a map $trans: T_B arrow.r.bar T_"HPrSS"$, where $T_B$ is the set of terms associated to Buchholz's OCF except those containing $bocf(omega,zws)$,
        and $T_"HPrSS"$ is the set of all HPrSS terms.

        $trans(t)$ is defined as such:
        - $trans(zero) = ()$
        - Suppose $t = t_0 plus bocf(u,t_1)$ for some $u in NN$, and $t_0, t_1 in T_B$
            - If $t_1 = bocf(0,zero) dot m$ for some $m in NN$, then
                $
                    trans(t_0 plus bocf(u,bocf(0,zero) dot m)) = trans(t_0)^frown \(u, underbrace(u+1\,...\,u+1, m)\)
                $where $zws^frown$ represents concatenation.
                Note that if $t = bocf(u,zero)$ this becomes $t_0 = "empty", m=0$, and as such:
                $
                    trans(bocf(u,0)) = (u)
                $
            - Otherwise, $trans(t)$ is the concatenation of $trans(t_0)$, $(u)$, and $trans(t_1)$ with $(u+1)$ added to each element.
                $
                    trans(t_0 plus bocf(u,t_1)) = trans(t_0)^frown (u)^frown [trans(t_1)]^(+(u+1))
                $
                (We use $[s]^(+k)$ to represent adding $k$ to every element of a sequence $s$).\
                Again, we can see that if $t=bocf(0,bocf(v,zero))$, $u=0$ and
                $
                    trans(bocf(0,bocf(v,zero))) = (0)^frown [trans(bocf(v,zero))]^(+1) = (0, v+1)
                $
    ]

    If we restrict #trans to $OT_B arrow$, #trans is an _order isomorphism_ from $(OT_B, prec)$ and $(OT_"HPrSS", lex)$.
    We can then prove the termination of all normal form HPrSS sequences by showing that $s[n] lex s:$
    #lemma[
        Let $OT_B$ be the set of ordinal terms associated with Buchholz's OCF $OT$ except those containing $bocf(omega,zws)$.
        If we restrict $trans$'s domain to $OT_B$, it satisfies the following:
        + It is a bijective map onto $OT_"HPrSS"$, the set of normal form HPrSS sequences
        + For any $t in OT_B \\ {zero}$ and $n in NN$, and there exists a $t' in OT_B$ such that $trans(t') = trans(t)[n]$ and $t' prec t$.
            If $n>0$ then such a $t[n-1] < t' <= t[n]$
    ]
    #proof[
        [WIP: I do not understand the proof given in the #link("https://googology.miraheze.org/wiki/Hyper_primitive_sequence_system#Termination")[Googology wiki]].
        Obviously $trans(t) = trans(t'[n])$, but I don't know how to prove $trans(t'[n]) = trans(t')[n]$
        // For an $m in NN$, we define $Sigma_m subset OT_B$ recursively as such:
        // + If $m = 0$, then $Sigma_0 = {bocf(0,bocf(u,zero)) | u in NN "and" u > 0}$
        // + If $m > 0$, then $Sigma_m = Sigma_(m-1) union {t[n] | t in Sigma_(m-1) "and" n in NN}$

        // This is analogous to the "drop-down" list we showed earlier where we define $epsilon_1$ from chained fundamental sequences of $bocf(0,bocf(omega,0))$.

        // We have $limits(union.big)_(m in NN)Sigma_m = OT_B$.

        // Let $t in OT_B$. Since $limits(union.big)_(m in NN)Sigma_m = OT_B$, there exists an $m in NN$ such that $t in Sigma_m$. Let $mu$ be the minimum of such an $m$.
        // We show that $trans(t) in OT_"HPrSS"$ by induction on $mu$.

        // + Base case $mu = 0$, then $t = bocf(0,bocf(u,zero))$ for some $u in NN$ satisfying $u > 0$, and hence $trans(t) = (0,u+1) in OT_"HPrSS"$.

        // + Induction step: Suppose $mu > 0$, and for all $a in Sigma_m$ where $m < mu$, $trans(a) in OT_"HPrSS"$.

        //     Then there exists a $t' in Sigma_(mu-1)$ such that $t = t'[n]$ for some $n in NN$.
        //     We also know that $t'[n] prec t'$, so $t = t'[n] prec t$, so $t != t'$.
        //     From the Induction Hypothesis, since $t' in Sigma_m$, $trans(t') in OT_"HPrSS"$.
        //     As such, from the definition of $OT_"HPrSS"$, $"Expand"(trans(t'),n) in OT_"HPrSS"$.

    ]
]
#[
    As we saw earlier in PrSS, $(0,1,2,3,...)$ is equivalent to $omega^omega^dots.up = e0$. Since we now have $(0,2)[n]$ which expands to $(0,1,2,3,...)$,
    we have $(0,2)$ corresponding to $e0$. In fact, we can expand upon this and define larger and larger ordinals:
    #let one = $redf(bold(1))$
    #let W = $redf(sans(Omega))$
    We denote #one as $bocf(0,zero)$，#W as $bocf(1,zero)$, and $#W _v$ as $bocf(v,zero)$.

    #table(
        columns: (auto, auto, auto),
        table.header([*HPrSS*],[*Ordinal Notation*],[*Common expression*]),
        $()$, $zero$, $0$,
        $(0)$, $bocf(0,zero)$, $1$,
        $(0,0)$, $bocf(0,zero) plus bocf(0,zero)$, $2$,
        $(0,1)$, $bocf(0,bocf(0,zero))$, $omega$,
        $(0,1,2)$, $bocf(0,bocf(0,bocf(0,zero)))$, $omega^omega$,
        $(0,1,2,3)$, $bocf(0,bocf(0,bocf(0,bocf(0,zero))))$, $omega^omega^omega$,
        $(0,2)$, $bocf(0,#W)$, $e0$,
        $(0,2,1)$, $bocf(0,#W plus bocf(0,zero))$, $e0 dot omega$,
        $(0,2,1,2)$, $bocf(0,#W plus bocf(0,bocf(0,zero)))$, $e0 dot omega^omega$,
        $(0,2,1,2,3)$, $bocf(0,#W plus bocf(0,bocf(0,bocf(0,zero))))$, $e0 dot omega^omega^omega$,
        $(0,2,1,3)$, $bocf(0,#W plus bocf(0,#W))$, $e0^2$,
        $(0,2,1,3,2,4)$, $bocf(0,#W plus bocf(0,#W plus bocf(0,#W)))$, $e0^e0$,
        $(0,2,2)$, $bocf(0,#W plus #W)$, $epsilon_1$,

    )

]

There is a somewhat weird way I came up with to associate HPrSS with Buchholz Hydras

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
        set-style(mark: (end: "straight"))
        // bezier-through("s2.north", (rel: (x: -.2, y: .25)), "s1.north", stroke: red + .75pt)
        bezier-through("s2.south", (rel: (x: -.2, y: -.25)), "s1.south", stroke: red + .75pt)

        bezier-through("s3.south", (rel: (x: -.2, y: -.25)), "s2.south", stroke: red + .75pt)

        bezier-through("s4.north", (rel: (x: -.5, y: .25)), "s1.north", stroke: red + .75pt)
        bezier-through("s5.south", (rel: (x: -.2, y: -.25)), "s4.south", stroke: red + .75pt)
        bezier-through("s6.north", (rel: (x: -.5, y: .5)), "s1.north", stroke: red + .75pt)
      },
    )

    Then we draw a tree representing the parent relationships:

    #figure(
        diagram(
            node-stroke: .1em,
            edge-stroke: .1em,
            spacing: 1em,
            edge-corner-radius: 8pt,

            node((-1,1), `+`),
            node((0,0), `0`),
            node((1,-2), `2`),
            node((2,-4), `4`),
            node((3,-3), `3`),
            node((4,-5), `5`),
            node((5,-1), `1`),

            edge((-1,1), "r,u"),
            edge((0,0), "r,u,u"),
            edge((0,0), "r,u,u"),
            edge((0,0), "r,r,r,r,r,u"),
            edge((1,-2), "r,u,u"),
            edge((1,-2), "r,r,u"),
            edge((3,-3), "r,u,u"),
        )
    )

    So for example, $5$'s parent is $3$, whose parent is  $2$, whose parent is $0$.

    Now let's consider the different in values. If the a node's parent's value is $1$ less than its own value, we label the node $0$.
    If a node's parent's value is $2$ less than its own value, we label the node $1$.
    And in general, if a node's parent's value is $n$ less than its own value, we label the node $n-1$.
    This results in the following Buchholz Hydra:
    #figure[
        #set text(size:7pt)
        #set align(horizon)
        #stack(
            dir: ltr,
            // spacing: 3em,
            diagram(
                node-stroke: 1pt,
                edge-stroke: 1pt,
                spacing: 1em,
                edge-corner-radius: 8pt,

                node((-1,1), `+`),
                node((0,0), `0`),
                node((1,-2), redf[*`2`*], stroke: red),
                node((2,-4), redf[*`4`*], stroke: red),
                node((3,-3), `3`),
                node((4,-5), redf[*`5`*], stroke: red),
                node((5,-1), `1`),

               	edge((-1,1), "r,u"),
                edge((0,0), "r,u,u", redf($+2$), stroke: red, label-side: center),
                edge((0,0), "r,r,r,r,r,u", $+1$, label-side: center, label-pos: 0.6),
                edge((1,-2), "r,u,u", redf($+2$), stroke: red, label-side: center),
                edge((1,-2), "r,r,u", $+1$, label-side: center),
                edge((3,-3), "r,u,u", redf($+2$), stroke: red, label-side: center),
            ),
            $#h(3em) xarrow(#h(10em))$,
            diagram(
                node-stroke: 1pt,
                edge-stroke: 1pt,
                spacing: 1em,
                edge-corner-radius: 8pt,

                node((-1,1), `+`),
                node((0,0), `0`),
                node((1,-2), redf[*`1`*], stroke: red),
                node((2,-4), redf[*`1`*], stroke: red),
                node((3,-3), `0`),
                node((4,-5), redf[*`1`*], stroke: red),
                node((5,-1), `0`),

               	edge((-1,1), "r,u"),
                edge((0,0), "r,u,u", redf($+2$), stroke: red, label-side: center),
                edge((0,0), "r,r,r,r,r,u", $+1$, label-side: center, label-pos: 0.6),
                edge((1,-2), "r,u,u", redf($+2$), stroke: red, label-side: center),
                edge((1,-2), "r,r,u", $+1$, label-side: center),
                edge((3,-3), "r,u,u", redf($+2$), stroke: red, label-side: center),
            )
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

The Pair Sequence System (PSS) can also be considered an extension to the primitive sequence system, where instead of it being a sequence of natural numbers,
the Pair Sequence System can be thought og as a sequence of _pairs_ of natural numbers. There are two common ways to write PSS, either inline, like
$(0,0)(1,1)(2,1)(2,0)$ or as a matrix like so:
$
    mat(0,1,2,2;0,1,1,0)
$

The PSS is not as comptabile with Buchholz's ordinal notation as HPrSS. Nonetheless it is possible to show a correspondence with PSS and Buchholz's ordinal notation.

divergence at $psi_0(Omega_omega dot (Omega + 1))$

== Patcail's Hydra/Mini-Nuclear Array Notation


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