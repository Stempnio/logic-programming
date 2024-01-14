% 1)
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
% 2)

replace_in_list([_|T], 0, Z, [Z|T]).
replace_in_list([H|T], I, Z, [H|R]) :-
    I > 0,
    NextI is I - 1,
    replace_in_list(T, NextI, Z, R).

point(S1, [X, Y], Z, S2) :-
    nth0(Y, S1, Row),
    replace_in_list(Row, X, Z, NewRow),
    replace_in_list(S1, Y, NewRow, S2).
% 3)

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

