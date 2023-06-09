#const n=8.

1 {queen(R, 1..n)} 1 :- R=1..n.

:-queen(R1, C), queen(R2, C).
