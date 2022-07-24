composite(N) :- N=1..n , I = 2..N-1, N\I = 0.
prime(N) :- N=2..n , not composite(N).

#const n=15.

% #show prime/1.

fac(0,1).
fac(N+1,F*(N+1)) :- fac(N,F), N+1<=n.

#show fac/2.