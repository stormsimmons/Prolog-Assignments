splitlist(L, [], L, 0).
splitlist([H|T], [H|A], B, N) :- 
    Nminus1 is N-1, 
    splitlist(T, A, B, Nminus1).

halfList(L, A, B) :- 
    length(L, Len),
    Half is Len//2, 
    splitlist(L, A, B, Half).

mergeLists(A, [], A).
mergeLists([], B, B).
mergeLists([Ha|Ta], [Hb|Tb], R) :-
    Ha =< Hb, 
    mergeLists(Ta, [Hb|Tb], M), 
    R = [Ha|M].
mergeLists([Ha|Ta], [Hb|Tb], R) :-
     Ha > Hb, 
     mergeLists(Tb, [Ha|Ta], M), 
    R = [Hb|M].

merge_sort([], []).
merge_sort([E], [E]).
merge_sort([H1, H2], [H1, H2]) :- H1 =< H2.
merge_sort([H1, H2], [H2, H1]) :- H1 > H2.
merge_sort(L, R) :- halfList(L, A, B), 
    merge_sort(A, Asort),
    merge_sort(B, Bsort), 
    mergeLists(Asort, Bsort, R).