% initial condition
:- not loc(monkey,l1,0).
:- not loc(bananas,l2,0).
:- not loc(box,l3,0).
:- not hasBananas(f,0).

% goal
:- not hasBananas(t,m).

% clingo monkey.lp monkey-planning.lp -c m=4
