%%% Example Input

%list(1,27).
%list(2,12).
%list(3,1).
%list(4,18).
%list(5,14). % [17,12,1,20,14]
%list(6,19).

%%% Input Generation
index(3..6).
possibleNumber(1..10).
1 { list(I,N) : possibleNumber(N) } 1 :- index(I).

%%%% Algorithm Description
indexIsUsed(I) :- list(I,N).
firstIndex(I) :- indexIsUsed(I), not indexIsUsed(I-1).
lastIndex(I)  :- indexIsUsed(I), not indexIsUsed(I+1).
%lastIndex(5).

sofar(I,N) :- list(I,N), firstIndex(I).
sofar(I+1,N) :- sofar(I,M), list(I+1,N), M < N.
sofar(I+1,M) :- sofar(I,M), list(I+1,N), M >= N.

maximum(N) :- sofar(I,N), lastIndex(I).


%%%% Algorithm Specification
hasFoundAMax :- maximum(M).
incorrect :- not hasFoundAMax.
incorrect :- maximum(M), list(I,N), N > M.
correct :- not incorrect.

:- incorrect. % integrity constraint.

#show.
#show list/2.
#show maximum/1.
#show correct/0.
#show incorrect/0.
