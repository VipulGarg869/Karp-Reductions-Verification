%%%%Algorithm Specification
colors(blue;red;green).
ns(color3,basis(vertex)).
%Possible solution of the problem.
ns(color3,candidate(set(V,C))) :- ns(color3,base(vertex,V)) , colors(C).
%A vertex can't be assigned 2 different colours.
ns(color3,incorrect) :- ns(color3,solution(set(V,C1))) , ns(color3,solution(set(V,C2))) , C1!=C2.
%Every vertex must be coloured.
ns(color3,coloured(V)) :- ns(color3,solution(set(V,_))).
ns(color3,incorrect) :- ns(color3,base(vertex,V)) , not ns(color3,coloured(V)).
%Adjacent vertices must not have the same colour.
ns(color3,incorrect) :- ns(color3,solution(set(V1,C))) , ns(color3,solution(set(V2,C))) , ns(color3,instance(edge(V1,V2))).
%Solution must only contain set(V,C) where candidate(set(V,C)) is true.
ns(color3,incorrect) :- ns(color3,solution(Y)) , not ns(color3,candidate(Y)).
ns(color3,correct) :- not ns(color3,incorrect).

ns(color3,domain(edge(X,Y))) :- ns(color3,base(vertex,X)) , ns(color3,base(vertex,Y)) , X < Y.