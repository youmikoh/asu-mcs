% Use clingo to find all solutions to the n-queens problem for n=3,4,5,6,7,8,9,10,11,12. Draw a
% table that lists the number of solutions and the times to compute all solutions. Use CPU time
% that clingo returns. Since the output is large, do not copy them into the submission

% p2.lp

% each row has exactly one queen
{queen(R,1..n)}=1 :- R=1..n.

% no two queens are on the same column
:- queen(R1,C), queen(R2,C), R1!=R2.

% no two queens are on the same diagonal
:- queen(R1,C1), queen(R2,C2), R1!=R2, |R1-R2|=|C1-C2|.
