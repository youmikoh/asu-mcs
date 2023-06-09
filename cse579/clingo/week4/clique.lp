% in/1 is a set consisting of n vertices of G
{in(X)} :- vertex(X).

% there must be an edge between the chosen vertices
:- in(X), in(Y), X!=Y, not edge(X,Y), not edge(Y,X).


#maximize{1,X: in(X)}.

#show in/1.

% clingo clique.lp -c n=3  graph1.lp 0
