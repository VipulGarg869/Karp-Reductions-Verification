% Choose the winner according to Borda Rule

% Input : the number m of canditates 1..m ; the set votecount/2
% of pairs (R,N) such that the ranking R was selected by N voters;
% the set p/3 of triples (R,Pos,C) such that Pos is the posisition
% of candidate C in Ranking R.



rank_score(R,C,N*(m-Pos)) :- p(R,Pos,C),votecount(R,N).
score(C,N) :- C=1..m , N = #sum{S,R : rank_score(R,C,S)}.

loser(C) :- score(C,N) , score(C1,N1)  , N1 > N.

winner(C) :- C = 1..m , not loser(C).

#show winner/1.