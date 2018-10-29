
union([],[],[]).
union(L1,[],L1).
union(L1, [H2|T2], [H2|R]):-
    \+(member(H2,L1)), union(L1,T2,R).
union(L1, [H2|T2], R):-
    member(H2,L1), union(L1,T2,R).  

sym_diff([] ,B,B).
sym_diff([H|T], B , [H|X]) :-
    \+ member(H,B),
    sym_diff(T,B,X).
sym_diff([H|T], B , X) :-
    member(H,B),
    delete(B,H,Z),
    sym_diff(T,Z,X).

complement([] ,U,U).
complement(A,[H|T],[H|X]) :- 
    \+ member(H,A),
    \+ A = [], 
    complement(A,T,X).
complement(A , [H|T], X) :-
    member(H,A),
    delete(A, H, Z),
    complement(Z, T, X).
    

    