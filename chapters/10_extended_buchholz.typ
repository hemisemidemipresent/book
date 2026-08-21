#import "../shorthands.typ": *
= Extended Buchholz's OCF [WIP]

Why do we have to stop at $Omega_omega$? What about $Omega_(omega+1)$? We can extend Buchholz's function as such to allow for even larger ordinals:

#definition[Extended Buchholz's function][
  Using the same definition of $Omega_nu$, we define the *Extended Buchholz's function* $psi$ and the set $C_nu (alpha)$ as such:
  + $Omega_nu subset.eq C_nu (alpha)$
  + For any two ordinals $xi, eta in C_nu (alpha)$, their sum $xi+eta in C_nu (alpha)$
  + For any ordinal $xi in C_nu (alpha)$, as long as $xi < alpha$, then $ psi_mu (xi) in C_nu (alpha)$ for all #fuchsiaf($mu in C_nu (alpha)$)
  + $psi_nu (alpha) = min{gamma in Ord | gamma in.not C_nu (alpha)}$, i.e., the smallest ordinal not inside $C_nu (alpha)$
]
It has the same properties as the original, just that instead of being restricted to $psi_mu$ with $mu <= omega$, we now have $mu in C_nu (alpha)$ as highlighted in red.
This is often abbreviated in the community as *EBOCF* (#strong[E]xtended #strong[B]uchholz's #strong[O]rdinal #strong[C]ollapsing #strong[F]unction)

With this, we can go beyond, letting $"TFBO" = psi_0(Omega_(omega+1))$.
We can make $psi_0(Omega_e0)), psi_0(Omega_G0)$, or even $psi_0(Omega_Omega)$.

The limit of this notation is the *Extended Buchholz Ordinal (EBO)* $EBO$.
The infinitely nested $Omega$-subscript tower is the *Omega fixed point* where $Omega_circle.filled = circle.filled$, and is commonly denoted as $Lambda$.
Therefore the EBO can also be written as $psi_0(Lambda)$.

== Normal Form and Fundamental Sequences

The normal form of EBOCF is very similar to that of BOCF:

#theorem[
  Every ordinal $alpha < EBO = psi_0(Lambda)$ can be uniquely expressed in the form:

    $
        alpha = psi_nu_1 (alpha_1) + ... + psi_nu_n (alpha_n)
    $
    Where:
    - $alpha_1,...,alpha_n, nu_1, ..., nu_n in C_0(Lambda)$
    - $psi_nu_1 (alpha_1) >= ... >= psi_nu_n (alpha_n)$
    - $alpha_1 in C_nu_1 (alpha_1),...,alpha_n in C_nu_n (alpha_n)$
]

The fundamental sequence rules are also very similar, the only change being Rule 4, highlighted in #fuchsiaf[fuchsia].

#definition[System of fundamental sequences for $psi$][
    For ordinals $alpha<=TFBO$ (expressed in normal form), the $eta^"th"$ term of the fundamental sequence of $alpha$, $alpha[eta]$ is defined as such:
    + If $alpha = psi_k_1 (alpha_1) + ... + psi_k_n (alpha_n)$, then $cof(alpha) = cof(psi_k_n (alpha_n))$, and
        $alpha[eta] = psi_k_1 (alpha_1) + ... + (psi_k_n (alpha_n)[eta])$
    + If $alpha = psi_0(0) = 1$ then $cof(alpha) = 1$. We need a sequence of length $1$, so we set $alpha[0] = 0$
    + If $alpha = psi_(nu+1)(0) = Omega_(nu+1)$, then $cof(alpha) = Omega_(nu+1)$.
        We need a sequence of length $Omega_(nu+1)$, so we set $alpha[eta] = Omega_(nu+1) [eta] = eta$
    + #fuchsiaf[
      If $alpha = psi_nu (0)$, and $cof(nu) >= omega$ and then $cof(alpha) = cof(nu)$ and $alpha[eta] = psi_nu[eta] (0) = Omega_nu[eta]$
    ]
    + If $alpha = psi_nu (beta + 1)$ then $cof(alpha) = omega$ and $alpha[eta] = psi_nu (beta) dot eta$
    + If $alpha = psi_nu (beta)$ where $beta$ is a limit ordinal,
        #set enum(numbering: "(a)")
        + If $cof(beta) = omega$ or $cof(beta) <= Omega_nu$,
            then we have $cof(alpha) = cof(beta)$, so we need a sequence of length $cof(beta)$, so $alpha[eta] = psi_nu (beta[eta])$
        + Otherwise if $cof(beta) > Omega_nu$ and $cof(beta) != omega$
            then $cof(alpha) = omega$. This is where the definitions diverge.

            #let mu = redf($mu$)
            #let nu = pinkf($nu$)
            We define $mu$ as $cof(beta) = Omega_(mu+1)$.

            $alpha[n] = psi_nu (beta[gamma[n]])$, where $gamma[0] = 0$, and $gamma[eta+1] = psi_mu (beta[gamma[eta]])$.
            To illustrate this nesting process:
            $
                alpha[0] &= psi_nu (beta[gamma[0]]) = psi_nu (beta[0])\
                alpha[1] &= psi_nu (beta[gamma[1]]) = psi_nu (beta[ psi_mu (beta[0]) ])\
                alpha[2] &= psi_nu (beta[gamma[2]]) =psi_nu (beta[ psi_mu (beta[ psi_mu (beta[0] ]) ])\
            $
            In the case of $mu=nu$ however, we can use a shortcut: $alpha[0] = psi_nu (beta[0])$, and $alpha[eta+1] = psi_nu (beta[alpha[eta]])$

            However there are many other systems out there:

            - #link("https://googology.miraheze.org/wiki/Extended_Buchholz%27s_function#Fundamental_sequences")[Dennis Maksudov]:

                Same definition, except $gamma[0] = Omega_mu$.

            - #link("https://davidexmachina.github.io/garden-of-ordinals")[David_Exmachina]:

                $alpha[0] = 0$, and $gamma[1] = 0$, otherwise $gamma[eta+1]$ unchanged.
]
The final wrinkle is to define a fundamental sequence of $alpha = EBO = psi_0(Lambda)$:
- $alpha[0] = psi_0(Omega)$
- $alpha[1] = psi_0(Omega_Omega)$
- $alpha[2] = psi_0(Omega_Omega_Omega)$
- $...$


#example[
  Evaluate the fundamental sequences of the following:
  + $psi_0(Omega_(omega+1))$
  + $psi_0(Omega_(omega+1)^2)$
  + $psi_0(Omega_e0)$
  + $psi_0(Omega_Omega)$

  Answers:
  + $psi_0(Omega_(omega+1))[n]$

    $cof(Omega_(omega+1)) = Omega_(omega+1)$ so rule 6(b), and $cof(psi_0(Omega_(omega+1))) = omega$.

    Then $mu = omega$ and
    $
      psi_0(Omega_(omega+1))[0] &= psi_0 (Omega_(omega+1)[0]) = psi_0(0)\
      psi_0(Omega_(omega+1))[1] &= psi_0 (Omega_(omega+1) [psi_omega (Omega_(omega+1)[0]]) = psi_0(psi_omega (0))\
      psi_0(Omega_(omega+1))[2] &= psi_0 (Omega_(omega+1) [psi_omega (Omega_(omega+1)[psi_omega (Omega_(omega+1)[0])]]) = psi_0(psi_omega (psi_omega (0)))\
    $

    and the general pattern is that:
    $
      psi_0(Omega_(omega+1))[0] &= psi_0(0)\
      psi_0(Omega_(omega+1))[1] &= psi_0(Omega_omega)\
      psi_0(Omega_(omega+1))[2] &= psi_0(Omega_omega^Omega_omega)\
      psi_0(Omega_(omega+1))[3] &= psi_0(Omega_omega^Omega_omega^Omega_omega)\
      &dots.v\
      psi_0(Omega_(omega+1))[n] &= psi_0(Omega_omega^Omega_omega^Omega_omega^dots.up)\
    $

    This is the same mechanism as to how $psi_0(Omega_2)[n] = psi_0(Omega^Omega^dots.up)$ in Buchholz OCF

  + $psi_0(Omega_(omega+1)^2)$ - Firstly, $Omega_(omega+1)^2 = psi_(omega+1)(Omega_(omega+1))$. Then we have $cof(Omega_(omega+1)^2) = Omega_(omega+1)$ and

    $
      psi_(omega+1)(Omega_(omega+1))[eta] = psi_(omega+1)(Omega_(omega+1)[eta]) = psi_(omega+1)(eta) = Omega_(omega+1) dot eta
    $

    Skipping the calculations, we get:

    $
      psi_0(Omega_(omega+1)^2)[0] &= psi_0(Omega_(omega+1))\
      psi_0(Omega_(omega+1)^2)[1] &= psi_0(Omega_(omega+1) dot psi_0(Omega_(omega+1)))\
      psi_0(Omega_(omega+1)^2)[2] &= psi_0(Omega_(omega+1) dot psi_0(Omega_(omega+1) dot psi_0(Omega_(omega+1))))\
      &dots.v\
      psi_0(Omega_(omega+1)^2)[n] &= psi_0(Omega_(omega+1) dot psi_0(Omega_(omega+1) dot psi_0(Omega_(omega+1) dot psi_0(...))))\
    $

  + $psi_0(Omega_e0)$ - Note that $cof(Omega_e0) != e0$, but instead $cof(Omega_e0) = omega$, as theres a sequence of length $omega$:
    $
      (Omega_omega, Omega_(omega^omega), Omega_(omega^omega^omega), ...)
    $ that reaches $Omega_e0$.
    So this is rule 4:

    $
      psi_0(Omega_e0)[0] &= psi_0(Omega_e0[0]) = psi_0(Omega_1)\
      psi_0(Omega_e0)[1] &= psi_0(Omega_e0[1]) = psi_0(Omega_omega)\
      psi_0(Omega_e0)[2] &= psi_0(Omega_e0[2]) = psi_0(Omega_(omega^omega))\
      psi_0(Omega_e0)[3] &= psi_0(Omega_e0[3]) = psi_0(Omega_(omega^omega^omega))\
      &dots.v
    $
  + $psi_0(Omega_Omega)$ - This time $cof(Omega_Omega) = Omega > omega$.
    So by rule 4, $Omega_Omega [eta] = psi_Omega (0)[eta] = psi_Omega[eta] (0) = psi_eta (0)$
    Then by rule 6b, $mu = 0$ since $Omega = Omega_(0+1)$, then $cof(psi_0(Omega_Omega)) = omega$, and:

    $
      psi_0(Omega_Omega)[eta] = psi_0(Omega_Omega [gamma[eta]]) = psi_0(Omega_gamma[eta])
    $

    , and since $mu = nu$:
    $
      psi_0(Omega_Omega)[0] &= psi_0(Omega_gamma[0]) = psi_0(Omega_0) = omega\
      psi_0(Omega_Omega)[eta+1] &= psi_0(Omega_gamma[0]) = psi_0(Omega_bluef(psi_0(Omega_Omega)[eta]))\
    $
    So we get:
    $
      psi_0(Omega_Omega)[0] &= psi_0(Omega_0) = omega\
      psi_0(Omega_Omega)[1] &= psi_0(Omega_omega)\
      psi_0(Omega_Omega)[2] &= psi_0(Omega_(psi_0(Omega_omega)))\
      psi_0(Omega_Omega)[3] &= psi_0(Omega_(psi_0(Omega_(psi_0(Omega_omega)))))\
      &dots.v
    $


]

== Ordinal notation associated with EBOCF

Once again, very similar to normal Buchholz Ordinal Notation:

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

    // #let ternary(s,t,u) = $#s redf(in) redf(bold(C))_#t redf(\() #u redf(\))$
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

== Extended Weak Buchholz/Nothing OCF
This is identical to the definition of EBOCF, except you #keyword[can't use addition].
The interesting about this function is that despite this apparent limitation, it can still reach the Extended Buchholz Ordinal.

Like most other OCFs, this is usually denoted with $psi$, but when comparing with regular Buchholz it gets very confusing very quickly, so I'll denote it with $p$ instead:
#definition[Extended Weak Buchholz function][
  Using the same definition of $Omega_nu$, we define the #keyword[Weak] Extended Buchholz's function $p$ and the set $c_nu (alpha)$ as such:
  + $Omega_nu subset.eq c_nu (alpha)$
  + For any ordinal $xi in c_nu (alpha)$, as long as $xi < alpha$, then $ p_mu (xi) in c_nu (alpha)$ for all $mu in c_nu (alpha)$
  + $p_nu (alpha) = min{gamma in Ord | gamma in.not c_nu (alpha)}$, i.e., the smallest ordinal not inside $c_nu (alpha)$
]

We start with $p_0(0) = 1$, $p_0(1) = 2$, and in general, for $n in NN$, $p_0(n) = n+1$. However, we can't even reach $omega$, as $p_0(p_0(p_0(...))) = 1 + 1 + ...$ will always be a finite number.

Similarly to how $psi_0$ gets "stuck" at #e0, our weak $p_0$ gets "stuck" at $omega$,
and the way to get "unstuck" is to find the smallest ordinal $alpha$ that is greater than all natural numbers and satisfies $alpha in c_0(alpha)$,
which in this case is also $p_1(0) = Omega$. So $p_0(Omega) = omega$.

But before we continue, lets iron out some properties about this new function
=== Properties
#note[I cooked all of this up myself so it might be jank]

#proposition[
  + $p_nu (0) = Omega_nu$
  + $Omega_nu <= p_nu (alpha) < Omega_(nu+1)$
] <def:smooth>
#proof[
  + Follows from the definition
  + $Omega_nu subset.eq c_nu (alpha) => Omega_nu <= p_nu (alpha)$, and the cardinality of $Omega_(nu+1)$ is greater than that of $c_nu (alpha)$.
    Hence there exists a $gamma < Omega_(nu+1)$ such that $gamma in.not c_nu (alpha)$, and therefore $psi_nu (alpha) < Omega_(nu+1)$.
]
#proposition[
  If $alpha < beta$ and $alpha in c_nu (beta)$, then $p_nu (alpha) < p_nu (beta)$.
]
#proof[
  We first note that if $alpha <= beta$, we trivially have $c_nu (alpha) subset.eq c_nu (beta)$ and $p_nu (alpha) <= p_nu (beta)$.
  Since $alpha in c_nu (alpha) subset.eq c_nu (beta)$, $p_nu (alpha) in c_nu (beta)$ and $p_nu (alpha) < p_nu (beta)$.
]
#proposition[Uniqueness of ordinal representation in $p$][
  If $gamma = p_nu_1 (xi_1) = p_nu_2 (xi_2)$, then $nu_1 = nu_2$ and $xi_1 = xi_2$
]
#proof[
  Follows from @def:smooth
]
#proposition[
  If $alpha < omega^(Omega_nu+1)$ then $alpha in c_nu (alpha)$ and $p_nu (alpha) = Omega_nu + alpha$.
]
#proof[
  By induction:
  + Base case: $p_nu (0) = Omega_nu$
  + Successor case: Suppose $alpha in c_nu (alpha)$ and $p_nu (alpha) = Omega_nu + alpha$ (and obviously since $alpha < omega^(Omega_nu+1) => alpha + 1 < omega^(Omega_nu+1)$)

    If $alpha in c_nu (alpha)$, then since $alpha < alpha+1$, we have $p_nu (alpha) in c_nu (alpha+1)$.

    Nothing else new can be produced (yes we can have $p_(nu+1)(alpha) in c_nu (alpha+1)$ but there exists smaller ordinals not contained within $c_nu (alpha)$)

    $p_nu (alpha+1)$ is the smallest ordinal not in $c_nu (alpha+1)$, which is $psi_nu (alpha) + 1 = Omega_nu + alpha + 1$ from the induction hypothesis.

    Now we show that: $alpha+1 in c_nu (alpha+1)$

    Since $alpha > 0$ (otherwise refer to the base case), $alpha = p_mu (xi)$ for some $mu, xi in c_nu (alpha)$.
    Since $xi < alpha$, we have $alpha = p_mu (xi) = Omega_mu + xi$ and $xi + 1 in c_nu (xi+1)$ from the induction hypothesis,
    and $alpha + 1 = Omega_mu + xi + 1 = p_mu (xi+1) in c_nu (alpha)$.

  + Limit case: for some limit ordinal $alpha < omega^(Omega_nu+1)$, suppose $beta in c_nu (beta)$ and $p_nu (beta) = Omega_nu + beta$ for all $beta < alpha$.

    - If $alpha < Omega_nu$, $alpha in Omega_nu subset.eq c_nu (alpha)$
    - If $alpha = Omega_nu > 0$, $p_nu (0) in c_nu (alpha)$ since $0 < alpha$
    - If $Omega_nu < alpha < omega^(Omega_nu + 1)$:

      For all $beta in c_nu (beta) subset.eq c_nu (alpha)$, and as such for all $beta < alpha$ we have $p_nu (beta) = Omega_nu + beta in c_nu (alpha)$.

    Then
    $
      p_nu (alpha) &= sup{p_nu (beta) | beta < alpha "and" beta in c_nu (beta) subset.eq c_nu (alpha)}\
      &= sup{Omega_nu + beta | beta < alpha "and" beta in c_nu (beta) subset.eq c_nu (alpha)}\
      &= Omega_nu + alpha
    $

]

#conjecture[
  $p_0(Omega_xi) = psi_0(xi)$
]

=== Analysis
#table(
  columns: (auto, auto),
  inset: 0.75em,
  align: horizon,
  table.header([*Weak Buchholz*], [*Regular Buchholz*]),
  $p_0(0)$, $1 = psi_0(0)$,
  $p_0(1) = p_0(p_0(0))$, $2 = psi_0(0) + psi_0(0)$,
  $p_0(2) = p_0(p_0(p_0(0)))$, $3 = psi_0(0) + psi_0(0) + psi_0(0)$,
  $p_0(Omega) = p_0(p_1(0))$, $omega = psi_0(1)$,
  $p_0(Omega+1) = p_0(p_1(p_0(0))$, $omega + 1 = psi_0(1) + psi_0(0)$,
  $p_0(Omega 2) = p_0(p_1(p_1(0))$, $omega 2 = psi_0(1) + psi_1(0)$,
  $p_0(Omega 3) = p_0(p_1(p_1(p_1(0)))$, $omega 3 = psi_0(1) + psi_1(0) + psi_1(0)$,
  $p_0(Omega_2) = p_0(p_2(0))$, $omega^2 = psi_0(2)$,
  $p_0(Omega_omega) = p_0(p_(p_0(Omega)) (0)) = p_0(p_(p_0(p_1(0)))(0))$, $omega^omega = psi_0(omega) = psi_0(psi_0(1))$,
  $p_0(Omega_(omega + 1)) = p_0(p_(p_0(Omega + 1)) (0)) = p_0(p_(p_0(p_1(p_0(0))))(0))$, $omega^(omega+1) = psi_0(omega+1)$,
  $p_0(Omega_(omega 2)) = p_0(p_(p_0(Omega 2)) (0)) = p_0(p_(p_0(p_1(p_1(0))))(0))$, $omega^(omega 2) = psi_0(omega 2)$,
  $p_0(Omega_(omega^2)) = p_0(p_(p_0(Omega_2)) (0)) = p_0(p_(p_0(p_2(0)))(0))$, $omega^omega^2 = psi_0(omega^2)$,
  $p_0(Omega_(omega^omega)) = p_0(Omega_(p_0(Omega_(omega)))) = p_0(Omega_(p_0(Omega_(p_0(Omega)))))$, $omega^omega^omega = psi_0(omega^omega)$,
  $p_0(Omega_(omega^omega^omega)) = p_0(Omega_(p_0(Omega_(omega^omega)))) = p_0(Omega_(p_0(Omega_(p_0(Omega_(p_0(Omega)))))))$, $omega^omega^omega^omega = psi_0(omega^omega^omega)$,
  $p_0(Omega_Omega) = p_0(Omega_(p_1(0)))$, $e0 = psi_0(Omega)$,
  $p_0(Omega_(Omega+1)) = p_0(Omega_(p_1(0)))$, $e0 = psi_0(Omega)$,

)

== Address Notation

== Sudden Sequence System