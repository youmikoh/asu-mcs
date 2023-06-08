% use clingo to determine how many bishops can be placed on a chessboard so that they do not attack each other.

% p8.lp

% a(R,C) position on row R, col C on an nxn board
{a(R,C)} :- R=1..n, C=1..n.

% no bishops on diagonals
:- a(R1,C1), a(R2,C2), R1!=R2, |R1-R2|=|C1-C2|.

#maximize{1,R,C: a(R,C)}.
