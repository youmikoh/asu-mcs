% simultaneous move
% #const maxstep=10.
% block(a;b;c).
% :- not on(
%     a, table, 0;
%     c, table, 0;
%     c, b, 0
% ).
% :- not on(
%     a, b, maxstep;
%     c, table, maxstep;
%     b, table, maxstep
% ).

% swap
% #const maxstep=20.
% block(a;b;c;d).
% :- not on(
%     a, table, 0;
%     b, a, 0;
%     c, table, 0;
%     d, c, 0
% ).
% :- not on(
%     a, table, maxstep;
%     d, a, maxstep;
%     c, table, maxstep;
%     b, c, maxstep
% ).


% block(a;b;c;d). % test origin adjacent
% :- not on(
%     a, table, 0;
%     b, a, 0;
%     c, table, 0;
%     d, c, 0
% ).
% :- not on(
%     b, table, maxstep;
%     c, table, maxstep;
%     d, c, maxstep;
%     a, d, maxstep
% ).


% block(a;b;c;d). % test dest adjacent
% :- not on(
%     a, table, 0;
%     b, table, 0;
%     c, table, 0;
%     d, c, 0
% ).
% :- not on(
%     a, table, maxstep;
%     b, a, maxstep;
%     d, b, maxstep;
%     c, table, maxstep
% ).

% block(a;b;c;d). % test origin adjacent
% :- not on(
%     a, table, 0;
%     b, a, 0;
%     c, table, 0;
%     d, c, 0
% ).
% :- not on(
%     a, table, maxstep;
%     b, a, maxstep;
%     c, b, maxstep;
%     d, table, maxstep
% ).



% blocks-p3.lp

#include "blocks-scenario-p3.lp".

% ========== PROBLEM 3 ==========
% minimal length plan: minimize timestep
% #minimize{1,T:move(B,L,T)}.
#minimize{1,B,L,T:move(B,L,T)}.

#show move/3.
#show on/3.

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

% concurrent actions are limited by num of grippers
% :- not {move(BB,LL,T)} grippers, T = 0..maxstep-1.

% a block can be moved only when it is clear
:- move(B,L,T), on(B1,B,T).

% a block can't be moved onto a block that is being moved also
:- move(B,B1,T), move(B1,L,T).

% from problem 2: two blocks cannot be on each other at the same time
:- on(B1,B2,T), on(B2,B1,T), block(B1), block(B2), T=0..maxstep.

% ========== PROBLEM 3 ==========
% outcome of all moves within the same timestep must be independent of the move sequence

% for any (B1,B2) moving within the same timestep T:
% - a moving block cannot be on top of another moving block at the source
:- move(B1,L1,T), move(B2,L2,T), {on(B1,B2,T);on(B2,B1,T)}=1.
% - destination of a moving block cannot be the source of another moving block
% destination block D of a moving block B1 cannot be below another moving block B2

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






% clingo blocks-p3.lp blocks-scenario-p3.lp -c maxstep=8 0 --outf=2 > output_p3_v4.json

