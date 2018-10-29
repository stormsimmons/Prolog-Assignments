
max_number(L, Max) :-
   select(Max, L, Rest), 
   \+ (member(Mem, Rest), Mem > Max).

min_number(L, Min) :-
    select(Min, L, Rest), 
    \+ (member(Mem, Rest), Mem < Min).

minmax([],_,0,0).

minmax(L,N,_,_):- 
    length(L,X),
    X > N ,
    write('list is too long'),
    !.

minmax(L,_,Min,Max) :- 
    max_number(L,Max),
    min_number(L,Min).

