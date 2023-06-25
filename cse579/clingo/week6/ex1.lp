unsat(1) :- not p.
p :- not unsat(1).
:~ unsat(1). [1@1]

unsat(2) :- p, not q.
q :- p, not unsat(2).
:~ unsat(2). [10@0]

unsat(3) :- not q.
q :- not unsat(3).
:~ unsat(3). [-20@0]

% clingo ex1.lp --opt-mode=enum 0
% clingo ex1.lp --opt-mode=enum

