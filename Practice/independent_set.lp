1 {color(X,C) : colors(C)} 1 :- vertex(X).

:- color(X,C1), color(Y,C2),C1=C2, edge(X,Y).
#show color/2.

