%            Maria-Piotr        Adam-Ewa
%            -----------        --------
%              /  |  \          /  |  \
%             /   |   \        /   |   \
%            /  Marek  \      /  Joanna \
% Robert-Agata         Jan-Anna         Krzysztof-Agnieszka
% ------------         --------         -------------------
%     /  \               /  \                   /  \
%    /    \             /    \                 /    \
%   /      \           /      \               /      \
% Radek   Beata      Darek   Tomek         Jacek    Iwona

kobieta(maria).
kobieta(ewa).
kobieta(joanna).
kobieta(agata).
kobieta(anna).
kobieta(agnieszka).
kobieta(beata).
kobieta(iwona).

mezczyzna(piotr).
mezczyzna(adam).
mezczyzna(marek).
mezczyzna(robert).
mezczyzna(jan).
mezczyzna(krzysztof).
mezczyzna(radek).
mezczyzna(darek).
mezczyzna(tomek).
mezczyzna(jacek).

rodzic(maria, marek).
rodzic(maria, agata).
rodzic(maria, jan).
rodzic(piotr, marek).
rodzic(piotr, agata).
rodzic(piotr, jan).

rodzic(adam, joanna).
rodzic(adam, anna).
rodzic(adam, krzysztof).
rodzic(ewa, joanna).
rodzic(ewa, anna).
rodzic(ewa, krzysztof).

rodzic(robert, radek).
rodzic(robert, beata).
rodzic(agata, radek).
rodzic(agata, beata).

rodzic(jan, darek).
rodzic(jan, tomek).
rodzic(anna, darek).
rodzic(anna, tomek).

rodzic(krzysztof, jacek).
rodzic(krzysztof, iwona).
rodzic(agnieszka, jacek).
rodzic(agnieszka, iwona).

malzenstwo(maria, piotr).
malzenstwo(adam, ewa).
malzenstwo(robert, agata).
malzenstwo(jan, anna).
malzenstwo(krzysztof, agnieszka).

matka(X, Y) :- kobieta(X), rodzic(X, Y).
ojciec(X, Y) :- mezczyzna(X), rodzic(X, Y).

siostra(X, Y) :- kobieta(X), rodzic(Z, X), rodzic(Z, Y), X\=Y.
brat(X, Y) :- mezczyzna(X), rodzic(Z, X), rodzic(Z, Y), X\=Y.

babcia(X, Z) :- kobieta(X), rodzic(X, Y), rodzic(Y, Z).
dziadek(X,Z) :- mezczyzna(Y), rodzic(X, Y), rodzic(Y, Z).

wuj(X, Y) :- brat(X, Z), matka(Z, Y).
stryj(X, Y) :- brat(X, Z), ojciec(Z, Y).

kuzyn(X, Y) :- mezczyzna(X), rodzic(Z, X), wuj(Z, Y).
kuzynka(X, Y) :- kobieta(X), rodzic(Z, X), wuj(Z, Y).

tesciowa(X, Y) :- matka(X, Z), (malzenstwo(Z, Y) ; malzenstwo(Y, Z), kobieta(Z).

zona(X, Y) :- kobieta(X), malzenstwo(X, Y).
zona(X, Y) :- kobieta(X), malzenstwo(Y, X).

maz(X ,Y) :- mezczyzna(X), malzenstwo(X, Y).
maz(X, Y) :- mezczyzna(X), malzenstwo(Y, X).

szwagier(X, Y) :- brat(X, Z), zona(Z, Y).
szwagier(X, Y) :- maz(X, Z), siostra(Z, Y).

przodek(X,Y):- rodzic(X,Y).
przodek(X,Y):- rodzic(X,Z), przodek(Z,Y).

