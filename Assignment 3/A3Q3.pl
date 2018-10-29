

product([H|T],R) :-
    productInt(T,H, R).

productInt([] , Result, R):-
    R is Result,!.

productInt([H|T], Res, Result) :-
    R is Res * H,
    productInt(T, R, Result).
 