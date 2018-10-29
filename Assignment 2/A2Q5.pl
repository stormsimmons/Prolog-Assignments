roan(blue_lightning).
paint(shadows).
clay_bank(nebraska_blitz).
roan(X):-
paint(X),
clay_bank(X),!.


diff(X,X) :- fail.
diff(X,Y).

leopard(X):-

\+ lion(X),

\+ cheetah(X).

lion(simba).

lion(mufasa).

lion(scar).