base(vertex(1..8)).

instance(edge(1,2 ; 1,3 ; 2,4 ; 5,6 ; 6,7 ; 4,8)).

domain(threshold(0..8)).
instance(threshold(5)).

solution(select(2)).
solution(select(8)).
solution(select(7)).
solution(select(5)).
solution(select(3)).