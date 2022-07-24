
1 { at (1.. n , C )} 1 :- C =1.. n .
C1 = C2 :- at (G , C1 ) , at (G , C2 ).
adj (X , Y ) :- X =1.. n , Y =1.. n , |X - Y |=1.
adj (1 , n ; n ,1).
:- at (G1 , C1) , at (G2, C2) , adj(C1,C2) , dislike(G1,G2).
:- at (G1 , C1) , at (G2, C2) , not adj(C1,C2) , like(G1,G2).
#show at/2.