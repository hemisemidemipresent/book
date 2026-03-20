= Introduction

When I was learning Googology, I was never really interested in naming specific large numbers, but instead learning about _how_ people generated large numbers. I tried understanding notation like B.E.A.F. and BAN but the rules were complex and they felt too clunky and inelegant to deal with. I then (re-)discovered about the Fast-Growing Hierarchy and how it can systematically categorize the growth of sequences, and it let me on a rabbit hole to finally be able to grasp the growth rate of $"TREE"(n)$. However, when I tried digging into the formal definitions of the things I was writing, I realized that there was a lot that I wasn't sure of myself. If I want to compute something like $f_Gamma_0 (3)$, what exactly am I supposed to do? This book is therefore a compilation of my attempts to pin down the definition of Fast-Growing Hierarchy to ever larger ordinals.

If you wish to contribute new sections, edit, or have suggestions please let me (hemidemisemipresent) know.


References:
- Googology wiki(s)
- The googology discord
- An Introduction to Proof Theory: Normalization, Cut-elimination, and Consistency Proofs by Paolo Mancosu, Richard Zach, and Sergio Galvan
- Zhongshu Wu PrSS doc on gdrive

== Prerequisites

- Set theory
  - Notations $union, inter, in, subset, backslash, emptyset, times$ (cartesian product)
  - Notation ${ x | P(x)}$ where $P(x)$ is a statement about $x$
  - set vs class
- The Natural Numbers $NN$ (in this book we include $0 in NN$)
- Knowledge on functions