%Input Generation
base(var(a;b;c)).
literals(pos(X)) :- base(var(X)).
literals(neg(X)) :- base(var(X)).

0 {instance(clause(X,Y))} 1 :- literals(X) , literals(Y) , X < Y.
