% in/1 is a set consisting of n vertices of G
{in(X) : vertex(X)} = n.

% covered/2 is the set of edges of G that have an endpoint in in/1
covered(X,Y) :- edge(X,Y), in(X).
covered(X,Y) :- edge(X,Y), in(Y).

% every edge of G is in covered/2
:- edge(X,Y), not covered(X,Y).

#show in/1.
% clingo vertex_cover.lp -c n=4 graph1.lp 0
% clingo vertex_cover.lp -c n=4 graph2.lp 0
