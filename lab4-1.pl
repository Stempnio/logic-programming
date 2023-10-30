% A. Definicja liczby Peano jest następująca:

% liczba(0).
% liczba(s(X)) :- liczba(X).

% 1. Zdefiniuj predykat mniejszy(A, B), który sprawdza, czy liczba Peano A jest mniejsza od B.

% ?- mniejszy(s(0), s(0)).
% false

% ?- mniejszy(s(0), s(s(0))).
% true

mniejszy(0, s(_)).
mniejszy(s(A),s(B)):-
   mniejszy(A,B).


% 2. Zdefiniuj predykat mnoz(A, B, C), który mnoży liczby Peano A i B i wynik zapisuje do C. Możesz wykorzystać predykat z wykładu dodający liczby Peano:

dodaj(0, Y, Y).
dodaj(s(X), Y, s(Z)) :- dodaj(X, Y, Z).



% 3. Bazując na predykacie krawedz z poprzednich zajęć, zdefiniuj predykat sciezka_peano(X,Y,N), który uzgadniał N z długością ścieżki z X do Y. Długość będzie podawana w postaci liczby Peano. Predykat powinien pozwalać zarówno na wyznaczanie długości ścieżki od X do Y, jak i na znajdowanie ścieżek o podanej długości N.

% ?- sciezka_peano(a, c, N).
% N = s(s(0))

% ?- sciezka_peano(a, X, s(s(0)) ).
% X = c

% ?- sciezka_peano(X, Y, s(s(0)) ).
% X = a, Y = c;
% X = b, Y = d