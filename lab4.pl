%zad1
ostatni(Element, [Element]) :- !.
ostatni(Element, [_|Y]) :- ostatni(Element, Y).

%zad2
przedostatni(Element, [Element, _]):- !.
przedostatni(Element, [_|Y]) :- przedostatni(Element, Y).

%zad3
nakoniec(Element, [], [Element]).
nakoniec(Element, L1, [L1|Element]).

%zad4
bezostatniego([_], []):- !.
bezostatniego([X|Y], [X|W]) :- bezostatniego(Y,W).

%zad5
podwajaj([],[]):- !.
podwajaj([X|Y],[X,X|W]) :- podwajaj(Y, W).

%zad6
codrugi([],[]):- !.
codrugi([_],[]):- !.
codrugi([_,Y|W], [Y|Z]) :- codrugi(W,Z).

%zad7
splataj([],[],[]):- !.
splataj([X|X1], [Y|Y1], [X,Y|W]) :- splataj(X1,Y1,W).

%zad8
lewoprawo(X,[X|W],[],W):- !.
lewoprawo(X,[A|X1],[A|Y1],W) :- lewoprawo(X, X1, Y1, W).

%zad9
wymiana(_,_,[],[]):- !.
wymiana(X,Y,[X|X1],[Y|Y1]) :-wymiana(X,Y,X1,Y1).
wymiana(X,Y,[H|T], [H|W]) :- wymiana(X,Y, T, W).

%zad10
polacz([],[]).
polacz([L|R], W) :- polacz(R,R1),append(L,R1,W).

