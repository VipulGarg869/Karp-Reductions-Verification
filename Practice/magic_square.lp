#const n = 3.

1 { num (R , C , 1..n*n)} 1 :- R=1..n , C = 1..n.

:- num(R1,_,X) , num(R2,_,X) , R1 != R2.
:- num(_,C1,X) , num(_,C2,X) , C1 != C2.

#const magic = (n**3 + n)/2.


%Fix R, the calculate sum
:- #sum{X : num(R,_,X)} != magic, R = 1..n.
:- #sum{X : num(_,C,X)} != magic, C = 1..n.

%No need to fix R here.
:- #sum{X : num(R,R,X)} != magic.
:- #sum{X : num(R,n-R+1,X)} !=magic.