%%%%%Algorithm Description

ns(color2,adj(V1,V2)) :- ns(color2,instance(edge(V1,V2))).
ns(color2,adj(V1,V2)) :- ns(color2,instance(edge(V2,V1))).

ns(color2,notallred(V)) :- ns(color2,adj(V,V1)) , ns(color2,solution(set(V1,blue))).
ns(color2,allred(V)) :- ns(color2,base(vertex,V)),not ns(color2,notallred(V)).

ns(color2,notallblue(V)) :- ns(color2,adj(V,V1)) , ns(color2,solution(set(V1,red))).
ns(color2,allblue(V)) :- ns(color2,base(vertex,V)),not ns(color2,notallblue(V)).

%Fixing colour for the first vertex
1 {solution(set(1,C)) : colors(C)} 1.

ns(color2,solution(set(V,blue))) :- ns(color2,allred(V)) , not ns(color2,solution(set(V,red))).
ns(color2,solution(set(V,red))) :- ns(color2,allblue(V)), not ns(color2,solution(set(V,blue))).

:- ns(color2,base(vertex,V)) , not ns(color2,solution(set(V,_))).
