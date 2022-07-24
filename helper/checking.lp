%Checking if Reduction is CORRECT.
size(3).
% maxinstancesize(4).
instancesize(1).
instancebounded :- maxinstancesize(M).
instancebounded :- instancesize(M).

0 {ns(Y,instance(X))} 1 :- ns(Y,domain(X)), not instancebounded,input(Y).

0 {ns(Y,instance(X)) : ns(Y,domain(X))} M :- maxinstancesize(M), input(Y).
M {ns(Y,instance(X)) : ns(Y,domain(X))} M :- instancesize(M), input(Y).

ns(X,base(B,1..S)) :- size(S) , ns(X,basis(B)), input(X).

{ns(X,solution(Y))} :- ns(X,candidate(Y)) , input(X) ,  direct.
:- ns(X,correct) , ns(Y,correct) , direct , input(X) , output(Y).
:- direct , not ns(X,correct) , input(X).

{ns(Y,solution(X))} :- ns(Y,candidate(X)) , not direct , output(Y).
:- ns(X,correct) , ns(Y,correct) , not direct , input(X) , output(Y).
:- not direct, not ns(Y,correct) , output(Y).

% direct.
