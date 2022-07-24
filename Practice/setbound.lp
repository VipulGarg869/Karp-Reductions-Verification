%Among the subsets of a given set of numbers for which the sum 
%doesn't exceed the given upper bound find the one for which this
%sum is maximal.

#const m = 22.
number(1;3;5;10;20).
{in(X)} :- number(X).
:- #sum{X : in(X)} > m.

#maximize{1,X : in(X)}.

#show in/1.