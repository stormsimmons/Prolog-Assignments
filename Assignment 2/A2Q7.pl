
cross_roads([C,R,O,S,A,D,N,G,E]) :-
    assign([0,1,2,3,4,5,6,7,8,9],[C,R,O,S,A,D,N,G,E]),
    10000*C + 1000*R + 100*O + 10*S + S +
    10000*R + 1000*O + 100*A + 10*D + S =:=
    100000*D + 10000*A + 1000*N + 100*G + 10*E + R.


assign(_,[]).

assign(Digs, [D|Vars]):-
    del(D,Digs,Digs1),
    assign(Digs1,Vars).

del(X,[X|T],T).

del(X,[Y|T],[Y|TR]) :- 
    del(X,T,TR).

%% usage : cross_roads([C,R,O,S,A,D,N,G,E]),
%%           Cross = [C,R,O,S,S],
%%           Roads= [R,O,A,D,S],
%%           Danger=[D,A,N,G,E,R].