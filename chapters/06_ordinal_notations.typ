#import "../shorthands.typ": *
#let al(sub) = greenf($bold(alpha)_#sub$)
#let be(sub) = greenf($bold(beta)_#sub$)
#let alphag = greenf($bold(alpha)$)
#let betag = greenf($bold(beta)$)

= Ordinal Notations (up to #e0)

An *ordinal notation*, or *ordinal notation system* is basically a way to express an ordinal as a *finite string*, i.e., finite sequences of finite symbols.
Think of the decimal system, that allows you to express any number into a finite sequence of the symbols $0,1,2,3,4,5,6,7,8,9$.
Of course, we also need to define some ordering of these strings too.

#definition[
  An *Ordinal Notation* is a well-ordered set $("OT",prec)$, where OT is a _recursive_ set of finite formal strings with a finite alphabet, and $prec$ is a _recursive_ order.

  (_recursive_ here means that there exists an algorithm to compute them, i.e. computable)
]



== Iterated Cantor Normal Form
#definition[
  *Iterated Cantor Normal Form* (ICNF) is an ordinal notation for ordinals $< e0$.

  The ordinal notation here is a string consisting of finitely many of the following symbols: (Only the symbols highlighted in red are allowed to be used in ICNF.
)
  - #zero
  - #plus
  - The function $redf(bold(omega^circle.filled.small))redf("(")"something"redf(")") $ which can also be written as $ wpow("something")$

  The ICNF ordinal notation $o(alpha)$ for an ordinal $alpha < e0$ is:
  $
  o(alpha) := cases(
    zero &"if" alpha = 0,
    wpow(o(alpha_1)) plus wpow(o(alpha_2)) plus ... plus wpow(o(alpha_n)) &"if the CNF of" alpha "is" omega^(alpha_1) + omega^(alpha_2) + ... + omega^(alpha_n)
  )
  $

  This works as a notation because Cantor normal form is unique, and for $alpha < e0$, $alpha_i < alpha$.

  We can define a well-ordering $prec$ that borrows from the normal order of ordinals by saying $o(alpha) prec o(beta)$ if and only if $alpha < beta$. However, such an ordering is not recursive as showing that $alpha in beta$ requires using infinite sets. We can order the strings on our own without relying on the order of ordinals (we will define one later).
]

#example[
  $
  o(omega^omega + omega^3 + omega^2 + 1) &= o(omega^omega + omega^3 + omega^2 + omega^0) "(convert to CNF within "o()")"\
  &=wpow(o(omega)) plus wpow(3) plus wpow(2) plus wpow(0)\
  &=wpow(o(omega^1)) plus wpow(o(omega^0 + omega^0 + omega^0)) plus wpow(o(omega^0 + omega^0)) plus wpow(o(omega^0))\
  &"(convert to CNF within "o()")"\
  &= wpow(wpow(o(1))) plus wpow(wpow(zero)plus wpow(zero) plus wpow(zero)) plus wpow(wpow(zero) plus wpow(zero)) plus wpow(wpow(zero))\
  &= wpow(wpow(wpow(zero))) plus wpow(wpow(zero)plus wpow(zero) plus wpow(zero)) plus wpow(wpow(zero) plus wpow(zero)) plus wpow(wpow(zero))\
  &"(convert to CNF within "o()")"$
]

#definition[
  Here we will define a recursive ordering for the ICNF ordinal notation. We define the following inductively:
  + the set $"OT"_(=k)$ of ordinal notations of height $k$,
  + the set $"OT"_(<=k)$ of ordinal notations of height $<=k$,
  + an ordering $scripts(prec)_k$ on $O_(<=k)$

  The sets $"OT"_(=k)$ and $"OT"_(<=k)$ are defined as such:
  + $zero$ is the only ordinal notation of height 0, so $"OT"_(=0) = "OT"_(<=0) = {zero}$, and $scripts(prec)_0 = {}$, i.e., $zero scripts(prec.not)_0 zero$

  + If $"OT"_(=k), "OT"_(<=k), scripts(prec)_k$ are defined, then the set $"OT"_(=k+1)$, the set of all ordinal notations of height $k+1$, is defined as:
    $
    wpow(al(1)) plus wpow(al(2)) plus ...   plus wpow(al(n))
    $
    where $al(1) in "OT"_(=k)$, and $al(1) scripts(succ.eq)_k al(2) scripts(succ.eq)_k ... scripts(succ.eq)_k al(n)$ ($al(i) in "OT"_(<=k)$).

    We color greek symbols in #greenf[*green*] to represent ordinal notations, rather than ordinals. Note that those colored in #redf[*red*] still represents the symbols themselves. To use a programming analogy, symbols in #greenf[*green*] are like variables containing strings (specifically, ordinal notation strings).

  The order $scripts(prec)_(k+1)$ on $"OT"_(<k+1)$ is defined as such:

  - Case 1: $alphag$ and $betag$ are both of height $<=k$ ($alphag "and" betag in "OT"_(<=k)$).

    In this case, we just use $scripts(prec)_k$ to compare them, i.e. $alphag scripts(prec)_(k+1) betag$ if $alphag scripts(prec)_k betag$.

  - Case 2: $alphag$ is of height $<=k$ but $betag$ is of height $k+1$ ($alphag in "OT"_(<=k)$ and $betag in "OT"_(=k+1)$). In this case, $alphag scripts(prec)_(k+1) betag$

  - Case 3: $alphag$ and $betag$ are both of height $k+1$.

    In this case, we can express $alphag$ and $betag$ as such they are of the form:
    $
    alphag &= wpow(al(1)) plus ... plus wpow(al(n))\
    betag &= wpow(be(1)) plus ... plus wpow(be(m))\
    $

    We order this lexicographically, comparing $al(1)$ and $be(1)$. If they are equal, move onto $al(2)$ and $be(2)$, and if they are still equal, move on until either you find a $al(i) prec be(i)$ or, if all exponents are equal, that $alphag$ has less terms than $betag$. A formal way to write this is:

    $alphag scripts(prec)_(k+1) betag$ if either of the following hold:
    - $al(i) = be(i)$ for all $i<=j$ and $j = n < m$

      e.g. $wpow(wpow(zero)) plus wpow(zero) scripts(prec)_2 wpow(wpow(zero)) plus wpow(zero) plus wpow(zero)$, here $n=2, m=3, j=n=2$.

    - $al(i) = be(i)$ for all $i<=j$ and $al(j+1) < be(j+1)$, $j<n$

      e.g. $wpow(wpow(zero)) plus wpow(zero) scripts(prec)_2 wpow(wpow(zero)) plus wpow(wpow(zero))$, here $j=1$

  Finally, we can define the set of all ordinal notations $"OT"="OT"_(<=0) union "OT"_(<=1) union "OT"_(<=2) union ...$, and an ordering $prec = scripts(prec)_0 union scripts(prec)_1 union scripts(prec)_2 union ...$
]

We still have to prove that ordering $prec$ on the set OT is a well-ordering. We will assume that it is a strict linear ordering -- the proof of that is left as an exercise to the reader (totally not because I'm lazy).

#proposition[
  $("OT"_(<=k), prec)$ is a well-ordered set
]
#proof[

  $"OT"_(<=0) = {zero}$ is trivially well-ordered, any nonempty subset is just ${zero}$, of which #zero is the smallest element.

  Now for induction, assume $("OT"_(<=k), prec)$ is well-ordered. The set $("OT"_(<=k+1), scripts(prec)_(k+1))$ is order isomorphic to the set of nonincreasing sequences of ordinal notations from $("OT"_(<=k), scripts(prec)_k)$. Why? because we can make a bijection $f: "OT"_(<=k+1) arrow.r.bar "OT"^*_(<=k)$ like this:

  $f(wpow(al(1)) plus wpow(al(2)) plus ... plus wpow(al(n))) = (al(1), al(2), ..., al(n))$.

  It should be apparent that the expression in the left hand side $wpow(al(1)) plus wpow(al(2)) plus ... plus wpow(al(n)) in "OT"_(<=k+1)$, and $al(1) succ.eq al(2) succ.eq ... succ.eq al(n)$, and thus the right hand side is an non-increasing sequence of expressions $al(i) in "OT"_(<=k)$ of variable length.

  Since $"OT"_(<=k+1)$ is order isomorphic to the set of all non-increasing sequence of elements from $"OT"_(<=k)$, and $"OT"_(<=k)$ is well-ordered,
  #link(label("non-increasing sequences well-ordered"))[by this proposition], $("OT"_(<=k+1), prec)$ must therefore be well-ordered too.
]

#proposition[
  $("OT", prec)$ is well-ordered
]

#proof[
  Let $al(1) succ al(2) succ ...$ be an infinite descending sequence of ordinal notations. The first $al(1)$ is of some height $k$. Since any ordinal notation of height $>k$ would be greater than any ordinal notation of height $k$, the height of every $al(i)$ is $<=k$. So $al(1) succ al(2) succ ...$ is an infinite descending sequence in $("OT"_(<=k), scripts(prec)_k)$. However, $("OT"_(<=k), scripts(prec)_k)$ is well-ordered, a contradiction. Therefore no infinite descending sequence can exist in $("OT", prec)$, so it is a well-ordered set.
]

While ordinal notations look like actual ordinals with symbols like #wpow(zero), they are really just complicated sequences of sequences of ... sequences of symbols. Ordinal notations of height 0 is just #zero. Then the ordinal notations of height 1 are #wpow(zero), $wpow(zero) plus wpow(zero), wpow(zero) plus wpow(zero) + wpow(zero), ...$. But we can instead represent them as sequences of ordinal notations of height 0, so $wpow(zero) = (zero), wpow(zero) + wpow(zero) = (zero, zero)$, and so on. We can then lexicographically order these sequences of #zero by length to get our order for $"OT"_(<=1)$, letting #zero be smaller than any sequence of $zero$s:

$
zero scripts(prec)_1 (zero) scripts(prec)_1 (zero, zero) scripts(prec)_1 (zero, zero, zero) scripts(prec)_1 ...
$

With this order, we can make a set of non-decreasing sequences of terms from $"OT"_(<=1)$, which corresponds to $"OT"_(<=2)$. For example, $wpow(wpow(zero) plus wpow(zero)) plus wpow(zero) = ((zero,zero),zero)$. We can define a lexicographic order on these sequences based on the order $scripts(prec)_1$ to get $scripts(prec)_2$, and with this method we can keep building ordinal notations of greater and greater height.

Ordinal notations themselves are *not transfinite sets* (unlike actual ordinals) -- this is why they are highlighted so distinctly in red. If you look closely, we do not need to know anything about transfinite ordinals to show that they are well-ordered (we just needed to know facts about lexicographical orderings of sequences).

== Ordering of Trees and Goodstein sequences

We now have two order-isomorphic well-ordered sets of order type $e0$:
+ The ordinals $<e0$ ordered by $<$, or equivalently $in$
+ Ordinal notations $<e0$ ordered by $prec$ (This ordinal notation is known as Iterated Cantor Normal Form)

Another example of a well-ordered set of order type $e0$ is the set of all finite, finitely branching trees.

#let tree(array, r: .4) = [
  #cetz.canvas({
  import cetz.tree
  import cetz.draw: *

  set-style(content: (padding: .1))

  tree.tree(
    (
      array
    ),
    direction: "up",
    draw-node: (node, ..) => {
      circle((), radius: r)
      content((), node.content)
    },
  )
})
]

#definition[
  The set $T$ of finite, finitely branching tree can be inductively defined as such:

  1. The tree containing a single node is a tree of height 1. We can represent this as $()$ or as a diagram:

    #figure(custom-tree-graph[
      - \u{200b}
    ])

  2. If $T_1,...,T_n$ are trees, and $k$ is the maximum height among $T_1,...,T_n$, a tree of height $k+1$ is $(T_1,T_2,...,T_n)$

    #figure(custom-tree-graph[
      - \u{200b} #node-attr(rotate: -180deg)
        - $T_n$ <blue>
        - ... <blue>
        - $T_3$ <blue>
        - $T_2$ <blue>
        - $T_1$ <blue>
      ])

    (nodes in blue represents trees)

  3. Nothing else is a tree
]

#example[
  The tree `((((),()),()),(()),())` is of height 4:

  #figure(custom-tree-graph[
      - \u{200b} #node-attr(rotate: -180deg)
        - \u{200b}
        - \u{200b}
          - \u{200b}
        - \u{200b}
          - \u{200b}
          - \u{200b}
            - \u{200b}
  ])
]

#definition[
  Now let's inductively define an order $<$ on these trees:

  1. The tree of height 1 is only equal to itself, and is $<$ all trees of height $>1$
  2. Suppose $T$ and $T'$ are trees of height $>1$, and let $h$ be the maximum of their heights. Assume that $<$ has been defined for trees of height $<h$.

    We can then write $T = (T_1, T_2, ..., T_n)$ and $T' = (T'_1, T'_2, ..., T'_n')$, where $T_i >= T_(i+1)$, $T'_i >= T'_(i+1)$ (i.e. arranged in a non-decreasing sequence)

    #align(center + horizon)[#stack(
      dir: ltr,
      $T=$,
      custom-tree-graph[
        - \u{200b} #node-attr(rotate: -180deg)
          - $T_n$ <blue>
          - $...$ <blue>
          - $T_3$ <blue>
          - $T_2$ <blue>
          - $T_1$ <blue>
      ],
      $T'=$,
      custom-tree-graph[
        - \u{200b} #node-attr(rotate: -180deg)
          - $T'_n'$ <blue>
          - $...$ <blue>
          - $T'_3$ <blue>
          - $T'_2$ <blue>
          - $T'_1$ <blue>
      ],
      spacing: 10pt
    )]

    We can then order these lexicographically, i.e. $T<T'$ if:
    1. $T_i = T'_i$ and $n<n'$
    2. There exists a $k$ such that for all $i<k$, $T_i = T'_i$ and $T_k < T'_k$

]
This should already be sounding familiar to you -- this is analogous to our ordinal notation system, where we can correspond #wpow(greenf($alpha$)) #plus #wpow(greenf($beta$)) #plus #wpow(greenf($gamma$)) to a tree like this:

#figure(custom-tree-graph[
  - \u{200b} #node-attr(rotate: -180deg)
    - *$gamma$* <blue>
    - *$beta$* <blue>
    - *$alpha$* <blue>
])

Some examples are

#align(center)[
  #table(
    columns: (auto, auto),
    align: center + horizon,
    inset: 10pt,
    table.header([*Ordinal notation*], [*Associated tree*]),
    zero, custom-tree-graph[
      - \u{200b}
    ],
    wpow(zero), custom-tree-graph[
      - \u{200b}
        - \u{200b}
    ],
    [#wpow(zero) #plus #wpow(zero)], custom-tree-graph[
      - \u{200b} #node-attr(rotate: -180deg)
        - \u{200b}
        - \u{200b}
    ],
    [$wpow(wpow(zero)plus wpow(zero)) plus wpow(zero)$],
    custom-tree-graph[
      - \u{200b} #node-attr(rotate: -180deg)
        - \u{200b}
        - \u{200b}
          - \u{200b}
          - \u{200b}
    ],
)
]

With this, we can construct an order isomorphism from $T$ to #e0, and show that $T$ is of order type #e0. We can basically show via induction that $"OT"_(<=k)$, the set of all ordinal notations of height $<=k$ is order isomorphic to $T_(<=k)$, the set of all trees of height $<=k$ since the way the ordering is defined (lexicographic ordering of elements of lower height) is the same. (informal proof)

=== Kirby-Paris Hydra

Imagine the previous tree, where every leaf node (i.e. not connected to any node above) is a head of a Hydra. Every time we cut off a head, the leaf's parent node and all of its remaining descendents will be multiplied $n$ times.

Here's is an example: if we cut the blue leaf node, the part in red gets duplicated $n=3$ times:

#stack(
  dir: ltr,
  spacing: 2em,
  custom-tree-graph[
    - \u{200b} #node-attr(rotate: -180deg)
      - \u{200b}
        - \u{200b}
        - \u{200b}
      - \u{200b}
        - \u{200b}
          - \u{200b}
        + #metadata("red")
        - \u{200b} <red>
          - \u{200b} <blue>
          + #metadata("red")
          - \u{200b} <red>
          + #metadata("red")
          - \u{200b} <red>
  ],
  align(center+horizon)[#sym.arrow.r],
  custom-tree-graph[
    - \u{200b} #node-attr(rotate: -180deg)
      - \u{200b}
        - \u{200b}
        - \u{200b}
      - \u{200b}
        - \u{200b}
          - \u{200b}
        + #metadata("red")
        - \u{200b} <red>
          + #metadata("red")
          - \u{200b} <red>
          + #metadata("red")
          - \u{200b} <red>
        + #metadata("red")
        - \u{200b} <red>
          + #metadata("red")
          - \u{200b} <red>
          + #metadata("red")
          - \u{200b} <red>
        + #metadata("red")
        - \u{200b} <red>
          + #metadata("red")
          - \u{200b} <red>
          + #metadata("red")
          - \u{200b} <red>
  ]
)

#theorem(name: [*_Kirby-Paris Hydra_*])[
  If you keep cutting off heads (in any manner), the Hydra eventually dies.
]

#proof[

  We assign ordinal notations $<e0$ to nodes in the tree:
  1. Leaf nodes are assigned #zero.
  2. If the ordinal notations assigned to a node's descendants are $al(1) succ.eq al(2) succ.eq ... succ.eq al(n)$, the node itself is assigned $wpow(al(1)) plus wpow(al(2)) plus ... plus wpow(al(n))$

  For example:


  #set align(center)
  #stack(
    dir: ltr,
    spacing: 2em,
    custom-tree-graph[
      - \u{200b} #node-attr(rotate: -180deg)
        - \u{200b}
        - \u{200b}
        - \u{200b}
          - \u{200b}
          - \u{200b}
            - \u{200b}
            - \u{200b}
            - \u{200b}
          - \u{200b}

    ],
    align(horizon)[#sym.arrow.r],
    text-tree-graph[
    - $wpow(wpow(wpow(zero)3) plus wpow(zero)2) plus wpow(zero)2$ #node-attr(rotate: -180deg)
      - #zero
      - #zero
      - #box[$wpow(wpow(zero)3) plus wpow(zero)2$]
        - #zero
        - $wpow(zero)3$
          - #zero
          - #zero
          - #zero
        - #zero
  ])
  #set align(left)

  Now let's look at what happens when a leaf node (filled in black) is removed. We set $n=3$ for this example. Here we denote $alphag = wpow(al(1)) plus ... wpow(al(n))$
  #set align(center)
  #stack(
    dir: ttb,
    spacing: 1em,
    text-tree-graph[
    - $wpow(alphag plus wpow(zero)) plus wpow(betag)$ #node-attr(rotate: -180deg)
      - #betag
      - $wpow(al(1)) plus ... plus wpow(al(n)) plus wpow(zero)\ =alphag plus wpow(zero)$
        - #zero <black>
        - $al(n)$
        - $...$
        - $al(1)$
  ],
  align(horizon)[#sym.arrow.b],

  text-tree-graph[
    - $wpow(alphag) dot 3 plus wpow(betag)$ #node-attr(rotate: -180deg)
      - #betag
      - #alphag
        - $al(1) ... al(n)$
      - #alphag
        - $al(1) ... al(n)$
      - $wpow(al(1)) plus ... plus wpow(al(n))\ =alphag$ #node-attr(forest:true)
        - $al(n)$
        - $...$
        - $al(1)$
  ]
  )

  #set align(left)
  The ordinal notation at the bottom decreases whenever we remove a head:
  $
  wpow(alphag) dot n &< wpow(alphag plus wpow(zero)) "since"\
  omega^alpha dot n &< omega^(alpha + 1)
  $

  Therefore, eventually, the root will reach #zero and the hydra will die.


]

=== Goodstein sequences
In base 10, we represent a number using powers of 10:
$
    25739 = 2 dot 10^4 + 5 dot 10^3 + 7 dot 10^2 + 3 dot 10^1 + 9
$

In other bases, e.g. base 3, we can do the same:
$
    25739 = 3^9 + 2 dot 3^7 + 2 dot 3^4 + 2 dot 3^3 + 2 dot 3 + 2
$
We can take a page out of our Iterated Cantor Normal Form and demand that the exponents of 3 must also be in terms of power of 3:
#let t = redf($3$)
$
    25739 = #t^#t^2 + 2 dot #t^(2 dot #t + 1) + 2 dot #t^(#t+1) + 2 dot #t^#t + 2 dot #t + 2
$
We call this "hereditary" base-3 representation.

Now the next term in the *Goodstein sequence* for this number would be equivalent to taking every "3^" and replacing it with a "4^", then subtracting 1 from it.
#let t = redf($4$)
$
    4297067018 = #t^#t^2 + 2 dot #t^(2 dot #t + 1) + 2 dot #t^(#t+1) + 2 dot #t^#t + 2 dot #t + 2 greenf(-1)
$
#definition[
    The *Goodstein sequence* for some number $n$ is the sequence $(n_2, n_3, n_4, ...)$ where
    the number $n_(i+1)$ is obtained by writing $n_i$ in hereditary base-$i$ notation, changing
    the $i$s into $(i + 1)$s and subtracting 1.
]
#example[
    Let's start with $n_2 = 10$. We first write $10$ in hereditary base-$2$ notation:
    #let t = redf($2$)
    $
        n_2 = #t^(#t+1) + #t
    $
    #let t = redf($3$)
    Then $n_3$ is:
    $
        n_3 = #t^(#t+1) + #t greenf(-1) = #t^(#t+1) + 2 = 83
    $
    We can repeat this for $n_4, n_5, ...$:
    $
        #let t = redf($4$)
        n_4 &= #t^(#t+1) + 2 greenf(-1) = #t^(#t+1) + 1 = 1025 \
        #let t = redf($5$)
        n_5 &= #t^(#t+1) + 1 greenf(-1) = #t^(#t+1) = 15625 \
        #let t = redf($6$)
        n_6 &= #t^(#t+1) greenf(-1) = 279935 \
        &= 5dot #t^#t + 5 dot #t^5 + 5 dot #t^4 + 5 dot #t^3 + 5 dot #t^2 + 5 dot #t + 5\
        #let t = redf($7$)
        n_7 &= 5dot #t^#t + 5 dot #t^5 + 5 dot #t^4 + 5 dot #t^3 + 5 dot #t^2 + 5 dot #t + 5 greenf(-1)\
        &= 5dot #t^#t + 5 dot #t^5 + 5 dot #t^4 + 5 dot #t^3 + 5 dot #t^2 + 5 dot #t + 4\
        &= 4215754
    $
]

The goodstein sequence seems to grow forever, but this sequence eventually terminates at 0!

#theorem[
    The Goodstein sequence for $n$ eventually reaches $0$, for all $n$
]

#proof[
    let $alpha(n, b)$ be the ordinal notation resulting from it by replacing every $b$ by $wpow("")$.

    With this, for each $n_i$ in the Goodstein sequence, we can assign an ordinal notation $alpha(n_i, i)$ to it.
    We now show that $alpha(n_(i+1),i+1) prec alpha(n_i,i)$.

    #let i = redf($i$)
    Suppose $n_i = a_k #i^k + ... + a_j #i^j + a_0$. Then $alpha(n_i,i)= wpow(k) dot a_k plus ... plus wpow(j) dot a_j + a_0$.

    If $a_0 > 0$, then
    #let i = redf($(i+1)$)
    $
        n_(i+1) &= a_k #i^k + ... + a_j #i^j + a_0 greenf(-1)\
        alpha(n_(i+1),i+1) &= wpow(k) dot a_i plus ... plus wpow(j) dot a_j + (a_0 - 1)\
        &prec wpow(k) dot a_k plus ... plus wpow(j) dot a_j + a_0 = alpha(n_i, i)
    $
    If $a_0 = 0$, then:
    $
        n_(i+1) &= a_k #i^k + ... + a_j #i^j greenf(-1)\
        &= a_k #i^k + ... + (a_j-1) #i^j + #i^j greenf(-1)\
        &= a_k #i^k + ... + (a_j-1) #i^j + sum_(s=0)^(j-1) i#i^s\
        alpha(n_(i+1),i+1) &= wpow(k) dot a_k plus ... plus wpow(j) dot (a_j - 1) + sum_(s=0)^(j-1) wpow(s) dot i\
        &prec wpow(k) dot a_k plus ... plus wpow(j) dot a_j + a_0 = alpha(n_i, i)
    $
    In the last line, we compare the factor on $wpow(j)$ (the largest power of $wpow("")$ in which they differed),
    and find that $alpha(n_i, i) succ alpha(n_(i+1),i+1)$ no matter the value of $a_0$, and therefore the sequence reaches 0.
]

== The Primitive Sequence System (PrSS)

#definition(name: [*_Primitive Sequence System (PrSS)_*])[
    Let the set $T$ be the set of sequences $s = (a_1, a_2, ..., a_l)$ such that:

    + $s$ is either empty $()$ or starts with $0$: $(0,...)$.
    + For any $a_i$ in $s$, let it's *parent* $a_j$ be the _latest element_ before $a_i$ such that $a_j<a_i$. $a_j$ must be equal to $a_i - 1$.

        Put another way, let the _parent index_ $p(i) in NN$ be the largest possible $p(i)<i$ such that $a_p(i)<a_i$. For all $a_i$ in the sequence, $a_p(i) = a_i - 1$.

        #example[
            $(0,1,3)$ is not a valid sequence as the latest element before $3$ that is less than $3$ is $1$, which is not $3-1 = 2$.

            $(0,1,2,1,2)$ is a valid sequence:
            - It starts with $0$
            - $a_2 = 1$. The latest element less than $1$ is $a_1 = 0$, which is 1 less than $a_2 = 1$
            - $a_3 = 2$. Similarly, the latest element less than $2$ is $a_2 = 1$ which is 1 less than $a_3=2$
            - $a_4 = 1$. The latest element less than $a_4 = 1$ is $a_1 = 0$, so no issues
            - $a_5 = 2$. The latest element less than $a_5=2$ is $a_4 = 1$, so no issues
        ]

    + The ordering $<$ is simply the lexicographic ordering of these sequences.
]
We can use this notation to define either _a fast-growing function_, or a _system of fundamental sequences_:

#definition[
    For a sequence $s = (a_1, a_2, ..., a_l) in T$, we define $s[n]$ as the $n^"th"$  member in its _fundamental sequence_.
    - $()[n] = n$. Otherwise, for nonempty $s$:
    - The *good root* $g$ and the *bad root* $b$ are defined as such:
        - $g = (a_1, ..., a_(p(l)-1))$
        - $b = (a_p(l), ..., a_(l-1))$
        - if $p(l)$ does not exist (i.e. there is no a_i < a_l), then: $g=(a_1, ..., a_(l-1))$ and $b$ is empty
    - $s[n] = (g, b, b, ..., b)$ with $n$ copies of $b$, though this can be replaced with any increasing function $f(n)$. The original definition used $f(n) = n^2$.

    As for the _fast-growing function_ also confusingly labelled $s[n]$:
    - We split the sequence into good root $g$ and bad root $b$ again.
    - $s[n] = (g, b, b, ..., b)[f(n)]$ with $f(n)$ copies of $b$. The original definition used $f(n) = n^2$, but $f(n) = n+1$ can also be used.
    The final result is the value in the $[]$ when the sequence is eventually empty.
]

#example[
    Expand the following:
    + $(0,0)[3]$
    + $(0,1)[3]$
    + $(0,1,2,3,2)[3]$
    + $(0,1,2,3,4,3,4,2,3)[3]$
    Seriously, try it yourself. I'll provide the answers in case you get stuck:

    + $0$ has no parent, so good root is $greenf(0)$ and bad root is empty. We get $(greenf(0))$. Note that $n$ doesn't matter when the last element is $0$.
    + The parent of $1$ is $0$, so we have an empty good root and a bad root of $redf(0)$. We replicate the bad root $n=3$ times, so we get $(redf(0),redf(0),redf(0))$
    + The parent of $2$ is $1$, so we have a good root of $greenf(0)$ and a bad root of $redf(1\,2\,3)$, so we get $(greenf(0),redf(1\,2\,3),redf(1\,2\,3),redf(1\,2\,3))$
    + $(0,1,2,3,4,2,3,2,2,2)$
]

#example[
    Evaluate $(0,1,1)[1]$ as a fast-growing function with $f(n) = n+1$

    $
        &(0,1,1)[1]\
        // &#h(1em) g="empty", b=(0,1), f(n) = 2\
        &=(0,1,0,1)[2]\
        // &#h(1em) g=(0,1), b=(0), f(n) = 3\
        &=(0,1,0,0,0)[3]\
        // &#h(1em) g=(0,1,0,0), b=(), f(n)=4\
        // &#h(1em) "(there's no index" i "where" a_i < 0" so" p(l) "doesn't exist)"\
        &= (0,1,0,0)[4]\
        // &#h(1em) g=(0,1,0), b=(), f(n)=5 "(same logic)"\
        &= (0,1,0)[5]\
        // &#h(1em) g=(0,1), b=(), f(n)=6 "(same logic)"\
        &= (0,1)[6]\
    $
    At this point we see a new pattern: $(a_1, ..., a_(l-1), 0)[n] = (a_1, ..., a_(l-1))[f(n)]$, since there's no parent for $0$ as there are no $a_i < 0$.
    $
        &(0,1)[6]\
        // &#h(1em) g="empty", b=(0), f(n)=7\
        &= (0,0,0,0,0,0,0)[7]\
        &= (0,0,0,0,0,0)[8]\
        &= (0,0,0,0,0)[9]\
        &= (0,0,0,0)[10]\
        &= (0,0,0)[11]\
        &= (0,0)[12]\
        &= (0)[13]\
        &= ()[14]\
        &= 14\
    $
    Now imagine if we used a bigger value of $n$, making many more copies of the bad root. Or image if we used $f(n) = n^2$ instead of $n+1$.
    $s[n]$ is a very powerful function. But we can constrain it's growth rate in the Hardy hierarchy as we'll show later.
]

=== Order isomorphism to $e0$

We now show that PrSS is order isomorphic to #e0.

// PrSS can be defined recursively as such:
// Let $T_(=0)$ be the set of all "height 0" sequences, i.e. just the empty sequence $()$. It is well-ordered by #lex, and this correponds to $"OT"_0$ in ICNF.
// $T_(=0) = T_(<=0)$

Now, just like in ICNF where we use a non-increasing sequence of ordinal notations of height $<=k$ to define a new height $k+1$:

$
    al(1) >= al(2) >=  ... >= al(n)\
    wpow(al(1)) plus wpow(al(2)) plus ... plus wpow(al(n))\
$

In PrSS we can make a new notation of new height $k+1$ from sequences of height $<=k$ as such:

Given a non-increasing _sequence of PrSS sequences_ of height $<=k$, e.g.
$
    (0,1) lexgteq (0,0,0) lexgteq (0,0) lexgteq (0,0)
$, we add 1 to each term in the sequence and join them up with $0$s:

$
    (0,1) lexgteq (0,0,0) lexgteq (0,0) lexgteq (0,0) -> (1,2) lexgteq (1,1,1) lexgteq (1,1) lexgteq (1,1)\
    redf((0, greenf((1,2)), 0, greenf((1,1,1)), 0, greenf((1,1)), 0, greenf((1,1)) ))\
    redf((0, #greenf[$1,2$], 0, #greenf[$1,1,1$], 0, #greenf[$1,1$], 0, #greenf[$1,1$] ))
$
Let's call this function $f$, which acts on _sequences of PrSS_ and returns the concatenated sequence.

Since the lexicographic ordering of _sequences of PrSS_ is also lexicographic (i.e. to compare 2 _sequences of PrSS_, we first compare
the first sequence in both, then move onto the second if they are equal), for any two _sequences of PrSS_ $S_1$ and $S_2$, $S_1 lex S_2$ if and only if
$f(S_1) lex f(S_2)$.

Here are some examples of the PrSS correspondence with ordinals.
I added a third column for the PrSS "hydra" to show how elements in the sequence relate to nodes of the ordinal notation tree.

#set align(center)
#table(
    columns: (auto, auto, auto, auto),
    align: left + horizon,
    inset: 0.75em,
    table.header([*Ordinal*],[*Ordinal Notation*],[*PrSS tree*],[*PrSS*]),
    $0$, $zero$, [```•```], $()$,
    $1$, $wpow(zero)$, [```
          0
        •─┘```], $(0)$,
    $2$, $wpow(zero) plus wpow(zero)$, box[```
          0 0
        •─┴─┘```], $(0,0)$,
    $3$, $wpow(zero) plus wpow(zero) plus wpow(zero)$, box[```
          0 0 0
        •─┴─┴─┘```], $(0,0,0)$,
    $omega$, $wpow(wpow(zero))$, box[```
        1
      0─┘
    •─┘```], $(0,1)$,
    $omega+1$, $wpow(wpow(zero)) plus wpow(zero)$, box[```
        1
      0─┘ 0
    •─┴───┘```], $(0,1,0)$,
    $omega+2$, $wpow(wpow(zero)) plus wpow(zero) plus wpow(zero)$, box[```
        1
      0─┘ 0 0
    •─┴───┴─┘```], $(0,1,0,0)$,
    $omega dot 2$, $wpow(wpow(zero)) plus wpow(wpow(zero))$, box[```
        1   1
      0─┘ 0─┘
    •─┴───┘```], $(0,1,0,1)$,
    $omega dot 2 + 1$, $wpow(wpow(zero)) plus wpow(wpow(zero)) plus wpow(zero)$, box[```
        1   1
      0─┘ 0─┘ 0
    •─┴───┴───┘```], $(0,1,0,1,0)$,
    $omega^2$, $wpow(wpow(zero) plus wpow(zero))$, box[```
        1 1
      0─┴─┘
    •─┘```], $(0,1,1)$,
    $omega^3$, $wpow(wpow(zero) plus wpow(zero) plus wpow(zero))$, box[```
        1 1 1
      0─┴─┴─┘
    •─┘```], $(0,1,1,1)$,
    $omega^omega$, $wpow(wpow(wpow(zero)))$, box[```
        2
      1─┘
    0─┘
  •─┘```], $(0,1,2)$,
    $omega^(omega^3 + 2) + 2$, $wpow(wpow(wpow(zero)3) plus wpow(zero)2) plus wpow(zero)2$, box[```
        2 2 2
      1─┴─┴─┘ 1 1
    0─┴───────┴─┘ 0 0
  •─┴─────────────┴─┘```], $(0,1,2,2,2,1,1,0,0)$,
    $omega^omega^omega$, $wpow(wpow(wpow(wpow(zero))))$, box[```
        3
      2─┘
    1─┘
  0─┘
•─┘```], $(0,1,2,3)$,
)
#set align(left)

We can see how this "hydra" behaves quite similarly to the Kirby-Paris Hydra we saw earlier:

$(greenf(0\,1),redf(2\,3\,3),bluef(3))[3] = (greenf(0\,1),redf(2\,3\,3),redf(2\,3\,3),redf(2\,3\,3))$

#align(center)[
    #set text(font: "Dejavu Sans Mono")
    #stack(
        dir: ltr,
        spacing: 3em,
        box[
            #set align(left)
            ~~~~~~~~#redf("3 3") #bluef("3")\
            ~~~~~~#redf("2─┴─┴")#bluef("─┘")\
            ~~~~#greenf("1─┘")\
            ~~#greenf("0─┘")\
            #greenf("•─┘")\
        ],
        box[
            #set align(left)
            ~~~~~~~~#redf("3 3   3 3   3 3")\
            ~~~~~~#redf("2─┴─┘ 2─┴─┘ 2─┴─┘")\
            ~~~~#greenf("1─┴─────┴─────┘")\
            ~~#greenf("0─┘")\
            #greenf("•─┘")\
        ]
    )
]

=== Growth rate of $s[n]$

Since we have assigned a mapping from each PrSS sequence to an ordinal, let's compare PrSS expansion rules with the Hardy Hierarchy,
using the Wainer Hierarchy for fundamental sequences.
We make just one modification to $H$, that for a limit ordinal $alpha$, $H_alpha (n) = H_alpha[n] (n+1)$ instead of the usual $H_alpha[n](n)$.
We can rewrite this as $H_alpha (n) = H_(alpha[n]+1)(n)$ since $H_(alpha+1)(n)= H_alpha (n+1)$.

#set align(center)
#table(
    align: left + horizon,
    inset: 0.75em,
    columns: (auto, auto),
    table.header([*PrSS*], [*HH*]),
    $()[n] = n$, $H_0(n) = n$,
    $(0)[n] = ()[n+1]$, $H_1(n) = H_0(n+1)$,
    $(0,0)[n] = (0)[n+1]$, $H_2(n) = H_1(n+1)$,
    $(0,1)[n] = underbrace((0\,0\,0\,...\,0), n "copies of" 0)[n+1]$, $H_omega (n) = H_n (n+1)$,
    $(0,1,0)[n] = (0,1)[n+1]$, $H_(omega+1) = H_omega (n+1)$,
    $(0,1,0,1)[n] = (0\,1\,underbrace(0\,0\,0\,...\,0, n "copies of" 0))[n+1]$, $H_(omega dot 2) (n) = H_(omega + n) (n+1)$,
    $(0,1,1)[n] = underbrace((0\,1\,...\,0\,1), n "copies of" (0,1))[n+1]$, $H_(omega^2) (n) = H_(omega n) (n+1)$,
    $(0,1,2)[n] = (0\,1\,underbrace(1\,1\,1\,...\,1, n "copies of" 1))[n+1]$, $H_(omega^omega) (n) = H_(omega^n) (n+1)$,
)
#set align(left)

We see the correspondence between each PrSS sequence and its associated ordinal in our modified Hardy Hierarchy.
Therefore the maximum growth rate of PrSS is $(0,1,2,3,...)[n]$ which corresponds to $H_e0 (n)$.

