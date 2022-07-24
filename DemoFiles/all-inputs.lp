%%% Input Generation
index(1). index(2). index(3). index(4).
possibleNumber(a). possibleNumber(b). possibleNumber(c).

 { list(I,N) : possibleNumber(N) }  :- index(I).


%%% integrity constraints

indexUsed(I) :- list(I,N).
:- index(I), not indexUsed(I).
:- list(I,A), list(I,B), A != B.
