
triangle(1,1).

triangle(M,N) :-
    integer(M),
    M >1,
    M2 is M - 1,
    triangle(M2,N2),
    N is M + N2.  

    