% Dany jest acykliczny graf skierowany o wierzchołkach a, b, c, d, e, f  i krawędziach ab, bc, bd, ce, cf, df, fe.
% Zdefiniuj predykat krawedz(X,Y) reprezentujący zadany graf.

% Zdefiniuj predykat sciezka(X,Y) mówiący o tym, że wierzchołki X, Y są połączone ścieżką. Wypróbuj zdefiniowany predykat i znajdź wszystkie wyniki następujących zapytań:

% ?- sciezka(b, f).

% ?- sciezka(b, Z).

% ?- sciezka(X,d).

% Napisz i wykonaj zapytania sprawdzające, czy

% istnieje ścieżka z a do f przechodząca przez d

% istnieje ścieżka o długości 3 kończąca się w f

% istnieje w grafie cykl

% Przetestuj predykat sciezka_dl(X,Y,N) odpowiadający na pytanie czy istnieje ścieżka o długości N łącząca wierzchołki X i Y.

% sciezka_dl(X,Y,N) :- N=1, krawedz(X,Y).
% sciezka_dl(X,Y,N) :- N>1, N1 is N - 1, krawedz(X,Z), sciezka_dl(Z,Y,N1).

% Przy pomocy powyższego predykatu znajdź odpowiedź na pytania:

% Znajdź wszystkie ścieżki o długości 4 kończące się w f

% Znajdź wszystkie ścieżki o długości 3 zaczynające się w a

% Znajdź wszystkie ścieżki o długości 3

% Dlaczego nie można przy pomocy tego predykatu znaleźć długości ścieżki od a do e ?

% Zdefiniuj nowy predykat dl_sciezki(X,Y,N), który umożliwi znajdowanie długości ścieżek.
% Przykład użycia predykatu dl_sciezki:
%  ?- dl_sciezki(a,c, N).
%       N = 2



krawedz(a,b).
krawedz(b,c).
krawedz(b,d).
krawedz(c,e).
krawedz(c,f).
krawedz(d,f).
krawedz(f,e).

sciezka(X,Y) :-
    krawedz(X,Y).

sciezka(X,Y) :-
    krawedz(X,Z),
    sciezka(Z,Y).

sciezka_dl(X,Y,N) :- N=1, krawedz(X,Y).
sciezka_dl(X,Y,N) :- N>1, N1 is N - 1, krawedz(X,Z), sciezka_dl(Z,Y,N1).

dl_sciezki(X,Y,N) :-
    krawedz(X,Y),
    N=1.

dl_sciezki(X,Y,N) :-
    N1 is N + dl_sciezki()


% B. Zdefiniuj predykaty collatz1 i collatz2 badający ciągi Collatza zdefiniowane następująco. Pierwszy element ciągu  a_1  jest dowolną dodatnią liczbą naturalną, a następne wyznaczamy wg. poniższej reguły.

% Jeśli liczba a_n  jest parzysta, to a_{n+1}=\frac{a_n}{2}  
% Jeśli liczba a_n jest nieparzysta, to a_{n+a} = 3 a_n +1 .

% Wikipedia: problem Collatza 

% Predykat collatz1(A) ma wyświetlać na terminalu w kolejnych liniach (poleceniem write) kolejne wyrazy ciągu startującego od wartości A aż do napotkania liczby 1.

% Predykat collatz1(A, N) ma zwracać w N numer pierwszego wyrazu ciągu, którego wartość wynosi 1. 

% Przykład:

% ?- collatz1(5).
%    5
%    16
%    8
%    4
%    2
%    1
%    true  

% ?- collatz2(5,N).
%      N=6

% C. Definiować predykat binom(K, L, X) uzgadniający X z wartością współczynnika dwumianowego Newtona \binom{k}{l}. Predykat powinien korzystać  ze wzoru

% \binom{k}{l} + \binom{k}{l-1} = \binom{k+1}{l}  ,

% oraz faktu, że \binom{k}{0}=1  i  \binom{k}{k}=1dla dowolnych  k>0 .

% Proszę nie używać wzoru na współczynnik Newtona wykorzystującego silnię.

collatz1(1).

collatz1(N):-
    N mod 2 =:= 0,
    N1 is N/2,
    writeln(N1),
    collatz1(N1).

collatz1(N):-
    N mod 2 =:= 1,
    N1 is 3*N +1,
    writeln(N1),
    collatz1(N1).

collatz2(1, 1).

collatz2(A, N):-
    A mod 2 =:= 0,
    A1 is A/2,
    writeln(A1),
    collatz2(A1, N1),
	N is N1+1.

collatz2(A, N):-
    A mod 2 =:= 1,
    A1 is 3*A +1,
    writeln(A1),
    collatz2(A1, N1),
    N is N1+1.

% 3

binom(K,L,X) :-
    L =:= 0,
    X is 1.

binom(K,L,X) :-
    K =:= L,
    X is 1.

binom(K,L,X) :-
    binom(K-1, L-1, X1),
    binom(K-1, L, X2),
    X is X1 + X2.