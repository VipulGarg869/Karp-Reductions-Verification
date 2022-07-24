%Input Generation
base(index(1)..4).
base(possibleNumber(1..8)). % 8^5 = 32768 lists.

%Every index has a corresponding list(I,N) element.

1 { instance(list(I,N)) : base(possibleNumber(N))} 1 :- base(index(I)) .
