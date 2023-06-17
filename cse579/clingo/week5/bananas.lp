%% sort and object declaration
boolean(t;f).
object(monkey;banana;box).
location(l1;l2;l3).

%% state constraints --- declares fluents (asBananas, onBox, loc), can be relative to other states/fluents

% location of banana
loc(banana,L,T) :- hasBananas(t, T), loc(monkey,L,T).
% location of monkey
loc(monkey,L,T) :- onBox(t,T), loc(box,L,T).


%% effect and preconditions of actions
% effect in the head, action in the body
% preconditions as constraints

% walk action --- doesn't always have to be recursive necessarily
loc(monkey,L,T+1) :- walk(L,T).
:- walk(L,T), loc(monkey,L,T). % already at destination
:- walk(L,T), onBox(t,T).

% pushBox --- action can affect multiple fluents
loc(box,L,T+1) :- pushBox(L,T).
loc(monkey,L,T+1) :- pushBox(L,T).
:- pushBox(L,T), loc(monkey,L,T).
:- pushBox(L,T), onBox(t,T).
:- pushBox(L,T), loc(monkey,L1,T), loc(box,L2,T), L1!=L2.

% climbOn
onBox(O,t,T+1) :- climbOn(T).
:- climbOn(T), onBox(t,T).
:- climbOn(T), loc(monkey,L1,T), loc(box,L2,T), L1 != L2.

% climbOff
onBox(O,f,T+1) :- loc(monkey,L,T), loc(box,L,T), climbOff(T).

% graspBananas
hasBananas(t,T+1) :- loc(monkey,L,T), loc(banana,L,T), graspBananas(T).

% disallow concurrent actions
:- walk(O,L,T), pushBox(L,T).
:- walk(O,L,T), climbOn(T).
:- walk(O,L,T), climbOff(T).
:- walk(O,L,T), graspBananas(T).
:- pushBox(L,T), climbOn(T).
:- pushBox(L,T), climbOff(T).
:- pushBox(L,T), graspBananas(T).
:- climbOn(T), climbOff(T).
:- climbOn(T), graspBananas(T).
:- climbOff(T), graspBananas(T).


%% domain independent axioms

% fluents are initially exogenous
{hasBananas(B,0):boolean(B)}.
{onBox(O,B,0):boolean(B)} :- object(O).
{loc(O,L,0)} :- object(O), location(L).

% uniqueness and existence of fluent values
:- not 1{hasBananas(B,T):boolean(B)}1, T=1..m.
:- not 1{onBox(O,B,0):boolean(B)}1, object(O).
:- not 1{loc(O,L,0)}, object(O)1, location(L).

% actions are exogenous
{walk(O,L,T)} :- object(O), location(L), T=1..m.
{pushBox(L,T)} :- location(L), T=1..m.
{climbOn(box,T)} :- location(L), T=1..m.

% commonsense law of inertia
{walk(O,L,T+1)} :- walk(O,L,T), T=1..m-1.
{onBox(O,B,T+1)} :- onBox(O,B,T), T=1..m-1.
{loc(O,L,T+1)} :- loc(O,L,T), T=1..m-1.
