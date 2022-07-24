%%%Input Generation

base(vertex(1..6)).

%0 or 1 edge between 2 vertices
0 { instance(edge(I,J))} 1 :- base(vertex(I)) , base(vertex(J)) , I<J. 

colors(red ; blue).
