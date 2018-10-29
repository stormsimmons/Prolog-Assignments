%% set_prolog_flag(answer_write_options,[max_depth(0)]). <- to return full formated answer

solution_to_puzzle(Solution) :-
    initial_state(Start),
    breadthfirst([[Start]], Solution).

breadthfirst([[Node | Path] | _], [Node | Path]) :-
    goal(Node).

breadthfirst([Path | Paths], Solution) :-
    extend(Path, NewPaths),
    conc(Paths, NewPaths, Paths1),
    breadthfirst(Paths1, Solution).

extend([Node | Path], NewPaths) :-
    bagof([NewNode, Node | Path],
    (s(Node, NewNode), not(member(NewNode, [Node | Path]))),
    NewPaths),!.

extend(_, []).

initial_state([r2, r2, space, r5,r5]).

goal([r5, r5, space, r2,r2]).

s(S,S1) :- 
    jump(S, S1);
    shimmy(S,S1).

shimmy(L,R) :- 
    append(L1, [r2, space|R2], L),
    append(L1, [space, r2|R2], R).

shimmy(L,R) :- 
    append(L1, [space, r5|R2], L),
    append(L1, [r5, space|R2], R).

jump(L,R) :- 
    append(L1, [r2,r5,space|R2], L),
    append(L1, [space,r5,r2|R2], R).

jump(L,R) :- 
    append(L1, [space,r2,r5|R2], L),
    append(L1, [r5,r2,space|R2], R).

member(X, [X | _]).

member(X, [_ | Tail]) :-
    member(X, Tail).

conc([], L, L).

conc([X | L1], L2, [X | L3]) :-
    conc(L1, L2, L3).
    