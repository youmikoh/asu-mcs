# [Week 2] First Order Logic and KR

# Introduction to First-Order Logic

> OBJECTIVE: Explain the limitation of propositional logic abd the basic idea of first-order logic

### Propositional Logic

- Study of declarative sentensesm statement about the world which can eb given a truth value
- Dealt very well with sentense components like: not, and, or, if ... then ...
- Propositional logic is compositional: meaning of $F \land G $ is derived from meaning of $F$ and of $G$
- Limitations:
  - Cannot express individuals and relations between them
  - Cannot deal with modifiers like: there exists, all, among, only

### Representation in Propositional Logic

| Knowledge from a medical domain | In propositional logic |
|---|---|
| Juvenile disease affects only children or teenagers | $JuvDisease \rightarrow AffectsChild \lor AffectsTeenager$ |
| Children and teenagers are not adults | $Child \lor Teenager \rightarrow \lnot Adult$ |
| Juvenile arthritis is a kind of arthritis and a juvenile disease | $JuvArthritis \rightarrow JuvDisease \land Arthritis$ |
| Arthritis affects sine adults | $Arthritis \rightarrow AffectsAdult$ |

- Some intuitive consequences of our statements:
  - Juvenile arthritis does not affect adults
  - Arthritis is not a juvenile disease
- We expect the following formulas to be entailed:
  - $JuvDisease \rightarrow \lnot AffectsAdult$
  - $Arthritis \rightarrow \lnot JuvDisease$
- However, neither of them is entailed
- Even worse, if we add to our initial formulas the following ones, we obtain an unsatisfiable set of formulas
  - $JuvDisease \rightarrow \lnot AffectsAdult$
  - $JuvArthritis$
- What is going wrong?
  - A <u>juvenile disease</u> *affects* **only** <u>children</u> or <u>teenagers</u>
  - <u>Children</u> and <u>teenagers</u> are not <u>adults</u>
  - <u>Juvenile arthritis</u> is a kind of <u>arthritis</u> and a <u>juvenile disease</u>
  - <u>Arthritis</u> *affects* **some** <u>adults</u>
- Intuitively ...
  - <u>underline</u> represents sets of objects
  - *itatic* represents relationships between objects
  - **bold** indicates whether a statement holds for "all" or for "some" objects

### Need for a Richer Language

- We need a language that allows us to:
  - Represent <u>sets of objects</u>
  - Represent *relationship between objects*
  - Write statements that are true for **some** or all **objects** statisfying certain conditions
  - Express everything we can express in propositional logic (and, or, implies, not, ...)
- Examples of conditions we want to express:
  - **For all** objects c,
    - if c belongs to <u>the set of juvenile diseases</u> and it *affects* object d,
    - then d belongs to <u>the set of children</u> or to <u>the set of teenagers</u>
- **There exists** objects c, d, such that c belongs to the set of <u>arthritis</u> and d belongs to *the set of adults* and c **affects** d

## Introduction to First Order Logic

#### Example

- Express: **"Every student is younger than some instructor"**
- We could identify the entire phrase with the propositional symbol $p$
  - cannot breakdown into smaller atoms since there are no propositional connectives
- However, the phrase has a finer logical structure. It is a statement about the following properties:
  - Being a student
  - Being an instructor
  - Being younger than somebody else

### Predicates

- Individuals are expressed by object/function constants: **andy, paul, father (andy)**
- Properties are expressed by predicates. $S, I, Y$ are predicates.
  - **S(andy):** Andy is a student.
  - **I(paul):** Paul is an instructor.
  - **Y(andy, paul):** Andy is younger than Paul.

### Variables and Quantifiers

- Variables are placeholders for concrete values.
  - $S(x)$: $x$ is a student.
  - $I(x)$: $x$ is an instructor.
  - $Y(x,y)$: $x$ is younger than $y$.
- Quantifiers make possible encoding the phrase:
  - **"Every student is younger than some instructor."**
  - Encoding $\forall\ x\ (S(x) \rightarrow (\exists\ y\ (I(y) \land Y(x, y))))$

#### Examples

- *"No books can meow. Dictionaries are books. Therefore, no dictionary can meow."*
  - We denote:
    - $B(x)$: $x$ is a book
    - $M(x)$: $x$ can meow
    - $D(x)$: $x$ is a dictionary

$$
\lnot \exists x (B(x) \land M(x)), \forall x (D (x) \rightarrow B(x))) \vDash \lnot \exists x (D(x) \land M(x))
$$

- *"Every child is yougner than their mother"*
  - We denote:
    - $C(x)$: $x$ is a child
    - $M(y,x)$: $y$ is $x$'s mother
      $$\forall x \forall y (C(x) \land M(y,x) \rightarrow Y(x, y))$$
    - $m(x)$: mother of $x$
      $$\forall x (C(x) \rightarrow Y(x, m(x)))$$

## First-Order Logic

Whereas propositional logic assumes world contains facts, first-order logic (like natural langauge) assumes the work contains:

- objects: people, houses, numbers, colours, cities, ...
- functions: best friend, successsor, one more than, end of, ...
- relations: red, round, bogus, prime, bigger than, inside, part of, has colours, occurred after, comes between, ...

### Signature

Signature consists of two kinds of symbols:

- FUNCTION CONSTANTS (with arity $n$): +/2, a/0, friend/1
  - function constants with arity 0 called **object constants**
  - maps to a value in the universe
- PREDICATE CONSTANTS (with arity $n$): even/1, >/2, p/0
  - predicate constants with arity 0 called **propositional constants**
  - every atom in propositional logic can be considered predicate constants with arity 0
  - maps to $\top,\bot$

### Other Symbols not in Signature

These symbols can be used in addition to the symbols in the signature

- (object) variables: $x$, $y$, $z$, $x_i$, $y_i$, $z_i$, ...
- the propositional connectives: $\bot$, $\top$, $\lnot$, $\land$, $\lor$, $\rightarrow$, $\leftrightarrow$
- the universal quantifer $\forall$ and the existential quantifier $\exists$
- the parantheses and the comma

### Terms

A TERM is meant to denote an individual. It is defined recursively:

- an object constant is a term: $apple$, $banana$, $cat$
- an object variable is a term: $x$, $y$, $z$
- for every function constant $f$ of arity $n\ (n>0)$, if $t_1,...,t_n$ are terms, then so is $f(t_1, ..., t_n)$
  - $friend(cat)$, $+(a, x)$
  - $friend(friend(friend(cat)))$, $+(a, +(x, cat))$ (infix notation)

### Syntax of First-Order Formulas

- An ATOMIC FORMULA is meant to denote a base fact that is either true or false
- They work like atoms in propositional logic (smallest unit that can be assigned true or false), but has a more complicated internal structure
- Atomic formulas are either:
  1. **Propositional constants R, or**
      - $TrainLate$, $TaxiLate$
  2. **$R(t_1, ..., t_n)$ where $R$ is a predicate constant and $t_i$ are terms, or**
      - $even(2)$, $prime(3)$, $>(3, 2)$, $3>2$
  3. **$t_1 = t_2$ (equality)**
      - $friend(cat) = dog$, $1 + 2 = 3$
- Atomic formulas have predicate constants followed by terms, whereas terms have function constants followed by other terms
- A (first-order) formula of signture $\sigma$ is defined recursively:
  - **every atomic formula of $\sigma$ is a formula**
  - both 0-place connectives ($\top$, $\bot$) are formulas
  - if $F$ is a formula, then $\lnot F$ is a formula
  - if $F$, $G$ are formulas, then $(F \odot G)$ is a formula, where $\odot$ is any binary connective
  - **if $F$ is a formula then $\forall x F$ and $\exists x F$ are formulas** (QUANTIFIER)

#### Examples

Let $\sigma = \{a, P, Q\}$ where:

- $a$ is an object constant
- $P$ is a unary predicate constant
- $Q$ is a binary predicate constant

Q: Whatare these formulas?

1. $a$ - no, $a$ is term since it is an object constant
2. $P(a)$ - yes, $P$ is a unary binary predicate constant
3. $Q(a)$ - no, $Q$ is a binary predicate constant but $Q(a)$ has only one term
4. $\forall x P(a)$ - yes, quantifier for formula
5. $\lnot P(a) \lor \exists x(P(x) \land Q(x, y))$ - yes, use parse tree to verify

### Bound and Free Variables: Free

- An OCCURRENCE OF VARIABLE $v$ in a formula $F$ is BOUND if it belongs to a subformula of $F$ that has the form $Qv\ G$; otherwise it is FREE
  - where $Q$ is a quantifier
  - informally speaking, the occurrence is bound if, in the parse tree, one of its ancestors is $Qv$
- $v$ is a FREE VARIABLE of $F$, if $v$ jas a free ocurrence in $F$

#### Example 1

$$ \exists \underbrace{y}_{(1)}\ P(\underbrace{x}_{(2)},\ \underbrace{y}_{(3)}) \land \lnot \exists \underbrace{x}_{(4)}\ P(\ \underbrace{x}_{(5)},\ \underbrace{y}_{(6)}) \\ \quad \\
\begin{CD}
  {\color{green}\exists y}   @<<< {\color{green}\land}  @>>>    {\color{green}\lnot}  \\
  @VVV        @.                  @VVV \\
  {\color{green}P(x,y)}      @.          @.      {\color{green}\exists x} \\
  @.          @.                  @VVV\\
  @.          @.                  {\color{green}P(x, y)} \\
\end{CD}
$$

- Q: which OCCURRENCES of variables are free?
  - (1) $y$ bound by $\exists$ quantifier
  - (2) $x$ free - no quantifier for $x$ in parents
  - (3) $y$ bound - no quantifier for $y$
  - (4) $x$ bound by $\exists$ quantifier
  - (5) $x$ bound by $\exists$ quantifier
  - (6) $y$ free - no quantifier for $y$ in parents
- Q: which VARIABLES of the formula are free? $x$, $y$

#### Example 2

$$ \forall \underbrace{x}_{(1)}\ (P(\underbrace{x}_{(2)}) \land Q(\underbrace{x}_{(3)})) \rightarrow (\lnot P(\underbrace{x}_{(4)}) \lor Q(\underbrace{y}_{(5)}))
\\ \quad \\
\begin{CD}
  @.    {\color{green}\forall x}   @<<<{\color{green}\rightarrow}@>>>    {\color{green}\lor}   @>>> {\color{green}Q(y)}\\
  @.    @VVV        @.                        @VVV \\
  {\color{green}P(x)}  @<<< {\color{green}\land}  @.                @.      {\color{green}\lnot} \\
  @.    @VVV        @.                        @VVV\\
  @.    {\color{green}Q(x)}        @.                @.      {\color{green}P(x)} \\
\end{CD}
$$

- free occurrences of a variable: (4), (5)
- free variables of the formula: $x$, $y$

### Bound and Free Variables: Bound

- Bound variables can be renamed without changing meaning:
  - $\forall x P(x)$ means the same as $\forall y P(y)$
- A SENTENCE (or CLOSED formula) is a formula without free variables
- The UNIVERSAL CLOSURE of $F$ is the $\forall v_i F$ where $v_i$ are free variables of $F$

### Exercise 1

Assume that the signature consists of only:

- object constant $Me$
- unary predicate constant $Male$
- binary predicate constant $Parent$

Express each sentence in first-order logic:

- I have no daughters.
  $$ \forall x (Parent(Me, x) \rightarrow Male(x))\quad\text{or}\quad \lnot \exists x (Parent(Me, x) \land \lnot Male(x)) $$
- I have a granddaughter.
  $$ \exists y \exists z (Parent(Me, y) \land Parent(y, z) \land \lnot Male(z))$$
- I have a brother.
  $$\exists y \exists z(Parent(y, z) \land Parent(y, Me) \land Male(z) \land \lnot (Me = z))$$

### Exercise 2

Let the underlying signature be
$$ \begin{equation} \begin{aligned} \{a, P, Q\} &\tag{1} \end{aligned} \end{equation} $$
where

- $a$ object constant
- $P$ unary predicate constant
- $Q$ binary predicate constant

We will think of object variables as ranging over the set $N$ of non-negative integers, and intrepret the signature as follows:

- $a$ represents the number 10
- $P(x)$ represents the condition "$x$ is a prime number"
- $Q(x,y)$ represents the condition "$x$ is less than y"

As an example, the sentence "all prime numbers are greater than $x$ can be represented by
$$ \begin{equation} \begin{aligned} \forall y (P(y) \rightarrow Q(x,y)) &\tag{2} \end{aligned} \end{equation} $$

In the following two problems, represents the sentences by predicate formulas

- Problem 1:
  - there is a prime number that is less than 10
    $$ \exists x (P(x) \land Q(x, a)) $$
  - $x$ equals 0 - check equivalence (both should yield same truth value for any signature)
    $$ \lnot \exists y (Q(y, x)) $$
    - suppose $x \geq 1$: $x$ does not equal 0, <span style="color:red">false</span>
      $$
      \begin{align*}
        \lnot \exists y (Q(y, x \geq 1))
        & \Leftrightarrow \lnot \exists y (0 \leq y < x) \\
        & \Leftrightarrow \lnot \top \quad \text{for}\ y = 0, x \geq 1 \\
        & \Leftrightarrow {\color{red}\bot}
      \end{align*}
      $$
    - suppose $x = 0$: $x$ equals 0, <span style="color:blue">true</span>
      $$
      \begin{align*}
        \lnot \exists y (Q(y, x=0))
        & \Leftrightarrow \lnot \exists y (0\leq y < 0) \\
        & \Leftrightarrow \lnot \bot \\
        & \Leftrightarrow {\color{blue}\top}
      \end{align*}
      $$
  - $x$ equals 9
    $$ Q(x, a) \land \lnot \exists y (Q(x, y) \land Q(y, a)) $$
    - suppose $x \geq 10$: $x$ does not equal 9, <span style="color:red">false</span>
      $$
      \begin{align*}
        Q(x \geq 10, a=10) \land ...
        & \Leftrightarrow 10 \leq x< 10 \\
        & \Leftrightarrow {\color{red}\bot}
      \end{align*}
      $$
    - suppose $x \leq 8$: $x$ does not equal 9, <span style="color:red">false</span>
      $$
      \begin{align*}
        ... \land \lnot \exists y (Q(x \leq 8, y) \land Q(y, a=10))
        & \Leftrightarrow ... \land \lnot \exists y (x < y < 10) \\
        & \Leftrightarrow ... \land \lnot \top \quad \text{for}\ y = 9, x \leq 8 \\
        & \Leftrightarrow {\color{red}\bot}
      \end{align*}
      $$
    - suppose $x = 9$: $x$ equals 9, <span style="color:blue">true</span>
      $$
      \begin{align*}
        Q(x=9, a=10) \land \lnot \exists y (Q(x=9, y) \land Q(y, a=10))
        & \Leftrightarrow (9<10) \land \lnot \exists y (9 < y < 10) \\
        & \Leftrightarrow \top \land \lnot \bot  \\
        & \Leftrightarrow {\color{blue}\top}
      \end{align*}
      $$

- Problem 2:
  - there are infinitely many prime numbers
    - there exists prime $y$ greater than prime $x$
    - there does not exist any $y$ such that all prime numbers (P) are less than $y$
  $$ \forall x \exist y (Q(x,y) \land P(y)) $$

## Semantics of First-Order Logic

> Objectives: explain the semantics of First-Order Logic

### Interpretation: Example

For signature $\sigma = \{a, succ, P, Q\}$ where

- $a$ is an object constant
- $succ$ is a unary function constant (successor)
- $P$ is a unary predicate constant
- $Q$ is a binary predicate constant
  $$
    \begin{align}
      |I| &= N \\
      a^I &= 10 \\
      succ^I(n) &= n+1 \\
    P^I(n) &= \begin{cases}
      t &\text{if } n \text{ is prime,}\\
      f &\text{otherwise}
    \end{cases} \\
    Q^I(m, n) &= \begin{cases}
      t &\text{if } m < n \\
      f &\text{otherwise}
    \end{cases} \\
    \end{align}
  $$

### Interpretation: Definition

An interpretation (or structure) $I$ of a signature $\sigma$ consist of

- a non-empty set $|I|$, called the universe (or domain) of $I$
- for every object constant $c$ of $\sigma$, an element $c^I$ of $|I|$
- for every function constant $f$ of $\sigma$ of arity $n>0$, a function $f^I$ from $|I|^n$ to $|I|$
- for every propostional constant $R$ of $\sigma$, an element $R^I$ of $\{t,f\}$
- for every predicate constant $R$ of $\sigma$ of arity $n>0$, a function $R^I$ from $|I|^n$ to $\{t,f\}$

### Semantics: Terms

- For object constant $a$, $a^I$ is part of interpretation $I$
- For terms $f(t_1, ..., t_n)$,
  - $f(t_1, ..., t_n)^I = f^I(t^I_1, ..., t^I_n)$ for all function constants $f$ of arity $n>0$
- Example:
  - $a^I = 10$ (part of interpretation)
  - $succ(a)^I = succ^I(a^I) = succ^I(10) = 11$

### Semantics: Formulas (Buggy)

- We define the truth value $F^I$ of $F$ under interpretation $I$ as:
  - $R(t_1, ..., t_n)^I = R^I(t^I_1, ..., t^I_n)$
  - $\bot^I =f, \top^I = t$
  - $(\lnot F)^I = \lnot (F^I)$
  - $(F \odot G)^I = \odot(F^I, G^I)$ for every binary connective $\odot$
  - $\forall w F(w)^I = t$ iff for all object constraints $c$, $F(c)^I = t$
  - $\exists w F(w)^I = t$ iff for some object constants $c$, $F(c)^I = t$
- Q: What does this mean? $\exists x(Q(x,a))^I = t \Leftrightarrow Q(c,a)^I = t$ for some object constant $c$
  - only $a^I=10$ option for $c$:
    - $Q(c,a)^I \Leftrightarrow Q(10, 10)^I \Rightarrow {\color{red}\bot}$
  - inituitively $Q(c,a)^I = \top$ for any constant $c: 0 \leq c < a$ (e.g. $c=0$)
    - cannot write this since only $a^I=10$ known

### Semantics: Extended Signature

- We consider an extended signature $\sigma^I$, to define the semantics correctly
  - $\sigma^I$ is not available to the knowledge engineer
- Consider an interpretation $I$ of a signature $\sigma$. For any element $\xi$ of its universe $|I|$, select a new symbol $\xi^*$, called the NAME of $\xi$
- By $\sigma^I$ we denote the signature obtained from $\sigma$ by adding all names $\xi^*$ as object constants
- The interpretation $I$ can be extended to the new signature $\sigma^I$ by defining $(\xi^*)^I = \xi, \forall \xi \in |I|$

#### Example

For signature $\sigma = \{a, P, Q\}$ and interpretation $I$ defined as (1)-(5), what is $\sigma^I$?

$$\sigma^I = \{a, P, Q, 0^*, 1^*, 2^*, ...\}$$

### Semantics: Formulas (Fixed)

- $R(t_1, ..., t_n)^I = R^I(t^I_1, ..., t^I_n)$
- $\bot^I =f, \top^I = t$
- $(\lnot F)^I = \lnot (F^I)$,
- $(F \odot G)^I = \odot(F^I, G^I)$ for every binary connective $\odot$
- $\forall w F(w)^I = t$ if $F(\xi^*)^I = t$ for all $\xi \in |I|$
- $\exists w F(w)^I = t$ if $F(\xi^*)^I = t$ for some  $\xi \in |I|$

#### Example

$\exists x (Q(x, a))^I = t {\color{green}\ \Leftrightarrow\ } Q(\xi^*, a)^I = t$ for some $\xi \in N \ {\color{green}\ \Leftrightarrow\ } \top$ ($\because$ take $\xi = 0$)

### Satisfaction, Logical Validity (Tautology), Equivalence

- The notions are simply carried over from propositional logic
- we say that an interpretation $I$ SATISFIES a SENTENCE $F$ (or $I$ is a MODEL of $F$) and write $I \vDash F$, if $F^I = t$
- A sentence $F$ is LOGICALLY VALID if every interpretaion satisifes $F$ (c.f. tautology in propositional logic)
- Two sentences (or sets of sentences) are EQUIVALENT to each other if they are satisfied by the same interpretations
- A formula with free variables is said to be LOGICALLY VALID if it's universal closure is logically valid
- Formulas F and G that may contain free variables are equivalent to eachother if $F \leftrightarrow G$ is logically valid

### Entailment

- A set $\Gamma$ of sentences is SATISFIABLE if there exists and interpretaion satisfying all sentences in $\Gamma$
- A set $\Gamma$ of sentences ENTAILS a formula F $(\Gamma \vDash F)$ if every interpretaion satisfying $\Gamma$ satisfies the universal closure of F
- Examples:
  - $\{\exists x P(x) , \exists x Q(x) \} \vDash \exists x (P(x) \land Q(x))$ <span style="color:red">false</span>
  - $\{\forall x P(x) , \forall x Q(x) \} \vDash \forall x (P(x) \land Q(x))$ <span style="color:blue">true</span>

### Undecidability of FOL

- The VALIDITY PROBLEM of FOL: given any sentence F, is F logically valid?
- Theorem: The Validity Problem is undecidable
- Corollary: The satisfiability problem of first-order logic (i.e., given a sentence F, is F satisfiable?) is undecidable:
  - Proof: by reducing the validity problem to it
  - $F$ is logically valid iff $\lnot F$ is unsatisfiable
- We need to restrict FOL in a meaningful way

## Representing Knowledge in FOL

> Objective: apply first-order logic to KR

### Establishing the Vocabulary

- Start from a textual description or diagram:
  - a juvenile disease affects only children or teenagers
  - children and teenagers are not adults
  - juvenile arthritis is a kind if arthritis and a juvenile disease
  - arthritis affects some adults
- Identify the important types of objects (unary FOL predicates):
  - juvenile disease, child, teenager, adult, ...
- Identify the important types of relationships (n-ary FOL predicates)
  - affects, ...
- Identify the important functions
  - none in this particular case (e.g. friend of $x$)

### Example FOL Sentenses

- a *juvenile disease* **affects** only *children* or *teenagers*
  - $\forall x \forall y (JuvDisease(x) \land Affected(x, y) \rightarrow Child(y) \lor Teen(y))$
- *children* and *teenagers* are not *adults*
  - $\forall x (Child(x)\lor Teen(x) \rightarrow \lnot Adult(x))$
- *juvenile arthritis* is a kind of *arthritis* and a *juvenile disease*
  - $\forall x (JuvArthritis(x) \rightarrow Arthritis(x) \land JuvDisease(x))$
- *arthritis* **affects** some *adults*
  - $\exists x \exists y (Arthritis(x) \land Affected(x,y) \land Adult(y))$

### Does Juvenile Disease Affect Adults?

- In propositional logic:
$$
\begin{Bmatrix}
  JuvDisease \rightarrow AffectsChild \lor AffectsTeen \\
  Child \lor Teen \rightarrow \lnot Adult
\end{Bmatrix} \\
{\Large{\nvDash}\ } JuvDisease \rightarrow \lnot AffectsAdult
$$
- In first-order logic:
$$
\begin{Bmatrix}
  \forall x \forall y (JuvDisease(x) \land Affected(x, y) \rightarrow Child(y) \lor Teen(y)) \\
  \forall x (Child(x)\lor Teen(x) \rightarrow \lnot Adult(x))
\end{Bmatrix} \\
{\Large{\vDash}\ } \forall x \forall y (JuvDisease(x) \land Affected(x, y) \rightarrow \lnot Adult(y))
$$

### Basic Facts

- Now that we have the basic vocabulary, we can acquire the data:
  - $Child(Apple)$: Apple is a child
  - $JuvArthritis(JRA)$: JRA is a juvenile arthiris
  - $\lnot Affects(JRA, Banana)$: Banana is not affected by JRA
- Usually data consists of (possibly negated) atoms
- Data can also reflet more complex information
  - $Child(Apple) \lor Child(Banana)$: either Apple or Banana is a child

### Terminological Axioms

Sentences describgint the general meaning of predicate and function symbols (independently of the concrete data)

- Sub-type statments:
  - $\forall x(JuvArthritis(x) \land Arthritis(x))$
- Full definitions:
  - $\forall x (JuvArthritis(x) \leftrightarrow Arthritis(x) \land JuvDisease(x))$
- Disjoint statments:
  - $\forall x (Child(x) \rightarrow \lnot Adult(x))$
- Covering statements:
  - $\forall x (Person(x) \rightarrow Adult(x) \lor Child(x) \lor Teen(x))$
- Type restrictions:
  - $\forall x \forall y(Affects(x, y) \rightarrow Arthritis(x) \land Person(y))$
- Other general statements:
  - $\forall x \forall y(Juvenile(x) \land Affects(x, y) \rightarrow Child(y) \lor Teen(y))$

### Data vs. Terminological Knowledge

- The Data describes specific objects
  - Sentences without variables or quantifiers (usually atoms)
- Terminological axioms describe general properties of the application domain, independent of the data
  - universally quantified sentences with no constants
- This separation is not theoretically "clean" in FOL:
  - $\forall y(Affects(JRA, y) \rightarrow Child(y) \lor Teen(y))$
  - $\forall x(Continent(x) \rightarrow (x=Eur) \lor (x = Asia) \lor (x=Amer) \lor (x=Afr) \lor (x=Aus) \lor (x=Antart))$
- Set of Terminological Axioms often called an ONTOLOGY
- Ontology + Data often called a KNOWLEDGE BASE

### The Role of Reasoning

- Why are reasoning problems (satisfiability, entailment) useful?
  - Detect errors
    - knowledge base becomes unsatisfiable
    - we get an unintuitive (and "wrong") entailment
    - we don't get an intuitive (and "right) entailment
  - Discover new knowledge
    - things we weren't aware we knew
  - Richer query answers $\Rightarrow$ Retrieve more (relevant) data
- Without reasoning, knowledge engineering becomes unfeasible
  - knowledge bases grow very large (thousands of sentences)
  - errors are difficult to detect manually
  - query answers do not take knowledge into account

### Expressivity vs. Complexity

- THEOREM: FOL satisfiability is an undecidable problem; there is no procuedure that given any set of first order sentences $S$:
  - always terminates
  - returns true if and only if $S$ is satisfiable
- So should we just give up (reasoning is intractable)? Maybe?
- Highly optimized FOL theorem provers are effective in practice
- But still can't cope with realistic KR problems

### Limitations of FOL

- FOL is powerful, but still can't capture:
  - transitive closure (ancestor is the transitive closer of parent)
  - defaults and exceptions (birds fly by default; penguins are an exception)
  - probabilistic knowledge (children suffer from JRA with probability $x$)
  - vague knowledge (Apple is tall, but how tall)
- We will return to some of these issues later in the course

## Herbrand Models

> Objective: explain how Herbrand models are defined and reduces the complexity of FOL reasoning

### Herbrand Models

- A Herbrand interpretation is a special case of first-order interpreation
- A herbrand intrepretation of a signature $\sigma$ (containing at least one object constant) is an intrepretation of $\sigma$ such that:
  - its universe (Herbrand Universe) is the set of all ground (i.e., variable-free) terms of $\sigma$, and
  - every ground term is interpreted as itself $(t^I = t)$

#### Example 1

Herbrand interpretations of the signature $\{P, a\}$:
$$
\begin{array}{c|c}
  (1) & (2) \\ \hline
  |I| = \{a\} & |I| = \{a\} \\
  a^I = a & a^I = a\\
  P^I(a) = t & P^I(a) = f
\end{array}
$$

- Herbrand interpretations of the signature $\{P, a\}$ that satisfies formula $P(a)$ is (1)

#### Example 2

Herbrand interpretations of the signature $\{P, a, b\}$:
$$
\begin{array}{c|c|c|c}
  (1) & (2) & (3) & (4) \\
  \hline
  |I| = \{a,b\} & |I| = \{a,b\} & |I| = \{a,b\} & |I| = \{a,b\} \\
  a^I = a & a^I = a & a^I = a & a^I = a \\
  b^I = b & b^I = b & b^I = b & b^I = a \\
  \hdashline
  P^I(a) = t & P^I(a) = t & P^I(a) = f & P^I(a) = f \\
  P^I(b) = t & P^I(b) = f & P^I(b) = t & P^I(b) = f \\
\end{array}
$$

- Herbrand interpretations of the signature $\{P, a, b\}$ that satisfies formula $P(a)$ is (1) and (2)
- An Herbrand interpertation can be identified with teh set of ground atoms to which it assigns the value true:
$$
\begin{array}{c|c|c|c}
  (1) & (2) & (3) & (4) \\
  \hline
  \{P(a), P(b)\}  & \{P(a)\} & \{P(b)\}  & \emptyset
\end{array}
$$

### Example 3 $$F_1 = \underbrace{P(a)}_{(i)} \land \underbrace{\exists x \lnot p(x)}_{(ii)}$$

Find the Herbrand models of $F_1$ whose signature is {a, P}:
$$
\begin{array}{c|c}
  (1) & (2) \\
  \hline
  |I| = \{a\} & |I| = \{a\} \\
  a^I = a & a^I = a \\
  \hdashline
  P^I(a) = t & P^I(a) = f  \\
  \hline
  \{P(a)\} \nvDash F_1 & \emptyset \nvDash F_1
\end{array}
$$

- (1) $\nvDash F_1$ since $P(a) = t$ means $\nexists x (\lnot p(x) \land \top)$ and (ii) is <span style="color:red">false</span>
- (2) $\nvDash F_1$ since $P(a) = f$ means (i) is <span style="color:red">false</span>

Find the Herbrand models of $F_1$ whose signature is $\{a, b, P\}$:
$$
\begin{array}{c|c|c|c}
  (1) & (2) & (3) & (4) \\
  \hline
  |I| = \{a,b\} & |I| = \{a,b\} & |I| = \{a,b\} & |I| = \{a,b\} \\
  a^I = a & a^I = a & a^I = a & a^I = a \\
  b^I = b & b^I = b & b^I = b & b^I = a \\
  \hdashline
  P^I(a) = t & P^I(a) = t & P^I(a) = f & P^I(a) = f \\
  P^I(b) = t & P^I(b) = f & P^I(b) = t & P^I(b) = f \\
  \hline
  \{P(a), P(b)\} \nvDash F_1 & \{P(a)\} \vDash F_1 & \{P(b)\} \nvDash F_1 & \emptyset \nvDash F_1
\end{array}
$$

- (3,4) $\nvDash F_1$ since $P(a) = f$ means (i) is <span style="color:red">false</span>
- (1) $\nvDash F_1$ since $P(b) = t$ means (ii) is <span style="color:red">false</span>
- **(2)** $\vDash F_1$ since $P(a) = t$ (i <span style="color:blue">true</span>) and $P(b) = f$ means (ii) is <span style="color:blue">true</span>

### Example 4 $$F_2 = \underbrace{P(a)}_{(i)} \land \underbrace{\lnot P(b)}_{(ii)} \land \underbrace{\exists x \lnot p(x)}_{(iii)}$$

Find the Herbrand models of $F_1$ whose signature is $\{a, b, P\}$:
$$
\begin{array}{c|c|c|c}
  (1) & (2) & (3) & (4) \\
  \hline
  |I| = \{a,b\} & |I| = \{a,b\} & |I| = \{a,b\} & |I| = \{a,b\} \\
  a^I = a & a^I = a & a^I = a & a^I = a \\
  b^I = b & b^I = b & b^I = b & b^I = a \\
  \hdashline
  P^I(a) = t & P^I(a) = t & P^I(a) = f & P^I(a) = f \\
  P^I(b) = t & P^I(b) = f & P^I(b) = t & P^I(b) = f \\
  \hline
  \{P(a), P(b)\} \nvDash F_1 & \{P(a)\} \vDash F_1 & \{P(b)\} \nvDash F_1 & \emptyset \nvDash F_1
\end{array}
$$

- (3,4) $\nvDash F_1$ since $P(a) = f$ means(i) is <span style="color:red">false</span>
- (1) $\nvDash F_1$ since $P(b) = t$ means (ii) is <span style="color:red">false</span>
- **(2)** $\vDash F_1$ since $P(a) = t$ (i <span style="color:blue">true</span>), $P(b) = f$ means (ii) is <span style="color:blue">true</span> ($\lnot P(b) = t$), and (iii) is <span style="color:blue">true</span> ($x=b$)

### Entailment and Herbrand Models

- Without functions, entailment restricted to Herbrand models is decidable
  - Herbrand models are finitely enumerable
- With functions, this is not the case:
  - Consider $\sigma = \{P, f, a\}$ with gh $\{a, f(a), f(f(a)), f(f(f(a))), ...\}$
- When the Herbrand universe is finite, quantified formulas can be identified with propositional formulas
  - $\forall x P(x)$ vs. $P(a) \land P(b) \land P(c)$
  - $\exists x P(x)$ vs. $P(a) \lor P(b) \lor P(c)$

