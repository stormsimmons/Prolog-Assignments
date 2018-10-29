
split([],[],[]):-!.

split([H|L], [PH|PT],N) :-
    pos(H),
    !,
    PH is H,
    split(L,PT,N).

split([H|L],P ,[NH|NT]) :-
    neg(H),
    !,
    NH is H,
    split(L,P,NT).

 pos(X):- X >= 0.

 neg(X):- X < 0.  