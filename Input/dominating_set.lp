base(vertex(1..6)).
instance(edge(1,2 ; 2,3 ; 3,6 ; 1,5 ; 2,5 ; 3,4 ; 5,4)).

domain(threshold(0..6)).
instance(threshold(2)).

solution(select(5)).
solution(select(3)).