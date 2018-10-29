% Defining operators
:- op(600, xfx , --->).
:- op(500, xfx , :).

solve(Node, Node, _) :-
    goal(Node).

solve(Node, Node ---> Tree, Depth) :-
    Depth > 0,
   Node ---> or : Nodes,
   member(Node1,Nodes),
   Depth1 is Depth -1,
   solve(Node1,Tree, Depth1).

solve(Node, Node ---> and : Trees, Depth) :-
    Depth > 0,
    Node ---> and : Nodes,
    Depth1 is Depth -1,
    solveall(Nodes,Trees, Depth1).

solveall([],[],_).

solveall([Node|Nodes],[Tree|Trees], Depth) :-
    solve(Node,Tree, Depth),
    solveall(Nodes,Trees, Depth).

show(Tree) :- 
    show(Tree, 0).

show(Node ---> Tree, H) :- 
    !,
    write(Node), write('--->'),
    H1 is H + 5,
    show(Tree, H1).

show(and : [T],_) :- 
    !,
    show(T).

show(and : [T | Ts],H) :- 
    !,
    show(T,H),
    tab(H),
    show(and: Ts, H).

show(Node, _) :- 
    write(Node)
    ,nl.


a ---> or : [b,c].
b ---> and : [d,e].
c ---> and : [f,g].
e ---> or : [h].
f ---> or : [h,i].

goal(d).
goal(g).
goal(h).
