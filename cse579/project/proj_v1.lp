% Define the grid
#const x_max = 4.
#const y_max = 4.

% Generate the grid
x(1..x_max).
y(1..y_max).
node(X, Y) :- x(X), y(Y).

% Define the input
init(object(node, n), value(at, pair(X, Y))) :- node(X, Y).
init(object(highway, h), value(at, pair(X, Y))) :- node(X, Y), (X = 1; X = x_max; Y = 1; Y = y_max).
init(object(pickingStation, p), value(at, pair(X, Y))) :- node(X, Y), (X = 2, Y = 2; X = 3, Y = 3).
init(object(robot, r), value(at, pair(X, Y))) :- node(X, Y), (X = 2, Y = 3; X = 3, Y = 2).
init(object(shelf, s), value(at, pair(X, Y))) :- node(X, Y), (X = 2, Y = 4; X = 3, Y = 4; X = 4, Y = 4; X = 4, Y = 3; X = 4, Y = 2; X = 4, Y = 1).
init(object(product, i), value(on, pair(S, U))) :- init(object(shelf, S), value(at, _)), (i = 1, U = 1; i = 2, U = 1; i = 3, U = 4; i = 4, U = 1).
init(object(order, o), value(line, pair(I, U))) :- (o = 1, I = 1, U = 1; o = 1, I = 3, U = 4; o = 2, I = 2, U = 1; o = 3, I = 4, U = 1).
init(object(order, o), value(pickingStation, P)) :- (o = 1, P = 1; o = 2, P = 2; o = 3, P = 2).

% Define the actions
occurs(object(robot, r), move(DX, DY), T) :- init(object(robot, r), value(at, pair(X, Y))), (DX=1, DY=0; DX=-1, DY=0; DX=0, DY=1; DX=0, DY=-1), T = 1..13.
occurs(object(robot, r), pickup, T) :- T = 1..13.
occurs(object(robot, r), deliver(O, I, U), T) :- init(object(order, O), value(line, pair(I, U))), T = 1..13.
occurs(object(robot, r), putdown, T) :- T = 1..13.

% Define the constraints
:- occurs(object(robot, R1), move(DX, DY), T), occurs(object(robot, R2), move(-DX, -DY), T), R1 != R2.
:- occurs(object(robot, R), putdown, T), init(object(robot, R), value(at, pair(X, Y))), init(object(highway, _), value(at, pair(X, Y))).

% Optimize the makespan
#minimize {T : occurs(_, _, T)}.

% Output the solution
#show occurs/3.
