% sort and object declarations
boolean(t;f).
end(leftEnd;rightEnd).
height(low;high).

% state condition
onTable(f,T) :- level(leftEnd,H,T), level(rightEnd,H1,T), H!=H1.

% effect and precondition of lift
level(E,high,T+1) :- lift(E,T).
:- lift(E,T), level(E,high,T).

% fluents are exogenous initially
1{level(E,HH,0): height(HH)}1 :- end(E).
1{onTable(BB,0): boolean(BB)}1.

% uniqueness and existence of fluent values
:- not 1{level(E,HH,T)}1, end(E), T=1..m.
:- not 1{onTable(BB,T)}1, T=1..m.

% actions are exogenous
{lift(E,T)} :- end(E), T=0..m-1.

% fluents are inertial
{level(E,H,T+1)} :- level(E,H,T), T=0..m-1.
{onTable(B,T+1)} :- onTable(B,T), T=0..m-1.


% scenario
onTable(t,0).
level(E,low,0) :- end(E).
:- not onTable(t,m).
:- level(E,low,m).


#const m=1.
