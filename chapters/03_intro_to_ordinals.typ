#import "../shorthands.typ": *

= Introduction to Ordinals

== Informal definition

The easiest way to think about ordinals is as an extension of the natural numbers $NN = {0,1,2,3,...}$ (We include $0$ in the natural numbers for this book).
#definition[We define $omega$ as the *first ordinal larger than all the natural numbers*, or *the first transfinite ordinal*.] We can continue by having an $omega+1, omega+2, ...$, so we have something like ${0,1,2,...,omega, omega+1, omega+2,...}$

We then have $omega + omega = omega dot 2, omega dot 3, omega dot 4, ...$ until we get $omega dot omega = omega^2, omega^3, omega^omega, omega^(omega+1), omega^omega^omega, ...$. Eventually, we reach $omega^omega^dots.up = e0$. The special property of $e0$ is that $omega^e0 = e0$, as
$
omega^e0 = omega^((omega^omega^dots.up)) = omega^omega^omega^dots.up = e0
$

We note that there are many intermediate ordinals that, while not mentioned explicitly, are still present, like $omega^omega^3 < omega^(omega^3+ omega^2 dot 3 + omega dot 4 + 5)+6 < omega^omega^4$.


== Von Neumann definition of ordinals

#definition[

An ordinal is defined as *the set of all ordinals lesser than that ordinal*.
]
Let's look at some examples of how this plays out:

- There are no ordinals smaller than $0$, so $0 = emptyset = {}$, the empty set.

- For the ordinal $1$, $0$ is the only ordinal smaller than $1$, so $1 = {0} = {emptyset} = {{}}$.

- Similarly, we have $2 = {0,1} = {emptyset, {emptyset}}$, $3={0,1,2}={emptyset,{emptyset},{emptyset,{emptyset}}}$, etc...

- In this definition, $omega$ is defined as the set of all ordinals less than $omega$, i.e. all natural numbers:
$
omega = {0,1,2,...} = NN
$
- $omega+1$ can similarly be defined as all the natural numbers + $omega$:
$
omega + 1 = {0,1,2,...,omega} = NN union {omega} = omega union {omega}
$

- $omega dot 2 = omega+omega$ can be defined as the ordinal larger than all $omega + n$:

$
omega dot 2 = {0,1,2,...,omega,omega+1,omega+2,...}
$


We can therefore see from this that *for any set of ordinals*, there exists another ordinal greater than all of them. Now, this can lead to a contradiction - what about the set of all ordinals? (this is Burali-Forti paradox). In modern set theory, however, it is not possible to construct "the set of all ordinals" which resolves this paradox. We only have the *_proper class_ of all ordinals*, denoted *$"Ord"$*, *$"On"$*, or less commonly, *$"ON"$*.

We can see from this definition of ordinals that for ordinals $alpha$ and $beta$, $alpha < beta$ can be defined as $alpha in beta$. Since $alpha$ also contains all ordinals smaller than itself, $alpha < beta$ can be written as $alpha subset.neq beta$ ($alpha subset beta "and" alpha != beta$)

== Ordinal Arithmetic

We previously defined the successor function $S(n)$ to be the least natural number greater than $n$, or just $n+1$. Using the von Neumann definition of ordinals, we can also write the successor function as:

#definition[
  The *successor function* $S(alpha) = alpha union {alpha} = alpha + 1$
]

#definition[
  A *Successor Ordinal* $beta$ is an ordinal which can be expressed as the *successor of another ordinal*.

  A *Limit Ordinal* is an ordinal that is *not a successor ordinal*.
]

#example[
  Categorize the following ordinals into whether they are limit or successor ordinals:
  + $omega$
  + $omega+5$
  + $omega^2$
  Explanations:
  + $omega$ is bigger than all natural numbers, so there is no natural number whose successor is $omega$. Therefore $omega$ is a *limit ordinal*.
  + $omega+5$ is the successor of $omega+4$. Therefore $omega+5$ is a *successor ordinal*.
  + $omega^2$ is the ordinal bigger than all $omega dot n$. Since there is no greatest $omega dot n$, $omega^2$ can't be a successor to any of them. Therefore $omega^2$ is a *limit ordinal*.
]


We previously defined addition recursively #link(<addition>)[here]. Let's add a new case to accommodate limit ordinals:

#definition[
  *Addition* can be defined recursively as:
  + $alpha + 0 = a$
  + $alpha + S(beta) = S(alpha+beta)$
  + $alpha + beta = limits(union.big)_(gamma<beta) (alpha+gamma)$ when $beta$ is a limit ordinal
]

#example[
  Evaluate $omega+1$ and $1+omega$. Are they the same?

  $
  omega + 1 &= omega + S(0)\
  &= S(omega+0) "(Rule 2)"\
  &= S(omega) "(Rule 1)"\
  &= omega + 1
  $

  $
  1 + omega &= union.big_(delta<omega) (1 + delta) "(Rule 3)"\
  &= 1 union 2 union 3 union ...\
  &= {0} union {0,1} union {0,1,2} union ...\
  &= {0,1,2,...}\
  &= omega
  $
  We see that addition is not commutative (i.e. $a+b$ is not always equal to $b+a$)
]

We can similarly accommodate limit ordinals into our definition of multiplication and exponentiation too:

#definition[
  *Multiplication* can be defined recursively as:
  + $alpha dot 0 = 0$
  + $alpha dot S(beta) = (alpha dot beta) + beta$
  + $alpha dot beta = limits(union.big)_(gamma<beta) (alpha dot gamma)$ when $beta$ is a limit ordinal
]

#example[
  Evaluate $omega dot 2$ and $2 dot omega$
  $
  omega dot 2 &= omega dot S(1)\
  &=(omega dot 1) + omega\
  &=((omega dot 0) + omega) + omega\
  &= omega + omega\
  \
  2 dot omega &= union.big_(gamma<omega) (2 dot gamma)\
  &= 0 union 2 union 4 union ...\
  &= {} union {0,1} union {0,1,2,3} union ...\
  &= {0,1,2,3,...}\
  &= omega
  $
  We see that multiplication is not commutative either (i.e. $a dot b$ is not always equal to $b dot a$)
]

Multiplication can also be denoted with the $times$ symbol (e.g. $omega times 2$), or even without any symbol, like in algebra (e.g. $omega 2$)

#definition[
  *Exponentiation* can be defined recursively as:
  + $alpha^0 = 1$
  + $alpha^S(beta) = alpha^beta dot alpha$
  + $alpha^beta = limits(union.big)_(gamma < beta) (alpha^gamma)$ when $beta$ is a limit ordinal
]

The usual exponential rules apply, e.g. $alpha^(beta+gamma) = alpha^beta dot alpha^gamma$, and $alpha^(beta dot gamma) = (alpha^beta)^gamma$.

Distributivity holds on the left, but not on the right:
$
    alpha dot (beta + gamma) &= alpha dot beta + alpha dot gamma\
    (alpha + beta) dot gamma &!= alpha dot gamma + beta dot gamma
$
As such we can also "cancel" terms on the left, but no on the right:
$
    alpha dot beta = alpha dot gamma &=> beta = gamma\
    beta dot alpha = gamma dot alpha &arrow.r.double.not beta = gamma
$

If you recall, $1+omega = omega$. We can show a more general version of this:
#proposition[
    #let alpha = redf($alpha$)
    #let beta = bluef($beta$)
    If $alpha < beta$, $omega^alpha + omega^beta = omega^beta$
]
#proof[
    #let alpha = redf($alpha$)
    #let beta = bluef($beta$)
    #let gamma = greenf($gamma$)
    Let $beta = alpha + gamma$ for some ordinal $gamma$. Then:

    $
        omega^alpha + omega^beta &= omega^alpha + omega^(alpha+gamma)\
        &= omega^alpha + omega^alpha dot omega^gamma\
        &= omega^alpha(1+omega^gamma)\
        &= omega^alpha dot omega^gamma\
        &= omega^(alpha+gamma)\
        &= omega^beta
    $
]

Higher hyperoperators are tricky to define for transfinite ordinals, so we will only allow addition, multiplication and exponentiation on transfinite ordinals.

== Ordinals versus Cardinals

The natural numbers $NN = {0, 1, 2, 3, ...}$ can be used in 2 ways: denoting the *position* of an element in a sequence, or denoting the *size* of a set.

Denoting the position leads to *Ordinal numbers*, while denoting the size leads to *Cardinal numbers*. For finite sets it both are the same, but when it comes to infinite sets and sequences, there are differences.

#definition[
  Two sets are said to have the same *cardinality* if there is a *one-to-one correspondence (bijection)* between them.
]
Note that since we have defined ordinals as sets, we can measured the cardinality of ordinals.
#example[
  Show that $omega$ and $omega 2$ have the same cardinality.

  We can construct a bijection $f$ from $omega$ to $omega 2$ as such:
  $
  &0 -> 0\
  &1 -> omega\
  &2 -> 1\
  &3 -> omega +1\
  &"and in general:"\
  &2n -> n\
  &2n + 1 -> omega + n
  $

  To be precise, to show that $f$ is a bijection, we need to show that:
  + $f$ is total: $f(n)$ is defined for all $n in omega$
  + $f$ is injective: if $n_1 != n_2$ then $f(n_1) != f(n_2)$
  + $f$ is surjective: for every $alpha in omega 2$ there exists an $n in omega$ such that $f(n) = alpha$
]

Every natural number is a cardinal. For infinite cardinals, they are labelled as $aleph_0, aleph_1, aleph_2, ...$.
We set $aleph_0$ to be the cardinality of $omega$ (and from the above example, this is the cardinality of $omega 2$ too).

But how do we know that there are cardinalities above $aleph_0$? We know there are cardinalities larger than $aleph_0$, as the cardinality of the set of all real numbers $RR$ is $2^(aleph_0)$, which is greater than $aleph_0$.
But what is $2^(aleph_0)$ in terms of $aleph_n$? Is $2^(aleph_0) = aleph_1$ (This is known as the Continuum Hypothesis)?
It turns out that we can set $2^(aleph_0) = aleph_n$ for _any_ finite $n$, and it will be consistent with ZFC.

In ZFC, we assign each cardinal to an ordinal via *von Neumann cardinal assignment*:

#definition[
  Von Neumann cardinal assignment defines the *cardinality of a set* as the *smallest ordinal that has a bijection with the set*.
]

Therefore by this definition, *cardinals are ordinals* and we can assign cardinals to ordinals like this: $aleph_0 = omega, aleph_1 = omega_1, aleph_2 = omega_2, ...$.

#definition[
  We say a set, and by extension ordinal, is *countable*, if its cardinality is less than $omega_1$ (or $aleph_1$).
]

