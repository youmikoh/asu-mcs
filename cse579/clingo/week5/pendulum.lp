% pendulum.lp

% sorts and object declaration
boolean(t;f).

% effects of hold
right(T+1) :- hold(T), right(T).
left(T+1) :- hold(T), left(T).

% by default, pendulum changes the position
{left(T+1)} :- right(T), T=0..m-1.
{right(T+1)} :- left(T), T=0..m-1.

% fluents are exogenous initially
1{right(0);left(0)}1.

% uniqueness and existence of values for fluents
:- not 1{right(T);left(T)}1, T=1..m.

% exogenous action
{hold(T)} :- T=0..m-1.
