% function.lp

domain(1;2;3).
codomain(a;b).

% define function f: domain -> codomain
{f(X,Y): codomain(Y)}=1 :- domain(X).

% one-to-one
% X = X1 :- f(X,Y), f(X1,Y).

% onto
:- {f(X,Y): domain(X)}=0, codomain(Y).
% {f(X,Y): domain(X)}!=0 :- codomain(Y). % equivalent to above

#show f/2.
