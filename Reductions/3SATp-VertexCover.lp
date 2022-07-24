
%%CONVERSION TO AN EQUIVALENT INSTANCE OF VERTEX COVER IN WHICH GRAPH IS CREATED BY CONSTRUCTION DESCRIBED BELOW AND K = N + 2M WHERE N = NO OF VARIABLES, M = NO OF CLAUSES

%COMPUTATION OF THE VALUE OF K.
totalvariables(N) :- N = #count{X : ns(sat3p,base(var,X))}.
totalclauses(M) :- M = #count{X,Y,Z : ns(sat3p,instance(clause(X,Y,Z)))}.
ns(vc,instance(threshold(N+2*M))) :- totalclauses(M) , totalvariables(N).

%%%%%%Creating vertices of the graph

ns(vc,base(vertex,vargadget(pos(V)))) :- ns(sat3p,base(var,V)).
ns(vc,base(vertex,vargadget(neg(V)))) :- ns(sat3p,base(var,V)).

ns(vc,base(vertex,clausegadget(X,Y,Z,1))) :- ns(sat3p,instance(clause(X,Y,Z))).
ns(vc,base(vertex,clausegadget(X,Y,Z,2))) :- ns(sat3p,instance(clause(X,Y,Z))).
ns(vc,base(vertex,clausegadget(X,Y,Z,3))) :- ns(sat3p,instance(clause(X,Y,Z))).
%%%%VERTEX CREATION COMPLETE. ONTO EDGE CREATION

%Vertex Gadget Edge
ns(vc,instance(edge(vargadget(pos(V)),vargadget(neg(V))))) :- ns(sat3p,base(var,V)). 
%Clause Gadget Edge
ns(vc,instance(edge(clausegadget(X,Y,Z,1),clausegadget(X,Y,Z,2)))) :- ns(sat3p,instance(clause(X,Y,Z))).
ns(vc,instance(edge(clausegadget(X,Y,Z,2),clausegadget(X,Y,Z,3)))) :- ns(sat3p,instance(clause(X,Y,Z))).
ns(vc,instance(edge(clausegadget(X,Y,Z,3),clausegadget(X,Y,Z,1)))) :- ns(sat3p,instance(clause(X,Y,Z))).

%Edge between clause vertex and vertex gadget.
ns(vc,instance(edge(vargadget(X),clausegadget(X,Y,Z,1)))) :- ns(vc,base(vertex,vargadget(X))) , ns(vc,base(vertex,clausegadget(X,Y,Z,1))).
ns(vc,instance(edge(vargadget(Y),clausegadget(X,Y,Z,2)))) :- ns(vc,base(vertex,vargadget(X))) , ns(vc,base(vertex,clausegadget(X,Y,Z,2))).
ns(vc,instance(edge(vargadget(Z),clausegadget(X,Y,Z,3)))) :- ns(vc,base(vertex,vargadget(X))) , ns(vc,base(vertex,clausegadget(X,Y,Z,3))).

%%SOLUTION OF Vertex Cover Instance in terms of 3SAT and vice versa


ns(vc,solution(select(vargadget(pos(V))))) :- ns(sat3p,solution(settrue(V))) ,direct.
ns(vc,solution(select(vargadget(neg(V))))) :- not ns(sat3p,solution(settrue(V))) , ns(sat3p,base(var,V)),direct.
% ns(vc,satisfied(pos(V))) :- ns(sat3p,solution(settrue(V))),direct.
% ns(vc,satisfied(neg(V))) :- not ns(sat3p,solution(settrue(V))) , ns(sat3p,base(var,V)),direct.
ns(vc,solution(select(clausegadget(X,Y,Z,2)))) :- ns(vc,solution(select(vargadget(X)))),ns(sat3p,instance(clause(X,Y,Z))),direct.
ns(vc,solution(select(clausegadget(X,Y,Z,3)))) :- ns(vc,solution(select(vargadget(X)))),ns(sat3p,instance(clause(X,Y,Z))),direct.
ns(vc,solution(select(clausegadget(X,Y,Z,1)))) :- not ns(vc,solution(select(vargadget(X)))),     ns(vc,solution(select(vargadget(Y)))) , ns(sat3p,instance(clause(X,Y,Z))),direct.
ns(vc,solution(select(clausegadget(X,Y,Z,3)))) :- not ns(vc,solution(select(vargadget(X)))),     ns(vc,solution(select(vargadget(Y)))) , ns(sat3p,instance(clause(X,Y,Z))),direct.
ns(vc,solution(select(clausegadget(X,Y,Z,1)))) :- not ns(vc,solution(select(vargadget(X)))), not ns(vc,solution(select(vargadget(Y)))) , ns(vc,solution(select(vargadget(Z)))), ns(sat3p,instance(clause(X,Y,Z))),direct.
ns(vc,solution(select(clausegadget(X,Y,Z,2)))) :- not ns(vc,solution(select(vargadget(X)))), not ns(vc,solution(select(vargadget(Y)))) , ns(vc,solution(select(vargadget(Z)))), ns(sat3p,instance(clause(X,Y,Z))),direct.

ns(sat3p,solution(settrue(V))) :- ns(vc,solution(select(vargadget(pos(V))))) , not direct.

input(sat3p).
output(vc).


