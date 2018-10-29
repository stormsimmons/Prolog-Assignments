lecturer(ian, theoreticalComputerScience).
lecturer(john, operatingSystems).
lecturer(fred, networks).
lecturer(monde, databases).
lecturer(thulani, complexity).
lecturer(undefind, prolog).

student(mary, theoreticalComputerScience).
student(joe, networks).
student(virat, operatingSystems).
student(virat,prolog).
student(pieter, networks).

module(theoreticalComputerScience, core).
module(operatingSystems, elective).
module(networks, elective).
module(databases, elective).
module(complexity, core).
module(prolog, undefind).

student_by_lecturer(X,Y):-lecturer(X,Z),student(Y,Z).
