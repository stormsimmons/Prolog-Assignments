multi(X,_,_) :-
    \+ integer(X),
    !,fail.

multi(_,Y,_) :-
    \+ integer(Y),
    !,fail.

multi(X,Y,R):-
    ((X < 0) -> 
    (X1 is -X, Y1 is -Y);
    (X1 is X, Y1 is Y)),
    multi_rec(X1,Y1,R). 

multi_rec(0,_,0) :- !.

multi_rec(X,Y,R):-
    X1 is X//2,
    Y1 is Y*2,
    multi_rec(X1,Y1,R1),
    ((X mod 2  =:= 1) -> 
    R is R1 + Y; 
    R=R1). 