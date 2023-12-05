% Przykład
zgaduj(X,Y) :- X=Y, write('Liczba='), writeln(X).
zgaduj(X,Y) :- X<Y, Z is (X+Y)//2, write('Czy liczba jest większa od '), write(Z), write('? '), read(A), sprawdz_odpowiedz(X,Y,Z,A).

sprawdz_odpowiedz(X,Y,Z,A) :- A = 't', Z1 is Z+1, zgaduj(Z1,Y).
sprawdz_odpowiedz(X,Y,Z,A) :- A \= 't', zgaduj(X,Z).

% Zadanie: Gra w liczby
% Zasady gry: Dana jest lista liczb L oraz ustalona liczba K. 
% Gracze wybierają kolejno po jednej liczbie z listy (nie usuwając jej z listy). 
% Gra kończy się w momencie, gdy suma wszystkich liczb wybranych przez obu graczy osiągnie lub przekroczy wartość K. 
% Wygrywa ten z graczy, który wykonał ostatni ruch.

% Napisz predykat wygrywa(L, K, X) sprawdzający, czy  gracz rozpoczynający grę ma strategię wygrywającą jeśli rozpocznie grę od wyboru liczby X.
% Jeśli wywołamy predykat ze zmienną X, to powinien zwrócić nam w tej zmiennej  liczbę, którą należy wybrać w pierwszym ruchu, aby wygrać (o ile to możliwe).

wygrywa(L, K, X) :-
    member(X, L),
    X >= K.

wygrywa(L, K, X) :-
    member(X, L),
    X < K,
    K1 is K-X,
    not(wygrywa(L, K1, X)).

% Napisz interaktywny program graj(L, K) grający w tę grę z człowiekiem. 
% Program powinien pytać gracza o liczbę, którą chce wybrać, samodzielnie wybierać swój ruch, 
% tak aby wygrać grę, jeśli to tylko możliwe. 

graj(L, K) :-
    wygrywa(L, K, X),
    write("mój ruch: "), writeln(X),
    
    X >= K, 
    writeln("wygrałem!").

graj(L, K) :-
    wygrywa(L, K, X),
    write("mój ruch: "), writeln(X),
    R is K - X,
    write("pozostało: "), writeln(R),
    write("Podaj swój ruch: "), read(UX),
    K1 is K - X - UX,
    graj(L, K1).

sprawdz(L, K, X) :- X >= K.
    write("Wygrałem!").

sprawdz(L, K, X) :- X < K.
      
% graj(L, K) :-
%     writeln('Podaj liczbe:'),
%     read(B),
%     B >= K,
%     writeln('Wygrałeś!').

% graj(L, K) :-
%     writeln('Podaj liczbe:'),
%     read(B),
%     B < K,
%     K1 is K - B,
%     ruch_komputera(L, K1).

% ruch_komputera(L, K) :-
%     wygrywa(L, K, X),
%     X >= K,
%     writeln('Komputer wygrywa!');
%     K1 is K - X,
%     graj(L, K1).

% wybierz_ruch(L, K, X) :-
%     wygrywa(L, K, X);
