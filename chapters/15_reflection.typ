#import "../shorthands.typ": *
== Reflection and Recursive Analogs

The core idea is the #keyword[(Lévy–Montague) Reflection Principle],
which is that any statement true in the whole universe of sets $V$ is already true in some set-sized piece of it.
The universe “reflects” its properties down to smaller models.

The core idea is that any statement true in the whole universe of sets is already true in some set-sized piece of it. The universe “reflects” its properties down to smaller models.

#definition[
  Let $X subset.eq Ord$ and $alpha in Ord$. For a sentence $phi$, we say *$alpha$ reflects $phi$ on $X$* if
  $
    alpha models phi => (exists beta in X inter alpha) beta models phi
  $
  #note[
    I.e., if $alpha models phi$, then there exists a smaller ordinal $beta$ within $X$ ($beta in X inter alpha$) such that $beta models phi$.
  ]
]

If $X$ is $Ord$, we simply say $alpha$ reflects $phi$.

#definition[Indescribable][
  $alpha$ in $Pi^n_m$-indescribable on $X$ if $alpha$ reflects every $Pi^n_m$ sentence on $X$.
]

#theorem[
  $alpha$ is $Pi^0_n$-indescribable $<=>$ $alpha > omega$ is regular
]

=== Mahlo
#definition[
  An ordinal $alpha$ is #keyword[Mahlo] on $X$, if for every $f : alpha -> alpha$ there exists a $beta > 0$ closed under $f$ such that $b in X inter alpha$.
]


== Recursive Analogs

#definition[
  Let $X subset.eq Ord$ and $alpha in Ord$. For a sentence $phi$, we say *$alpha$ reflects $phi$ on $X$* if
  $
    alpha models phi => (exists beta in X inter alpha) beta models phi
  $
  #note[
    I.e., if $alpha models phi$, then there exists a smaller ordinal $beta$ within $X$ ($beta in X inter alpha$) such that $beta models phi$.
  ]

  If $X$ is $Ord$, we simply say $alpha$ reflects $phi$.
]

