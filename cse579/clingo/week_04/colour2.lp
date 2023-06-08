colour(red;blue;green).

% each vertex is mapped to a colour
{coloured(X,C): colour(C)}=1 :- vertex(X).

% the adjacent vertices should be of different colour
:- edge(X,Y), coloured(X,C), coloured(Y,C).


% clingo colour2.lp graph1.lp 0
% clingo colour2.lp graph2.lp 0
