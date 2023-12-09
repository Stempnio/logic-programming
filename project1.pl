% Ex 1
available(Labyrinth, X, Y) :-
    nth1(Y, Labyrinth, Row),
    nth1(X, Row, Cell),
    Cell == o.

move([X, Y], [X, Y1]) :- Y1 is Y - 1. 
move([X, Y], [X, Y1]) :- Y1 is Y + 1. 
move([X, Y], [X1, Y]) :- X1 is X - 1. 
move([X, Y], [X1, Y]) :- X1 is X + 1. 

path(_, [X,Y], [X,Y], Acc, Path) :-
    reverse([[X,Y]|Acc], Path).
path(Labyrinth, [X,Y], End, Acc, Path) :-
    move([X,Y], [NextX, NextY]),
    available(Labyrinth, NextX, NextY),
    not(member([NextX, NextY], Acc)),
    path(Labyrinth, [NextX, NextY], End, [[X, Y]|Acc], Path).

path(Labyrinth, Start, End, Path) :-
    path(Labyrinth, Start, End, [], Path).

% Ex 2
display_lab([]).
display_lab([H|T]) :-
    display_row(H),
    display_lab(T).

display_row([]) :- nl.
display_row([X|T]) :-
    X == x,
    write(X),
    display_row(T).
display_row([X|T]) :-
    X == o,
    write(' '),
    display_row(T).

% Ex 3
display_lab(Lab, Path) :-
    display_lab(Lab, Path, 1).

display_lab([], _, _).
display_lab([H|T], Path, Y) :-
    display_row(H, Path, 1, Y),
    NewY is Y + 1,
    display_lab(T, Path, NewY).

display_row([], _, _, _) :- nl.
display_row([_|T], Path, X, Y) :-
    member([X,Y], Path),
    write('.'),
    NewX is X + 1,
    display_row(T, Path, NewX, Y).
display_row([Cell|T], Path, X, Y) :-
    not(member([X,Y], Path)),
    Cell == x,
    write(x),
    NewX is X + 1,
    display_row(T, Path, NewX, Y).
display_row([Cell|T], Path, X, Y) :-
    not(member([X,Y], Path)),
    not(Cell == x),
    write(' '),
    NewX is X + 1,
    display_row(T, Path, NewX, Y).