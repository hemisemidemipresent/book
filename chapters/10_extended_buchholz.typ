#import "../shorthands.typ": *
= Extended Buchholz's OCF

Why do we have to stop at $Omega_omega$? What about $Omega_(omega+1)$? We can extend Buchholz's function as such to allow for even larger ordinals:

#definition(name: [*_Extended Buchholz's function_*])[
  Using the same definition of $Omega_nu$, we define the *Extended Buchholz's function* $psi$ and the set $C_nu (alpha)$ as such:
  + $Omega_nu subset.eq C_nu (alpha)$
  + For any two ordinals $xi, eta in C_nu (alpha)$, their sum $xi+eta in C_nu (alpha)$
  + For any ordinal $xi in C_nu (alpha)$, as long as $xi < alpha$, then $ psi_mu (xi) in C_nu (alpha)$ for all #redf($mu in C_nu (alpha)$)
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

#definition(name: [_*System of fundamental sequences for $psi$*_])[
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
  + $psi_0(Omega_Omega)$ - This time $cof(Omega) = Omega$

  ```
  α = ψ(Ω_Ω)
  cof(α) = ω
  ===============
  α[0] = ω
  α[1] = ψ(Ω_ω)
  α[2] = ψ(Ω_ψ(Ω_ω))
  α[3] = ψ(Ω_ψ(Ω_ψ(Ω_ω)))
  α[4] = ψ(Ω_ψ(Ω_ψ(Ω_ψ(Ω_ω))))
  α[5] = ψ(Ω_ψ(Ω_ψ(Ω_ψ(Ω_ψ(Ω_ω)))))
  ...
  ```
]

== Ordinal notation associated with EBOCF

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

    #let ternary(s,t,u) = $#s redf(in) redf(bold(C))_#t redf(\() #u redf(\))$
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

== Address Notation

== Sudden Sequence System