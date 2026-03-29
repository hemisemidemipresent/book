#import "../shorthands.typ": *

= Veblen Hierarchy

== What lies beyond $e0$?

We previously spent a lot of time on ordinals $<e0$. We finally see what lies beyond $e0$. We first start with $e0 + 1$, then $e0 + 2, e0 + omega, e0 + omega^2, e0+omega^omega,$ until we get $e0 + e0 = e0 dot 2$.
We then have the following ordinals, and their expression in Cantor Normal Form (CNF):

(Note that CNF applies to *all* ordinals, not just ordinals $<e0$. It is the _Ordinal Notations_ discussed last chapter that have this restriction.)
$
e0 dot 3 &= omega^e0 + omega^e0 + omega^e0\
e0 dot omega &= omega^(e0+1)\
e0^2 &= omega^(e0 dot 2)\
e0^omega &= omega^omega^(e0+1)\
e0^e0 &= omega^omega^(e0 dot 2)\
e0^e0^omega &= omega^omega^omega^(e0+1)\
e0^e0^e0 &= omega^omega^omega^(e0 dot 2)\
e0^e0^e0^omega &= omega^omega^omega^omega^(e0+1)
$

Note that while $omega^e0 = e0, e0^omega != e0$.

$
    omega^e0 &= union.big_(gamma < e0)(omega^gamma) = sup {omega, omega^omega, omega^omega, omega^omega^omega, ...} = e0\
    e0^omega &= union.big_(gamma < omega)(e0^gamma) > e0
$

The limit of stacking $omega^dots.up^omega^(e0+1)$ is $epsilon_1$, or more formally:
$
    epsilon_1 := sup{e0+1,omega^(e0+1), omega^omega^(e0+1),...}
$
$epsilon_1$ can also be defined as:
$
    epsilon_1 = sup {e0, e0^e0, e0^e0^e0, ...}
$
However, you may be noticing that these are not the same sequence: $e0^e0 = omega^omega^(e0 dot 2)$, which is not of the form $omega^dots.up^omega^(e0+1)$.
However, we can show that these two definitions lead to the same supremum of $epsilon_1$.

#proof[
    Let's fix $epsilon_1=sup{e0+1,omega^(e0+1), omega^omega^(e0+1),...}$.
    Suppose for contradiction that
    $
        sup {e0, e0^e0, e0^e0^e0, ...} > sup{e0+1,omega^(e0+1), omega^omega^(e0+1),...} = epsilon_1
    $
    That means there must exist a term $e0^dots.up^e0$ greater than all $omega^dots.up^omega^(e0+1)$.
    As seen earlier, we can express $e0^dots.up^e0$ as some $omega^dots.up^omega^(e0 dot 2)$.
    However, since $e0 + 1 <= e0 dot 2 <= omega^(e0+1)$,
    $
        omega^dots.up^omega^(e0+1) <= omega^dots.up^omega^(e0 dot 2) <= omega^dots.up^omega^omega^(e0+1)
    $
    So there cannot exist a term $e0^dots.up^e0$ greater than all $omega^dots.up^omega^(e0+1)$, and as such:
    $
        sup {e0, e0^e0, e0^e0^e0, ...} = sup{e0+1,omega^(e0+1), omega^omega^(e0+1),...} = epsilon_1
    $
    In fact, we can see that for any ordinal $epsilon_0 < alpha < epsilon_1$:
    $
        epsilon_1 = sup{omega^alpha, omega^omega^alpha, omega^omega^omega^alpha, ...}
    $
]


$epsilon_1$ is the second fixed point of $omega^alpha = alpha$. Note that it is also a fixed point of $e0^alpha = alpha$.

We can repeat this process to get $epsilon_2 = sup {epsilon_1 + 1, omega^(epsilon+1), omega^omega^(epsilon_1 + 1), ...}$ and so on.
$epsilon_n$ is the $(1+n)$th fixed point of $omega^alpha = alpha$, and $epsilon_omega$ is the $omega^"th"$ fixed point of $omega^alpha = alpha$.
Formally:
$
    epsilon_omega = sup {e0, epsilon_1, epsilon_2, ...} = sup {epsilon_n | n in NN}
$
and in general for a limit ordinal $lambda$, $epsilon_lambda = sup{epsilon_alpha | alpha < lambda}$

We can keep repeating until we get something like $epsilon_e0$ and $epsilon_epsilon_e0$. Eventually we reach:
$
    z0 = epsilon_epsilon_epsilon_dots.down = sup{e0, epsilon_e0, epsilon_epsilon_e0, ...}
$

$z0$ is the first fixed point of $epsilon_alpha = alpha$, since $epsilon_z0 = epsilon_((epsilon_epsilon_dots.down)) = epsilon_epsilon_epsilon_dots.down = z0$.
Note that it is also a fixed point of $omega^alpha = alpha$, as $omega^z0 = omega^(epsilon_z0) = epsilon_z0 = z0$.

=== What lies beyond $z0$?

We have the usual $z0 + 1$, all the way up to $z0 + z0 = z0 dot 2$. Then we have $z0 dot n$, all the way up to $z0 dot omega = omega^(z0+1)$.
We can similarly construct:
$
    epsilon_(z0+1) = sup{z0+1, omega^(z0+1), omega^omega^(z0+1), ...}
$

In order to climb to the next $zeta$, we need to nested deeper and deeper $epsilon$s:

$
epsilon_epsilon_(z0+1) &= sup{epsilon_(z0+1), omega^(epsilon_(z0+1)), omega^omega^(epsilon_(z0+1)), ...}\
zeta_1 &= sup{z0+1, epsilon_(z0+1), epsilon_epsilon_(z0+1), epsilon_epsilon_epsilon_(z0+1), ...}
$

When we finally reach $zeta_zeta_zeta_dots.down$ we can define a new ordinal $eta_0$ the first fixed point of $zeta_alpha = alpha$. We can keep going, defining an even larger ordinal such that $eta_alpha = alpha$ but eventually we will run our of symbols in this process. but at this point it's clear we need another way to express iteratively using fixed points.

=== Is there always a fixed point?

We have seen that $omega^alpha = alpha$ has a fixed point, and we can convince ourselves it exists by informally saying $omega^e0 = omega^(omega^omega^dots.up) = omega^omega^omega^dots.up = e0$.
We can similarly convince ourselves that the fixed point $epsilon_alpha = alpha$ also exists by saying $epsilon_z0 = epsilon_((epsilon_epsilon_dots.down)) = epsilon_epsilon_epsilon_dots.down =z0$.
But does a fixed point exist for every function? The answer is yes, if the function meets certain criteria:

#theorem(name: [*_Veblen’s Fixed Point Theorem_*])[
    #definition[
        A *normal function* is a function $f: Ord arrow.r.bar Ord$ such that:
        + $f$ is *strictly increasing*: $f(alpha) < f(beta)$ whenever $alpha <beta$
        + $f$ is *continuous*: if $beta$ is a limit ordinal, then $f(beta) = sup{f(alpha) | alpha < beta}$
    ]

    If a function is normal, then it has a fixed point $f(beta) = beta$.
    In fact there are infinitely many fixed points $f(beta) = beta$ that they make a proper class.
]

#proof[
    Let $alpha$ be an arbitrary ordinal, and left $f$ be a normal function. Now let's define $beta$ as:

    $
        beta &= sup{f^n (alpha) | n in NN}\
        &= sup{f^0(alpha) = alpha, f(alpha), f(f(alpha)), f^3 (alpha), ...}
    $
    Where $f^n (alpha)$ denotes function iteration. We can now show that $beta$ is a fixed point:
    $
        f(beta) &= f(sup{f^n (alpha) | n in NN})\
        &= sup{f^(n+1) (alpha) | n in NN}\
        &= beta
    $
    However, this assumes $alpha <= f(alpha)$, which must hold, as otherwise if $alpha > f(alpha)$, we can make an infinite descending sequence:
    $
        alpha > f(alpha) > f(f(alpha)) > f^3(alpha) > ...
    $
    However, the ordinals are well-ordered, so such a sequence can't exist.



    Since for any ordinal $alpha$, $alpha <= f(alpha)$, we can conclude that $alpha <= beta$.
    We can in fact show that $beta = sup{f^n (alpha) | n in NN}$ is the *least* fixed point $f$ with the property $alpha<=beta$:
    #proof[
        Let $gamma$ be any fixed point of $f$, so $f(gamma) = gamma$, with the property $alpha<=gamma$.
        $
            f(alpha) &<= f(gamma) = gamma\
            f(f(alpha)) &<= f(f(gamma)) = gamma\
            f^n (alpha) &<= gamma\
            beta = sup{f^n (alpha) | n in NN} &<= gamma
        $
    ]

    Therefore there is a proper class of fixed points of $f$, no matter what $f$ is.
]
We can define a function to find these fixed points:
#definition[
    The *derivative* of normal functions $f$, denoted $f'(alpha)$, is a function that enumerates over the fixed points of $f$.
    $
       f'(alpha) = sup{f^n (alpha) | n in NN} &<= gamma
    $
]

#example[
    The derivative of $f(alpha) = omega^alpha$ is $f'(alpha) = epsilon_alpha$, e.g. #e0 is the $1"st"$ fixed point of $f(alpha) = omega^alpha$
]

We can generalize this to define a fixed point of multiple functions:

#definition[
    For a family of the function $f_1, f_2, ..., f_k$, the _joint fixed point_ of _all_ $f_1, f_2, ..., f_k$ is defined as the fixed point of
    $
        f(alpha) := f_1(f_2(...f_k (alpha)))
    $
    So the $(1+alpha)^"th"$ fixed point of $f_1, f_2, ..., f_k$ is:
    $
        f'(alpha) &= sup{f^n (alpha) | n in NN}
    $
]

== 2-argument Veblen function

#definition[
  The 2-argument/binary Veblen function *$phi(alpha, beta)$* is defined as such:
  - $phi(0, gamma) := omega^gamma$
  - $phi(beta, gamma)$ for $alpha !=0$ is the $(1+gamma)^"th"$ fixed point of the functions $phi(alpha, #o) = #o$ for $alpha<beta$
]


Since we will be dealing with functions with multiple arguments, it's hard to tell which argument is the one being fixed,
so I denote the "dummy variable" of the fixed point to be #o.
// so instead of writing "the fixed point
// of the function $f(a,b)=b$, I will use a circle and say "the fixed point of the function $f(a,#o)$"

#example[
  For an ordinal $alpha$:
  $
      omega^alpha &= phi(0,alpha)\
      epsilon_alpha &= phi(1,alpha)\
      zeta_alpha &= phi(2,alpha)\
      eta_alpha &= phi(3,alpha)
  $
  Show that  $e0 = phi(1,0)$, and $zeta_2 = phi(2,2)$

  + $phi(1,0)$ is the $(1+0)^"th"$ fixed point of the function $phi(gamma, #o )= #o$ for $gamma < 1$ (i.e. $gamma = 0$)

    $phi(1,0)$ is the $1^"st"$ fixed point of the function $phi(0, #o) = omega^#o = #o$, and the first fixed point of $omega^#o = #o$ is $e0$.

  + $phi(2,2)$ is the $(1+2)^"th"$ fixed point of the function $phi(gamma, #o) = #o$ for $gamma < 2$

    $phi(2,2)$ is the $3^"rd"$ fixed point of the functions $phi(0, #o) = omega^#o = #o$ and $phi(1, #o) = epsilon_#o = #o$, and $zeta_2$ is the third ordinal that is a fixed point for _both_ functions. ($z0, zeta_1$ are the first and second).
]

Let's go through some basic properties of the Veblen function:
#proposition[
    #let alpha = redf($alpha$)
    #let beta = bluef($beta$)
    + If $alpha < beta$, then $phi(alpha, phi(beta, gamma)) = phi(beta, gamma)$
    + If $alpha < beta$, then $phi(gamma, alpha) < phi(gamma, beta)$
]
Both properties are just consequences of the definition provided, so convince yourself that they are true.
#example[
    Which is bigger? $phi(2, phi(1,0))$ or $phi(3,0)$?

    Of course we can convert them into ordinals that we know ($zeta_omega$ and $eta_0$) but we don't have notation that keeps up.

    $phi(3,0)$ can be written as $phi(1,phi(3,0))$, which can then be written as $phi(2,phi(1,phi(3,0)))$ (Property 1)

    Then we have:
    $
        0 &< phi(3,0)\
        phi(1,0) &< phi(1,phi(3,0))\
        phi(2,phi(1,0)) &< phi(2,phi(1,phi(3,0))) = phi(3,0)\
    $
    Therefore $phi(3,0)$ is bigger.
]

In the previous section, we defined $epsilon_1$ as:
$
    epsilon_1 &= sup{e0+1,omega^(e0+1), omega^omega^(e0+1), ...}\
    &= sup{phi(1,0)+1,phi(0,phi(1,0)+1), phi(0,phi(0,phi(1,0)+1)),...}\
    &= sup{phi^n (0,phi(1,0)+1)|n in NN}\
    &= phi(1,1)
$

We also mentioned that instead of $phi(1,0)+1$ (i.e. $e0 + 1$), we can replace that with any ordinal $alpha$ such that $phi(1,0) < alpha < phi(1,1)$ (i.e. $e0<alpha<epsilon_1$).
However, it is a bit self-referential to use $phi(1,1)$ in a condition that defines $phi(1,1)$.
We can instead prove a similar statement for all $phi(alpha+1,beta+1)$:
#proposition[
    $phi(alpha+1,beta+1)$ is the first fixed point of the function $f(#o) = phi(alpha, phi(alpha+1,beta)+#o) = #o$
]
#proof[
    Let $xi$ be the first (i.e. _least_) fixed point of $f$, i.e., $f(xi) = phi(alpha, phi(alpha+1,beta)+xi)=xi$. We now show that $xi = phi(alpha+1, beta+1)$

    Since $phi(alpha,greenf(gamma))>=greenf(gamma)$ for all $greenf(gamma)$, we can express $xi$ as:
    $
        xi = phi(alpha, greenf(phi(alpha+1,beta)+xi)) >= greenf(phi(alpha+1,beta)+xi)
    $
    This gives us $xi >= phi(alpha+1,beta) + xi$. Since obviously $xi gt.not phi(alpha+1,beta) + xi$, we have:
    $
        xi = phi(alpha+1,beta)+ xi
    $, and for that to be true, $xi>phi(alpha+1,beta)$.
    Applying $phi(alpha,#o)$ on both sides we get
    $
        phi(alpha,xi) &= phi(alpha,phi(alpha+1,beta)+ xi)\
        &= xi
    $
    Therefore $xi$ is a fixed point of $phi(alpha,#o)$, i.e., $xi=phi(alpha+1,gamma)$ for some ordinal $gamma$.
    And since $xi>phi(alpha+1,beta)$, minimally $xi>=phi(alpha+1, beta+1)$.

    We also notice that $phi(alpha+1,beta+1)$ is a fixed point of $f$:
    #let fp = $redf(phi(alpha+1,beta+1))$
    $
        f(fp) &= phi(alpha, phi(alpha+1,beta)+fp)\
        &= phi(alpha, fp)\
        &= fp
    $

    Since $xi$ is the _least_ fixed point of $f$, $xi<=phi(alpha+1,beta)$. Since we have just shown earlier that $xi>=phi(alpha+1,beta+1)$, we get:
    $
        xi = phi(alpha+1,beta+1)
    $

]
Note that with this definition our $epsilon_1$ sequence would be translated as:
$
    phi(1,1) &= sup{f^n(1)|n in NN}\
    &= sup { phi(0,phi(1,0)+1), phi(0,phi(1,0)+phi(0,phi(1,0)+1)),...}\
    &= sup {omega^(e0+1), omega^(e0+omega^(e0+1)), omega^(e0+omega^(e0+omega^(e0+1))), ...}\
    &= sup {omega^(e0+1), omega^omega^(e0+1), omega^(omega^omega^(e0+1)),...}
$

Now that we have defined the 2-argument Veblen function, what is the largest ordinal we can make? After $eta_0$ we have $phi(4,0), phi(10,0),$ or even $phi(10000, 0)$.
What about $phi(omega,0)$? We can think of it as the first fixed point for _all_ $phi(n,#o) = #o$ for every $n in NN$, or as the supremum of all $phi(n,0)$:

$
    phi(omega,0) = sup {phi(n,0) | n in NN}
$
It should be obvious to deduce that it is also the supremum of all $phi(n,1)$ too, i.e., the value of the second argument does not matter.
In general, for a limit ordinal $lambda$,
$
    phi(lambda, 0) = sup{phi(alpha,0)|alpha<lambda}
$




Continuing where we left off, we have $phi(omega, 0) = phi(phi(1,0),0)$, and we can keep nesting $phi(phi(phi(1,0),0),0)$, $phi(phi(phi(phi(1,0),0),0),0)$, until we reach the (first) fixed point of the Veblen function: $G0 = phi(G0, 0)$.
$G0$ is known as the *Feferman–Schütte ordinal*, which can also be expressed as:

$
    G0 = sup{phi(1,0), phi(phi(1,0),0), phi(phi(phi(1,0),0),0), ...}
$

This is the largest ordinal we can reach with the two-argument veblen function.



== Veblen Normal Form and Fundamental Sequences

Much like how all ordinals $<e0$ can be expressed in Cantor Normal Form, all ordinals $<G0$ can be expressed in:

#theorem(name: [*_Veblen Normal Form_*])[
  Every ordinal $alpha < G0$, can be uniquely written in the following form:
  $
  phi(beta_1, gamma_1) + phi(beta_2, gamma_2) + ... + phi(beta_k, gamma_k)
  $
  where $phi(beta_1, gamma_1) >= phi(beta_2, gamma_2) >= ... >= phi(beta_k, gamma_k)$ and $gamma_i < phi(beta_i, gamma_i)$ for $i in {1,...,k}$
]

#definition[
  The *Veblen Hierarchy* is a system of fundamental sequences for *limit* ordinals $alpha < G0$ when expressed in Veblen Normal Form:

  + $(phi(beta_1, gamma_1) + phi(beta_2, gamma_2) + ... + phi(beta_k, gamma_k))[n] :=   phi(beta_1, gamma_1) + phi(beta_2, gamma_2) + ... + phi(beta_k, gamma_k)[n]$
  + $phi(0, gamma+1) := omega^gamma dot n$
  + $phi(beta+1,0)[n] := phi^n (beta,0)$
  + $phi(beta+1,gamma+1)[n] := phi^n (beta, phi(beta+1, gamma) + 1)$
  + $phi(beta,gamma)[n] := phi(beta, gamma[n])$ when $gamma$ is a limit ordinal
  + $phi(beta, 0)[n] := phi(beta[n],0)$ when $beta$ is a limit ordinal
  + $phi(beta, gamma+1)[n] := phi(beta[n],phi(beta, gamma) + 1)$ when $beta$ is a limit ordinal

  In rule 3 and 4, $phi^n ()$ refers to function iteration, so $phi^n (beta, gamma) = phi(beta, phi^(n-1) (beta, gamma))$ and $phi^1(beta,gamma)=phi(beta,gamma)$
]

#example[
    - $phi(2,0)[n]$
        $
            phi(2,0)[1] &= phi^1(1,0) = phi(1,0) = e0\
            phi(2,0)[2] &= phi^2(1,0) = phi(1,phi(1,0)) = epsilon_e0\
            phi(2,0)[3] &= phi^3(1,0) = phi(1,phi(1,phi(1,0))) = epsilon_epsilon_e0\
        $

    - $phi(2,1)[n]$
        $
            phi(2,1)[1] &= phi^1(1, phi(2,0)+1) = epsilon_(z0+1)\
            phi(2,1)[2] &= phi^2(1, phi(2,0)+1) = phi(1, phi(1, phi(2,0)+1)) = epsilon_epsilon_(z0+1)\
            phi(2,1)[3] &= phi^3(1, phi(2,0)+1) = phi(1,phi(1, phi(1, phi(2,0)+1))) = epsilon_epsilon_epsilon_(z0+1)\
        $
    - $phi(omega,0)[n]$
        $
            phi(omega,0)[n] = phi(omega[n],0) = phi(n,0)
        $
    - $phi(omega,1)[n]$
        $
            phi(omega,1)[n] = phi(omega[n], phi(omega,0)+1) = phi(n, phi(omega,0)+1)
        $
]

== Multivariate Veblen function

=== 3-argument veblen function

So how do we go beyond $G0$? $G0$ is the $1^"st"$ fixed point of $phi(#o,0) = #o$. $Gamma_1$ is therefore the $2^"nd"$ fixed point, and $Gamma_2$ is the $3^"rd"$, and so on.
This "Gamma function" can be thought of as $Gamma_beta = (1+beta)^"th"$ fixed point of $phi(#o, 0) = #o$. So we can make $Gamma_omega$, $Gamma_e0$, or even $Gamma_G0$.
We have seen this pattern before -- eventually we reach the _Gamma fixed point_ of $Gamma_#o = #o$, which can be though of as an infinite nesting of Gammas: $Gamma_Gamma_Gamma_dots.down$.

We can then iterate over the fixed points of $Gamma_#o = #o$, but we can systematize this with the _3-argument veblen function_. We let $G0 = phi(1,0,0)$,
and then $Gamma_1 = phi(1,0,1)$. In general $Gamma_beta = phi(1,0,beta)$, and first Gamma fixed point $Gamma_Gamma_Gamma_dots.down = phi(1,1,0)$ can be denoted as the first fixed point of $phi(1,0,#o) = #o$.

We can create a definition of the 3-argument veblen function as such:

#definition[
    - $phi(0,beta,gamma) = phi(beta,gamma)$, converting from the 3-argument veblen to the 2-argument veblen
    - $phi(alpha,0,gamma)$ is the $(1+gamma)^"th"$ fixed point of $phi(bluef(alpha'),#o,0)=#o$ for all $bluef(alpha') < alpha$
    - $phi(alpha,beta,gamma), beta!=0$ is the $(1+gamma)^"th"$ fixed point of $phi(alpha, bluef(beta'), #o)$ for all $bluef(beta') < beta$
]

#example[
    $phi(2,0,0)$ is the $1^"st"$ fixed point of $phi(bluef(alpha'),#o,0)=#o$ for all $bluef(alpha') < alpha$ = 2, so $bluef(alpha') = {0,1}$
    - $phi(0,#o,0)=#o$
    - $phi(1,#o,0)=#o$
]

=== Extension to finitely many arguments

Now what about a 4-argument veblen function? or an $n$-argument veblen function? We can extend it to any number of arguments as such:

#definition[
    Let $S$ be an arbitrary string of ordinals, and $O$ be a string of $0$s.
    - $phi(gamma) = gamma$
    - $phi(O,S)=phi(S)$, i.e., you can remove zeroes from the left
    - $phi(S,beta,O,gamma)$ is the $(1+gamma)^"th"$ fixed point of $phi(S,alpha,#o,O)=#o$ for all $alpha<beta$
]

#example[
    + $phi(1,0,0,0)$

        We have $S = "empty", beta = 1, O = (0,0), gamma=1$:
        $
            phi(underbrace(1, beta),underbrace(0\,0,O),underbrace(0,gamma))
        $
        As such $phi(1,0,0,0)$ is the $(1+0)^"th"$ fixed point of $phi(alpha,#o,0,0)=#o$ for all $alpha<1$, i.e. $alpha=0$. Rephrasing, we have:

        $phi(1,0,0,0)$ is the $1^"st"$ fixed point of $phi(#o,0,0)=#o$.
    + $phi(1,2,3,4)$
        We have $S=(1,2), beta=3, O = "empty", gamma=4$

        As such $phi(1,2,3,4)$ is the $(1+4)^"th"$ fixed point of $phi(1,2,alpha,#o)=#o$ for all $alpha<3$. Rephrasing, we have:

        $phi(1,2,3,4)$ is the $5^"th"$ fixed point of $phi(1,2,alpha,#o)=#o$ for $alpha in {0,1,2}$.
]

With this, we can define ordinals like $phi(1,0,0,0)$, $phi(1,0,0,0,0)$, and so on. Taking this to its limit yields the *Small Veblen Ordinal*:

$
    SVO = sup{phi(1), phi(1,0), phi(1,0,0), phi(1,0,0,0), phi(1,0,0,0,0), ...}
$

We also have an "Extended Veblen Normal Form":

#theorem[
    Every ordinal $alpha < SVO$, can be uniquely written in the following form:
    $
        phi(s_1) + phi(s_2) + ... + phi(s_k)
    $
    where:
    - $phi(s_1) >= phi(s_2) >= ... >= phi(s_k)$
    - $s_i$ is an arbitrary string of ordinals $alpha_(i,1), alpha_(i,2), ..., alpha_(i,k_i)$ where $i in {1,...,k}$
    - $alpha_(i,1) > 0$ and $alpha_(i,j) < phi(s_i)$ for all $i in {1,...,k}$ and $j in {1, ..., k_i}$
]

However, I'm going to skip straight to the veblen function with _transfinitely_ many arguments, as that generalizes to finitely many arguments too.

== Transfinitary Veblen function

=== Finitely Supported functions
#let fsarrow = $scripts(arrow.bar.r)_0$ // arrow for finitely supported functions
#definition[
    A function $f:X arrow.bar.r Y$ if a *finitely supported* if there are only _finitely many_ values of $x in X$ such that $f(x) != 0$ (assuming $0 in Y$).

    We call the set of values $x in X$ such that $f(x)!=0$ the _support_ of the function.\
    ${x|x in X "and" f(x)!=0}$)

    If  $f:X arrow.bar.r Y$ is finitely supported, we write it as $f:X fsarrow Y$.
]

#example[
    $
        f(beta) = cases(
            2 "if" beta = 0,
            3 "if" beta = 1,
            0 "else"
        )
    $
    is an example of a finitely supported function from $Ord fsarrow Ord$
]

We use finitely supported functions for this as our veblen function will now _take in_ a finitely supported function $f: Ord fsarrow Ord$,
so our veblen function can be thought of as $phi: (Ord fsarrow Ord) arrow.r.bar Ord$.

#example[
    In our previous example, we defined an $f$ where $f(0)=2, f(1)=3, f("anything else") = 0$. Then
    $
        phi(f) = phi(f(1),f(0)) = phi(3,2)
    $and in general, the arguments are arranged "right to left":
    $
        phi(f) = phi(...,f(2),f(1), f(0))
    $
]

The easiest way to create a new finitely supported function from another is to "update" one of their values:

#definition[
    For a finitely supported function $f$, $f[alpha@beta]$ is defined as such:
    $
        f[alpha@beta](xi) := cases(
            f(xi) &"if" xi!=beta,
            alpha &"if" xi=beta
        )
    $

    You can think of $f[alpha@beta]$ as "$f$ with $alpha$ at $beta$".

    As shorthands:
    + If $f(xi) = 0$ for all $xi$, i.e., $f$ is the "zero function", then $f[alpha@beta]$ can be written as just $[alpha@beta]$
    + $f[alpha_1@beta_1][alpha_2@beta_2]...[alpha_n@beta_n]$ can be written as $f[alpha_1@beta_1,alpha_2@beta_2,...,alpha_n@beta_n]$
]

#proposition[
    The set of all finitely supported functions $Ord fsarrow Ord$ is well-ordered as such:

    For two finitely supported functions $f,g : Ord fsarrow Ord$, $f < g$ if for some ordinal $alpha$:
    + $f(beta) = g(beta)$ for all $beta < alpha$, and
    + $f(alpha) < g(alpha)$
]
This should be fairly easy to show, it is quite similar to how $NN^2$ is well-ordered.

#definition[
    The *degree* $deg(f)$ of a finitely supported function $f: X fsarrow Y$ is the smallest $d in X$ such that $f(d) != 0 $
    (i.e. the smallest element of $X$ that is in the support of $f$)
]
// prove that all these (veblen) functions are normal

=== Definition
#definition[
    The multivariate Veblen function is the function $phi: (Ord fsarrow Ord) arrow.r.bar Ord$ defined as follows:

    Let $f:Ord fsarrow Ord$, and let $g = f[0@0]$. If $g$ is the zero function, we set $phi(f) = omega^f(0)$.

    Otherwise, let $d = deg(g)$. We define $phi(f)$ as the $(1+f(0))^"th"$ common fixed point of the functions
    $phi(g[alpha@d, #o@d']) = #o$ for all $alpha < f(d)$ and $d' < d$.
]

#example[
    $phi(1,1,0) = phi(f)$ where $f$ is:
    $
        f(xi) = cases(
            0 "if" xi = 0,
            1 "if" xi = 1,
            1 "if" xi = 2,
            0 "else",
        )
    $
    $g = f[0@0]$ basically sets $g(0) = 0$, which doesnt change anything since $f(0)$ is already $0$. So $g$ is not the zero function.

    $d = deg(f) = 1$. So $phi(f)$ is the $(1+f(0))^"th" = 1^"st"$ common fixed point of: $phi(g[alpha@d, #o@d']) = #o$ for all $alpha < f(d) = 1$ and $d' < d = 1$.
    So we are basically stuck with $alpha = 0$ and $d' = 0$, so $phi(1,1,0)$ is the first fixed point of $phi(f[0@1, #o@0])=phi(1,0,#o)=#o$
]

#example[
    $phi([1@omega]) = phi(f)$ where $f$ is:
    $
        f(xi) = cases(
            1 "if" xi = omega,
            0 "else"
        )
    $
    $g = f[0@0] = f$ which doesn't change anything since $f(0) = 0$. $deg(f) = omega$, so from the definition, $phi(f)$ is the $1^"st"$ common fixed point of all functions
    $phi(g[alpha@d, #o@d']) = #o$ for all $alpha < f(d) = 1$ and $d'<d=omega$. Plugging this in yields $phi(g[0@omega,#o@d']) = #o$ for all $d' < omega$, or put another way
    it is the common fixed points of all $phi(1@n)$ for $n in NN$.

    This is equivalent to the _Small Veblen Ordinal_.
]

But how do we even know that these fixed points exist? We need to first show that the multivariate veblen are all normal functions.
#proposition[
    If $f : Ord fsarrow Ord$, and $deg(f) >= d$, then $g(alpha) = phi(f[alpha@d])$ is a non-negative normal function.

]

#proof[
    [WIP]
]


Now that we have extended the veblen function yet again, what is the new limit? We can construct $SVO = phi([1@omega])$, but why stop at $omega$?
We can have $phi([1@G0])$, $phi([1@SVO]) = phi([1@phi([1@omega])])$, or even $phi([1@phi([1@phi([1@omega])])])$.
I think we have seen this pattern enough times by now -- we can make a fixed point $phi([1@#o])=#o$,
and the (first) ordinal that satisfies is known as  the *Large Veblen Ordinal* $LVO$. If we let $f(alpha) = phi([1@alpha])$, it can also be written as:
$
    LVO &= sup{f^n (0) | n in NN}\
    &= sup{f(0), f(f(0)), f(f(f(0))), ...}\
    &= sup{phi([1@0]) = omega, phi([1@phi[1@0]])=SVO,phi([1@phi[1@phi([1@0])]]),...}
$

We do have to first show that $phi([1@alpha])$ is normal before we know that such a fixed point exists:
#proposition[
    The function $f(alpha) = phi([1@alpha])$ is normal.
]
#proof[
    We need to show that it is:
    1. strictly increasing

        $phi([1@y]) = phi([phi([1@y])@x]) > phi([1@x])$ (why? [WIP])
    2. continuous
        [WIP]
]

#theorem(name: [*_Tranfinitary Veblen Normal Form_*])[
    All ordinals $alpha < LVO$ can be expressed as
]
#definition[
    The fundamental sequences for the multivariate veblen function is:
    [WIP]
]
=== Schütte's Klammersymbolen

This is another way to write the veblen function with transfinitely many arguments. If we have a finitely covered function $f$ like so:

$
    f(xi) = cases(
    alpha_0 &"if" xi=0,
    alpha_1 &"if" xi=1,
    &dots.v,
    alpha_beta &"if" xi=beta,
    0 &"else"
)
$
We can "decompose" it to $[alpha_0@0, alpha_1@1, ..., alpha_beta@beta]$. In Schütte's Klammersymbolen, we write this as:
$
    mat(
        alpha_beta, ..., alpha_1, alpha_0;
        beta, ..., 1, 0;
    )
$
So for example, the Small Veblen Ordinal would be $phi mat(1;omega)$, and the Large Veblen Ordinal would be represented as the following fixed point:
$
    LVO = phi mat(1;LVO)
$

== Dimensional Veblen

Some fellas made another extension to the Veblen function. I won't cover it here but you can check it out here: https://arxiv.org/pdf/2310.12832