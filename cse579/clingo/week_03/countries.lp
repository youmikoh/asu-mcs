size(france, 65). size(germany, 83). size(italy, 61). size(uk, 64).
% size(russia, 142).
% large(C) :- size(C, S1), size(uk, S2), S1 > S2.
small(C) :- size(C, S1), size(france, S2), S1 < S2.
