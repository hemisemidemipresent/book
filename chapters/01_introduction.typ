= Introduction

When I was learning Googology, I was never really interested in naming specific large numbers, but instead learning about _how_ people generated large numbers.
I tried understanding notation like B.E.A.F. and BAN but the rules were complex and they felt too clunky and inelegant to deal with.
I then (re-)discovered about the Fast-Growing Hierarchy and how it can systematically categorize the growth of sequences, and it let me on a rabbit hole to finally be able to grasp the growth rate of $"TREE"(n)$.
However, when I tried digging into the formal definitions of the things I was writing, I realized that there was a lot that I wasn't sure of myself.
If I want to compute something like $f_Gamma_0 (3)$, what exactly am I supposed to do?
There's #link("https://www.youtube.com/watch?v=EKLzsWAzsec")[a Geometry Dash level] where I have to click $f_(psi_0(Omega_omega))(520)$ times, what does that mean?
So I tried learning Googology more formally with a more solid math foundation, and started taking down notes.
Eventually, I compiled these notes into something resembling a book, though many of the later chapters were much more of a work-in-progress.
Generally, I introduce new concepts more informally, then go back around to formalize them, though I feel in some sections I might have frontloaded the formality too much.

Q: Why write out so much when you can contribute to the wiki?\
A: I don't trust myself to give accurate information, I have already went back to fix errors in earlier chapters many times when learning more.
Also because I can't go back to latex after using Typst omfg its so much easier to do everything.
That and wikis in general suffer from "Wikipedia Math" problem where it may serve as a useful reference if you already know the thing, but it's terrible for learning,
so I'm writing this more explicitly as a ladder to go from power towers to the Buchholz Ordinal.

Feel free to contribute! Like correcting any mistakes or re-working some sections.
The best way is probably a pull request on #link("https://github.com/hemisemidemipresent/book")[github], but you can just ping/dm me on discord `@hemidemisemipresent`.

References:
- Googology wiki(s)
- The googology discord (too many random scraps of messages)
- An Introduction to Proof Theory: Normalization, Cut-elimination, and Consistency Proofs by Paolo Mancosu, Richard Zach, and Sergio Galvan
- Zongshu Wu PrSS document on google drive
- Buchholz, W. (1986). #link("https://epub.ub.uni-muenchen.de/3841/1/3841.pdf")["A new system of proof-theoretic ordinal functions"]. Annals of Pure and Applied Logic. 32: 195–207. doi:10.1016/0168-0072(86)90052-7.
- #link("https://codegolf.stackexchange.com/questions/139355/golf-a-number-bigger-than-tree3/219466#219466")[Patcail's first answer on a codegolf challenge]

== Prerequisites

- Set theory
  - Notations $union, inter, in, subset, backslash, emptyset, times$ (cartesian product)
  - Notation ${ x | P(x)}$ where $P(x)$ is a statement about $x$
  - Set vs class
- The Natural Numbers $NN$ (in this book we include $0 in NN$)
- Knowledge on functions