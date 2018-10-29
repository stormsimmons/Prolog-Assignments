

return_last_3(L, R) :- 
    length(L, Len),
    Len =< 3,
    R = L,!.

return_last_3([_|T], R):- 
    return_last_3(T, R).


