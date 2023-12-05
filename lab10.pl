:- use_module(library(clpfd)).

% Rozwiąż poniższe zagadki przy przy wykorzystaniu biblioteki programowania z więzami (clpfd). 
% W zadaniach a,c,d różnym literom odpowiadają różne cyfry, a w zadaniu b różnym literom mogą
%  odpowiadać takie same cyfry.

% 1.
% a) 
%  TEST
% +JEST
% SUPER

z1a([E, J, P, R, S, T, U]) :-
    Vars = [E, J, P, R, S, T, U],
    Vars ins 0..9,
    T #\= 0, J #\= 0, S #\= 0,
    all_different(Vars),
    T + S*10 + E*100 + T*1000 +
    T + S*10 + E*100 + J*1000 
    #= R + E*10 + P*100+U*1000 + S*10000,
    labeling([], Vars).

% b)
%  DOM
% +DOM
% MIASTO

z2a([D,O,M,I,A,S,T]) :-
    Vars = [D,O,M,I,A,S,T],
    Vars ins 0..9,
    D #\= 0, M #\= 0,
    all_different(Vars),
    (M + O*10 + D*100) * (M + O*10 + D*100)
    #= O + T*10 + S*100 + A*1000 + I*10000 + M*100000,
    labeling([], Vars).

% c) 
%        X
%     YYYY
%     YYYY
%     YYYY
%    +YYYY
%    XYYYY

z1c([X,Y]) :-
    Vars = [X,Y],
    Vars ins 0..9,
    all_different(Vars),
    4 * (Y + 10*Y + 100*Y + 1000*Y) + X
    #= Y + 10*Y + 100*Y + 1000*Y + 10000*X,
    labeling([], Vars).

% d)
% am - cw = ca
% ·   -    -
% m + dt = dl
% am :  g = md

z1d([A, C, D, G, L, M, T, W]) :-
    Vars = [A, C, D, G, L, M, T, W].
    Vars ins 0..9,
    all_different(Vars),
    AM #= A*10 + M,
    CW #= C*10 + W,
    CA #= C*10 + A,
    DT #= D*10 + T,
    DL #= 
    M + A*10 - W * C*10 # A + C*10,
    M + T + D*10 #= L + D*10,
    M + A*10 * G = D + M*10,
