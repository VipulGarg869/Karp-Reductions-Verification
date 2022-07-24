
%Creating equivalent instance of 4SAT. Simple enough reduction.
ns(sat4,base(var,X)) :- ns(sat3,base(var,X)).
ns(sat4,instance(clause(X,Y,Z,X))) :- ns(sat3,instance(clause(X,Y,Z))).
%%REDUCTION COMPLETE

% Solution of 4 SAT INSTANCE IN TERMS OF 3 SAT AND VICE VERSA
ns(sat4,solution(set(V,B))) :- ns(sat3,solution(set(V,B))), direct.

ns(sat3,solution(set(V,B))) :- ns(sat4,solution(set(V,B))), not direct.


input(sat3).
output(sat4).
