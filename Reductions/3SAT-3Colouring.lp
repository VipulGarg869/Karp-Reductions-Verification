

%Conversion to equivalent instance of 3COLOURING
ns(color3,base(vertex,neutral)).
ns(color3,base(vertex,true)).
ns(color3,base(vertex,false)).

%Creating vertices for pos and neg of each variable.
ns(color3,base(vertex,pos(V))) :- ns(sat3,base(var,V)).
ns(color3,base(vertex,neg(V))) :- ns(sat3,base(var,V)).

%%%%%%%%Creating extra vertices for the clause gadget.
ns(color3,base(vertex,clausegadget(X,Y,Z,0))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(color3,base(vertex,clausegadget(X,Y,Z,1))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(color3,base(vertex,clausegadget(X,Y,Z,2))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(color3,base(vertex,clausegadget(X,Y,Z,3))) :- ns(sat3,instance(clause(X,Y,Z))).
%%%%%%%%VERTEX CREATION FOR THE 3 COLOURING GRAPH COMPLETE. EDGE CREATION BEGINS

%Creating edges for the base triangle.
ns(color3,instance(edge(neutral,false))).
ns(color3,instance(edge(false,true))).
ns(color3,instance(edge(true,neutral))).

%Creating edges between variable gadgets and base trianlge.
ns(color3,instance(edge(pos(V),neg(V)))) :-  ns(sat3,base(var,V)).
ns(color3,instance(edge(neutral,pos(V)))) :- ns(sat3,base(var,V)).
ns(color3,instance(edge(neutral,neg(V)))) :- ns(sat3,base(var,V)).

%Creating edges for each clause gadget (given on page 27 of PDF).

ns(color3,instance(edge(X,clausegadget(X,Y,Z,0)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(color3,instance(edge(true,clausegadget(X,Y,Z,0)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(color3,instance(edge(clausegadget(X,Y,Z,3),clausegadget(X,Y,Z,0)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(color3,instance(edge(true,clausegadget(X,Y,Z,1)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(color3,instance(edge(clausegadget(X,Y,Z,3),clausegadget(X,Y,Z,2)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(color3,instance(edge(clausegadget(X,Y,Z,1),clausegadget(X,Y,Z,2)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(color3,instance(edge(Y,clausegadget(X,Y,Z,1)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(color3,instance(edge(false,clausegadget(X,Y,Z,2)))) :- ns(sat3,instance(clause(X,Y,Z))).
ns(color3,instance(edge(Z,clausegadget(X,Y,Z,3)))) :- ns(sat3,instance(clause(X,Y,Z))).

%%%%REDUCTION COMPLETE


%SOLUTION OF 3 COLOUR INSTANCE IN TERMS OF 3 SAT AND VICE VERSA
ns(color3,solution(set(neutral,green))) :- direct.
ns(color3,solution(set(true,blue))) :- direct.
ns(color3,solution(set(false,red))) :- direct.
ns(color3,solution(set(pos(V),blue))) :- ns(sat3,solution(set(V,true))), direct.
ns(color3,solution(set(pos(V),red))) :- ns(sat3,solution(set(V,false))), direct.
ns(color3,solution(set(neg(V),blue))) :- ns(sat3,solution(set(V,false))), direct.
ns(color3,solution(set(neg(V),red))) :- ns(sat3,solution(set(V,true))), direct.

ns(color3,solution(set(clausegadget(X,Y,Z,0),red))):- ns(sat3,instance(clause(X,Y,Z))) , ns(color3,solution(set(Y,red))),ns(color3,solution(set(Z,red))),direct.
ns(color3,solution(set(clausegadget(X,Y,Z,0),green))):- ns(sat3,instance(clause(X,Y,Z))) , ns(color3,solution(set(Z,blue))),direct.
ns(color3,solution(set(clausegadget(X,Y,Z,0),green))):- ns(sat3,instance(clause(X,Y,Z))) , ns(color3,solution(set(Y,blue))),direct.
ns(color3,solution(set(clausegadget(X,Y,Z,1),red))):- ns(sat3,instance(clause(X,Y,Z))) , ns(color3,solution(set(Y,blue))),direct.
ns(color3,solution(set(clausegadget(X,Y,Z,1),green))):- ns(sat3,instance(clause(X,Y,Z))) , ns(color3,solution(set(Y,red))),direct.
ns(color3,solution(set(clausegadget(X,Y,Z,2),blue))):-ns(sat3,instance(clause(X,Y,Z))) , ns(color3,solution(set(Y,red))),direct.
ns(color3,solution(set(clausegadget(X,Y,Z,2),green))):-ns(sat3,instance(clause(X,Y,Z))) , ns(color3,solution(set(Y,blue))),direct.
ns(color3,solution(set(clausegadget(X,Y,Z,3),green))):- ns(sat3,instance(clause(X,Y,Z))) , ns(color3,solution(set(Y,red))),ns(color3,solution(set(Z,red))),direct.
ns(color3,solution(set(clausegadget(X,Y,Z,3),red))):- ns(sat3,instance(clause(X,Y,Z))) , ns(color3,solution(set(Z,blue))),direct.
ns(color3,solution(set(clausegadget(X,Y,Z,3),blue))):- ns(sat3,instance(clause(X,Y,Z))) , ns(color3,solution(set(Z,red))),ns(color3,solution(set(Y,blue))),direct.


ns(sat3,solution(set(V,true))) :- ns(color3,solution(set(pos(V),T))) , ns(color3,solution(set(true,T))), not direct.
ns(sat3,solution(set(V,false))) :- ns(color3,solution(set(pos(V),T))) , ns(color3,solution(set(false,T))), not direct.


input(sat3).
output(color3).

