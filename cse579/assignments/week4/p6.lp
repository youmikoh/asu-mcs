% Use clingo to find all solutions to the Anti-Knight Sudoku problem presented below

% p6.lp

% each number 1..9 is assigned to one cell in each box
{a(X,Y,N): X=1..9, Y=1..9, X1<=X, X<=X1+2, Y1<=Y, Y<=Y1+2}=1 :- N=1..9, X1=3*(0..2)+1, Y1=3*(0..2)+1.

% no two different numbers given a row and a column
:- a(X,Y,N), a(X,Y,N1), N!=N1.

% no two different columns given a row and a number
:- a(X,Y,N), a(X,Y1,N), Y!=Y1.

% no two different rows given a column and a number
:- a(X,Y,N), a(X1,Y,N), X!=X1.

% cells that are a chess knight’s move away from each other cannot hold the same number
:- a(R,C,N), a(R1,C1,N), |R1-R|+|C1-C|==3.

% anti-knight sudoku
a(1,1,3). a(1,9,4).
a(2,4,6). a(2,6,9).
a(3,3,6). a(3,7,9).
a(4,2,8). a(4,4,3). a(4,6,2). a(4,8,6).
a(5,5,7).
a(6,2,1). a(6,4,8). a(6,6,5). a(6,8,7).
a(7,3,7). a(7,7,8).
a(8,4,7). a(8,6,8).
a(9,1,9). a(9,9,7).
