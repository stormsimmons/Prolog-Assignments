%% set_prolog_flag(answer_write_options,[max_depth(0)]). <- to return full formated answer
ans(Sol) :- 
    initial_state(Start),
    solve(Start, Sol).

solve(Node,Solution) :- 
    dfs([],Node,Solution).

dfs(Path, Node, [Node|Path]) :- 
    goal(Node).

dfs(Path, Node, Solution) :- 
    s(Node, Node1),
    \+ member(Node1,Path),
    dfs([Node|Path],Node1,Solution).

initial_state([25,10,20,5,tourch,bridge]).
goal([bridge,_,_,_,_,_]).

s(N,N1) :- 
    append(L,[bridge|T],N),
    member(tourch, L),
    append(Test, [tourch|Last], L),
    append(Test,Last,Final),
    min(Final, Min),
    max(Final,Max),
    delete(L,Min,L1),
    delete(L1,Max,L2),
    delete(L2,tourch,L3),
    append(L3,[bridge,tourch,Min,Max|T],N1).

s(N,N1) :- 
    append(L,[bridge|T],N),
    member(tourch, T),
    append(Z, [tourch|Last], T),
    append(Z,Last,Final),
    min(Final, Min),
    delete(Final,Min,L1),
    delete(L1,tourch, L2),
    append([tourch,Min|L],[bridge|L2],N1).

max([R], R).

max([X|Xs], R):-
    max(Xs, T), 
    (X > T -> R = X ; R = T).    

min([R], R).

min([X|Xs], R):- 
    min(Xs, T), 
    (X < T -> R = X ; R = T).    