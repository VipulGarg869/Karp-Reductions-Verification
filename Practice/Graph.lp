adj(X,Y) :- edge(X,Y).
adj(X,Y) :- edge(Y,X).

number_of_edges(N/2) :- N = #count{ X , Y : adj(X,Y)}.

degree(X , D ) :- vertex(X) , D = #count{ Y : adj(X,Y)}.
#show number_of_edges/1.
#show degree/2.