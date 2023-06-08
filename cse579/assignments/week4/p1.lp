% Use clingo to find all solutions to the 8-queens problem that have no queens in the 4x4=16
% squares in the middle of the board.

% p1.lp

% 8-queens problem
#const n=8.

% each row has exactly one queen
{queen(R,1..n)}=1 :- R=1..n.

% no two queens are on the same column
:- queen(R1,C), queen(R2,C), R1!=R2.

% no two queens are on the same diagonal
:- queen(R1,C1), queen(R2,C2), R1!=R2, |R1-R2|=|C1-C2|.

% no queens in the 4x4 squares in the middle of the board
:- queen(R,C), R=3..6, C=3..6.
