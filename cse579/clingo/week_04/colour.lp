% each vertex is mapped to a colour
{colour(X,C): C=1..n}=1 :- vertex(X).

% the adjacent vertices should be of different colour
:- edge(X,Y), colour(X,C), colour(Y,C).


% clingo colour.lp -c n=3 graph1.lp 0
% clingo colour.lp -c n=3 graph2.lp 0
