%%%Algorithm Description

inList(N) :- instance(list(_,N)).
indexIsUsed(I) :- instance(list(I,_)).
% lastIndex(I) :- indexIsUsed(I), not indexIsUsed(I+1).
noofindices(I) :- I = #count{X : base(index(X))}.
lastIndex(I) :- I=#max{ X : base(index(X))}.
iterations(N) :- noofindices(I) , N = (I-1)*(I-1).


sortedlist(I,N,0) :- instance(list(I,N)).

%\ is for modulus.

%%% Very simple implementation of Bubble Sort.
sortedlist(I,N,T) :- iterations(W) , T<=W , I != T\(K-1) + 1 , I != T\(K-1) + 2, lastIndex(K) , sortedlist(I,N,T-1). 
sortedlist(T\(K-1)+1,N1,T) :- iterations(W) , T<= W , lastIndex(K) , sortedlist(T\(K-1)+1,N1,T-1) , sortedlist(T\(K-1)+2,N2,T-1) , N1<N2.
sortedlist(T\(K-1)+1,N2,T) :- iterations(W) , T<= W , lastIndex(K) , sortedlist(T\(K-1)+1,N1,T-1) , sortedlist(T\(K-1)+2,N2,T-1) , N2<=N1.
sortedlist(T\(K-1)+2,N1,T) :- iterations(W) , T<= W , lastIndex(K) , sortedlist(T\(K-1)+1,N1,T-1) , sortedlist(T\(K-1)+2,N2,T-1) , N1>=N2.
sortedlist(T\(K-1)+2,N2,T) :- iterations(W) , T<= W , lastIndex(K) , sortedlist(T\(K-1)+1,N1,T-1) , sortedlist(T\(K-1)+2,N2,T-1) , N2>N1.


sortedlist(I,N) :- sortedlist(I,N,W) , iterations(W).

#show instance/1.
#show sortedlist/2.