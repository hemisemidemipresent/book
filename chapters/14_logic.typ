#import "../shorthands.typ": *
= Crash Course in Logic and Set theory

== Filters and Ideals

#definition[
  A #keyword[filter] on a nonempty set $S$ is a collection $F$ of subsets of $S$ such that:
  - $S in F$ and $emptyset in.not F$
  - For subsets $X, Y in F$, $X inter Y in F$
  - For subsets $X, Y$, if $X in F$ and $X subset Y$, then $Y in F$

  An #keyword[ideal] on a nonempty set $S$ is a collection $I$ of subsets of $S$ such that:
  - $emptyset in I$ and $S in.not I$
  - For subsets $X, Y in I$, $X union Y in I$
  - For subsets $X, Y$, if $X in I$ and $Y subset X$, then $Y in F$
]

Filters and Ideals are dual notions.
If $F$ is a filter on $S$, then the set ${S \ X|X in F}$ would be an ideal in $S$.
Conversely, if $I$ is an ideal on $S$, then the set ${S \ X|X in I$ would be a filter in $F$.

#example[
  1. A trivial filter is $F = {S}$
  2. A _principal filter_

    Let $X_0$ be a nonempty subset of $S$. Then the filter
    $
      {X subset S | X_0 subset X}
    $
    is a principal filter. Note that for finite sets, all filters and principal filters.
  3. A _Cofinite/Frechet filter_ is an example of a non-principal filter on an infinite set $S$.
    Let $I$ be the ideal of all finite subsets of $S$


]

#definition[
  A filter $U$ on a set $S$ is an #keyword[ultrafilter] if for every $X subset S$, either $X in U$ or $S \ X in U$
]

== Logic

// Tarski's thing

#definition[Structure][
   A #keyword[structure] is a set with a collection of relations and operations defined on elements of that set.
   This is usually
]
We generally consider structures in the language of first-order set theory,
so usually its a universe $X$ and the relation $in$, and the structure is denoted $(X, in)$

// assignment
// substitution
// satisfaction
// witness
// defineable power set
// constructible hierarchy
// von neumann hierarchy
// V=L

// Transitive sets

== Levy Hierarchy

// bounded vs unbounded quantifiers
// Δ₀ formulas, Δ₀ absoluteness
// Σ₁ and Π₁
// modified Levy Hierarchy with Σ^n_m and Π^n_m

== Axioms of KP

- Extensionality
- Empty Set
- Pairing
- Union
- Infinity
- Δ₀-Separation
- Δ₀-Collection
- Set Induction/Foundation

== Axioms of ZF(C)


