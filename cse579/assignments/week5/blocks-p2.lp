% blocks-p2.lp

#const m = 0.
#show on/3.

block(1..6).

% ----- sort and object declaration -----

% every block is a location
location(B) :- block(B).

% the table is a location
location(table).

% ----- state description -----

% two blocks can't be on the same block at the same time
:- 2{on(BB,B,T)}, block(B), T = 0..m.

% ========== PROBLEM 2 ==========
% two blocks cannot be on each other at the same time, and
% a block cannot be on itself (constraint does not state B1!=B2)
:- on(B1,B2,T), on(B2,B1,T), block(B1), block(B2), T = 0..m.

% ----- effect and preconditions of action -----

% effect of moving a block
on(B,L,T+1) :- move(B,L,T).

% concurrent actions are limited by num of grippers
:- not {move(BB,LL,T)} grippers, T = 0..m-1.

% a block can be moved only when it is clear
:- move(B,L,T), on(B1,B,T).

% a block can't be moved onto a block that is being moved also
:- move(B,B1,T), move(B1,L,T).


% ----- domain independent axioms -----

% fluents are initially exogenous
1{on(B,LL,0):location(LL)}1 :- block(B).

% uniqueness and existence of value constraints
:- not 1{on(B,LL,T)}1, block(B), T = 1..m.

% actions are exogenous
{move(B,L,T)} :- block(B), location(L), T = 0..m-1.

% commonsense law of inertia
{on(B,L,T+1)} :- on(B,L,T), T = 0..m-1.




% clingo blocks-p2.lp -n0 --outf=2 > output_p2.json
