% Partitioning {1...n} into r sum-free sets.

1 { in(I,1..r)} 1 :- I=1..n.

:- in(I,X), in(J,X) , in(I+J,X) .

#const n = 45.
#const r = 4.