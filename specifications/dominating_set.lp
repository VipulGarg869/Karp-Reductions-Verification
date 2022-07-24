%%Algorithm Specification
ns(ds,basis(vertex)).
ns(ds,candidate(select(X))) :- ns(ds,base(vertex,X)).
ns(ds,adj(X,Y)) :- ns(ds,instance(edge(X,Y))).
ns(ds,adj(X,Y)) :- ns(ds,instance(edge(Y,X))).

ns(ds,notselected(E)) :- ns(ds,base(vertex,E)) , not ns(ds,selected(E)).
ns(ds,selected(E)) :- ns(ds,solution(select(E))).

ns(ds,connected(V)) :- ns(ds,solution(select(E))) , ns(ds,adj(V,E)).
ns(ds,incorrect):- ns(ds,notselected(V)) , not ns(ds,connected(V)).

ns(ds,incorrect) :- N = #count{X : ns(ds,solution(select(X)))} , ns(ds,instance(threshold(T))) , N > T.
ns(ds,incorrect) :- ns(ds,solution(X)) , not ns(ds,candidate(X)).
ns(ds,correct) :- not ns(ds,incorrect).

ns(ds,domain(edge(X,Y))) :- ns(ds,base(vertex,X)) , ns(ds,base(vertex,Y)) , X < Y.
ns(ds,domain(threshold(0..S))) :- size(S). 
