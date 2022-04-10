%zad1
symetryczna([]) :- !.
symetryczna([_]) :- !.
symetryczna([X|L]) :- append(L1,[X],L),!, symetryczna(L1).
%zad2
parami([],[]):-!.
parami([X,Y],[[X,Y]]) :-!.
parami([X,Y|L],[[X,Y]|W]) :- parami(L,W).
%zad3
polowki([],[],[]) :- !.
polowki([X|L],[X|LL],LP) :- append(LP,[W],L).
%!!!!
%zad4
sumuj([],0) :- !.
sumuj([X|L], S1) :- sumuj(L,S), S1 is S+X.
%zad5
ile_dodatnich([], 0) :- !.
ile_dodatnich([X|L],N) :- ile_dodatnich(L, N1),((X>0, N is N1 + 1,!); N is N1). 
%zad6
plus_minus([],0) :- !.
plus_minus([X|L], S) :- plus_minus(L, S1),((X == +, S is S1 + 1,!); S is S1 - 1). 
%zad7
wstawiaj(L,X,1,[X|L]) :- !. 
wstawiaj([Y|L],X, I, [Y|L1]) :- I1 is I - 1, wstawiaj(L,X,I1, L1).
%zad8
usuwaj(L, 0, L) :- !.
usuwaj([_|L],I,W) :- I1 is I - 1, usuwaj(L,I1,W).
%zad9
rozdziel([],_,[],[]) :- !.
rozdziel([],_,_,_) :- !.
rozdziel([Y|L], X, [Y|L1], L2) :- Y < X,!, rozdziel(L, X, L1, L2).
rozdziel([Y|L], X, L1, [Y|L2]) :- Y >= X,!, rozdziel(L, X, L1, L2).
%zad10
powiel([],[],[]) :- !.
powiel([X],[1], [X]) :- !.
powiel([X],[Y], [X|L]) :- Y1 is Y - 1, powiel([X],[Y1],L),!.
powiel([X|L],[Y|L2],U) :- powiel([X], [Y], W),!, powiel(L, L2, L1),!, append(W,L1,U).