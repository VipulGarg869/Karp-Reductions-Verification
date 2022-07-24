ns(vc,basis(vertex)).
ns(vc,candidate(select(X))) :- ns(vc,base(vertex,X)).
ns(vc,incorrect) :- N = #count{X : ns(vc,solution(select(X)))} , ns(vc,instance(threshold(M))) , N > M.
% ns(vc,incorrect) :- (M + 1) #count{X : ns(vc,solution(select(X)))}, ns(vc,instance(threshold(M))).
ns(vc,incorrect) :- ns(vc,solution(X)) , not ns(vc,candidate(X)).
ns(vc,incorrect) :- ns(vc,instance(edge(X,Y))) , not ns(vc,solution(select(X))) , not ns(vc,solution(select(Y))).
ns(vc,correct) :- not ns(vc,incorrect).

ns(vc,domain(edge(X,Y))) :- ns(vc,base(vertex,X)) , ns(vc,base(vertex,Y)) , X < Y.
ns(vc,domain(threshold(0..S))) :- size(S).