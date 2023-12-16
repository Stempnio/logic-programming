% Ex 1
available(Labyrinth, X, Y) :-
    nth1(X, Labyrinth, Row),
    nth1(Y, Row, Cell),
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
display_lab(Labyrinth, Path) :-
    display_lab(1, Labyrinth, Path).

display_lab(_, [], _).
display_lab(Row, [H|T], Path) :-
    display_row(Row, 1, H, Path),
    NextRow is Row + 1,
    display_lab(NextRow, T, Path).

display_row(_, _, [], _) :- nl.
display_row(Row, Col, [_|T], Path) :-
    member([Row, Col], Path),
    write('.'),
    NextCol is Col + 1,
    display_row(Row, NextCol, T, Path).
display_row(Row, Col, [X|T], Path) :-
    not(member([Row, Col], Path)),
    X == x,
    write(X),
    NextCol is Col + 1,
    display_row(Row, NextCol, T, Path).
display_row(Row, Col, [X|T], Path) :-
    not(member([Row, Col], Path)),
    X == o,
    write(' '),
    NextCol is Col + 1,
    display_row(Row, NextCol, T, Path).