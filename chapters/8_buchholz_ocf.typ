#import "../shorthands.typ": *
= Buchholz's $psi$ function

#definition[
  Buchholz $psi$ function is defined as such:

]

== Ordinal Notation

== Extended Buchholz

#definition[
  The *cofinality* of an ordinal $alpha$, denoted $cof alpha$, is the *least cardinal number* $kappa$ such that there exists a subset $S subset.eq alpha$ of cardinality $kappa$ where $alpha$ is smallest ordinal strictly greater than every element in $S$.
]

#example[
  Find the cofinality of
  + $omega 2$
  + $omega 2 + 3$

  Answers:
  + Let $S = {omega + n | n in NN} subset omega 2$. $S$ has a cardinality of $omega$.

    However, we still need to rule out the possibility that there might be a subset $S$ of finite cardinality (i.e. cardinality $<omega$) that still satisfies the criteria that $omega 2$ is the smallest ordinal greater than every element in $S$

    In a subset $S$ which has a nonzero finite cardinality, there is a largest element $beta$, and its successor $beta + 1$ is the smallest ordinal greater than all elements of the subset $S$ while being less than $omega 2$. Therefore $S$ can't have nonzero finite cardinality.

    If $S$ has a cardinality of $0$ (i.e. $S = emptyset = {}$), then $0$ is the smallest ordinal greater than all elements in $S$. Therefore $S$ can't have a cardinality of $0$.

    Therefore the smallest cardinality of $S$ where $omega 2$ is the least ordinal greater than all elements in $S$ is $omega$.
  + $S = {omega 2 + 2} subset omega 2 + 3$, and $S$ has a cardinality of $1$. $S$ can't have a cardinality of $0$ since the smallest ordinal larger than nothing is $0$.
]