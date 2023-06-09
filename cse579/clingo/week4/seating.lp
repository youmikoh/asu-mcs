% at(G,C) means that guest G is assigned chair C.
% each guest is assigned a chair. n^n
{at(G,1..n)}=1 :- G=1..n.

% different guests are assigned different chairs. n!
G1=G2 :- at(G1,C), at(G2,C).

% adj(X,Y) iff chair X is adjacent to chair Y. n!
adj(X,Y) :- X=1..n, Y=1..n, |X-Y|=1.
adj(n,1; 1,n).

% guests who like each other sit next to each other.
% :- like(G1,G2), at(G1,C1), at(G2,C2), not adj(C1,C2).
% like(G1,G2) :- at(G1,C1), at(G2,C2), adj(C1,C2). % why is this different?
adj(C1,C2) :- like(G1,G2), at(G1,C1), at(G2,C2). % why is this different?

% guests who don’t like each other don’t sit to each other.
:- dislike(G1,G2), at(G1,C1), at(G2,C2), adj(C1,C2).

#show at/2.
