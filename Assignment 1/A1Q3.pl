exp(Base,Exponent,Result):- 
integer(Base),
integer(Exponent),
exponent_recursion(Base,Exponent,Result).

exponent_recursion(Base, 0,1) :-
Base >= 0.

exponent_recursion(0, Exponent ,0) :-
Exponent > 0.

exponent_recursion(Base, Exponent,Result) :-
Base > 0,
Exponent > 0,
Predecessor is Exponent - 1,
exponent_recursion(Base,Predecessor, InnerRes),
Result is Base * InnerRes.




