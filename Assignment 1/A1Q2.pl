
on(base,tablet).
on(tablet,spanner).
on(spanner,car).
on(car, fridge).
on(fridge,chair).
on(chair,book).
on(book,lid).

below(X, Y) :- on(X, Y).
below(X, Y) :- on(X, Z), 
    below(Z, Y).

% 2.1)
top(X) :- on(_, X),
    \+ below(X, _).

% 2.2)    
bottom(X) :- on(X, _), 
    \+ below(_, X).

% 2.3)
above_below(X, _, B) :- 
    top(X),
    on(B,X).

above_below(X, A, _) :- 
    bottom(X),
    on(X,A).

above_below(X,A,B) :-
    on(X,A),
    on(B,X).

    