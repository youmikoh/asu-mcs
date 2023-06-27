% blocks-p4.lp

% ----- sort and object declaration -----

% every block is a location
location(B) :- block(B).

% the table is a location
location(table).

% ----- state description -----

% two blocks can't be on the same block at the same time
:- 2{on(BB,B,T)}, block(B), T = 0..maxstep.

% ----- effect and preconditions of action -----

% effect of moving a block
on(B,L,T+1) :- move(B,L,T).

% % concurrent actions are limited by num of grippers
:- not {move(BB,LL,T)} grippers, T = 0..maxstep-1.

% a block can be moved only when it is clear
:- move(B,L,T), on(B1,B,T).

% a block can't be moved onto a block that is being moved also
:- move(B,B1,T), move(B1,L,T).

% prune non-serializable plans
:- move(B1,B2,T), on(B,B2,T), block(B2).

% ----- domain independent axioms -----

% fluents are initially exogenous
1{on(B,LL,0):location(LL)}1 :- block(B).

% uniqueness and existence of value constraints
:- not 1{on(B,LL,T)}1, block(B), T = 1..maxstep.

% actions are exogenous
{move(B,L,T)} :- block(B), location(L), T = 0..maxstep-1.

% commonsense law of inertia
{on(B,L,T+1)} :- on(B,L,T), T = 0..maxstep-1.


#show move/3.
% #show on/3.

% ========== PROBLEM 4 ==========
% minimal number of actions
#minimize{1,B,L,T:move(B,L,T)}.

% clingo blocks-p4.lp blocks-scenario-p3.lp -c maxstep=8 0 -c grippers=10 --quiet -t4

