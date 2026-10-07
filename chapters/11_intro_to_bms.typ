#import "../shorthands.typ": *
= [WIP] Introduction to Bashicu matrix system
// This shit is too powerful; just do an introductory chapter first

== Definition

So far we have considered both the Primitive Sequence System (PrSS) and the Pair Sequence System (PSS).
We can generalize this to any number of rows as part of the *Bashicu Matrix System*.

== ascension

// https://discord.com/channels/206932820206157824/437684636320137226/794724356064149515
// for example, (0,0)(1,1)(2,1) repeats (0,0)(1,1) but increases it by (2,0) every time, so you get (0,0)(1,1)(2,0)(3,1)(4,0)(5,1)...
// but this would be a problem with 3 rows
// (0,0,0)(1,1,1)(2,1,0)(1,1,1) would expand into (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,2,0)(2,2,0)(3,3,1)(4,3,0)...
// (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,2,0), which is a part of that sequence, would expand into (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,1,0)(4,2,1)...
// etc...
// so you have a long sequence of expansions, but eventually you get to (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,1,0)(2,2,1)
// which expands very similarly to (0,0,0)(1,1,1)(2,1,0)(1,1,1)
// it expands into (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,1,0)(2,2,0)(3,3,1)(4,2,0)(3,3,0)(4,4,1)(5,3,0)...
// which is the same thing as (0,0,0)(1,1,1)(2,1,0)(1,1,1) except the m in (n,n,1)(n,m,0) gets decreased by 1



// it wouldnt terminate

// yes
// so
// the ascension matrix makes some things not increase when expanding
// so that (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,1,0)(2,2,1) would actually expand into (0,0,0)(1,1,1)(2,1,0)(1,1,0)(2,2,1)(3,1,0)(2,2,0)(3,3,1)(4,**1**,0)(3,3,0)(4,4,1)(5,**1**,0)...

== Wrangling with upgrading

#note[
  Note that correspondences between BMS and ordinals are conjectural past $psi_0(Omega_omega)$.
]

We initially have $(0,0,0)(1,1,1)$ being $psi_0(Omega_omega)$, so we may (naively) conjecture that an $(x,1,1)$ functions the same way ass PSS,
with an $omega$ at height $x$. So $(0,0,0)(1,1,1)(1,1,1)$ corresponds to $psi_0(Omega_omega 2)$

