## Logic and Set Theory

$\gdef\VERT{|}$

|||||
|:--------------------|:--------------------------|:----------------------------|:-----
|$\forall$ `\forall`  |$\complement$ `\complement`|$\therefore$ `\therefore`    |$\emptyset$ `\emptyset`
|$\exists$ `\exists`  |$\subset$ `\subset`  |$\because$ `\because`              |$\empty$ `\empty`
|$\exist$ `\exist`    |$\supset$ `\supset`  |$\mapsto$ `\mapsto`                |$\varnothing$ `\varnothing`
|$\nexists$ `\nexists`|$\mid$ `\mid`        |$\to$ `\to`                        |$\implies$ `\implies`
|$\in$ `\in`          |$\land$ `\land`      |$\gets$ `\gets`                    |$\impliedby$ `\impliedby`
|$\isin$ `\isin`      |$\lor$ `\lor`        |$\leftrightarrow$ `\leftrightarrow`|$\iff$ `\iff`
|$\notin$ `\notin`    |$\ni$ `\ni`          |$\notni$ `\notni`                  |$\neg$ `\neg` or `\lnot`
|   | $\Set{ x \VERT x<\frac 1 2 }$<br><code>\Set{ x &#124; x<\frac 1 2 }</code>  | $\set{x\VERT x<5}$<br><code>\set{x&#124;x<5}</code> ||


$$
\gdef\T{\top}
\gdef\B{\bot}
\gdef\OR{\lor}
\gdef\AND{\land}
\gdef\IF{\leftarrow}
\gdef\THEN{\rightarrow}
\gdef\EQ{\leftrightarrow}

\T ~\B ~\OR ~\AND ~\IF ~\THEN ~\EQ
\\


\gdef\satisfy{\vDash}
\gdef\notsatisfy{\nvDash}
\gdef\crit{\neg H}
\gdef\so{\rightsquigarrow}
\gdef\img{\imageof}

\satisfy ~\notsatisfy ~\crit ~\so ~\imageof
\\

\set{s,e,t} ~\Set{S,e, t}
\\

\gdef\txt#1{\texttt{#1}}

\txt{txt - some text inside}
\\

\gdef\R#1{{\color{red}{#1}}}
\gdef\G#1{{\color{green}{#1}}}
\gdef\B#1{{\color{blue}{#1}}}
\gdef\P#1{{\color{deeppink}{#1}}}
\gdef\V#1{{\color{darkviolet}{#1}}}

\R{red~\txt{r}~\AND} ~\B{blue~\txt{b}~\OR} ~\G{green~\txt{g}~\IF} ~\P{pink~\txt{r}~\THEN} ~\V{violet~\txt{r}~\EQ}
\\

\gdef\red#1{{\color{red}{#1}}}
\gdef\green#1{{\color{green}{#1}}}
\gdef\blue#1{{\color{blue}{#1}}}
\gdef\pink#1{{\color{deeppink}{#1}}}
\gdef\violet#1{{\color{darkviolet}{#1}}}

\red{red~\txt{r}~\AND} ~\blue{blue~\txt{b}~\OR} ~\green{green~\txt{g}~\IF} ~\pink{pink~\txt{r}~\THEN} ~\violet{violet~\txt{r}~\EQ}
\\

\gdef\Rtxt#1{{\color{red}{\texttt{#1}}}}
\gdef\Gtxt#1{{\color{green}{\texttt{#1}}}}
\gdef\Btxt#1{{\color{blue}{\texttt{#1}}}}
\gdef\Ptxt#1{{\color{deeppink}{\texttt{#1}}}}
\gdef\Vtxt#1{{\color{darkviolet}{\texttt{#1}}}}

\Rtxt{tred $r$} ~\Btxt{tblue $b$} ~\Gtxt{tgreen $g$} ~\Ptxt{tpink $p$} ~\Vtxt{tviolet $v$}
\\

\gdef\Rbox#1{{\colorbox{salmon}{$#1$}}}
\gdef\Gbox#1{{\colorbox{lightgreen}{$#1$}}}
\gdef\Bbox#1{{\colorbox{skyblue}{$#1$}}}
\gdef\Pbox#1{{\colorbox{pink}{$#1$}}}
\gdef\Vbox#1{{\colorbox{plum}{$#1$}}}

\Rbox{bred~\txt{txt}~\AND} ~\Bbox{bblue~\txt{txt}~\OR} ~\Gbox{bgreen~\txt{txt}~\IF} ~\Pbox{bpink~\txt{txt}~\THEN} ~\Vbox{bviolet~\txt{txt}~\EQ}
\\

$$
