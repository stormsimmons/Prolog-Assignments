students(simmons, storm ,male , 12, [english,afrikaans,math,science]).
students(willis, amy ,female , 11, [english,afrikaans,bio,science]).
students(brown, mike ,male , 12, [english,zulu,business,math]).
students(timm, chris ,male , 12, [afrikaans, french ,business,bio]).
students(malan, lukas ,male , 11, [english,portuguese,math,science,business,geography,accounting]).

student_subs(X,_,_):-
    \+ nonvar(X),
    !,fail.
student_subs(_,Y,_):-
    \+ nonvar(Y),
    !,fail.
student_subs(X,Y,L):- 
    students(X, Y ,_ , _, L).

student_gen(X,_,_):-
    \+ nonvar(X),
    !,fail.
student_gen(_,Y,_):-
    \+ nonvar(Y),
    !,fail.
student_gen(X,Y,G):- 
    students(X, Y ,G , _, _).

student_grd(X,_,_):-
    \+ nonvar(X),
    !,fail.
student_grd(_,Y,_):-
    \+ nonvar(Y),
    !,fail.
student_grd(X,Y,G):- 
    students(X, Y ,_ , G, _).

count([],0).
count([_|T],X) :- count(T, X1), X is X1 + 1.

student_list_count(X,Y):-students(X,Y,_,_,L), count(L,C), C>6.



%% or students(X,Y,_,_,L),count(L,C), C>6.


%% students(brown,_,_,_,_).

%% students(X,Y,_,_,[_|[portuguese|_]]).