#import "../shorthands.typ": *
= Extended Buchholz's function

Why do we have to stop at $Omega_omega$? What about $Omega_(omega+1)$? We can extend Buchholz's function as such to allow for even larger ordinals:

#definition(name: [*_Extended Buchholz's function_*])[
  Using the same definition of $Omega_nu$, we define the *Extended Buchholz's function* $psi$ and the set $C_nu (alpha)$ as such:
  + $Omega_nu subset.eq C_nu (alpha)$
  + For any two ordinals $xi, eta in C_nu (alpha)$, their sum $xi+eta in C_nu (alpha)$
  + For any ordinal $xi in C_nu (alpha)$, as long as $xi < alpha$, then $ psi_mu (xi) in C_nu (alpha)$ for all #redf($mu in C_nu (alpha)$)
  + $psi_nu (alpha) = min{gamma in Ord | gamma in.not C_nu (alpha)}$, i.e., the smallest ordinal not inside $C_nu (alpha)$
]
It's the same as the original, just that instead of being restricted to $psi_mu$ with $mu <= omega$, we now have $mu in C_nu (alpha)$ as highlighted in red.
This is often abbreviated in the community as *EBOCF* (#strong[E]xtended #strong[B]uchholz's #strong[O]rdinal #strong[C]ollapsing #strong[F]unction)

With this, we can go beyond, letting $"TFBO" = psi_0(Omega_(omega+1))$.
We can make $psi_0(Omega_e0)), psi_0(Omega_G0)$, or even $psi_0(Omega_Omega)$.

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