#import "../shorthands.typ": *
= Intermission: Cardinals

We already have a good grasp of Ordinals from Chapter 5, however we have so far simply lightly touched on Cardinals.

#definition[Cardinality][
  Two sets $X$ and $Y$ have the same #keyword[cardinality]
  $
    |X| = |Y|
  $
  if there exists a bijective (one-to-one and onto) mapping from X onto Y.
]

In this case, all sets of equal cardinality get assigned the same cardinal (which is a special type of ordinal).
#definition[Cardinals][
  An ordinal $alpha$ is called a #keyword[cardinal number] (or just "cardinal"), if $|alpha|!=|beta|$ for all $beta < alpha$.
]
(Recall Von Neumann Cardinal Assignment)

As for the ordering of cardinals, $|X| <= |Y|$ is true if there exists an injective (one-to-one) mapping of $X$ into $Y$.

#theorem[Cantor's Theorem][
  For a set $A$, its powerset $cal(P)(A)$ has a strictly larger cardinality, i.e.,
  $
    |A| < |cal(P)(A)|
  $
]
#proof[
  Suppose $|A| = |cal(P)(A)|$. Then there its a bijective function $f: A -> cal(P)(A)$.
  This means that for every element of $A$, it can be mapped to every possible subset of $A$.

  For contradiction, we construct a special subset $B = {x in A | x in.not f(x)}$.
  This subset $B$ must be inside $cal(P)(A)$ since $B subset.eq A$.

  Since $f$ is a bijective, it must be surjective (onto), i.e. for every element $y in cal(P)(A)$, there exists an $x in A$ such that $f(x) = y$.
  This means there exists a $z in A$ such that $f(z) = B$.

  However, if $z in B$, that means that $z in f(z)$ (from the fact that $f(z) = B$) and $z in.not f(z)$ (from the definition of $B$).
  A similar contradiction applies for $z in.not B$.

  Hence no such function $f$ exists, and $|A| != |cal(P)(A)|$
  However, since there exists injections (one-to-one) functions from $A$ to $cal(P)(A)$ (trivially $f(x) = {x}$),
  $|A| <= |cal(P)(A)|$. Combining these two results, we have $|A| < |cal(P)(A)|$.
]

#lemma[
  For every ordinal $alpha$, there exists a cardinal number greater than $alpha$
]
#proof[
  For any set $X$, let $h(X)$ be the least $beta$ such that there is no bijection of $beta$ onto $X$.

  There is a set of possible well-orderings or subsets of $X$.
  Hence there is a set of ordinals for which a bijection of $beta$ into $X$ exists.
  So $h(X)$ is merely the (strict) supremum of that set, thus $h(X)$ exists.

  Applying this concept to an ordinal $alpha$, we have $|alpha| < |h(alpha)|$.
  So for any ordinal $alpha$ there exists a cardinal number greater than $alpha$.
]

Note that $|cal(P)(A)| = 2^(|A|)$.

// == Cardinal Arithmetic
// - $+$ and $dot$ are commutative, associative and distributive (unlike ordinals)
// - $(kappa dot lambda)^mu = kappa^mu dot lambda^mu$
// - $kappa^(lambda+mu) = kappa^lambda dot kappa^mu$
// - $(kappa^lambda)^mu = kappa^(lambda dot mu)$
// - If $kappa <= lambda$, then $kappa^mu <= lambda^mu$
// - If $0 < lambda <= mu$, then $kappa^lambda <= kappa^mu$
// - $kappa^0 = 1$, $kappa^1 = kappa$, and $0^kappa = 0$ for $kappa > 0$
//
// We generally won't be using cardinal arithmetic much in googology, but its good to keep these in mind.

== Alephs
We will more formally go through what things like $aleph_1$, or $omega_1$ means:


#definition[Cardinal Successor][For every ordinal $alpha$, let the #keyword[cardinal successor] $alpha^+$ be the least cardinal number greater than $alpha$.]

This is equivalently the set
$
    aleph_1 = omega_1 = {alpha in Ord : |alpha| <= aleph_0}
$

We can then enumerate across the alephs with ordinals:
#definition[Alephs][
  We use $aleph_alpha$ when referring to cardinality and $omega_alpha$ when referring to the order type:

  - $aleph_0 = omega_0 = omega$
  - $aleph_(alpha+1) = omega_(alpha+1) = aleph_alpha^+$
  - $aleph_lambda = omega_lambda = sup{omega_alpha | alpha < lambda}$ if $lambda$ is a limit ordinal.
]

Just like how a limit ordinal is an ordinal that cannot be reached by (ordinal) successors,
a #keyword[(weak) limit cardinal] is a cardinal that cannot be reached by cardinal successors, e.g. $aleph_omega$.

== Beths

#definition[Beths][
  - $beth_0 = aleph_0$
  - $beth_(alpha+1) = 2^(beth_alpha)$
  - $beth_lambda = sup{aleph_alpha | alpha < lambda}$ if $lambda$ is a limit ordinal.
]

Notably, $beth_1 = 2^(aleph_0) = frak(c)$, the cardinality of the set of real numbers (the continuum).

Since $kappa^+ <= 2^kappa$ (as $kappa < 2^kappa$ and $kappa < kappa^+$), $aleph_alpha <= beth_alpha$.

The #keyword[Generalized Continuum Hypothesis (GCH)] states that:

$
  aleph_(alpha+1) = 2^(aleph_alpha)
$
which equivalently means that $aleph_alpha = beth_alpha$.

GCH is independent of ZFC, which means that ZFC's axioms can neither prove nor disprove the continuum hypothesis.

Does googology assume GCH? Not necessarily.
Googology is mainly about the complex recursiveness of a structure,
so it does not matter if the "layers" (e.g. $Omega$ in Buchholz's OCF) is made from $aleph$s or $beth$s.

== Cofinality

#definition[
  The #keyword[cofinality] of an ordinal $alpha$, denoted $cof alpha$, is the *least cardinal number* $kappa$ such that there exists a subset $S subset.eq alpha$ of cardinality $kappa$ where $alpha$ is smallest ordinal strictly greater than every element in $S$.
]

#example[
  Find the cofinality of
  + $omega 2$
  + $omega 2 + 3$
  + $omega_1 = Omega$

  Answers:
  + Let $S = {omega + n | n in NN} subset omega 2$. $S$ has a cardinality of $omega$.

    However, we still need to rule out the possibility that there might be a subset $S$ of finite cardinality (i.e. cardinality $<omega$) that still satisfies the criteria that $omega 2$ is the smallest ordinal greater than every element in $S$

    In a subset $S$ which has a nonzero finite cardinality, there is a largest element $beta$, and its successor $beta + 1$
    is the smallest ordinal greater than all elements of the subset $S$ while being less than $omega 2$. Therefore $S$ can't have nonzero finite cardinality.

    If $S$ has a cardinality of $0$ (i.e. $S = emptyset = {}$), then $0$ is the smallest ordinal greater than all elements in $S$. Therefore $S$ can't have a cardinality of $0$.

    Therefore the smallest cardinality of $S$ where $omega 2$ is the least ordinal greater than all elements in $S$ is $omega$.
  + $S = {omega 2 + 2} subset omega 2 + 3$, and $S$ has a cardinality of $1$. $S$ can't have a cardinality of $0$ since the smallest ordinal larger than nothing is $0$.
  + $omega_1$ (and its associated cardinal $aleph_1$) is defined as the set of all ordinals whose cardinality is $<=aleph_0$. So the smallest subset where $omega_1$ is the
]

#definition[Regular Cardinal][
  An ordinal/cardinal $kappa$ is #keyword[regular] if $kappa = cof(kappa)$. Otherwise it is #keyword[singular].
]