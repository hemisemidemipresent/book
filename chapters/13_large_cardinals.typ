#import "../shorthands.typ": *
= Introduction to Large Cardinals (Inaccessibles, Mahlos, and Weakly Compact)
#note[we are referring to weakly- everything here]

== Inaccessibles

#definition[Inaccessibles][
  A cardinal/ordinal is #keyword[inaccessible] when it is regular and a limit of regulars.
]

We denote the least inaccessible as $I$. Let's briefy look through why none of the ordinals we previous made are inaccessible:

- $omega$ and $Omega$ is regular but not a limit of regulars
- $Omega_omega$ is a limit of regulars ($Omega_1, Omega_2, ...$) but not regular as $cof(Omega_omega) = omega$
- $Omega_Omega$ is similarly not regular as $cof(Omega_Omega) = Omega$
- $Lambda = Omega_Omega_Omega_dots.down$ is also not regular as $cof(Lambda) = omega$.