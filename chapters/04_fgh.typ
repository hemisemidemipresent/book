#import "../shorthands.typ": *
= The Fast-Growing Hierarchy

#definition[
  The *fast-growing hierarchy* (FGH) is defined as follows:
  + $f_0(n) := S(n) = n+1$
  + $f_(alpha + 1) := f_alpha^n (n) := underbrace(f_alpha (f_alpha (...f_alpha (n))), f_alpha "applied" n "times")$
  + $f_alpha (n) := f_(alpha[n])(n)$ if $alpha$ is a limit ordinal.

  $alpha[n]$ in this case represents the $n$th term in the fixed fundamental sequence assigned to the ordinal $alpha$.
]

#warning[The fast-growing hierarchy is *ill-defined* unless a *specific choice of a system of fundamental sequences is explicitly fixed* in the context.]

Wait, but what is a fundamental sequence? For now, we will ignore that warning as we will won't be dealing with limit ordinals.

== The Fast-Growing Hierarchy for finite ordinals

Before we start plugging in infinite ordinals into the FGH, let's try figuring out the growth rate of the first few $f_1, f_2, f_3, f_4$:

$
f_1(n) &= f^n_0(n) = underbrace(f_0(f_0(...f_0(n))), "applied" n "times") = n+underbrace(1+1+...+1, n "times") = 2n\

f_2(n) &= f^n_1(n) = underbrace(f_1(f_1(...f_1(n))), "applied" n "times") = underbrace(2 dot 2 dot ... 2, n "times") dot n = 2^n dot n > 2^n\

f_3(n) &= f^n_2(n) = underbrace(f_2(f_2(...f_2(n))), "applied" n "times") > underbrace(2 up 2 up ... up 2, n "times") up n\
&> underbrace(2 up 2 up ... up 2, n "times") = 2 up up n\

f_4(n) &= f^n_3(n) = underbrace(f_3(f_3(...f_3(n))), "applied" n "times") > underbrace(2 up up 2 up up ... up up 2, n "times") up up n\
&> underbrace(2 up up 2 up up ... up up 2, n "times") = 2 up up up n\
$

We see that for every new $f_m$, we get increasingly powerful hyperoperators:

#align(center)[
#table(
  columns: (auto, auto),
  table.header([FGH function], [corresponding growth rate]),
  align: center,
  [$f_1(n)$], [Multiplication $2n$],
  [$f_2(n)$], [Exponentiation $>2^n$],
  [$f_3(n)$], [Tetration $>2 up up n$],
  [$f_4(n)$], [Pentation $>2 up up up n$],
  [$f_m (n)$], [$(m-1)$th hyperoperator $>2 up^(m-1) n$],
)
]
== Fast-Growing Hierarchy for ordinals $<=e0$
=== Informal Treatment of the Fast-Growing Hierarchy for $omega$

With the functions $f_m (n)$ we have so far, we can easily make enormous numbers like $f_69(420)$.
But can we grow faster than that? If we _diagonlize_ across all $f_m (n)$, we get $f_n (n)$ in red:

#align(center)[
#let nums = range(0,5)
#table(
  columns: (auto, auto, auto, auto, auto, auto),
  [*$f_0$*], ..nums.map(n => $f_0 (#(n))$),
  [*$f_1$*], ..nums.map(n => $f_1 (#(n))$),
  [*$f_2$*], ..nums.map(n => $f_2 (#(n))$),
  [*$f_3$*], ..nums.map(n => $f_3 (#(n))$),
  [*$f_4$*], ..nums.map(n => $f_4 (#(n))$),
  fill: (x,y) => if x == y + 1 { red }
)
]

This $f_n (n)$ will eventually grow faster than any $f_m (n)$ like $f_1000(n)$. We can formalize this as such:

#definition[
  For 2 functions $f,g : NN arrow.r.bar NN$, we say that $f$ *dominates*, or *eventually dominates* $g$ if there exists an $n_0 in NN$ such that for all $n >= n_0$, $f(n) > g(n)$
]



We use $f_omega (n)$ to denote $f_n (n)$. From this, we can continue counting up:

$
f_(omega+1)(n) = f_omega^n (n)\
f_(omega+2)(n) = f_(omega+1)^n (n)\
f_(omega 2)(n) = f_(omega+n)(n)\
f_(omega 2+1)(n) = f_(omega 2)^n (n)\
f_(omega^2)(n) = f_(omega omega)(n) = f_(omega n)(n)$


=== Formal Treatment of the Fast-Growing Hierarchy for ordinals $<=e0$

In the warning earlier, it specified that we need to specify a system of fundamental sequences for ordinals in order for FGH to be properly defined. Here, we will formally define fundamental sequences for ordinals $<=e0$.

Before we define that, let's first have a standard way to express ordinals $<=e0$:

#theorem(name: [*_Cantor Normal Form_*])[
  For every ordinal $alpha$ there is a unique sequence of ordinals $alpha_0 >= alpha_1 >= ... >= alpha_n$ such that
  $
  alpha = omega^(alpha_0) + omega^(alpha_1) + ... + omega^(alpha_n)
  $
]

The basic rules of CNF is that you can only use addition and the "$omega$ power" function $omega^circle.filled (alpha) = omega^alpha$.

Note that what exactly the $alpha_n$ in $omega^(alpha_n)$ is written as is not enforced, so $omega^(1+omega)$ is technically a valid way to write $omega^omega$ in CNF. Another way to illustrate it is that everything in #redf[*red*] is enforced, while those in *black* are not:


$
omega^omega + omega^2 dot 2 + omega dot 3
&= redf(omega^blackf(omega)+omega^blackf(2)+omega^blackf(2)+omega^blackf(1)+omega^blackf(1)+omega^blackf(1))\
&= redf(omega^blackf(1+omega)+omega^blackf(1+1)+omega^blackf(omega^0 + omega^0) + omega^blackf(omega^0) + omega^blackf(S(0)) + omega^blackf("the smallest ordinal greater than 0"))
$


Now that we have a standardized way to uniquely write each ordinal, we can finally go into specifying fundamental sequences. The usual way to define these fundamental sequences based on Cantor Normal Form is the *Wainer Hierarchy*.

#definition[
  The *Wainer Hierarchy* is a system of fundamental sequences for ordinals $<=e0$ (expressed in Cantor Normal Form):

  + $0[n] := 0$
  + $(omega^(alpha_0) + omega^(alpha_1) + ... + omega^(alpha_n))[n] := omega^(alpha_0) + omega^(alpha_1) + ... + omega^(alpha_n)[n]$ (i.e. take the fundamental sequence of the last term, which is the term with the smallest $alpha$)
  + $omega^0[n] = 1[n] := 0$
  + $omega^(alpha+1)[n] = omega^alpha dot n$
  + $omega^alpha [n] = omega^alpha[n]$ if $alpha$ is a limit ordinal
  + $e0[0]:=0$, and $e0[n+1]=omega^e0[n]$
]

#example[
  If we want to find out what $f_(omega^omega^2 + omega^omega)(3)$ is, we first evaluate $(omega^omega^2 + omega^omega)[3]$
  $
  (omega^omega^2 + omega^omega)[3] &= omega^omega^2 + omega^omega [3]\
  &= omega^omega^2 + omega^omega[3]\
  &= omega^omega^2 + omega^3
  $

  So $f_(omega^omega^2 + omega^omega)(3) = f_(omega^omega^2 + omega^3)(3)$, so we still need to evaluate $(omega^omega^2 + omega^3)[3]$:

  $
      (omega^omega^2 + omega^3)[3] &= omega^omega^2 + omega^2 dot omega[3]\
      &= omega^omega^2 + omega^2 dot 3\
      omega^omega^2 + (omega^2 dot 3) [3] &= omega^omega^2 + omega^2 dot 2 + omega^2 [3]\
      &= omega^omega^2 + omega^2 dot 2 + omega dot omega [3]\
      &= omega^omega^2 + omega^2 dot 2 + omega dot 3\
      omega^omega^2 + omega^2 dot 2 + (omega dot 3)[3] &= omega^omega^2 + omega^2 dot 2 + omega dot 2 + omega[3]\
      &= omega^omega^2 + omega^2 dot 2 + omega dot 2 + 3
  $

  So $f_(omega^omega^2 + omega^omega)(3) = f_(omega^omega^2 + omega^2 dot 2 + omega dot 2 + 3)(3)$. Then
  #let ordinal = $omega^omega^2 + omega^2 dot 2 + omega dot 2$
  $
      &f_(ordinal + 3)(3) = f_(ordinal redf(+ 2))^redf(3)(3)\
      =& f_(ordinal + 2)(f_(ordinal + 2)(f_(ordinal + 2)(3)))\
      =& f_(ordinal + 2)(f_(ordinal + 2)(f_(ordinal redf(+ 1))^redf(3)(3)))\
      =& f_(ordinal + 2)(f_(ordinal redf(+1))^( bluef(f_(ordinal + 1)^3(3)) )( bluef(f_(ordinal + 1)^3(3)) ))\
  $
  And we will stop there. It's quite clear that this grows wayyy out of control that even expressing it in terms of $f_ordinal$ is basically impossible
]

== Other growing hierarchies

Aside from the fast-growing hierarchy, we have other slower hierarchies, though at sufficiently large ordinals they "catch up" with the fast-growing hierarchy.

#definition[
  *Slow-growing hierarchy* (SGH):
  + $g_0(n):=0$
  + $g_(alpha+1)(n):=g_alpha (n) +1$
  + $g_alpha (n) = g_alpha[n]$ when $alpha$ is a limit ordinal
]

#definition[
  *Middle-growing hierarchy* (MGH):
  + $m_0(n):=n+1$
  + $m_(alpha+1)(n):= m_alpha^2(n) = m_alpha (m_alpha (n))$
  + $m_alpha (n) := m_alpha[n]$ when $alpha$ is a limit ordinal
]

#definition[
  *Hardy hierarchy* (HH):
  + $H_0(n):=n$
  + $H_(alpha+1)(n):= H_alpha (n+1)$
  + $H_alpha (n) := H_alpha[n]$ when $alpha$ is a limit ordinal
]