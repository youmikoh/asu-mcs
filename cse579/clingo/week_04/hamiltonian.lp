% in(X,Y) is the SET OF EDGES IN CYCLE and every vertex has only ONE incoming edge and only ONE outgoing edge in the cycle.
{in(X,Y): edge(X,Y)}=1 :- vertex(X).
{in(Y,X): edge(Y,X)}=1 :- vertex(Y).

% Define reachability recursively
reachable(X) :- in(1,X).
reachable(Y) :- in(X,Y), reachable(X).

% Every vertex is reachable in cycle from some fixed vertex, say 1.
:- not reachable(X), vertex(X).
% Display
#show in/2

% clingo hamiltonian.lp graph1.lp 0


%optimize
#minimize{C,X,Y: cost(X,Y,C), in(X,Y)}.

% clingo hamiltonian.lp graph1.lp graph1_edge_cost.lp 0
