%% Example Input

list(1,27).
list(2,12).
list(3,1).
list(4,18).
list(5,14).
list(6,19).

% %%% Input Generation
% index(3..6).
% possibleNumber(1..10).
% 1 { instance(list(I,N)) : possibleNumber(N) } 1 :- index(I).

%%%% Algorithm Description
indexIsUsed(I) :- instance(list(I,N)).
firstIndex(I) :- indexIsUsed(I), not indexIsUsed(I-1).
lastIndex(I)  :- indexIsUsed(I), not indexIsUsed(I+1).
%lastIndex(5).

sofar(I,N) :- firstIndex(I), instance(list(I,N)).
sofar(I+1,N) :- sofar(I,M), instance(list(I+1,N)), M < N.
sofar(I+1,M) :- sofar(I,M), instance(list(I+1,N)), M >= N.

solution(maximum(N)) :- sofar(I,N), lastIndex(I).


%%%% Algorithm Specification
hasFoundAMax :- solution(maximum(M)).
incorrect :- not hasFoundAMax.
incorrect :- solution(maximum(M)), instance(list(I,N)), N > M.
correct :- not incorrect.

% :- incorrect. % integrity constraint.

:- correct.
%%% Generator Based Solver
% inList(N) :- instance(list(I,N)).

% 1 {solution(maximum(N)) : inList(N)} 1.

% :- inList(M) , solution(maximum(N)) , M > N.
#show.
#show instance/1.
#show solution/1.
#show correct/0.
#show incorrect/0.
