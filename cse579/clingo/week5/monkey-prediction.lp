:- not loc(monkey,l1,0).
:- not loc(bananas,l2,0).
:- not loc(box,l3,0).
:- not walk(l3,0).
:- not pushBox(l2,1).

:- #count{LL:loc(monkey,LL,2), loc(bananas,LL,2), loc(box,LL,2)}=1

% clingo monkey.lp monkey-prediction.lp -c m=2
