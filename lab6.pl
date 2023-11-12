% 1. 
% A. Napisz predykat silnia(N,S), gdzie zawracający w S wartość n! 

% Przykład:

% ?- silnia(0,N0), silnia(1,N1), silnia(3,N3)..
% N0=1
% N1=1
% N3=6

silnia(N,S) :- silnia(N, 1, S).
silnia(0, A, A).
silnia(N,A,S) :-
    N > 0,
    N1 is N-1,
    A1 is A*N,
    silnia(N1, A1, S).

% B. Napisz predykat fib(N,F), zwracający w F N-ty element ciągu Fibonacciego.  Zakładamy, że zerowy element ciągu Fibonacciego wynosi 0, a pierwszy wynosi 1. W definicji predykatu należy wykorzystać dwa akumulatory: jeden do przechowywania bieżącego wyrazu ciągu, a drugi do przechowywania wyrazu poprzedniego.

% Przykład:

% ?- fib(0,F0), fib(1,F1), fib(6,F6),.
% F0=0, F1=1, F6=8.


fib(N,F) :-
    fib(N, 0, 1, F).
fib(0, _, B,B).
fib(N,A,B,F) :-
  	N > 0,
    A1 is B,
    B1 is A+B,
    N1 is N-1,
    fib(N1, A1, B1, F).

% 2. 

% Napisz predykat przekatna(M, P), gdzie macierz M jest przekątną macierzy kwadratowej M. 
% Macierz M jest reprezentowana jako lista wierszy. Wykorzystaj akumulator.

% Przykład:
% przekatna([[1,2],[3,4]], D).
%    D = [1,4]

% TODO - implement

% 3.

% Napisz  predykat sumy(L, X, Y) uzgadniający z X sumę elementów ujemnych z listy L, a z Y sumę elementów dodatnich z L. Wykorzystaj dwa akumulatory.

% Przykład:

% ?- sumy([1, -2, 0, -3, 5], X, Y).
% X = -5
% Y = 6

% ?- sumy([], X, Y).
% X = 0
% Y = 0

sumy(L, X, Y) :-
    sumy(L, 0, 0, X, Y).

sumy([], X, Y, X, Y).
sumy([H|T], X1, Y1, X, Y) :-
    H < 0,
    XN is X1 + H,
    sumy(T, XN, Y1, X, Y).
sumy([H | T], X1, Y1, X, Y) :-
    H >= 0,
    YN is Y1 + H,
    sumy(T, X1, YN, X, Y).

% 4. 

% Napisz predykat spłaszcz(L, P), wyznaczający liste P będącą spłaszczeniem listy L.

% Przykład:

% splaszcz([a, [1, [ b, [], c ], a, 1]], P).

% P = [a,1,b,c,a,1]

dodaj_na_koniec(X, [], [X]).
dodaj_na_koniec(X, [H|T], [H|W]) :-
    dodaj_na_koniec(X, T, W).

lacz_listy(A,[],A).
lacz_listy(A, [H|T], W) :-
    dodaj_na_koniec(H, A, W1),
    lacz_listy(W1, T, W).

jest_lista([]).
jest_lista([_|_]).

splaszcz(L, P) :- splaszcz(L, [], P).

splaszcz([], P, P).
splaszcz([H|T], Acc, P) :-
    jest_lista(H),
    splaszcz(H, [], P1),
    lacz_listy(Acc, P1, W),
    splaszcz(T, W, P).
splaszcz([H|T], Acc, P) :-
    not(jest_lista(H)),
    dodaj_na_koniec(H, Acc, W),
    splaszcz(T, W, P).


% odwroc(L, R) :-
%     odwroc(L, [], R).

% odwroc([], A, A).
% odwroc([H|T], A, R) :-
%     odwroc(T, [H|A], R).