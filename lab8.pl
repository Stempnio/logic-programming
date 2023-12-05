concat(A1-B1, B1-C1, A1-C1).

% Zadanie A 
% Zdefiniować predykat mirror(A1-B1, A2-B2) dodający na koniec listy przekazanej w A1-B1 jej elementy
% w odwrotnym porządku i zwracający wynikową listę w A2-B2 w lewo o jeden element. 
% Proszę na początku zrealizować zadanie przy użyciu zwykłych list, predykatu append i bez użycia akumulatora. 
% W drugim etapie można zamienić taka implementację na listy różnicowe.

% Przykład:
% ?- mirror([a,b,c|X]-X, W).
% W = [a, b, c, c, b, a|_G1] - G1. 
% ?- mirror([a,b,c|X]-X, W-[]).
% W = [a, b, c, c, b, a]

% Implementacja bez list roznicowych

% mirror([], []).
% mirror([H|T], W) :-
%     mirror(T, M),
%     append([H|M], [H], W).

mirror([], L-L).
mirror([H|T], [H|A]-C) :-
    mirror(T, A-[H|C]).

% Zadanie B 
% Zdefiniować predykat rotate(A1-B1, A2-B2) przesuwający cyklicznie elementy w liście A1-B1 w lewo o jeden element. 
% Wynik powinien znaleźć się w zmiennej A2-B2.

% Przykład:
% ?- rotate([a,b,c|X]-X, W).
% W = [b,c,a|_G1] - G1. 
% ?- rotate([a,b,c|X]-X, W-[]).
% W = [b,c,a] 
app(L1-L2, L2-L3, L1-L3).

% rotate(A-A, A-A).
% rotate(A-B, X-Y) :-
%     % A = [H|T],
%     [H|T] = A,
%     app(T-B, [H|C]-C, X-Y).

% rot([H|T]-B, X-Y) :-
%     app(T-B, [H|C]-C, X-Y).

% rot(A-A, B-B).

% rot([H|T]-B, X-Y) :-
%     B = [H|C], X=T, C=Y.
% rot(A-A, B-B).

rot([H|T]-[H|C], T-C).
rot(A-A, B-B).

rot(A1-A2, B-B) :-
    unify_with_occurs_check(A1, A2).