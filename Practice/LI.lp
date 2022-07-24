{ in(X) : vertex(X) }.
:- in(X) , in(Y) , edge(X , Y).


#maximize{1,X : in(X)}.

#show in/1.
