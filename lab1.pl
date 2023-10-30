% Poniżej opisane zostały zależności rodzice - dzieci
% RODZICE	DZIECI
% ala i jacek	ola, magda, michal
% wanda i karol	czarek, roman
% witold i kunegunda	franek, zuzanna
% magda i mariusz	onufry, aneta
% onufry i ola	ewa, nina
% 1. Zdefiniuj predykaty opisujące następujące związki miedzy osobami z tabeli:

% mezczyzna/1
% kobieta/1
% dziecko/2 - dziecko(X,Y) = 'X jest dzieckiem Y'
% syn/2
% corka/2
% wnuk/2
% dziadek/2
% dziadek/1 - dziadek(X) = 'X jest czyimś dziadkiem'
% potomek/2

mezczyzna(jacek).
mezczyzna(karol).
mezczyzna(czarek).
mezczyzna(roman).
mezczyzna(franek).
mezczyzna(witold).
mezczyzna(mariusz).
mezczyzna(onufry).

kobieta(ala).
kobieta(ola).
kobieta(magda).
kobieta(wanda).
kobieta(kunegunda).
kobieta(zuzanna).
kobieta(aneta).
kobieta(ewa).
kobieta(nina).

dziecko(ola, ala).
dziecko(magda, ala).
dziecko(michal, ala).

dziecko(ola, jacek).
dziecko(magda, jacek).
dziecko(michal, jacek).

dziecko(ewa, ola).
dziecko(nina, ola).

dziecko(ewa, onufry).
dziecko(nina, onufry).

dziecko(onufry, magda).
dziecko(aneta, magda).

dziecko(onufry, mariusz).
dziecko(aneta, mariusz).

syn(X, Y) :- mezczyzna(X), dziecko(X, Y).
corka(X, Y) :- kobieta(X), dziecko(X, Y).

wnuk(X, Y) :- mezczyzna(X), dziecko(X, Z), dziecko(Z, Y).

dziadek(X,Y) :- mezczyzna(X), dziecko(A, X), dziecko(Y, A).

dziadek(X) :- mezczyzna(X), dziadek(X, _).

potomek(X, Y) :- dziecko(X, Y).
potomek(X, Y) :- dziecko(X, Z), potomek(Z, Y).
    