
%%%Algorithm Specification
ns(is,basis(vertex)).
ns(is,candidate(select(X))) :- ns(is,base(vertex,X)).
ns(is,adj(X,Y)) :- ns(is,instance(edge(X,Y))).
ns(is,adj(X,Y)) :- ns(is,instance(edge(Y,X))).
ns(is,incorrect) :- ns(is,solution(select(X))), ns(is,solution(select(Y))) , ns(is,adj(X,Y)).
ns(is,incorrect) :- ns(is,solution(X)) , not ns(is,candidate(X)).
ns(is,incorrect) :- N = #count{X : ns(is,solution(select(X)))} , ns(is,instance(threshold(T))) , N < T.
ns(is,correct) :- not ns(is,incorrect).

ns(is,domain(edge(X,Y))) :- ns(is,base(vertex,X)) , ns(is,base(vertex,Y)) , X < Y.
ns(is,domain(threshold(0..S))) :- size(S).