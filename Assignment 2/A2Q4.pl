%% 4.1
difference(A,B,R):- 
    findall(X ,(member(X,A),\+ member(X,B)),R).

%% 4.2
compliment(A,U,C) :- 
    findall(X, (member(X,U), \+ member(X,A)), C).

%% 4.3
sym_diff(A,B,R) :- 
    findall(X ,(member(X,A), \+  member(X,B)),H),
    findall(X ,(member(X,B), \+  member(X,A)),T),
    append(H,T,R).

