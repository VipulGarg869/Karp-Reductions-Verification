

%%CONVERSION TO AN EQUIVALENT INSTANCE OF VERTEX COVER IN WHICH GRAPH IS CREATED BY CONSTRUCTION DESCRIBED BELOW AND K = N + 2M WHERE N = NO OF VARIABLES, M = NO OF CLAUSES

%COMPUTATION OF THE VALUE OF K.
totalvariables(N) :- N = #count{X : ns(sat3,base(var,X))}.
totalclauses(M) :- M = #count{X,Y,Z : ns(sat3,instance(clause(X,Y,Z)))}.
ns(vc,instance(threshold(N+2*M))) :- totalclauses(M) , totalvariables(N).

%%%%%%Creating vertices of the graph

ns(vc,base(vertex,vargadget(pos(V)))) :- ns(sat3,base(var,V)).
ns(vc,base(vertex,vargadget(neg(V)))) :- ns(sat3,base(var,V)).

ns(vc,base(vertex,clausegadget(X,Y,Z,1))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(vc,base(vertex,clausegadget(X,Y,Z,2))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(vc,base(vertex,clausegadget(X,Y,Z,3))) :- ns(sat3,instance(clause(X,Y,Z))).
%%%%VERTEX CREATION COMPLETE. ONTO EDGE CREATION

%Vertex Gadget Edge
ns(vc,instance(edge(vargadget(pos(V)),vargadget(neg(V))))) :- ns(sat3,base(var,V)). 
%Clause Gadget Edge
ns(vc,instance(edge(clausegadget(X,Y,Z,1),clausegadget(X,Y,Z,2)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(vc,instance(edge(clausegadget(X,Y,Z,2),clausegadget(X,Y,Z,3)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(vc,instance(edge(clausegadget(X,Y,Z,3),clausegadget(X,Y,Z,1)))) :- ns(sat3,instance(clause(X,Y,Z))).

%Edge between clause vertex and vertex gadget.
ns(vc,instance(edge(vargadget(X),clausegadget(X,Y,Z,1)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(vc,instance(edge(vargadget(Y),clausegadget(X,Y,Z,2)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(vc,instance(edge(vargadget(Z),clausegadget(X,Y,Z,3)))) :- ns(sat3,instance(clause(X,Y,Z))).

%%SOLUTION OF Vertex Cover Instance in terms of 3SAT and vice versa


ns(vc,solution(select(vargadget(pos(V))))) :- ns(sat3,solution(set(V,true))).
ns(vc,solution(select(vargadget(neg(V))))) :- ns(sat3,solution(set(V,false))).
ns(vc,satisfied(pos(V))) :- ns(sat3,solution(set(V,true))).
ns(vc,satisfied(neg(V))) :- ns(sat3,solution(set(V,false))). 
ns(vc,solution(select(clausegadget(X,Y,Z,2)))) :- ns(vc,satisfied(X)),ns(sat3,instance(clause(X,Y,Z))).
ns(vc,solution(select(clausegadget(X,Y,Z,3)))) :- ns(vc,satisfied(X)),ns(sat3,instance(clause(X,Y,Z))).
ns(vc,solution(select(clausegadget(X,Y,Z,1)))) :- not ns(vc,satisfied(X)), ns(vc,satisfied(Y)), ns(sat3,instance(clause(X,Y,Z))).
ns(vc,solution(select(clausegadget(X,Y,Z,3)))) :- not ns(vc,satisfied(X)), ns(vc,satisfied(Y)), ns(sat3,instance(clause(X,Y,Z))).
ns(vc,solution(select(clausegadget(X,Y,Z,1)))) :- not ns(vc,satisfied(X)), not ns(vc,satisfied(Y)), ns(vc,satisfied(Z)), ns(sat3,instance(clause(X,Y,Z))).
ns(vc,solution(select(clausegadget(X,Y,Z,2)))) :- not ns(vc,satisfied(X)), not ns(vc,satisfied(Y)), ns(vc,satisfied(Z)), ns(sat3,instance(clause(X,Y,Z))).


ns(sat3,solution(set(V,true))) :- ns(vc,solution(select(vargadget(pos(V))))).
ns(sat3,solution(set(V,false))) :- ns(vc,solution(select(vargadget(neg(V))))).

input(sat3).
output(vc).


