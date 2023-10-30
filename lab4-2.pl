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
