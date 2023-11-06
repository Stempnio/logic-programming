% a) lacz_listy(A, B, C) - łączy listy A i B w listę C. Jeśli podano listy A i C powinien znaleźć listę B.
% Np. 
%   ?-lacz_listy([1,2,3], [4,5,6], C).
%     C = [1,2,3,4,5,6].
%   ?-lacz_listy([1,2,3], C, [1,2,3,4,5]).
%     C = [4,5].

lacz_listy([],L,L).
lacz_listy([H|T1], L2, [H|T3]) :- 
   lacz_listy(T1, L2, T3).

% b) ostatni_element(A, B) - uzgadnia B z ostatnim elementem listy A
% Przykład: 
% ?- ostatni_element([a,b,c], B).
%   B = c.
% ?- ostatni_element([], B).
%     false.
% ?- ostatni_element([a,b,X], c).
%     X=c.

ostatni_element([B], B).
ostatni_element([_ | A], Y) :-
   ostatni_element(A,Y).

% c) prefiks(A, B) - sprawdza, czy lista A jest początkowym fragmentem listy B
% Przykład: 
% ?- prefiks([a,b], [a,b,c]).
%   true.
% ?- prefiks([a,c], [a,b,c]).
%   false.
% ?- prefiks(X, [a,b]).
%    X=[];
%    X=[a];
%    X=[a,b].

prefiks([], _).
prefiks([A|B], [A|D]) :-
   prefiks(B, D).

% d) podlista(A, B) - sprawdza, czy A jest spójnym fragmentem listy B
% Przykład:
% ?- podlista([b, c], [a,b,c,d]).
%    true.
% ?- podlista([a, c], [a,b,c,d]).
%    false.
% ?- podlista([X,Y], [a,b,c]).
%    X=a, Y=b;
%    X=b, Y=c.

podlista(A,B) :-
   prefiks(A,B).
podlista(A, [_|T]) :- 
   podlista(A, T).


% e) sortuj(A, B) - napisz predykat sortujący listę A i uzgadniający posortowaną listę ze zmienną B. Proszę zastosować sortowanie przez proste wstawianie.
% ?- sortuj([2, 3, 1], [1, 2, 3]).
%    true.

% ?- sortuj([2, 3, 1], A).
%    A = [1,2,3]

% sortuj(A,B).

wstaw(A,[],[A]).
% wstaw(A, [H|T], L) :-
%    A =< H,
%    L = [A, H| T].
wstaw(A, [H|T], [A, H| T]) :-
   A =< H.
wstaw(A, [H|T], [H | L]) :-
   A > H,
   wstaw(A, T, L).
   

sortuj([], []).
sortuj([H|T], L) :- sortuj(T,S), wstaw(H,S,L).

% f) podlista2(A, B) - sprawdza, czy A jest fragmentem listy B niekoniecznie spójnym. Należy uwzględnić liczbę powtórzeń elementów.  

% ?- podlista2([1,2,3,2], [1,a,b,2,c,c,3,c,c,2]).
%    true.

% ?- podlista2([1,2,3,2], [1,a,b,2,2,c,c,3,c,c]).
%    false.

% ?- podlista2([1,2,2,3], [a,b,2,2,c,c,3,c,c,1]).
%    false.

% TODO - implement

% g) permutacja(A, B) - uzgadnia listę B kolejno z permutacjami listy A.

% ?- permutacja([1,2,3], B).
%    B=[1,2,3] ;
%    B=[1,3,2] ;
%    B=[2,1,3] ;
%    B=[2,3,1] ;
%    B=[3,1,2] ;
%    B=[3,2,1] ;
%    false 

% Uwaga: Kolejność w jakiej predykat oblicza permutacje nie jest istotna. Nie będzie również błędem, jeśli permutacje będą się powtarzać.

% todo

% h) usun_element(L1, E, L2) - usuwa z listy L1 pierwsze wystąpienie elementu E i uzgadnia wynikową listę z L2. Jeśli elementu nie ma na liście, to uzgadnia listę L2 z L1.

% ?- usun_element([a,b,c,a,b,c], b, L).
%    L=[a,c,a,b,c].

% ?- usun_element([a,b,c,a,b,c], x, L).
%    L=[a,b,c,a,b,c].

usun_element([], _, []).
usun_element([H|T], H, T).
usun_element([H|T], X, [H | L]) :-
   usun_element(T, X, L).

% i) usun_duplikaty(L1, L2) - usuwa z listy L1 duplikaty i uzgadnia wynik z listą L2. Elementy listy L2 mogą występować w dowolnej kolejności.

% ?- usun_duplikaty([a,b,c,a,a,b,c], L).
%    L=[a,b,c].   % Kolejność nie jest istotna

% L zawiera X
zawiera([X], X).
zawiera([X|_], X).
zawiera([_|T], X):-
   zawiera(T, X).

usun_duplikaty([], []).
usun_duplikaty([H|T], L) :-
   zawiera(T, H),
   usun_duplikaty(T, L).
usun_duplikaty([H|T], [H|L]) :-
   not(zawiera(T,H)),
   usun_duplikaty(T, L).
