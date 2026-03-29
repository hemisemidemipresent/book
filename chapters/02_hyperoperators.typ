#import "../shorthands.typ": *

= Hyperoperators

== Addition, Multiplication, and Exponentiation

Before we get to large numbers with powerful operations, let's first start from concepts we are more familiar with. Let's first start with the very basic *Successor Function*.

#definition[
  The *Successor Function* is the function $S(x) = $ the least natural number greater than $x$, or more commonly, $S(x) = x+1$
]

In this case, *Addition* is actually just the Successor Function applied repeatedly:

<addition>
#definition[
  *Addition* can be defined recursively as:
  1. $a + 0 = a$
  2. $a + S(b) = S(a+b)$

  Alternatively, it can also be seen as the Successor Function applied repeatedly:

  $a+b = underbrace(S(S(...S(a))), S() "applied" b "dot")
  = a + underbrace(1+1+...+1, b "number of" +1)$
]

#example[
  Evaluate $2+3$ with the recursive definition:
  $
  2+0 &=2\
  2+1 &= 2+S(0) = S(2+0=2) = 3\
  2+2 &= 2+S(1) = S(2+1=3) = 4\
  2+3 &= 2+S(2) = S(2+2=4) = 5\
  $
  Note that each line requires the previous $2+n$ to be known before the Successor Function $S(x)$ can be applied onto it
]

We next move onto *Multiplication*, which, as you have learnt in school, is repeated addition:

#definition[
  *Multiplication* can be defined recursively as:
  1. $a dot 0 = 0$
  2. $a dot (b+1) = (a dot b) + a$

  or alternatively, as just repeated addition:

  $a dot b = underbrace(a + a + ... + a, a "is here" b "times")$
]

#example[
  Evaluate $2 dot 3$

  - With the recursive definition:
  $
  2 dot 0 &= 0\
  2 dot 1 &= (2 dot 0) + 2 = 2\
  2 dot 2 &= (2 dot 1) + 2 = 4\
  2 dot 3 &= (2 dot 2) + 2 = 6\
  $
  - or just applying addition repeatedly:
  $
  2 dot 3 = underbrace(2 + 2 + 2, 2 "is here" 3 "times") = 6
  $
]

Now let's move on to *Exponentiation*, which is repeated multiplication:

#definition[
  *Exponentiation* can be defined recursively as such:
  $
  a^b := cases(
    1 &thick (b=0),
    a^(b-1) dot a &thick (b>0)
  )
  $
  or alternatively, as just repeated multiplication:
  $a^b = underbrace(a dot a dot a dot ... dot a, a "is here" b "times")$
]

Exponentiation may also be denoted using Donald Knuth's *up-arrow notation* as $a up b = a^b$

#example[
  Evaluate $2 ^ 3$

  - With the recursive definition:
  $
  2 ^ 0 &= 1\
  2 ^ 1 &= (2 ^ 0) dot 2 = 2\
  2 ^ 2 &= (2 ^ 1) dot 2 = 4\
  2 ^ 3 &= (2 ^ 2) dot 2 = 8\
  $
  - or just applying multiplication repeatedly:
  $
  2 dot 3 = underbrace(2 dot 2 dot 2, 2 "is here" 3 "times") = 8
  $
]

We can start to see a pattern here, where each new, more powerful operator is defined as repeatedly applying the previous operator. So what happens when we repeatedly do this for exponentiation?

== Tetration and Beyond

#definition[
  *Tetration* is defined as repeated exponentiation. This can be expressed recursively:
  $
  a up up 1 &= a\
  a up up b &= a ^ (a up up (b-1)) = a up (a up up (b-1))
  $
  or simply as repeated exponentiation, but computed from right to left:
  $
  a up up b = underbrace(a^a^a^dots.up, a "is here" b "times") = underbrace(a up a up ... up a, a "is here" b "times")
  $
]

#example[
  Evaluate $2 up up 3$

  - With the recursive definition:
  $
  2 up up 1 &= 2\
  2 up up 2 &= 2 up (2 up up 1) = 2^2 = 4\
  2 up up 3 &= 2 up (2 up up 2) = 2^4 = 16\
  $
  - or just applying exponentiation repeatedly:
  $
  2 up up 3 = underbrace(2 up 2 up 2, 2 "is here" 3 "times") = 2 ^ 2 ^ 2= 2^((2^2)) = 2^4 = 16
  $
]

We can similarly define *Pentation*:

#definition[
  *Pentation* is repeated Tetrations like so:
  $
  a up up up b = underbrace(a up up a up up ... up up a, a "is here" b "times")
  $
]

#example[
  $
  2 up up up 3 &= underbrace(2 up up 2 up up 2, 2 "is here" 3 "times")\
  &= 2 up up (2 up up 2)\
  &= 2 up up (2^2)\
  &= 2 up up 4\
  &= 2 up 2 up 2 up 2\
  &= 2 up 2 up (2^2)\
  &= 2 up 2 up 4\
  &= 2 up (2^4)\
  &= 2 up 16\
  &= 65536
  $
]

Now, 65536 might not look like much, but when you put in slightly larger numbers like $3 up up up 3$, you will get monstrous results:

#example[
  $
  3 up up up 3 &= 3 up up 3 up up 3\
  &= 3 up up (3^3^3)\
  &= 3 up up (~7.63 times 10^12)\
  &= underbrace(3 up 3 up ... up 3, ~7.63 times 10^12 "arrows")
  $
]

We can generalize the definition of increasingly powerful hyperoperators as such:

#definition[
  Let $a up^n b = a underbrace(up up ... up, n) b$

  $a up^(n+1) b = underbrace(a up^n a up^n ... up^n a, a "is here" b "times")$
]

With up-arrow notation, we can already make enormously big numbers like Graham's number:

#example[
  $
  g_0 = 4\
  g_(n+1) = 3 up^(g_n) 3 = 3 underbrace(up up up ... up, g_n "times") 3$

  So for example:

  $
  g_1 = 3 underbrace(up up up up, 4) 3\
  g_2 = 3 underbrace(up up up ... up, 3 up up up up 3 "times") 3$

  Graham's number is defined as $g_64$
]