
hanoi(N) :- 
    move(N, origin, destination, temporary).

move(0, _, _, _) :- !.

move(N, A, B, C) :-
    M is N-1,
    move(M, A, C, B), 
    display(A, B), 
    move(M, C, B, A). 


display(X,Y) :-
    write('from '),
    write(X),
    write(' to '),
    write(Y),
    nl.