a(0,0):- !.
a(X,Y):-  V is X-1, a(V,Z), Y is Z + X.

b(X,0,1):- !.
b(X,Y,R):- Z is Y-1, b(X,Z,T), R is T*X.

c(0,L,L).
c(X,[Z|L],T):- Y is X-1, c(Y,L,T).

d([],[]).
d([X|L],R):- d(L,T), R=[X|[X|T]].

e(X,Y,[X,Y|Z]).
e(X,Y,[Z|T]):- e(X,Y,T).