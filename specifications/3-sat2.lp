%Algorithm Specification
ns(sat3p,basis(var)).
ns(sat3p,candidate(settrue(V))) :- ns(sat3p,base(var,V)).
ns(sat3p,satisfied(pos(V))) :- ns(sat3p,base(var,V)) , ns(sat3p,solution(settrue(V))).
ns(sat3p,satisfied(neg(V))) :- ns(sat3p,base(var,V)) , not ns(sat3p,solution(settrue(V))).

ns(sat3p,incorrect) :- ns(sat3p,solution(X)) , not ns(sat3p,candidate(X)).
ns(sat3p,incorrect) :- ns(sat3p,instance(clause(X,Y,Z))) , not ns(sat3p,satisfied(X)) ,not ns(sat3p,satisfied(Y)) , not ns(sat3p,satisfied(Z)).
ns(sat3p,correct) :- not ns(sat3p,incorrect).

% Instance of 3SAT
ns(sat3p,compatible(pos(X),pos(Y))) :- ns(sat3p,base(var,X)),ns(sat3p,base(var,Y)), X <= Y.
ns(sat3p,compatible(neg(X),pos(Y))) :- ns(sat3p,base(var,X)),ns(sat3p,base(var,Y)), X < Y.
ns(sat3p,compatible(pos(X),neg(Y))) :- ns(sat3p,base(var,X)),ns(sat3p,base(var,Y)), X < Y.
ns(sat3p,compatible(neg(X),neg(Y))) :- ns(sat3p,base(var,X)),ns(sat3p,base(var,Y)), X <= Y.
% ns(sat3p,domain(clause(X,Y,Z))):- ns(sat3p,literal(X)) , ns(sat3p,literal(Y)) , ns(sat3p,literal(Z)) , X <= Y , Y <= Z .
ns(sat3p,domain(clause(X,Y,Z))):- ns(sat3p,compatible(X,Y)) , ns(sat3p,compatible(Y,Z)).
ns(sat3p,literal(pos(X))) :- ns(sat3p,base(var,X)).
ns(sat3p,literal(neg(X))) :- ns(sat3p,base(var,X)).
