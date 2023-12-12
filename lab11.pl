% 1. Napisz predykat subst(T, A, V, R). Które zamienia w wyrażeniu T wszystkie wystąpienia atomu A na V i zwraca wynik w R. 

% Przykład:
% subst(siostra(ala, ola), ala, hemenegilda, W), subst(W, siostra, sister), Z)
% W = siostra(hermenegilda, ola),
% Z = sister(hermenegilda, ola),

% subst((a+1)*(a+5), a, 2, W), subst(W,*,/,Z).
% W = (2+1)*(2+5),
% Z=(2+1)/(2+5).

subst(A, A, V, V) :- !.

subst(T, A, V, R) :-
    T =.. [F|Args],
    subst_list(Args, A, V, RArgs),
    R =.. [F|RArgs].

subst_list([], _, _, []).
subst_list([H|T], A, V, [RH|RT]) :-
    subst(H, A, V, RH),
    subst_list(T, A, V, RT).

% 2. Napisz predykat rysuj/1 "rysujący" drzewo o dowolnej liczbie gałęzi. Drzewo reprezentujemy w rekurencyjnie przy pomocy struktury d(<wezel>, drzewo_1, ...., drzewo_n). "rysunek" ma zostać wypisany na standardowe wyjście.

% Rysunek drzewa d(a, d(b, d(c),d(d)),  d(e, d(f), d(g)),  d(h))  uzyskany wywołaniem rysuj(d(a, d(b, d(c), d(d)), d(e, d(f), d(g)), d(h)))
% ma wyglądać następująco. Każdy następny poziom jest zagnieżdżony o jedną spację

% a
%  b
%   c
%   d
%  e
%   f
%   g
%  h

