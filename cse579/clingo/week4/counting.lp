#count{Y: edge(X,Y)}.
  outdegree(X,N) :- vertex(X), N=#count{Y: edge(X,Y)}.
  branching_vertex(X) :- vertex(X), #count{Y: edge(X,Y)} > 1.

#count{X,Y: edge(X,Y)}.
  num_edges(N) :- N=#count{X,Y: edge(X,Y)}.

#count(X,Y,Z: edge(X,Y), edge(Y,Z))
  num_legnth2_path(N) :- N=#count{X,Y,Z: edge(X,Y), edge(Y,Z)}.
