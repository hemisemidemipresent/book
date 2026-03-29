= Introduction

When I was learning Googology, I was never really interested in naming specific large numbers, but instead learning about _how_ people generated large numbers.
I tried understanding notation like B.E.A.F. and BAN but the rules were complex and they felt too clunky and inelegant to deal with.
I then (re-)discovered about the Fast-Growing Hierarchy and how it can systematically categorize the growth of sequences, and it let me on a rabbit hole to finally be able to grasp the growth rate of $"TREE"(n)$.
However, when I tried digging into the formal definitions of the things I was writing, I realized that there was a lot that I wasn't sure of myself.
If I want to compute something like $f_Gamma_0 (3)$, what exactly am I supposed to do?
There's #link("https://www.youtube.com/watch?v=EKLzsWAzsec")[a Geometry Dash level] where I have to click $f_(psi_0(Omega_omega))(520)$ times, what does that mean?
This book is a compilation of my attempts to understand the math involved in googology.

Generally, I introduce new concepts more informally, then go back around to formalize them, though I feel in some sections I might have frontloaded the formality too much.


Feel free to correct any mistakes or re-work some sections.
You may also suggest or contribute chapters for new topics, though I'd like it to fit within the general "skill level" of the book.
Some concepts that I am currenty nowhere confident enough to write about are:

- Inaccessible cardinals, Mahlo Cardinals, Weakly Compact Cardinals, Stability, Reflection and whatever OCF can use them
- y sequence
- Laver tables
- Proof Theoretic Ordinals (though ordinal analysis might be way too technical to be summarized in a chapter)


References:
- Googology wiki(s)
- The googology discord
- An Introduction to Proof Theory: Normalization, Cut-elimination, and Consistency Proofs by Paolo Mancosu, Richard Zach, and Sergio Galvan
- Zhongshu Wu PrSS document on google drive

== Prerequisites

- Set theory
  - Notations $union, inter, in, subset, backslash, emptyset, times$ (cartesian product)
  - Notation ${ x | P(x)}$ where $P(x)$ is a statement about $x$
  - Set vs class
- The Natural Numbers $NN$ (in this book we include $0 in NN$)
- Knowledge on functions