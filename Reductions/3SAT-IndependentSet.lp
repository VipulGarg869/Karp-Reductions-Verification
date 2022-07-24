
%CREATING AN EQUIVALENT INSTANCE OF INDEPENDENT SET WHERE K = NUMBER OF CLAUSES.

%COMPUTATION OF THE THRESHOLD
ns(is,instance(threshold(K))) :- K = #count{X,Y,Z : ns(sat3,instance(clause(X,Y,Z)))}.
%%%Creating vertices of the graph.
ns(is,base(vertex,clausegadget(X,Y,Z,X))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(is,base(vertex,clausegadget(X,Y,Z,Y))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(is,base(vertex,clausegadget(X,Y,Z,Z))) :- ns(sat3,instance(clause(X,Y,Z))).

%%%EDGE CREATION
%FOR CLAUSE GADGET.
ns(is,instance(edge(clausegadget(X,Y,Z,X),clausegadget(X,Y,Z,Y)))) :- ns(sat3,instance(clause(X,Y,Z))) , X!=Y.
ns(is,instance(edge(clausegadget(X,Y,Z,X),clausegadget(X,Y,Z,Z)))) :- ns(sat3,instance(clause(X,Y,Z))) , X!=Z.
ns(is,instance(edge(clausegadget(X,Y,Z,Z),clausegadget(X,Y,Z,Y)))) :- ns(sat3,instance(clause(X,Y,Z))) , Z!=Y.
%BETWEEN OPPOSITE LITERALS
ns(is,instance(edge(clausegadget(X1,Y1,Z1,X),clausegadget(X2,Y2,Z2,Y)))) :- ns(is,base(vertex,clausegadget(X1,Y1,Z1,X))) , ns(is,base(vertex,clausegadget(X2,Y2,Z2,Y))) , ns(sat3,base(var,V)) , X=pos(V) , Y = neg(V).
%%%REDUCTION COMPLETE

%%%SOLUTION OF INDEPENDENT SET IN TERMS OF 3 SAT AND VICE VERSA
ns(is,solution(select(clausegadget(X,Y,Z,X)))) :- ns(sat3,instance(clause(X,Y,Z))) , ns(sat3,satisfied(X)) ,ns(sat3,satisfied(Y)) ,ns(sat3,satisfied(Z)),direct.
ns(is,solution(select(clausegadget(X,Y,Z,X)))) :- ns(sat3,instance(clause(X,Y,Z))) , ns(sat3,satisfied(X)) ,ns(sat3,satisfied(Y)) ,not ns(sat3,satisfied(Z)),direct.
ns(is,solution(select(clausegadget(X,Y,Z,X)))) :- ns(sat3,instance(clause(X,Y,Z))) , ns(sat3,satisfied(X)) ,not ns(sat3,satisfied(Y)) ,ns(sat3,satisfied(Z)),direct.
ns(is,solution(select(clausegadget(X,Y,Z,Y)))) :- ns(sat3,instance(clause(X,Y,Z))) , not ns(sat3,satisfied(X)) ,ns(sat3,satisfied(Y)) ,ns(sat3,satisfied(Z)),direct.
ns(is,solution(select(clausegadget(X,Y,Z,Z)))) :- ns(sat3,instance(clause(X,Y,Z))) , not ns(sat3,satisfied(X)) ,not ns(sat3,satisfied(Y)) ,ns(sat3,satisfied(Z)),direct.
ns(is,solution(select(clausegadget(X,Y,Z,X)))) :- ns(sat3,instance(clause(X,Y,Z))) , ns(sat3,satisfied(X)) ,not ns(sat3,satisfied(Y)) ,not ns(sat3,satisfied(Z)),direct.
ns(is,solution(select(clausegadget(X,Y,Z,Y)))) :- ns(sat3,instance(clause(X,Y,Z))) , not ns(sat3,satisfied(X)) ,ns(sat3,satisfied(Y)) ,not ns(sat3,satisfied(Z)),direct.

ns(sat3,solution(set(V,true))) :- ns(is,solution(select(clausegadget(_,_,_,pos(V))))) , not direct.
ns(sat3,solution(set(V,false))) :- ns(is,solution(select(clausegadget(_,_,_,neg(V))))) , not direct.
ns(sat3,solution(set(V,true))) :- not ns(is,solution(select(clausegadget(_,_,_,neg(V))))) , ns(sat3,base(var,V)) , not direct.

input(sat3).
output(is).

