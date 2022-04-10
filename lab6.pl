%zad1
najwiekszy([M],M) :- !.
najwiekszy([H|T], M) :- najwiekszy(T, X),H >= X, M = H,!.
najwiekszy([H|T], M) :- najwiekszy(T, X),H < X, M = X,!.
%zad2
liniowa([_,_]) :- !.
liniowa([X,Y|[Z|T]]) :- Y - X =:= Z - Y,!,liniowa([Y,Z|T]),!.
liniowa([X,Y|[Z|_]]) :- Y - X =:= Z - Y, !.

%zad3
rozbij([],[],[]) :- !.
rozbij(L1,[L2H|L2T],[X|LT]) :- L2H > 0, !,append(X,Y, L1), length(X, L2H), !, rozbij(Y, L2T, LT), !.

%zad 4
przynaleznosc([], [_,_], [],[]) :- !.
przynaleznosc([SH|ST], [L,P], [SH|T1], LZ) :- SH >= L, SH =< P,!, przynaleznosc(ST, [L,P], T1, LZ),!.
przynaleznosc([SH|ST], [L,P], LW, [SH|T2]) :- SH =< L,!,przynaleznosc(ST, [L,P], LW, T2),!.
przynaleznosc([SH|ST], [L,P], LW, [SH|T2]) :- SH >= P,!,przynaleznosc(ST, [L,P], LW, T2),!.

%zad5
decnabin([],[]) :- !.
decnabin(1, [1]) :- !.
decnabin(0, [0]) :- !.
decnabin(N, B) :- N > 0, !,N1 is N div 2, NM is N mod 2, decnabin(N1, T), append(T, [NM], B), !.

%zad6
rozdziel([],_,[],[]) :- !.
rozdziel([],_,_,_) :- !.
rozdziel([Y|L], X, [Y|L1], L2) :- Y < X,!, rozdziel(L, X, L1, L2).
rozdziel([Y|L], X, L1, [Y|L2]) :- Y >= X,!, rozdziel(L, X, L1, L2).

szybkisort([],[]) :- !.
szybkisort([X],[X]) :- !.
szybkisort([LH|LT],S) :- rozdziel(LT, LH, X,Y),!, szybkisort(X, N1), !, szybkisort(Y,N2), !, append(N1,[LH|N2],S),!.

%zad7
doposort(X, [], [X]) :- !.
doposort(X, [L1H|L1T], [L1H|L2]) :- L1H < X, !, doposort(X, L1T, L2),!.
doposort(X, [L1H|L1T], [X|[L1H|L1T]]) :- L1H >= X,!.

wstawsort([],[]) :- !.
wstawsort([X], [X]) :- !.
wstawsort([H|T], S) :- wstawsort(T, X),!, doposort(H, X, S),!.

%zad8
unikalne([],[]) :- !.
unikalne([LH|LT],[LH|K]) :- unikalne(LT, K), not(member(LH,K)),!.
unikalne([LH|LT],K) :- unikalne(LT, K), member(LH,K),!.

%zad9
najblizszy(_, [Y], Y) :- !.
najblizszy(X, [H|T], M) :- najblizszy(X, T, Z), W is abs(X - H), Z1 is abs(X - Z), W < Z1,  M = H,!.
najblizszy(X, [H|T], Z) :- najblizszy(X,T,Z),W is abs(X - H),Z1 is abs(X - Z), W >= Z1,!. 

%zad10
ciagliczb(N, N, [N]) :- !.
ciagliczb(M,N,[M|L]) :- M =< N, !, M1 is M + 1, ciagliczb(M1, N, L),!. %>

odsiewaj(_, [],[]) :- !.
odsiewaj(X, [Y], []) :- H1 is Y mod X, H1 =:= 0,!.
odsiewaj(X, [Y], [Y]) :-!.
odsiewaj(X, [L1H|L1T],L2) :- H1 is L1H mod X, H1 =:= 0,!, odsiewaj(X, L1T, L2).  
odsiewaj(X, [L1H|L1T],[L1H|L2]) :- odsiewaj(X, L1T, L2). 

sito([],[]) :- !.
sito([H|T],[H|L2]) :- odsiewaj(H,T,T1),sito(T1, L2), !.

eratostenes(X, L) :- ciagliczb(2,X,L1),!, sito(L1,L),!.
