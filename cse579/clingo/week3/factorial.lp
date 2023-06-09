% fac(i, m): i-th factorial is m
fac(0,1).
fac(N+1, F*(N+1)) :- fac(N, F), N=0..n.

fac(F) :- fac(N, F).
#show fac/1.
