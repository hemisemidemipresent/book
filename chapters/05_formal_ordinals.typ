#import "../shorthands.typ": *

= Formal treatment of orders and ordinals

Order types are the most general way to define ordinals. Under this definition, an ordinal is an equivalence class of _well-ordered sets_ under the relation of _order isomorphism_. There's a lot to unpack there, so we'll introduce the concepts one at a time:

== Orders and well-orders


#definition[
  A *relation* $R$ on a set $X$ is a set of ordered pairs from $X$, i.e., $R subset.eq X times X = {(x,y) | x,y in X}$. We write $x R y$ for $(x,y) in R$
]

Specifically, such a relation is a _binary relation_ or _2-ary relation_ as it is a relation between 2 sets. However, we will mainly be using binary relations, so we will just call them relations.

#example[
  The relation "less than" on a set ${1,2,3}$ can be defined as the following set of ordered pairs from X: $R = {(x,y) | x,y in X "and" x<y } = {(1,2), (1,3), (2,3)}$.

  We see that $R$ is a subset of $X times X$:
  $
  {(1,2), (1,3), (2,3)} subset {(1,1), (1,2), (1,3), (2,1), (2,2), (2,3), (3,1), (3,2), (3,3)}
  $
]

#definition[
  A relation $<$ on $X$ is called a *strict linear order* on $X$ if and only if the following are true for all $x,y,z in X$:
  + $<$ is transitive: If $x < y$ and $y < z$, then $x < z$
  + $<$ is asymmetric: If $x < y$, then $y lt.not x$ (which is $not (y<x)$)
  + $<$ is total: If $x != y$, then either $x < y$ or $y < x$
]

For strict linear orders, we'll usually use symbol $<$ and its variants like $prec$.
The _partial linear order_ $x <= y$ means $x = y "or" x<y$. The symbol $>$ can similarly be defined as $x > y$ if and only if $y < x$.

#definition[
  A relation $<$ is a *well-ordering* on the set $X$ is a relation with a *strict linear ordering* of $X$ such that *every (non-empty) subset of $X$ has a least element under $<$*.
]

A least element of $Y$ is some $y in Y$ such that $y<=z$ for every $z in Y$, and is unique for a linearly ordered set (if a least element exists).

#definition[
  A *well-ordered set* $(X, ltx)$ is a set $X$ and a relation $ltx$ that is a well-ordering of $X$
]

#proposition[
  Suppose $(X, <)$ is a well-ordered set. For every $x in X$, if it is not the maximum element, then there is a unique $x' > x$ such that there is no $z in X$ such that $x < z < x'$. ($x'$ here is called the *successor* of $x$ in $(X, <)$)
]

#proof[
  Let $Y = {y in X | y>x}$, the set of all elements greater than $x$. Since $<$ is a well-ordering of $X$, then $Y subset.eq X$ must have a least element $x'$.
  Since $x' in Y$, $x < x'$.

  Since $x'$ is the least element in $Y$, there can't be any $z in Y$ such that $x<z$ and $z < x'$

  To prove $x'$ is unique, if we assuming there exists another number $x''$ with the same property that there is no $z$ such that $x < z <x''$, we have to show $x' = x''$. Since $x<x'', x'' in Y$. Since $x'$ is the least element in $Y$, $x' <= x''$. We can't have $x' < x''$, as it leads to $x<x'<x''$ which violates the property mentioned. Therefore $x' = x''$, and thus $x'$ is unique.
]

Another property of well-ordered set is that they do not contain an infinite descending sequence.
This property is needed to do induction along well-ordered sets. It also serves as another way to prove that an ordered set is well-ordered.
#proposition[
  Every well-ordered set does not contain an infinite descending sequence $x_1 > x_2 > ...$.

  Similarly, every strictly linearly ordered set which does not contain an infinite descending sequence is a well-ordered set.
]

#proof[
  Suppose $X$ is well-ordered by $<$ but yet there is an infinite descending sequence $x_1 > x_2 >  ...$.
  We create a subset $Y subset.eq X$ such that $Y = {x_i | i in NN "and" i>= 1}$.
  Since $Y$ is a nonempty subset of $X$, it has a least element.
  But if $y in Y$ is the least element, then such an infinite sequence would not be able to exist.

  Suppose $(X, <)$ is a strictly linearly ordered set which does not contain an infinite descending sequence, but is not a well-ordered set.
  As it is not a well-ordered set, there exists a subset $P subset.eq X$ such that there is no least element.
  Therefore, for any $x_i in P$, we can find an $x_(i+1) in P$ such that $x_i > x_(i+1)$.
  We can construct an infinite descending sequence $x_1 > x_2 > x_3 > ...$, a contradiction.
  Therefore $(X, <)$ must be a well-ordered set.
]

We have a similar result for *non-increasing* sequences:
#proposition[
    If $(X,<)$ is a well-ordered set, and $x_1>=x_2>=x_3>=...$ is a non-increasing infinite sequence, then the sequence eventually stabilizes,
    i.e. for some $k$, $x_k = x_i$ for all $i>=k$.
]

#proof[
    Assume the converse, that for all $k$, $x_k != x_i(k)$ for some $i(k) > k$.

    Since $x_k >= ... >= x_i(k)$, by transitivity, $x_k >= x_i(k)$. But since $x_k != x_i(k)$, $x_k > x_i(k)$.
    This leads to an infinite descending sequence, which cannot exist in a well-ordered set, a contradiction.
]



// #theorem(name: "Induction along well-orderings")[
//   Suppose $(X, ltx)$ is a well-ordering, and P is a property that may be true of elements of S. If, for every $x in X$, it is true that:
// $P(x)$ if for all $y < x, P(y)$ (𝐼(𝑃, 𝑥))
// then 𝑃(𝑥) is true for all 𝑥 ∈ 𝑋
// ]



== Order Isomorphisms and Order Types

#definition[
  An *order isomorphism* between two _ordered_ sets $(X,ltx), (Y,lty)$ is a bijection $f: S arrow.r.bar T$ such that for all $x,y in X$, $x ltx y <=> f(x) lty f(y)$.

  If that was too dense, to put it in another way, it is a mapping $f:X arrow.r.bar Y$ such that:
  + $f$ is total, i.e., defined for all $x in X$
  + $f$ is injective, i.e., if $x!=y$ then $f(x)!=f(y)$
  + $f$ is surjective onto $Y$, i.e. for every $y in Y$, there is an $x in X$ such that $f(x) = y$
  + $f$ is order-preserving, i.e., $x ltx y$ if and only if $f(x) lty f(y)$


  Note: the first three criteria are for the definition of a bijection.

  If there is an order isomorphism between two well-ordered sets, we say they are *order isomorphic*, or that they have the same *order type*.
]
Note: an order isomorphism only requires that the sets be _ordered_. It does not require them to be _well-ordered_.
Nonetheless we will usually be dealing with well-ordered sets, as the ordinals are well-ordered under $in$:

#definition[
  Every ordinal $alpha$ has the following properties:
  + transitivity, i.e., for all $beta in alpha$, $beta subset.eq alpha$, and
  + $in$ is a well-ordering on $alpha$
]

1. For all $beta in alpha$, $beta < alpha$ and therefore the elements inside $beta$ would be inside $alpha$, i.e. $beta subset.eq alpha$.
2. An infinite descending sequence can't exist in $alpha$ as it has a least element $0$.

This is another way we can define von-Neumann ordinals, and leads to the same structure, where the successor of an ordinal $alpha$ is $alpha union {alpha}$,
and an ordinal is the set of all ordinals smaller than it.

#proposition[
    If $(alpha_1, alpha_2, ...)$ is a sequence of ordinals that is increasing (i.e., $alpha_i < alpha_(i+1)$) then:
    $
        union.big_i alpha_i = {x | x in alpha_i "for some" i}
    $
    is an ordinal, and is the _least ordinal_ $beta > alpha_i$ for all $i = 1,2,...$.

    The ordinal $union.big_i alpha_i $ is known as the *limit*, *supremum*, or *strict supremum*
    #footnote[
        In analysis, supremum usually uses partial $>=$ rather than strict $>$: it usually refers to the least number $s$ such that for all $x in X, s>=x$.
        Note that for limit ordinals, there is no difference between a strict supremum and the "typical" supremum.
    ]
    of a sequence $alpha_i$. We denote this with the the symbol $sup$.
] <label>

#proof[
    Suppose $alpha in union.big_i alpha_i$. Then for some $i, alpha in alpha_i$. Since $alpha_i$ is an ordinal, so are all of its elements, therefore $alpha$ is also an ordinal.
    This means that every element in $union.big_i alpha_i$ is an ordinal.

    Now we have to show that $union.big_i alpha_i$ contains every ordinal less than any member of it. This might sound confusing, but let's take a look at $omega$.
    $omega$ contains every ordinal less than any member of it. For example, $500$ is an ordinal in $omega$, and all ordinals $<500$ are also contained inside $omega$.
    This is true for any ordinal $n in omega$.

    So for any ordinal $alpha in union.big_i alpha_i$, for some $i$, $alpha in alpha_i$. Now consider all ordinals $beta < alpha$.
    The ordinal $beta$ has to be $in alpha_i$ as $alpha_i$ is an ordinal and therefore contains all ordinals below it ($beta < alpha < alpha_i$).

    Therefore for any ordinal $alpha in union.big_i alpha_i$, for all $beta< alpha$, $beta in union.big_i alpha_i$, and as such $union.big_i alpha_i$ is an ordinal.
]

#proposition[If $(X,ltx)$ and $(Y,lty)$ are order isomorphic and $(X,ltx)$ is a well-ordered set, $(Y,lty)$ is also a well-ordered set.] #label("order isomorphic transfers well-order")

#proof[
  Let $f$ be an order isomorphism between $X$ and $Y$. Suppose$(X,ltx)$ is a well-ordered set but $(Y,lty)$ isn't. Then there is an infinite descending sequence $y_1 gty y_2 gty ...$. Because  $f$ is onto, for each $i$ there exists there is an $x_i in X$ such that $f(x_i)=y_i$. Since $y_i gty y_(i+1), f(x_i) gty f(x_(i+1))$ and by the order-preserving property, $x_i gtx x_(i+1)$. But then $x_1 gtx x_2 gtx ...$ is an infinite descending sequence in $X$, a contradiction.
]

#example[
  Show that the set of natural numbers $NN$ and the set of even natural numbers $E = {2n | n in NN}$, with their usual order, have the same order type.

  $f(x) = 2x$ is an order isomorphism between $NN$ and $E$ as:

  1. $f$ is defined for all $NN$
  2. If $x!=y, 2x != 2y$
  3. For every $n in E, n = 2 dot m "where" m in N$. $m$ satisfies $f(m) = n$
  4. If $x < y, 2x < 2y$ and vice versa

  And in fact, since $omega = NN$ is an ordinal, it is well-ordered. Therefore #link(label("order isomorphic transfers well-order"))[by this proposition], $E$ which has an order isomorphism to $omega$ is also well-ordered.

]
In the above example, we show that these two well-ordered sets are order isomorphic have the same *order type*. Since the set of all natural numbers is $omega$, we can generalize this to say that any set that has order isomorphism to $omega = NN$ has order type $omega$. In general, *any set that has order isomorphism to an ordinal $alpha$ has order type $alpha$*.

#example[
  Show that the set $X = {1/n | n in NN "and" n!=0} union {0}$ with the ordering $>$:
  + has the same cardinality as $omega$
  + is *not* order isomorphic to $omega$
  + is order isomorphic to $omega + 1$
  + is a well-ordered set
  (note that the ordering of $X$ is "greater than" rather than the typical "lesser than". As such we will color $redf(>)$ to represent the ordering of $X$)

  + For cardinality, we do not need to consider the order of the set. We can define a bijection $f : omega arrow.r.bar X$ as such:
    $
      f(n) = cases(0 &"if" n=0, 1/n &"if" n!=0)
    $
    (The validity of this bijection #strike[should be obvious] is left as an exercise to the reader)

  + The main reason why $X$ is not isomorphic to $omega$ is that when you order the set by $>$, you get ${1/1, 1/2, 1/3, ..., 0}$. There is an element "at the end", whereas for $omega = {0,1,2,...}$ there is no such element at the end.

    Let's prove by contradiction. Suppose an order isomorphism $f : omega arrow.r.bar X$ exists. Then there must be some $n in omega$ that maps to $0$, i.e., there must exist some $n$ such that $f(n) = 0$.

    However, there exists an $n+1 in omega$ such that $n < n+1$. The order-preserving property therefore requires that $f(n) redf(>) f(n+1)$, i.e., there must exist a $f(n+1) in X$ such that $0 redf(>) f(n+1)$. But there is no such element in $X$, as $1/n redf(>) 0$ and $0 = 0$, a contradiction.

  + $omega + 1 = {0,1,2,...,omega}$, so intuitively (though you shouldn't trust intuition when dealing with infinities) we can see how we can map this to $X$ while preserving order.

    The following bijection $f: omega+1 arrow.r.bar X$ is order isomorphic:
    $
    f(alpha) = cases(1/(alpha+1) &"if" alpha < omega, 0 &"if" alpha = omega)
    $
  + Since $omega+1$ is a well-ordered set, and there exists an order isomorphism from $omega+1$ to $X$, #link(label("order isomorphic transfers well-order"))[by this proposition] $X$ is a well-ordered set.
]

This is the crux of the difference between ordinals and cardinals. *Cardinality* is about comparing sizes via *bijections* between *unordered sets*, and assigning a *cardinal number*. *Order Types* is about comparing sizes via *order isomorphisms* between *(well-)ordered sets*, and assigning an *ordinal number*.

In our original definition, an ordinal is "an *equivalence class* of well-ordered sets under the relation of order isomorphism". We can interpret this as: "an ordinal represents the class of all well-ordered sets that are order isomorphic to each other". So in the equivalence class corresponding to $omega+1$, we have well-ordered sets like $({0,1,2,...,omega}, <)$, and $({1/n | n in NN, n!=0} union {0},redf(>))$.



Now, let's look at how the concepts of well-orders and order types applies in other settings:

== Lexicographical Ordering

Let us consider the ordering of the set of pairs of natural numbers $NN^2 = {(n,m) | n,m in NN}$. The lexicographical ordering $lex$ is defined as:

$
(k,l) lex (n,m) "if and only if (a)" k < n "or (b)" k=n "and" l<m
$

It's called a lexicographical ordering as it compares these pairs like how a dictionary would compare words - it compares the first element, and only moves onto the second element if the first element is the same.
$
(0,0) lex (0,1) lex (0,2) lex ... lex (1,0) lex (1,1) lex ... lex (2,0) lex ...
$
We can extend this definition of lexicographical ordering to longer sequences. Similarly to $NN^2$, we call the set of all sequences of length $k$ $NN^k$.

#definition[
    The *lexicographical ordering $lex$* on $NN^k$ is defined as:

  $(n_1,...,n_k) lex (m_1,...,m_k)$ if and only if, for some $j<k$, the following is true:
  #set enum(numbering: "(a)")
  + $n_i = m_i$ for all $i$ when $0<i<=j$
  + $n_(j+1)<m_(j+1)$
]

#example[
  #set enum(numbering: "(a)")
  $(1,2,3) lex (3,2,1)$ because for $j=0$:
  + for all $0<i<=j, n_i = m_i$ (since there is no $0<i<=0$, this is considered vacuously true)
  + $n_1 < m_1$

  $(1,2,3) lex (1,2,5)$ because for $j=2$:
  + for all $0<i<=j, n_i = m_i$
  + $n_3 < m_3$
]

Personally, I find that lexicographical ordering defined via math is quite clunky. I think easier if you think about it conceptually (sorting it like how a dictionary would) than trying to find what $j$ value satisfies the criteria.

With the definition of $lex$ extended to any sequence of length $k$, we can now show that:
#proposition[
  $(NN^k, lex)$ is a well-ordered set.
]

#proof[
  Let $Y subset.eq NN^k$. We now have to prove there exists a least element in $Y$.

  Let $n_1$ be the smallest $n$ such that $(n, m_2, m_3, ..., m_k) in Y$. Then there is no $(m_1, m_2, m_3,..., m_k) in Y$ such that $m_1 < n_1$. Now let $n_2$ be the smallest $n$ such that $(n_1, n, m_3, ..., m_k) in Y$. Again, there is no $(m_1, m_2, m_3, ..., m_k) in Y$ such that $m_1 < n_1$ or $n_1 = m_1 "and" m_2 < n_2$. Continue this process until you finally define $n_k$ as the least $n$ such that $(n_1, n_2, n_3, ..., n) in Y$. Then $(n_1, n_2, n_3, ..., n_k) in Y$ is the least element in the $lex$ ordering.
]

// #proposition[$(NN^k, lex)$ has order type $omega^k$.]
// #proof[
//   [WIP] idk how to inductively prove this.
// ]

However, what if we want to compare sequences of arbitrary length? Let $NN^*$ be the sequences of natural number of arbitrary length:
$
&(0),(1),(2),...\
&(0,0),(0,1),(0,2),...\
&(0,0,0),(0,0,1),(0,0,2),...\
$

We can extend our usual definition of lexicographic ordering as such:

#definition[
For 2 sequences $s, t$:
$
s &= (n_1, n_2, ..., n_k)\
t &= (m_1, m_2, ..., m_l)\
$

$s lex t$ if and only if either of the following is true:

+ $n_1=m_1,n_2=m_2,...,n_k=m_k$, and $k<l$

  #example[$(1,3,5) lex (1,3,5,7,9)$]
+ there is a $j<k$ such that $n_1=m_1,...,n_j=m_j$ and $n_(j+1)<m_(j+1)$

  #example[
      $(1,3,5,7,9) lex (1,3,7)$

      The first two elements are the same but in the third element they are different. The third element in the first sequence $(5)$ < the third element in the second sequence $(7)$.

      Put another way, $j=2, n_1=m_1, n_2=m_2, n_3<m_3$
  ]
]

However, $(NN^*, lex)$ is *not a well-ordered set*, as we can construct an infinite descending sequence of elements:
$
(1) lexgt (0,1) lexgt (0,0,1) lexgt ...
$

// In order to well-order $NN^*$, we need to compare them differently. We first order them by length, then use the lexicographic ordering of fixed-length sequences. We call this new ordering "short-lex", or $slex$
// #definition(name: [*_short-lex ordering #slex _*])[
//   For 2 sequences $s, t$:
//   $
//   s &= (n_1, n_2, ..., n_k)\
//   t &= (m_1, m_2, ..., m_l)\
//   $

//   $s slex t$ if and only if either of the following is true:

//   1. $k < l$
//   2. $k=l$ and for some $j<k, n_j = m_j$ and $n_(j+1) < m_(j+1)$
// ]

// #proposition[$(NN^*, slex)$ is a well-ordered set.]
// #proof[
//     Let $NN^*_>$ be the set of all sequences $(n_1, ..., n_k) in NN^*$ where $n_i > n_(i+1)$
//     (note that terms in our infinite descending sequence are not in $NN^*$).

//     Then $(N^*_>, lex)$ is a well-ordering.
// ]

However, if we only consider *decreasing sequences*, #lex is a well-order (Note that in the above example, none of them are decreasing.)

#proposition[
    Let $NN^*_>$ be the set of all decreasing sequences $(n_1, n_2, ..., n_k)$ where $n_1 > n_2 > ... > n_k$.

    $(NN^*_>, lex)$ is a well-ordered set.
]

#proof[
    Suppose for contradiction that there exists an infinite descending sequence of elements in $NN^*_>$:

    $s_1 lexgt s_2 lexgt ...$, where $s_1, s_2, ... in NN^*_>$.

    Let $s_i = (n_1^i, n_2^i, ..., n^i_k_i) in NN^*_>$.

    If we consider the first elements of $s_1, s_2, s_3, ...$ we get a non-increasing sequence $n_1^1 >= n_1^2 >= n_1^3 >= ...$.
    For every $k$, $n_1^k >= n_1^(k+1)$, as if $n_1^k < n_1^(k+1)$, then lexicographically $s_k lex s_(k+1)$ and it won't be in the infnite descending sequence.

    Since it is a non-increasing sequence in the well-ordered set $NN$, it must stabilize at some index.
    Let's call the index $j_1$, and the value it stabilizes at $m_1$.
    Therefore for all $i >= j_1$, the first element of $s_i$ must be $m_1$: $s_i = (m_1, n_2^i, n_3^i, ..., n^i_k_i)$.

    Now let's consider all sequences after the index $j_1$. We can similarly construct a non-increasing sequence from the second elements in those sequences:
    $n^(j_1)_2 >= n^(j_1 + 1)_2 >= n^(j_1 + 2)_2 >= ...$. It similarly stabilizes at an index $j_2$ with a value of $m_2$.
    Therefore for all $i >= j_2$, the second element of $s_i$ must be $m_2$: $s_i = (m_1, m_2, n_3^i, ..., n^i_k_i$).

    Now since $s_i in NN^*_<$, $s_i$ _is a decreasing sequence_, so $m_1 > m_2$.
    Continuing this, we get $m_1 > m_2 > m_3 > ...$, which is an infinite descending sequence in $NN$, a contradiction.
    Therefore $(NN^*_>, lex)$ is a well-ordered set.
]

Note that there's nothing special about $NN$ here, we can replace $NN$ with an well-ordered set:
#proposition[

    Let $(X, <)$ be a well-ordered set.
    Let $X^*_>$ be the set of all decreasing sequences $(x_1, x_2, ..., x_k)$ where $x_1 > x_2 > ... > x_k$ and $x_i in X$.

    $(X^*_>, lex)$ is a well-ordered set.
] #label("decreasing sequences of a well-ordered is well-ordered")

In fact, the set of all *non-increasing* sequences of elements of a well-ordered set $X$ is also a well-ordered by #lex.
A non-increasing sequence of elements in $X$ is a sequence $(x_1, x_2, ..., x_k)$ where $x_i >= x_(i+1)$ (rather than strictly decreasing $x_i > x_(i+1)$).

To show this, we can split non-increasing sequences into a sequence of constant sequences, e.g. $(4,4,4,3,2,2,1,1,1) arrow.r ((4,4,4),(3),(2,2),(1,1,1,1))$.

#lemma[
  Let $(X, <)$ be a well-ordered set. Let $X_=^*$ be the set of all constant sequences $(x,...,x) in X$.

  e.g. if $X={1,2,3}, X_=^* = {(1),(1,1),(1,1,1),...,(2),(2,2),...,(3), (3,3), ...}$

  $(X_=^*,lex)$ is a well-ordered set.
]

#proof[
  Let $Y subset.eq X_=^*$. Now we have to show there exists a least element in $Y$.

  Lexicographically, we compare sequences by their first entry. As such, the least element must have the least first entry.
  Let $x$ be the value of the least first entry.

  Since all sequences in $X^*_=$ are constant sequences, all candidates to be the least element will be sequences like $(x,x), (x,x,x,x), (x,x,x)$.
  The least element (lexicographically) would be the _shortest_ constant sequence of $x$.
]

#proposition[
  If $(X,<)$ is a well-ordered set, the set of non-increasing sequences of elements $(X_(>=)^*, lex)$ is a well-ordered set.
] #label("non-increasing sequences well-ordered")

#proof[

    Since the set of constant sequences $X_=^*$ is well-ordered, #link(label("decreasing sequences of a well-ordered is well-ordered"))[by this proposition],
    the set of decreasing sequences of constant sequences $(X^*_=)^*_lexgt$ is also well-ordered.
    Now, #link(label("order isomorphic transfers well-order"))[by this proposition] all we need to do is construct an order ismorphism from $(X^*_=)^*_lexgt$ to $X^*_>=$ to prove that $X^*_>=$ is a well-ordered set.

    Let $y_i$ denote constant sequences in $X^*_=$. We can construct an isomorphism $f: (X^*_=)^*_lexgt arrow.r.bar X^*_>=$:

    $f( (y_1,y_2,...,y_k') ) = (underbrace(x_1\,...\,x_1, "contents of" y_1), underbrace(x_2\,...\,x_2, "contents of" y_2), ..., underbrace(x_k'\,...\,x_k', "contents of" y_k'))$

    Both sets are ordered lexicographically. $X^*_>=$ is ordered by #lex, and $(X^*_=)^*_lexgt$ is ordered lexicographically based on #lex,
    so this is an order-preserving isomorphism.

    Therefore is $X^*_>=$ is a well-ordered set.
]

All this discussion on lexicographic orderings is quite abstract, but we will use the concepts of orders (especially on non-increasing sets) in the next chapter.

// == Cardinals [WIP]

// We previously introduced $$