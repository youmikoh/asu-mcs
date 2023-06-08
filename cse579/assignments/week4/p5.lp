% Use clingo to find all solutions to the Offset Sudoku problem below.

% p5.lp

% each number 1..9 is assigned to one cell in each box
{a(X,Y,N): X=1..9, Y=1..9, X1<=X, X<=X1+2, Y1<=Y, Y<=Y1+2}=1 :- N=1..9, X1=3*(0..2)+1, Y1=3*(0..2)+1.

% no two different numbers given a row and a column
:- a(X,Y,N), a(X,Y,N1), N!=N1.

% no two different columns given a row and a number
:- a(X,Y,N), a(X,Y1,N), Y!=Y1.

% no two different rows given a column and a number
:- a(X,Y,N), a(X1,Y,N), X!=X1.

% every colour region must contain all the digits 1 through 9.
:- a(R,C,N), a(R1,C1,N), R\3==R1\3, C\3==C1\3, R!=R1, C!=C1.

% offset sudoku
a(1,3,7). a(1,7,8).
a(2,2,2). a(2,8,4).
a(3,1,8). a(3,3,4). a(3,5,2). a(3,7,5). a(3,9,1).
a(4,5,7).
a(5,3,8). a(5,4,3). a(5,5,6). a(5,6,4). a(5,7,2).
a(6,5,9).
a(7,1,3). a(7,3,2). a(7,5,8). a(7,7,7). a(7,9,4).
a(8,2,7). a(8,8,8).
a(9,3,6). a(9,7,9).


