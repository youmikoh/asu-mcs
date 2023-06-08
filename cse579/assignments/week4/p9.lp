% About a set X of numbers we say that it is almost sum-free if the sum of two different elements
% of X never belongs to X. For instance, the set {1, 2, 4} is almost sum-free. Almost-Schur number
% A(k) is the largest integer n for which the interval {1, . . . , n} can be partitioned into k almost
% sum-free sets.

% Use clingo to find the exact values of A(1), A(2), A(3) and try to find the largest lower bound for
% A(4), i.e., the largest number l such that A(4) >= l.

% p9.lp

% partition set {1,...,n} into k subsets
% in(I,S): number I is in subset S
{in(I,1..k)}=1 :- I=1..n.

% almost sum-free subsets: sum of two distinct elements of subset S is not in S
:- in(I,S), in(J,S), I!=J, in(I+J,S).

#maximize{1,I,S: in(I,S)}.

#show in/2.
