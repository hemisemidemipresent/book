#import "../shorthands.typ": *
= Buchholz's Ordinal Collapsing Function

Buchholz's *Ordinal Collapsing Function* (BOCF) is a way for us to create even larger (countable) ordinals.
Ironically, to make these larger ordinals, we will be using even larger _uncountable_ ordinals to get there (remember $omega_1$?).

#definition[
  Let $Omega_nu$ be defined as such:
  $
      Omega_nu := cases(
          1 &"if" nu=0,
          omega_nu &"if" nu>0
      )
  $

  Buchholz's ordinal collapsing function $psi$ and the set $C_nu (alpha)$ is defined as such:
  + $Omega_nu subset.eq C_nu (alpha)$
  + For any two ordinals $xi, eta in C_nu (alpha)$, their sum $xi+eta in C_nu (alpha)$
  + For any ordinal $xi in C_nu (alpha)$, as long as $xi < alpha$, then $ psi_mu (xi) in C_nu (alpha)$ for all $mu <= omega$
  + $psi_nu (alpha) = min{gamma in Ord | gamma in.not C_nu (alpha)}$, i.e., the smallest ordinal not inside $C_nu (alpha)$
]
This is a lot to unpack, so let's first start with $nu = 0$:

#example[
    Let's first find what $psi_0 (0)$ is.

    In order to figure out what $psi_0 (0)$, we first need to know what's inside $C_0(0)$. Going down the list, we have:
    + $Omega_0 = 1 = {0} subset.eq C_0(0)$

        so currently $C_0(0) = {0}$
    + For any two ordinals in $C_0(0)$, their sum is also in $C_0(0)$

        Another way to interpret this statement is to say that you can take a collection of ordinals in $C_0(0)$ and apply addition a finite number of times on them.
        In this case, all we have is $0$, so nothing new gets added here.
    + For any ordinal $xi in C_0 (0)$, as long as $xi < 0$, then $ psi_mu (xi) in C_0 (0)$ for all $mu <= omega$

        In this case, there are no ordinals $xi < 0$ so, nothing new get added here either.

    + $psi_0(0)$ is the smallest ordinal _not_ contained inside $C_0(0) = {0}$, which is just 1.
]

In fact, we can generalize this and show that:
#lemma[$psi_nu (0) = Omega_nu$]
#proof[
    From the definition, $Omega_nu subset.eq C_nu (0)$, i.e. for all $alpha in Omega_nu, alpha in C_nu (0)$.

    For all $alpha,beta in Omega_nu, alpha+beta in Omega_nu$, so adding doesn't generate us anything new.

    Since there are no ordinals $xi < 0$, we can't use $psi$ to generate us anything new.

    So $C_nu (0) = {gamma in Ord | gamma < Omega_nu}$. Then $psi_nu (0)$ is the smallest ordinal not in $C_nu (0)$ which is $Omega_nu$.
]

#example[
    Let's proceed to find the value of $psi_0(1)$:

    + $Omega_0 subset.eq C_0(0)$, so we once again have $0 in C_0(0)$.
    + Adding doesn't do anything
    The difference this time is that we can use $psi_0(0)$:
    3. For any ordinal $xi in C_0(0)$, as long as $xi < 1$, then $psi_mu(xi) in C_0(0)$ for all $mu<=omega$

        The only valid values of $xi$ is just $0$, so we have $psi_0(0), psi_1(0), ..., psi_omega(0) in C_0(0)$.
        $psi_0(0) = 1 in C_0(0)$, so we finally have something new.
        We haven't gotten to $psi_1(0), psi_2(0), ..., psi_omega(0)$ yet, and we'll ignore them for now.
    2. We can now use addition to show that $1 + 1 = 2 in C_0(0), 2 + 1 = 3 in C_0(0)$, and so on to show that all natural numbers $NN subset.eq C_0(0)$.
        In fact, $NN = C_0(0)$.
    4. $psi_0(1)$ is the smallest ordinal not in $C_0(0)$, which is $omega$
]

== Properties

Before we continue further, let's look at some properties about this function.
Let's first introduce the concept of an *additively principal* ordinal:

#definition[
    An *additively principal* ordinal $alpha$ is any non-zero ordinal such that for any $beta, gamma < alpha$, $beta + gamma < alpha$.

    We denote the _class_ of all additively principal numbers as $P$. $P$ is precisely all ordinals of the form $omega^xi$, where $xi$ is some ordinal.

    Formally, we can define $P$ as such:
    $
        P &:= {alpha in Ord | 0<alpha "and for all" beta, gamma < alpha, beta + gamma < alpha }\
        &= {omega^xi | xi in Ord}
    $
]

We can also define a function $P(alpha)$ that "decomposes" an ordinal $alpha$ into its additively principal "components":

#definition[
    We define $P(alpha)$ as:
    + $P(0) := emptyset$
    + For $alpha>0$, there are uniquely determined $alpha_0, alpha_1, ..., alpha_n in P$ with $alpha = alpha_0 + alpha_1 + ... + alpha_n$.

        We set $P(alpha) := {alpha_0, alpha_1, ... , alpha_n}$
]

This notion is useful as the Buchholz function $psi$, as each $C_nu (alpha)$ represents all ordinals that can be derived from addition and the $psi$ function itself:
#lemma[
    + If $zeta,eta in C_nu (alpha)$, then $zeta+eta in C_nu (alpha)$
    + An ordinal $gamma in C_nu (alpha)$ if and only if $P(gamma) subset.eq C_nu (alpha)$
    + If $zeta+eta in C_nu (alpha)$, then $eta in C_nu (alpha)$
]
#proof[
    + In the definition
    + Since $gamma = gamma_0 + gamma_1 + ... + gamma_n$ where $gamma_i in P(gamma)$, and $P(gamma) subset.eq C_nu (alpha)$,
        then $gamma_i in C_nu (alpha)$ for all $i<=n$, and as such, we can "reconstruct" $gamma$ from elements of $C_nu (alpha)$:
        $
            gamma = gamma_0 + ... + gamma_n in C_nu (gamma)
        $
    + Since $xi + eta in C_nu (alpha)$, we have $P(eta) subset.eq P(eta + xi) subset.eq C_nu (alpha)$, and thus, $eta in C_nu (alpha)$
]
We can additionally show that the $psi$ function only outputs additively principal ordinals:
#lemma[
    $psi_nu (alpha) in P$ for all ordinals $nu, alpha$.
]
#proof[
    Suppose $psi_nu (alpha) in.not P$. Then $P(psi_nu (alpha)) subset.eq psi_nu (alpha)$, which is to say, for every element $p in P(psi_nu (alpha))$,
    $p < psi_nu (alpha)$, which also means $p in C_nu (alpha)$, thus $P(psi_nu (alpha)) subset.eq C_nu (alpha)$.
    However, this implies $psi_nu (alpha) in C_nu (alpha)$, a contradiction.
]

== Bigger ordinals

Now let's look at $psi_0(2)$. Since $C_0(1) subset.eq C_0(2)$, we will mainly focus on what _additional_ elements are contained with $C_0(2)$.
For starters, since $1<2$, we can access $psi_0(1) = omega, psi_1(1), ...$.
Since we can also use addition, ordinals like $omega+1$, $omega+omega$, or even $omega dot 1000$ are within $C_0(2)$.
However, as we cannot add $omega$ to itself transfinitely many times, the least ordinal not contained within $C_0(2)$ is $psi_0(2) = omega^2$.

So far, as we have increased $alpha$, $psi_0(alpha)$ has increased. In fact, this is true for any $psi_nu$:
#lemma[
    + If $alpha <= beta$, then $C_nu (alpha) subset.eq C_nu (beta)$ and $psi_nu (alpha) <= psi_nu (beta)$
    + If $alpha < beta$ and $alpha in C_nu (alpha)$, then $psi_nu (alpha) < psi_nu (beta)$
]
#proof[
    + Trivial
    + From the previous statement, we can conclude that $C_nu (alpha) subset.eq C_nu (beta)$ and $psi_nu (alpha) <= psi_nu (beta)$.
        Since $C_nu (alpha) subset.eq C_nu (beta)$ and $alpha in C_nu (alpha)$, $alpha in C_nu (beta)$, and since $alpha < beta$, $psi_nu (alpha) in C_nu (beta)$
]

#lemma[
    If $gamma = psi_nu_1 (alpha_1) = psi_nu_2 (alpha_2)$, then $nu_1 = nu_2$ and $alpha_1 = alpha_2$, i.e., all outputs of $psi$ are uniquely represented.
    // + If $gamma in C_nu (alpha)$, $Omega_nu <= gamma$, and $gamma in P$, then $gamma$ can be expressed as $gamma = psi_u (xi)$ for some $xi in alpha inter C_nu (alpha) inter C_u (xi)$
]
#proof[
    Left as an exercise to the reader
]

Continuing from where we left off, we can repeat this for $C_0(3)$ to get $psi_0(3) = omega^3$, $psi_0(4) = omega^4$ and so on.
It seems like $psi_0(alpha) = omega^alpha$, and we can prove that fact:
We first prove a property about how $psi_nu (alpha+1)$ relates to $psi_nu (alpha)$:

#lemma[
    + $psi_nu (alpha+1) = min{gamma in P | psi_nu (alpha) < gamma}$ if $alpha in C_nu (alpha)$
    + $psi_nu (alpha+1) = psi_nu (alpha)$ if $alpha in.not C_nu (alpha)$
    + If $alpha$ is a limit ordinal, $psi_nu (alpha) = sup{psi_nu (xi) | xi<alpha "and" xi in C_nu (xi)}$
]
#proof[
    + Since $alpha in C_nu (alpha)$, and $alpha in C_nu (alpha)$, $psi_nu (alpha) < psi_nu (alpha+1)$.
        // And since $$ $psi_nu (alpha) in P$
        Suppose for contradiction there exists an ordinal $gamma$ such that $psi_nu (alpha) <= gamma < psi_nu (alpha+1)$, and $gamma in P$.
]
#lemma[
    + For all ordinals $alpha < e0$, $alpha in C_0(alpha)$ and $psi_0(alpha) = omega^alpha$
    + For all ordinals $alpha < epsilon_(Omega_nu + 1)$ where $nu!=0$, $alpha in C_nu (alpha)$ and $psi_nu (alpha) = omega^(Omega_nu + alpha)$
]

#proof[
    Suppose $alpha in C_0(alpha)$ and $psi_0(alpha) = omega^alpha$. Then $alpha+1 in C_0(alpha+1)$ and $psi_0(alpha+1)$
]

Going through all those steps

// We previously saw that for ordinals $alpha < e0$, $alpha in C_0(alpha)$ and $psi_0(alpha) = omega^alpha$, so we have:



$
    psi_0(1) &= omega\
    psi_0(2) &= omega^2\
    psi_0(omega) &= omega^omega\
    psi_0(omega+1) &= omega^(omega+1)\
    psi_0(omega^omega) &= omega^omega^omega\
$

Then what about $psi_0(e0)$?

$
    psi_0(e0) &= sup{psi_0(xi) | xi < e0 "and" xi in C_0(xi)}\
    &={omega^xi | xi < e0}\
    &= e0
$

Therefore we have $psi_0(e0) = e0$, and $e0 in.not C_0(e0)$. As such, we can't use $e0$ in $C_0(e0+1)$ (i.e., $psi_0(e0)=e0 in.not C_0(e0+1)$),
and $C_0(e0+1) = C_0(e0+1)$. So $psi_0(e0+1) = psi(e0)=e0$
In fact, none of the ordinals we have mentioned will cut it, $psi_0(G0) = psi_0(SVO) = psi_0(LVO) = e0$. This is where $psi_1()$ comes in.

We (now) know that $psi_1(0) = Omega_1$. If you recall from the start, our $C_0(1)$ contains not only $psi_0(0) = 1$, but also $psi_1(0) = Omega_1, psi_2(0) = Omega_2, ...$.
From now on, we will use $Omega$ as a shorthand for $Omega_1$. $e0 in.not C_0(Omega)$, so $psi_0(Omega) = e0$. But since $Omega in C_0(Omega) subset.eq C_0(Omega+1)$,
we *can* use $psi_0(Omega)$ in $C_0(Omega+1)$, i.e., $e0 in C_0(Omega+1)$, so we have:
$
    psi_0(Omega) &= e0\
    psi_0(Omega + 1) &= e0 dot omega = omega^(e0+1)\
    psi_0(Omega + 2) &= e0 dot omega^2 = omega^(e0+2)\
    psi_0(Omega + omega) &= e0 dot omega^omega = omega^(e0+omega)\
    psi_0(Omega + e0) &= e0 dot omega^e0 = e0^2 = omega^(e0 + e0)
$

We can actually prove that $psi_0(Omega + alpha) = omega^(e0+alpha)$:

#proof[
    We use transfinite induction:

    + Base case: $psi_0(Omega + 0) = omega^(e0+0) = e0$ and $0 in C_0(Omega+0)$
    + Successor ordinal case: If $psi_0(Omega + alpha) = omega^(e0+alpha)$ and $alpha in C_0(Omega+alpha)$, then

        $
            psi_0(Omega+alpha+1) &= min{gamma in P | psi_0(alpha) < gamma}\
            &= min {omega^xi | omega^(e0+alpha) < omega^xi}\
            &= omega^(e0 + alpha + 1)
        $
        Since $alpha, 1 in C_0(alpha) subset.eq C_0(alpha+1)$, $alpha+1 in C_0(alpha+1)$
    + Limit ordinal case: If for a limit ordinal $lambda$, for all ordinals $alpha < lambda$, $psi_0(Omega + alpha) = omega^(e0+alpha)$ and $alpha in C_0(Omega+alpha)$,

        $
            psi_0(Omega + lambda) &= sup{psi_0 (Omega+alpha) | alpha < lambda "and" alpha in C_0(alpha)}\
            &= sup{omega^(e0+alpha) | alpha < lambda}\
            &= omega^(e0+lambda)
        $

        However, we need to show that $Omega + lambda in C_0(Omega+lambda)$ in order to _continue_ the induction to higher ordinals.
        If $Omega + lambda in C_0(Omega+lambda)$, then $lambda in C_0(Omega+lambda)$ and therefore we must have $lambda < psi_0(Omega + lambda)$.

        Since $psi_0(Omega + lambda) = omega^(e0+lambda)$, $lambda < omega^(e0+lambda)$.
        The first ordinal that violates this property is the _second_ fixed point of $omega^#o = #o$, i.e., $epsilon_1$.
        Though note that for $epsilon_1$, $psi_0(Omega + epsilon_1) = omega^(e0+epsilon_1) = epsilon_1$ still holds, just that $epsilon_1 in.not C_0(Omega + epsilon_1)$

    So therefore, for all $alpha <= epsilon_1, psi_0(Omega + alpha) = omega^(e0+alpha)$
]

We see that our function gets "stuck" once again on $psi_0(Omega+epsilon_1)$.
It only becomes "unstuck" once again when we have an ordinal $alpha > Omega+epsilon_1$ such that $alpha in C_0(alpha)$.
The next such ordinal is $Omega + Omega$, or $Omega dot 2$, and we have $psi_0(Omega dot 2) = epsilon_1$.

We can similarly have
$
    psi_0(Omega dot 3) &= epsilon_2\
    psi_0(Omega dot omega) &= epsilon_omega\
    psi_0(Omega dot e0) &= epsilon_e0\
    psi_0(Omega dot Omega) &= z0
$, replacing each "stuck" term with $Omega$, and in general, we can relate Buchholz's function to the Veblen function as such:
#proposition[$
    psi_0(Omega^alpha dot (1+beta)) = phi(alpha,beta)
$]
You can verify that these expressions satisfies $alpha in C_0(alpha)$ by expressing them in terms of $psi_1$:
$
    psi_1(0) &= Omega\
    psi_1(alpha) &= omega^(Omega + alpha) = Omega dot omega^alpha\
    psi_1(psi_1(0)) &= psi_1(Omega) = omega^(Omega+Omega) = Omega^2\
    psi_1(psi_1(alpha)) &= psi_1(Omega dot omega^alpha) \
    psi_1(Omega dot alpha) &= omega^(Omega+Omega dot alpha) = omega^(Omega dot alpha) = Omega^(alpha)\
    psi_1(Omega^2) &= Omega^Omega
$
So for example:
$
    z0 &= psi_0(Omega^2)\
    &= psi_0(psi_1(Omega))\
    &= psi_0(psi_1(psi_1(0)))\
$
The limit of the 2-argument veblen function is $G0$, which can be written as:
$
    G0 &= psi_0(Omega^Omega)\
    &= psi_0(psi_1(Omega^2))\
    &= psi_0(psi_1(psi_1(Omega)))\
    &= psi_0(psi_1(psi_1(psi_1(0))))\
$
We can generalize this to the extended veblen function as such:
#proposition[$
    psi_0(Omega^((Omega^n alpha_n + ... + Omega alpha_1 + alpha_0)) (1+beta)) = phi(alpha_n, ..., alpha_1, alpha_0 ,beta)
$]

Continuing, we have
$
    SVO = psi_0(Omega^Omega^omega), LVO = psi_0(Omega^Omega^Omega)
$

Now that we have "caught up" with the veblen function, we can go even further, with $psi_0(Omega^Omega^Omega^Omega)$.
Eventually we reach $psi_0(Omega^Omega^dots.up) = BHO$, the *Bachmann-Howard Ordinal (BHO)*.
(The expression $epsilon_(Omega+1)$ really just means the supremum of ${Omega, Omega^Omega, Omega^Omega^Omega, ...}$).
This is the limit of the dimensional veblen, and also the proof-theoretic ordinal of several mathematical theories.

Just like how we previously got "stuck" at $psi_0(e0) = e0$, we run into the issue where $psi_1(epsilon_(Omega+1)) = epsilon_(Omega+1)$:

$
    psi_1(epsilon_(Omega+1)) &= omega^(Omega + epsilon_(Omega+1))\
    &= sup {omega^(Omega+Omega), omega^(Omega+Omega^Omega), omega^(Omega+Omega^Omega^Omega), ...}\
    &= sup {Omega^2, Omega^Omega, Omega^Omega^Omega, ...}\
    &= epsilon_(Omega+1)
$

Since $epsilon_(Omega+1) in.not C_1(epsilon_(Omega+1))$ and $C_0(epsilon_(Omega+1)) subset C_1(epsilon_(Omega+1))$, $epsilon_(Omega+1) in.not C_0(epsilon_(Omega+1))$.
To go further than this, we will need to invoke higher $Omega$s, like $Omega_2$, $Omega_3$, and so on.
The next ordinal larger than $epsilon_(Omega+1)$ that we can access is $psi_2(0) = Omega_2$, so we have $psi_1(Omega_2) = epsilon_(Omega+1)$,
and can re-express the Bachmann-Howard Ordinal as $psi_0(Omega_2)$ instead.

We then have:
$
    psi_0(Omega_2 + 1) &= "BHO" dot omega\
    psi_0(Omega_2 + omega) &= "BHO" dot omega^omega\
    psi_0(Omega_2 + "BHO") &= "BHO" dot omega^"BHO" = "BHO"^2\
    psi_0(Omega_2 + "BHO"^2) &= "BHO" dot omega^"BHO"^2 = "BHO"^"BHO"\
    psi_0(Omega_2 + "BHO"^"BHO") &= "BHO" dot omega^"BHO"^"BHO" = "BHO"^"BHO"^"BHO"\
    psi_0(Omega_2 + epsilon_("BHO"+1)) &= epsilon_("BHO"+1)
$

Just like how $psi_0(Omega + epsilon_1) = epsilon_1$, we have $psi_0(Omega_2 + epsilon_("BHO"+1)) = epsilon_("BHO"+1)$, so we replace it with an $Omega$ and get $psi_0(Omega_2 + Omega) = epsilon_("BHO"+1)$.
With this we can find the next "fixed point":
$
    psi_0(Omega_2 + Omega) &= epsilon_("BHO"+1)\
    psi_0(Omega_2 + Omega + epsilon_("BHO"+1)) &= epsilon_("BHO"+1)^2\
    psi_0(Omega_2 + Omega + epsilon_("BHO"+1)^2) &= epsilon_("BHO"+1)^epsilon_("BHO"+1)\
    psi_0(Omega_2 + Omega + epsilon_("BHO"+1)^epsilon_("BHO"+1)) &= epsilon_("BHO"+1)^epsilon_("BHO"+1)^epsilon_("BHO"+1)\
    psi_0(Omega_2 + Omega + epsilon_("BHO"+2)) &= epsilon_("BHO"+2)\
    psi_0(Omega_2 + Omega + Omega) &= epsilon_("BHO"+2)\

$
This is starting to look like the veblen correspondence all over again, where
$
    psi_0(Omega_2 + Omega^alpha dot beta) = phi(alpha, "BHO"+beta)
$

Now let's look at $psi_1$:
$
    psi_1(Omega_2) &= epsilon_(Omega+1)\
    psi_1(Omega_2 + 1) &= epsilon_(Omega+1) dot omega\
    psi_1(Omega_2 + epsilon_(Omega+1)) &= epsilon_(Omega+1) dot omega^(epsilon_(Omega+1)) = epsilon_(Omega+1)^2\
    psi_1(Omega_2 + epsilon_(Omega+1)^2) &= epsilon_(Omega+1)^epsilon_(Omega+1)\
    psi_1(Omega_2 + epsilon_(Omega+1)^epsilon_(Omega+1)) &= epsilon_(Omega+1)^epsilon_(Omega+1)^epsilon_(Omega+1)\
    psi_1(Omega_2 + epsilon_(Omega+2)) &= epsilon_(Omega+2)\
$

So we have to yet again find the next ordinal $alpha > epsilon_(Omega+2))$ such that $alpha in C_1(alpha)$ $psi_1(Omega_2 dot 2) &= epsilon_(Omega+2)$. We again have a similar correspondence going on:
$
    psi_1(Omega_2^alpha dot beta) = phi(alpha, Omega+beta)
$
But we don't need the veblen function anymore. The limit of what we can do with $Omega_2$ is:
$
    psi_1(Omega_2^Omega_2^Omega_2^dots.up) = psi_1(epsilon_(Omega_2+1))
$
This is analogous the BHO earlier, where $psi_2(epsilon_(Omega_2+1)) = epsilon_(Omega_2 + 1)$

// If the BHO is $psi_0(epsilon_(Omega+1))$ and $psi_1(Omega_2) = epsilon_(Omega+1)$ then is the BHO $psi_0(psi_1(Omega_2))$ or $psi_0(Omega_2)$.

This gives us a whole new family of ordinals like $psi_0(Omega_3), psi_0(Omega_4), ...$ up to $BO$, which is known as *Buchholz's Ordinal (BO)*.
This is the limit of all $psi_0(Omega_n)$ for finite $n$, and while we haven't gotten to the ordinal notation associated with Buchholz's $psi$ yet,
ordinal notations $<BO$ correspond with many systems.
// It is also used in reverse mathematics.

Of course, the true limit of Buchhol'z OCF is $psi_0(Omega_omega^Omega_omega^Omega_omega^dots.up) = TFBO$, the *Takeuti–Feferman–Buchholz ordinal (TFBO)*

// #text("asdfghjkajsdfhgadshfjsadkfjhadsfasjdkfadsjfh",fill: gradient.linear(..color.map.turbo))


== Extended Buchholz
Why do we have to stop at $Omega_omega$? What about $Omega_(omega+1)$?
#definition[
  The *cofinality* of an ordinal $alpha$, denoted $cof alpha$, is the *least cardinal number* $kappa$ such that there exists a subset $S subset.eq alpha$ of cardinality $kappa$ where $alpha$ is smallest ordinal strictly greater than every element in $S$.
]

#example[
  Find the cofinality of
  + $omega 2$
  + $omega 2 + 3$

  Answers:
  + Let $S = {omega + n | n in NN} subset omega 2$. $S$ has a cardinality of $omega$.

    However, we still need to rule out the possibility that there might be a subset $S$ of finite cardinality (i.e. cardinality $<omega$) that still satisfies the criteria that $omega 2$ is the smallest ordinal greater than every element in $S$

    In a subset $S$ which has a nonzero finite cardinality, there is a largest element $beta$, and its successor $beta + 1$ is the smallest ordinal greater than all elements of the subset $S$ while being less than $omega 2$. Therefore $S$ can't have nonzero finite cardinality.

    If $S$ has a cardinality of $0$ (i.e. $S = emptyset = {}$), then $0$ is the smallest ordinal greater than all elements in $S$. Therefore $S$ can't have a cardinality of $0$.

    Therefore the smallest cardinality of $S$ where $omega 2$ is the least ordinal greater than all elements in $S$ is $omega$.
  + $S = {omega 2 + 2} subset omega 2 + 3$, and $S$ has a cardinality of $1$. $S$ can't have a cardinality of $0$ since the smallest ordinal larger than nothing is $0$.
]
