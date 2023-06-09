boolean(t;f).

% direct effect
p(t,T+1) :- a(T), T=0..m-1.

% initial status are exogenous
1{p(B,0):boolean(B)}1. % same as 1{p(t,0); p(f,0)}1.

% uniqueness and existence of values
:- not 1{p(B,T):boolean(B)}1, T=1..m. % check why this needs to be written as a constraint in this format

% actions are exogenous
{a(T)} :- T=0..m-1.

% commonsense law of inertia
{p(B,T+1)} :- p(B,T), T=0..m-1.

% state at T=0
% clingo simple.lp -c m=0 0

% state at T=0
% clingo simple.lp -c m=1 0
