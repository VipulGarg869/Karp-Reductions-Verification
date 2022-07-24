%%%%Algorithm Specification
colors(blue;red).
nc(color2,basis(vertex)).
%Possible solution of the problem.
ns(color2,candidate(set(V,C))) :- ns(color2,base(vertex,V)) , colors(C).
%A vertex can't be assigned 2 different colours.
ns(color2,incorrect) :- ns(color2,solution(set(V,C1))) , ns(color2,solution(set(V,C2))) , C1!=C2.
%Every vertex must be coloured.
ns(color2,coloured(V)) :- ns(color2,solution(set(V,_))).
ns(color2,incorrect) :- ns(color2,base(vertex,V)) , not ns(color2,coloured(V)).
%Adjacent vertices must not have the same colour.
ns(color2,incorrect) :- ns(color2,solution(set(V1,C))) , ns(color2,solution(set(V2,C))) , ns(color2,instance(edge(V1,V2))).

%Solution must only contain set(V,C) where candidate(set(V,C)) is true.
ns(color2,incorrect) :- ns(color2,solution(Y)) , not ns(color2,candidate(Y)).

ns(color2,correct) :- not ns(color2,incorrect).

ns(color2,domain(edge(X,Y))) :- ns(color2,base(vertex,X)) , ns(color2,base(vertex,Y)) , X < Y.