% blocks-p1.lp
#include "blocks-scenario.lp".

#const grippers=2.

#minimize{1,T:move(B,L,T)}.

moves(N) :- N=#count{1,B,L,T:move(B,L,T)}.
#show moves/1.
#show move/3.

% ----- sort and object declaration -----

% every block is a location
location(B) :- block(B).

% the table is a location
location(table).

% ----- state description -----

% two blocks can't be on the same block at the same time
:- 2{on(BB,B,T)}, block(B), T = 0..m.

% ========== PROBLEM 1 ==========
% limit number of simultaneous block stacks on table
:- not {on(B, table, T)} max_block_stacks, T = 0..m.

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




% clingo blocks-p1.lp -c m=3 -c max_block_stacks=4
% clingo blocks-p1.lp -c m=4 -c max_block_stacks=4


% clingo blocks-p1.lp -c m=2 -c max_block_stacks=5
% clingo blocks-p1.lp -c m=3 -c max_block_stacks=5

