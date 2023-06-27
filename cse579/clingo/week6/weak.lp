% weak.lp

% {p;q}.
% :~ p. [10@0]
% :~ q. [5@1]


%  clingo weak.lp --opt-mode=enum 0

1{p;q;r}2.
:~ p. [10@0]
:~ q. [-5@0]
:~ r. [5@1]

