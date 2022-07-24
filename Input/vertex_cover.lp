size(10).

base(vertex(1..N)) :- size(N).
domain(edge(X,Y)) :- base(vertex(X)) , base(vertex(Y)).
domain(threshold(0..N)) :- size(N).

solution(select(2)).
solution(select(4)).


instance(edge(1,2 ; 2,3 ; 3,4)).
instance(threshold(2)).