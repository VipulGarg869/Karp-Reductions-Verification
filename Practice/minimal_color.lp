 % Color the vertices of a graph so that no two adjacent
 % vertices share the same color using as few colors as
 % possible .

 % input : set vertex /1 of vertices of a graph G ; set
 % edge /2 of edges of G .

 size ( N ) :- N = #count { X : vertex ( X )}.
 % achieved : size ( N ) iff N is the number of vertices of
% the graph .

1 { color (X , C ) : C =1.. N } 1 :- vertex ( X ) , size ( N ).
% achieved : for every vertex X there is a unique
% C from {1 ,... , n } such that color (X , C ).
%

:- edge (X , Y ) , color (X , C ) , color (Y , C ).
% achieved : no two adjacent vertices share the same
% color .

#minimize{1,Y : color(X,Y)}.
% achieved : the number of colors assigned to vertices
% is minimal .
#show color/2.