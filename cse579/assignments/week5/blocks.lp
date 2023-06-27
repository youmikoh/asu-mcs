

% % simultaneous move\
% #const maxstep=4.
% block(a;b;c).
% :- not on(
%     a, table, 0;
%     c, table, 0;
%     b, c, 0
% ).
% :- not on(
%     a, c, maxstep;
%     c, table, maxstep;
%     b, table, maxstep
% ).

% % % swap
% #const maxstep=4.
% block(a;b;c;d).
% :- not on(
%     a, table, 0;
%     c, table, 0;
%     b, a, 0;
%     d, c, 0
% ).
% :- not on(
%     a, table, maxstep;
%     c, table, maxstep;
%     b, c, maxstep;
%     d, a, maxstep
% ).

% swap
% #const maxstep=20.
% block(a;b;c;d).
% :- not on(
%     a, table, 0;
%     b, a, 0;
%     c, table, 0;
%     d, c, 0;
%     e, table, 0;
%     f, e, 0;
%     g, table, 0
% ).
% :- not on(
%     a, table, maxstep;
%     d, a, maxstep;
%     c, table, maxstep;
%     b, c, maxstep;
%     e, table, maxstep;
%     g, e, maxstep;
%     f, table, maxstep
% ).




% blocks.lp

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sort and object declaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% every block is a location
location(B) :- block(B).

% the table is a location
location(table).

%%%%%%%%%%%%%%%%%%%
% state description
%%%%%%%%%%%%%%%%%%%

% two blocks can't be on the same block at the same time
:- 2{on(BB,B,T)}, block(B), T = 0..maxstep.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% effect and preconditions of action
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% effect of moving a block
on(B,L,T+1) :- move(B,L,T).

% % concurrent actions are limited by num of grippers
:- not {move(BB,LL,T)} grippers, T = 0..maxstep-1.

% a block can be moved only when it is clear
:- move(B,L,T), on(B1,B,T).

% a block can't be moved onto a block that is being moved also
:- move(B,B1,T), move(B1,L,T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% domain independent axioms
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% fluents are initially exogenous
1{on(B,LL,0):location(LL)}1 :- block(B).

% uniqueness and existence of value constraints
:- not 1{on(B,LL,T)}1, block(B), T = 1..maxstep.

% actions are exogenous
{move(B,L,T)} :- block(B), location(L), T = 0..maxstep-1.

% commonsense law of inertia
{on(B,L,T+1)} :- on(B,L,T), T = 0..maxstep-1.


#show move/3.
#show on/3.


#minimize{1,T:move(B,L,T)}.


% clingo blocks.lp blocks-scenario-p3.lp -c maxstep=8 -c grippers=5 0

% clingo blocks.lp blocks-scenario-p3.lp -c maxstep=8 0 --outf=2 > output_p3_v0.json
