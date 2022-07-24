
%Algorithm Specification
bool(true;false).
ns(sat4,basis(var)).
ns(sat4,candidate(set(V,B))) :- ns(sat4,base(var,V)) , bool(B).
ns(sat4,satisfied(pos(V))) :- ns(sat4,base(var,V)) , ns(sat4,solution(set(V,true))).
ns(sat4,satisfied(neg(V))) :- ns(sat4,base(var,V)) , ns(sat4,solution(set(V,false))).

ns(sat4,assigned(V)) :- ns(sat4,solution(set(V,_))).
ns(sat4,incorrect) :- ns(sat4,base(var,V)) , not ns(sat4,assigned(V)).
ns(sat4,incorrect) :- ns(sat4,solution(set(V,B1))) , ns(sat4,solution(set(V,B2))) , B1 != B2.
ns(sat4,incorrect) :- ns(sat4,solution(X)) , not ns(sat4,candidate(X)).
ns(sat4,incorrect) :- ns(sat4,instance(clause(X,Y,Z,W))) , not ns(sat4,satisfied(X)) ,not ns(sat4,satisfied(Y)) , not ns(sat4,satisfied(Z)) , not ns(sat4,satisfied(W)).
ns(sat4,correct) :- not ns(sat4,incorrect).

%Domain of 4SAT
ns(sat4,domain(clause(X,Y,Z,W))) :- ns(sat4,literal(X)),ns(sat4,literal(Y)) , ns(sat4,literal(Z)) , ns(sat4,literal(W0)) , X<=Y , Y<=Z , Z<=W.
ns(sat4,literal(pos(X))) :- ns(sat4,base(var,X)).
ns(sat4,literal(neg(X))) :- ns(sat4,base(var,X)).
