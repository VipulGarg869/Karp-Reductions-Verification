#const n = 3.

given(1,1,6 ; 2,2,2 ; 2,3,8 ; 3,1,1).


1 {filled(R,C,1..n*n)} 1 :- R=1..n , C=1..n.
:- filled(R1,_,X) , filled(R2,_,X) , R1!=R2.
:- filled(_,C1,X) , filled(_,C2,X) , C1!=C2.
:- filled(R1,C1,X) , filled(R2,C2,X+1) , (R1-R2)**2 + (C1-C2)**2 > 2.

:- given(R,C,X), not filled(R,C,X).

#show filled/3.