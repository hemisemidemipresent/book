#import "../shorthands.typ": *
= Buchholz's $psi$ function

// == Prerequisites

// #definition[
//     An *additively principal* ordinal $alpha$ is any non-zero ordinal such that for any $beta, gamma < alpha$, $beta + gamma < alpha$.

//     We denote the _class_ of all additively principal numbers as $P$. $P$ is precisely all ordinals of the form $omega^"some ordinal"$.

//     Formally, we can define $P$ as such:
//     $
//         P &= {alpha in Ord | 0<alpha "and for all" beta, gamma < alpha, beta + gamma < alpha }\
//         &= {omega^xi | xi in Ord}
//     $
// ]

== Buchholz's Ordinal Collapsing Function
Buchholz's Ordinal Collapsing Function is a way for us to create even larger (countable) ordinals.
Ironically, to make these larger ordinals, we will be using even larger _uncountable_ ordinals to get there (remember $omega_1$?).

#definition[
  Let $Omega_nu$ be defined as such:
  $
      Omega_nu := cases(
          1 &"if" nu=0,
          omega_nu &"if" nu>0
      )
  $

  Buchholz's ordinal collapsing function $psi$ and the set $C_nu (alpha)$ is defined as such:
  + $Omega_nu subset.eq C_nu (alpha)$
  + For any two ordinals $xi, eta in C_nu (alpha)$, their sum $xi+eta in C_nu(alpha)$
  + For any ordinal $xi in C_nu (alpha)$, as long as $xi < alpha$, then $ psi_mu (xi) in C_nu (alpha)$ for all $mu <= omega$
  + $psi_nu (alpha) = min{gamma in Ord | gamma in.not C_nu (alpha)}$, i.e., the smallest ordinal not inside $C_nu (alpha)$
]
This is a lot to unpack, so let's first start with $nu = 0$:

#example[
    Let's first find what $psi_0 (0)$ is.

    In order to figure out what $psi_0 (0)$, we first need to know what's inside $C_0(0)$. Going down the list, we have:
    + $Omega_0 = 1 = {0} subset.eq C_0(0)$

        so currently $C_0(0) = {0}$
    + For any two ordinals in $C_0(0)$, their sum is also in $C_0(0)$

        Another way to interpret this statement is to say that you can take a collection of ordinals in $C_0(0)$ and apply addition a finite number of times on them.
        In this case, all we have is $0$, so nothing new gets added here.
    + For any ordinal $xi in C_0 (0)$, as long as $xi < 0$, then $ psi_mu (xi) in C_0 (0)$ for all $mu <= omega$

        In this case, there are no ordinals $xi < 0$ so, nothing new get added here either.

    + $psi_0(0)$ is the smallest ordinal _not_ contained inside $C_0(0) = {0}$, which is just 1.
]
#example[
    Let's proceed to find the value of $psi_0(1)$:

    + $Omega_0 subset.eq C_0(0)$, so we once again have $0 in C_0(0)$.
    + Adding doesn't do anything
    The difference this time is that we can use $psi_0(0)$:
    3. For any ordinal $xi in C_0(0)$, as long as $xi < 1$, then $psi_mu(xi) in C_0(0)$ for all $mu<=omega$

        The only valid values of $xi$ is just $0$, so we have $psi_0(0), psi_1(0), ..., psi_omega(0) in C_0(0)$.
        $psi_0(0) = 1 in C_0(0)$, so we finally have something new.
        We haven't gotten to $psi_1(0), psi_2(0), ..., psi_omega(0)$ yet, and we'll ignore them for now.
    2. We can now use addition to show that $1 + 1 = 2 in C_0(0), 2 + 1 = 3 in C_0(0)$, and so on to show that all natural numbers $NN subset.eq C_0(0)$.
        In fact, $NN = C_0(0)$.
    4. $psi_0(1)$ is the smallest ordinal not in $C_0(0)$, which is $omega$
]

Buchholz proved some properties about this function

== Ordinal Notation

== The Pair Sequence System

The Pair Sequence System (PSS) can be considered an extension to the primitive sequence system, where instead of it being a sequence of natural numbers,
the Pair Sequence System can be thought og as a sequence of _pairs_ of natural numbers. There are two common ways to write PSS, either inline, like
$(0,0)(1,1)(2,1)(2,0)$ or as a matrix like so:
$
    mat(0,1,2,2;0,1,1,0)
$

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