% p(a,1) . p(b,1) . p (c,2).
% q(N) :- N = #count{ A, X : p(A,X)}.
% r(N) :- N = #count{ A: p(A,X)}.
% s(N) :- N = #count{ X : p(A,X)}.

% q(a;b;c;d;e).
% { p(X)} :- q(X).

% :- #count{ X : p(X),q(X)} < 2.
% :- #count{ X : p(X),q(X)} > 4.

% #show p/1.

%p(S) :- S = #sum{N*N : N=2..2}.

% score(a,30).
% score(b,23).
% score(c,13).
% score(d,0).
% score(e,-2).

% total(S) :- S = #sum{Y,X : score(X,Y)}.

% where(a,1).
% where(b,1).
% where(c,2).
% where(d,3).

% howmany(I,N) :- N = #count{X : where(X,I)}, I = 1..7.

% p(3).
% p(2).
% p(5).

% q(X) :- p(X) , #count{ Y : p(Y) , Y<X} = 0.

% #show q/1.

{p(-7 ; -3 ; 3 ; 7)}.

#minimize{X : p(X)}.