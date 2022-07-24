%Algorithm Specification
bool(true;false).
ns(sat3,basis(var)).
ns(sat3,candidate(set(V,B))) :- ns(sat3,base(var,V)) , bool(B).
ns(sat3,satisfied(pos(V))) :- ns(sat3,base(var,V)) , ns(sat3,solution(set(V,true))).
ns(sat3,satisfied(neg(V))) :- ns(sat3,base(var,V)) , ns(sat3,solution(set(V,false))).

ns(sat3,assigned(V)) :- ns(sat3,solution(set(V,_))).
ns(sat3,incorrect) :- ns(sat3,base(var,V)) , not ns(sat3,assigned(V)).
ns(sat3,incorrect) :- ns(sat3,solution(set(V,B1))) , ns(sat3,solution(set(V,B2))) , B1 != B2.
ns(sat3,incorrect) :- ns(sat3,solution(X)) , not ns(sat3,candidate(X)).
ns(sat3,incorrect) :- ns(sat3,instance(clause(X,Y))) , not ns(sat3,satisfied(X)) ,not ns(sat3,satisfied(Y)).
ns(sat3,correct) :- not ns(sat3,incorrect).

% Domain of 2SAT
ns(sat3,domain(clause(X,Y))):- ns(sat3,literal(X)) , ns(sat3,literal(Y)) , X <= Y.

ns(sat3,literal(pos(X))) :- ns(sat3,base(var,X)).
ns(sat3,literal(neg(X))) :- ns(sat3,base(var,X)).
