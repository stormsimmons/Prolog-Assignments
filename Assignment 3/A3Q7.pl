solve(Solution) :- 
    init(Start),
    bfs([[Start]],Solution).

bfs([[Node|Path]|_] , [Node|Path]) :-
    goal(Node),!.

bfs([Path | Paths], Solution) :-
    extend(Path, NewPaths),
    conc(Paths, NewPaths, Paths1),
    bfs(Paths1, Solution).

extend([Node | Path], NewPaths) :-
    findall([NewNode, Node | Path],
    (move(Node, NewNode), \+ member(NewNode, [Node | Path])),
    NewPaths).

goal([0,0,right]).
init([3,3,left]).

move([A,B,left],[C,B,right]) :- 
    A > 0, 
    C is A - 1. 
 move([A,B,left],[C,B,right]) :- 
    A > 1, 
    C is A - 2. 
 move([A,B,left],[C,D,right]) :- 
    A > 0, B > 0, 
    C is A - 1, 
    D is B - 1. 
 move([A,B,left],[A,D,right]) :- 
    B > 0, 
    D is B - 1. 
 move([A,B,left],[A,D,right]) :- 
    B > 1,
    D is B - 2. 
 move([A,B,right],[C,B,left]) :- 
    A < 3, 
    C is A + 1. 
 move([A,B,right],[C,B,left]) :- 
    A < 2, 
    C is A + 2. 
 move([A,B,right],[C,D,left]) :- 
    A < 3, 
    B < 3, 
    C is A + 1, 
    D is B + 1. 
 move([A,B,right],[A,D,left]) :- 
    B < 3, 
    D is B + 1. 
 move([A,B,right],[A,D,left]) :- 
    B < 2, 
    D is B + 2. 

member(X, [X | _]).
member(X, [_ | Tail]) :-
    member(X, Tail).

conc([], L, L).
conc([X | L1], L2, [X | L3]) :-
    conc(L1, L2, L3).