% fib(i, m): i-th fibonacci number is m
fib(0, 0).
fib(1, 1).
fib(N+2, F0+F1) :- fib(N, F0), fib(N+1, F1), N=0..(n-2).
