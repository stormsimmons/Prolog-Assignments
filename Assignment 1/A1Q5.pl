
% 5.1
count(_, [], 0).
count(X, [X | T], N) :-
  !, count(X, T, N1),
  N is N1 + 1.
count(X, [_ | T], N) :-
  count(X, T, N).

% 5.2
delete_all(_, [], []) :- !.
delete_all(X, [X|Xs], Y) :- !,
    delete_all(X, Xs, Y).
delete_all(X, [T|Xs], Y) :- !,
    delete_all(X, Xs, Y2), 
    append([T], Y2, Y).

% 5.3
replace_all(_, [], _, []).
replace_all(X, [X|T], Y, [Y|T2]) :- 
    replace_all(X, T, Y, T2).
replace_all(X, [H|T], Y, [H|T2]) :- 
    H \= X, 
    replace_all(X, T, Y, T2).


