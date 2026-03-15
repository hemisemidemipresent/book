#import "../shorthands.typ": *

= Veblen Hierarchy

== What lies beyond $e0$?

We previously spent a lot of time on ordinals $<e0$. We finally see what lies beyond $e0$. We first start with $e0 + 1$, then $e0 + 2, e0 + omega, e0 + omega^2, e0+omega^omega,$ until we get $e0 + e0 = e0 dot 2$.
We then have the following ordinals, and their expression in Cantor Normal Form (CNF).

(Note that CNF applies to *all* ordinals, not just ordinals $<e0$. It is the _Ordinal Notations_ discussed last chapter that have this restriction.)
$
e0 dot 3 = omega^e0 + omega^e0 + omega^e0\
e0 dot omega = omega^(e0+1)\
e0^omega = omega^omega^(e0+1)\
e0^e0 = omega^omega^(e0 dot 2)\
e0^e0^omega = omega^omega^omega^(e0+1)\
e0^e0^e0 = omega^omega^omega^(e0 dot 2)\
e0^e0^e0^omega = omega^omega^omega^omega^(e0+1)
$

Note that while $omega^e0 = e0, e0^omega != e0$.

$
    omega^e0 &= union.big_(gamma < e0)(omega^gamma) = sup {omega, omega^omega, omega^omega, omega^omega^omega, ...} = e0\
    e0^omega &= union.big_(gamma < omega)(e0^gamma) > e0
$

The limit of this process is $epsilon_1$, or more formally:
$
    epsilon_1 = sup{e0+1,omega^(e0+1), omega^omega^(e0+1),...}
$, which can also be defined as
$
    epsilon_1 = sup {e0, e0^e0, e0^e0^e0, ...}
$ if you prefer.

$epsilon_1$ is the second fixed point of $omega^alpha = alpha$. Note that it is also a fixed point of $e0^alpha = alpha$.

We can repeat this process to get $epsilon_2 = sup {epsilon_1 + 1, omega^(epsilon+1), omega^omega^(epsilon_1 + 1), ...}$ and so on. $epsilon_n$ is the $(1+n)$th fixed point of $omega^alpha = alpha$.

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
        A *normal function* is a function $f: "Ord" arrow.r.bar "Ord"$ such that:
        + $f$ is *strictly increasing*: $f(alpha) < f(beta)$ whenever $alpha <beta$
        + $f$ is *continuous*: if $beta$ is a limit ordinal, then $f(beta) = sup{f(alpha) | alpha < beta}$
    ]

    If a function is normal, then it has a fixed point $f(beta) = beta$.
    In fact there are infinitely many fixed points $f(beta) = beta$ that they make a proper class.
]

#proof[
    Let $alpha$ be an arbitrary ordinal, and let $f$ be a normal function. Now let's define $beta$ as:

    $
        beta = sup{f^n (alpha) | n in NN}
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

    I.e., $f'(alpha)$ represents the $1 + alpha^"th"$ fixed point of $f$
]

#example[
    The derivative of $f(alpha) = omega^alpha$ is $f'(alpha) = epsilon_alpha$, e.g. #e0 is the $1"st"$ fixed point of $f(alpha) = omega^alpha$
]

We can generalize this to define a fixed point of multiple functions:

[WIP]

== 2-argument Veblen function

#definition[
  The 2-argument/binary Veblen function *$phi(alpha, beta)$* is defined as such:
  - $phi(0, beta) := omega^beta$
  - $phi(alpha, beta)$ for $alpha !=0$ is the $(1+beta)^"th"$ fixed point of the functions $phi(gamma, delta) = delta$ for $gamma<alpha$
]

#example[
  Show that  $e0 = phi(1,0)$, and $zeta_2 = phi(2,2)$

  $phi(1,0)$ is the $(1+0)^"th"$ fixed point of the function $phi(gamma, delta )= delta$ for $gamma < 1$ (i.e. $gamma = 0$)

  $phi(1,0)$ is the $1^"st"$ fixed point of the function $phi(0, delta) = omega^delta = delta$, and the first fixed point of $omega^delta = delta$ is $e0$.

  $phi(2,2)$ is the $(1+2)^"th"$ fixed point of the function $phi(gamma, delta) = delta$ for $gamma < 2$

  $phi(2,2)$ is the $3^"rd"$ fixed point of the functions $phi(0, delta) = omega^delta = delta$ and $phi(1, delta) = epsilon_delta = delta$, and $zeta_2$ is the third ordinal that is a fixed point for _both_ functions. ($z0, zeta_1$ are the first and second).
]

Now that we have defined the 2-argument Veblen function, what is the largest ordinal we can make? After $eta_0$ we have $phi(4,0), phi(10,0), phi(10000, 0)$.
What about $phi(omega,0)$? This is where using the *joint derivative*


then $phi(omega, 0) = phi(phi(1,0),0)$, and we can keep nesting $phi(phi(phi(1,0),0),0), phi(phi(phi(phi(1,0),0),0),0)$, until we reach the (first) fixed point of the Veblen function: $G0 = phi(G0, 0)$. $G0$ is known as the *Feferman–Schütte ordinal*, which can also be expressed in $phi(phi(...phi(1,0)...,0),0)$.

#theorem(name: [*_Veblen Normal Form_*])[
  Every ordinal $alpha < G0$, can be uniquely written in the following form:
  $
  phi(beta_1, gamma_1) + phi(beta_2, gamma_2) + ... + phi(beta_k, gamma_k)
  $
  where $phi(beta_1, gamma_1) >= phi(beta_2, gamma_2) >= ... +. phi(beta_k, gamma_k)$ and $gamma_i < phi(beta_i, gamma_i)$ for $i in {1,...,n}$
]

#definition[
  The *Veblen Hierarchy* is a system of fundamental sequences for *limit* ordinals $alpha < G0$ when expressed in Veblen Normal Form:

  WIP: inaccuracies

  + $(phi(beta_1, gamma_1) + phi(beta_2, gamma_2) + ... + phi(beta_k, gamma_k))[n] :=   phi(beta_1, gamma_1) + phi(beta_2, gamma_2) + ... + phi(beta_k, gamma_k)[n]$
  + $phi(0, gamma+1) := omega^gamma dot n$
  + $phi(beta+1,0)[n] := phi^n (beta,0)$
  + $phi(beta+1,gamma+1)[n] := phi^n (beta, phi(beta+1, gamma) + 1)$
  + $phi(beta,gamma)[n] := phi(beta, gamma[n])$ when $gamma$ is a limit ordinal
  + $phi(beta, 0)[n] := phi(beta[n],0)$ when $beta$ is a limit ordinal
  + $phi(beta, gamma+1)[n] := phi(beta[n],phi(beta, gamma) + 1)$ when $beta$ is a limit ordinal

  In rule 3 and 4, $phi^n ()$ refers to function iteration, so $phi^n (beta, gamma) = phi(beta, phi^(n-1) (beta, gamma))$
]

=== Veblen Normal Form