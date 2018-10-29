
%% 3.1
test(N):- N > 0.

filter(_,Pred,_):-
    \+ atom(Pred),!,
    fail.

filter([],_,[]).

filter([X|T],Pred,[X|R]):-
    Predicate =.. [Pred,X],
    call(Predicate),
    filter(T,Pred,R),!.

filter([_|T],Pred,R):-
    filter(T,Pred,R).

%% 3.2
test_map(N,R):- R is N * N.

map(_,Pred,_):-
    \+ atom(Pred),!,
    fail.

map([],_,[]).

map([X|T],Pred,[R|Res]):-
    Predicate =.. [Pred,X,R],
    call(Predicate),
    map(T,Pred,Res),!.

map([_|T],Pred,R):-
    map(T,Pred,R).