% Dla predykaty realizujące następujące na strukturze wektor(X,Y,Z):

% sumy suma/3
% iloczynu skalarnego iloczyn_sk/3 
% Przykład:

% ?- suma(wektor(1,2,3), wektor(1,3,5), W).
%      W=wektor(2,5,8)

% ?- iloczyn_sk(wektor(1,2,3), wektor(1,3,5), W).
%      W=22   % 1*1 + 2*3 + 3*5

suma(wektor(X1,Y1,Z1), wektor(X2,Y2,Z2), W) :-
    X is X1 + X2,
    Y is Y1 + Y2,
    Z is Z1 + Z2,
    W = wektor(X,Y,Z).

iloczyn_sk(wektor(X1,Y1,Z1), wektor(X2,Y2,Z2), W) :-
    X is X1 * X2,
    Y is Y1 * Y2,
    Z is Z1 * Z2,
    W is X + Y + Z.

% Zdefiniować relację wiekszy(X, Y, Z), której dwoma pierwszymi elementami są dwie liczby, a trzecim elementem jest większa z nich.
% Zdefiniować dwuargumentową relację modul, w której drugim argumentem jest wartość bezwzględna pierwszego argumentu.
% Zdefiniować rekurencyjnie predykat suma(N, S), której S jest równe sumie liczb od 0 do N (włącznie). N jest liczbą naturalną.
% Przykłady.

% ?- wiekszy(2,3, X).
% X = 3.

% ?- wiekszy(5,3, X).
% X = 5.

% ?- wiekszy(5,5, X).
% false

% ?- modul(-2,X).
% X=2

% ?- suma(3, S).
% S = 6.

wiekszy(X, Y, Z) :-
    X > Y,
    Z = X.
    
wiekszy(X, Y, Z) :-
    X < Y,
    Z = Y.

modul(X, Y) :-
    X > 0,
    Y = X ;
    X < 0,
    Y is -X.

suma(N, S) :-
    N =:= 0, S = 0.

suma(N, S) :-
    N > 0,
    N1 is N - 1,
    suma(N1, S1),
    S is S1 + N.

% Zdefiniuj predykaty delta(A,B,C,D) i pierw(A,B,C,X) pozwalające na wyznaczenie delty i pierwiastków równania kwadratowego Ax^2+Bx+C = 0.

% Predykat delta powinien uzgadniać argument D z deltą równania kwadratowego.

% Predykat pierw powinien uzgadniać argument X z kolejnymi pierwiastkami równania:

% Przykład:

% ?- delta(1, 2, 3, D).
% D = -8

% ?- pierw(2, 0, 1, X).   % Brak pierwiastków
% false
% ?- pierw(1, 4, 4, X).  %  Jeden pierwiastek 
% X = -2 ;
% false
% ?- pierw(1, 1, -2, X).  %  Dwa pierwiastki
% X = -2 ;
% X = 1
delta(A,B,C,D) :-
    D is B*B - 4 * A * C.

pierw(A,B,C,X) :-
    delta(A,B,C,D),
    D > 0,
    X1 is (-B-sqrt(D)) / (2 * A),
    X2 is (-B+sqrt(D)) / (2 * A),
    X = wynik(X1, X2).

pierw(A,B,C,X) :-
    delta(A,B,C,D),
    D =:= 0,
    X is (-B) / (2*A).
