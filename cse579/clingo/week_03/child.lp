parent(apple,banana). parent(banana,cat). parent(banana,dog).
child(X,Y) :- parent(Y,X).
% grandparent(X,Z) :- parent(X,Y), parent(Y,Z).
% siblings(X,Y) :- parent(Z,X), parent(Z,Y), X != Y.
% parent(X,Y) :- father(X,Y).
% parent(X,Y) :- mother(X,Y).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Z) :- ancestor(X,Y), acnestor(Y,Z).
