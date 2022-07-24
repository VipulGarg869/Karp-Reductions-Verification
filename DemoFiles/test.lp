brother(adam,ben).
father(ben,charles).
brother(charles,dima).
sister(dima,emma).
mother(dima,frank).


related(X,Y) :- brother(X,Y). % rule 1
related(X,Y) :- father(X,Y). % rule 2
related(X,Y) :- mother(X,Y).
related(X,Y) :- sister(X,Y).
related(X,Z) :- related(X,Y), related(Y,Z), X != Z. % rule 5
related(Y,X) :- related(X,Y). % rule 6


%related(dima,emma). %from the database + rule 4
%related(emma,dima). % from rule 6

