%%%Algorithm Specification

indexInSorted(I) :- sortedlist(I,_).

incorrect:- inList(N) , F1 = #count{I : instance(list(I,N))} , F2 = #count{I : sortedlist(I,N)} , F1!=F2.
incorrect:- sortedlist(I1,N1) , sortedlist(I1+1,N2) , N2 < N1.
incorrect:- indexInSorted(I), not indexIsUsed(I).
incorrect:- indexIsUsed(I) , not indexInSorted(I).
incorrect:- sortedlist(I,N1) , sortedlist(I,N2) , N1 != N2.
correct :- not incorrect.

:- correct.
#show correct/0.
#show incorrect/0.