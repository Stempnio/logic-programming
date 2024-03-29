% Ex. 1
row(0, []).
row(W, [' '|R]) :-
    W > 0,
    NextW is W-1,
    row(NextW, R).

canvas(_, 0, []).
canvas(W, H, [R|T]) :- 
    H > 0,
    NextH is H - 1, 
    row(W, R), 
    canvas(W, NextH, T).

% Ex. 2

replace_in_list([_|T], 0, Z, [Z|T]).
replace_in_list([H|T], I, Z, [H|R]) :-
    I > 0,
    NextI is I - 1,
    replace_in_list(T, NextI, Z, R).

point(S1, [X, Y], Z, S2) :-
    nth0(Y, S1, Row),
    replace_in_list(Row, X, Z, NewRow),
    replace_in_list(S1, Y, NewRow, S2).

% Ex. 3

draw_vertical_line(S1, X, Y, Y, Z, S2):-
    point(S1, [X, Y], Z, S2).

draw_vertical_line(S1, X, Y1, Y2, Z, S2) :-
    Y1 > Y2,
    draw_vertical_line(S1, X, Y2, Y1, Z, S2).

draw_vertical_line(S1, X, Y1, Y2, Z, S2) :-
    Y1 < Y2,
    point(S1, [X, Y1], Z, S3),
    NextY is Y1 + 1,
    draw_vertical_line(S3, X, NextY, Y2, Z, S2).

draw_horizontal_line(S1, X, X, Y, Z, S2):-
    point(S1, [X, Y], Z, S2).

draw_horizontal_line(S1, X1, X2, Y, Z, S2) :-
    X1 > X2,
    draw_horizontal_line(S1, X2, X1, Y, Z, S2).

draw_horizontal_line(S1, X1, X2, Y, Z, S2) :-
    X1 < X2,
    point(S1, [X1, Y], Z, S3),
    NextX is X1 + 1,
    draw_horizontal_line(S3, NextX, X2, Y, Z, S2).

draw_diagonal_line(S1, X, Y, X, Y, Z, S2) :-
    point(S1, [X, Y], Z, S2).

draw_diagonal_line(S1, X1, Y1, X2, Y2, Z, S2) :-
    X1 > X2, Y1 < Y2,
    draw_diagonal_line(S1, X2, Y2, X1, Y1, Z, S2).

draw_diagonal_line(S1, X1, Y1, X2, Y2, Z, S2) :-
    X1 < X2, Y1 > Y2,
    point(S1, [X1, Y1], Z, S3),
    NextX is X1 + 1,
    NextY is Y1 - 1,
    draw_diagonal_line(S3, NextX, NextY, X2, Y2, Z, S2).

draw_diagonal_line(S1, X1, Y1, X2, Y2, Z, S2) :-
    X1 > X2, Y1 > Y2,
    draw_diagonal_line(S1, X2, Y2, X1, Y1, Z, S2).

draw_diagonal_line(S1, X1, Y1, X2, Y2, Z, S2) :-
    X1 < X2, Y1 < Y2,
    point(S1, [X1, Y1], Z, S3),
    NextX is X1 + 1,
    NextY is Y1 + 1,
    draw_diagonal_line(S3, NextX, NextY, X2, Y2, Z, S2).

line(S1, [X1, Y], [X2, Y], Z, S2) :-
    draw_horizontal_line(S1, X1, X2, Y, Z, S2).

line(S1, [X, Y1], [X, Y2], Z, S2) :-
    draw_vertical_line(S1, X, Y1, Y2, Z, S2).

line(S1, [X1, Y1], [X2, Y2], Z, S2) :-
    draw_diagonal_line(S1, X1, Y1, X2, Y2, Z, S2).

% Ex. 4

poly(S1, L, Z, S2) :-
	L = [H|T],
	append(T, [H], NewList),
    draw_poly(S1, H, NewList, Z, S2).

draw_poly(S1,CurrentPoint, [FinalPoint], Z, S2) :-
    line(S1, CurrentPoint, FinalPoint,Z, S2).

draw_poly(S1,CurrentPoint, [H|T], Z, S2) :-
    line(S1, CurrentPoint, H, Z, S3),
    draw_poly(S3, H, T, Z, S2).

% Ex. 5

clean(S1, X1, Y1, X2, Y2, S2) :-
    X1 > X2, Y1 > Y2,
    clean(S1, X2, Y2, X1, Y1, S2).

clean(S1, X1, Y, X2, Y, S2) :-
    line(S1, [X1, Y], [X2, Y], ' ', S2).

clean(S1, X1, Y1, X2, Y2, S2) :-
    Y1 < Y2,
    line(S1, [X1, Y1], [X2, Y1], ' ', S3),
    NextY is Y1+1,
    clean(S3, X1, NextY, X2, Y2, S2).
    
% Ex. 6

copy(S1, X, Y, [Line], S2) :-
    copy_horizontal_line(S1, [X, Y], Line, S2).

copy(S1, X, Y, [H|T], S2) :-
    copy_horizontal_line(S1, [X,Y], H, S3),
    NextY is Y+1,
    copy(S3, X, NextY, T, S2).

copy_horizontal_line(S1, Coordinate, [P], S2) :-
    point(S1, Coordinate, P, S2).

copy_horizontal_line(S1, [X,Y], [H|T], S2) :-
    point(S1, [X, Y], H, S3),
    NextX is X+1,
    copy_horizontal_line(S3, [NextX, Y], T, S2).