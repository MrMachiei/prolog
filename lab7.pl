%zad1
sumuj([X],X) :- !.
sumuj([X|L], S1) :- sumuj(L,S),!, S1 is S+X.

podzielniki(N, N, []) :- !.
podzielniki(N, D, [D|L]) :- T is N mod D, T = 0, D1 is D+1,!, podzielniki(N, D1, L),!.
podzielniki(N, D, L) :- D1 is D+1, podzielniki(N, D1, L),!.

doskonala(N) :- N>0, podzielniki(N, 1, L), sumuj(L, N),!.

%zad2
przekroj(_, [], []) :- !.
przekroj([], _, []) :- !.
przekroj([_],[_],[]) :- !.
przekroj([X], [X], [X]) :- !.
przekroj([X|L1],[X|L2],[X|L]) :- przekroj(L1, L2, L),!. 
przekroj([X1|L1],[X2|L2],L) :- X1 < X2, przekroj(L1,[X2|L2],L),!.
przekroj([X1|L1],[_|L2],L) :- przekroj([X1|L1],L2,L),!.

%zad3
glowyogony([], [], []):-!.
glowyogony([[HL|OL]|L2], [HL|G], [OL|O]) :- glowyogony(L2, G, O),!. 

slad([],0) :- !.
slad([[X]], X) :- !.
slad(M, S) :- glowyogony(M, [GH|_], [_|O]), !, slad(O, S1),!,S is S1+GH,!. 

%zad4
rozszerzaj([[M,N]], [M,N]) :- !.
rozszerzaj([[M, N]|R], [M, N]) :- rozszerzaj(R, [M1, N1]),N > N1,M<M1,!.
rozszerzaj([[M, _]|R], [M, N1]) :- rozszerzaj(R, [M1, N1]), M < M1,!.
rozszerzaj([[_, N]|R], [M1, N]) :- rozszerzaj(R, [M1, N1]),N > N1,!.
rozszerzaj([[_, _]|R], [M1, N1]) :- rozszerzaj(R, [M1, N1]),!.

%zad5
ciagliczb(N, N, [N]) :- !.
ciagliczb(M,N,[M|L]) :- M =< N, !, M1 is M + 1, ciagliczb(M1, N, L),!. %>

liczpodziel(N, N, 0) :- !.
liczpodziel(N, D, S) :- T is N mod D, T = 0, D1 is D+1,!, liczpodziel(N, D1, S1),!, S is S1+1, !.
liczpodziel(N, D, S) :- D1 is D+1, liczpodziel(N, D1, S),!.

antyp([], _) :- !.
antyp([_], _) :- !.
antyp([H|T], LP) :- liczpodziel(H, 1, S), S < LP, antyp(T, LP),!. 

antypierwsza(N) :- ciagliczb(1, N, L), liczpodziel(N, 1, LP), antyp(L, LP).

%zad6
rozmien(N, S, [X]) :- append(_, [X],N), X = S,!.
rozmien(N, S, R) :- append(_, [X],N), X < S, S1 is S - X, rozmien(N, S1, L),!, append(L,[X],R),!.
rozmien(N, S, L) :- append(L1,[_],N), rozmien(L1, S, L),!.

%zad7
wpolu([], _, []) :- !.
wpolu([[HX,HY]|T], [[X1,Y1],[X2,Y2]], [[HX,HY]|L]) :- HX =< X2, HY =< Y2, HX >= X1, HY >= Y1,  !, wpolu(T,[[X1,Y1],[X2,Y2]], L ),!.
wpolu([[HX,_]|T], [[X1,Y1],[X2,Y2]], L) :- HX < X1,wpolu(T,[[X1,Y1],[X2,Y2]], L ),!.
wpolu([[_,HY]|T], [[X1,Y1],[X2,Y2]], L) :-  HY < Y1,wpolu(T,[[X1,Y1],[X2,Y2]], L ),!.
wpolu([[HX,_]|T], [[X1,Y1],[X2,Y2]], L) :- HX > X2,wpolu(T,[[X1,Y1],[X2,Y2]], L ),!.
wpolu([[_,HY]|T], [[X1,Y1],[X2,Y2]], L) :-   HY > Y2,wpolu(T,[[X1,Y1],[X2,Y2]], L ),!.

%zad8
minX([[HX,_]], HX) :- !.
minX([[HX,_]|T], HX) :- minX(T, X1), HX < X1,!.
minX([_|T], X1) :- minX(T, X1),!.

minY([[_,HY]], HY) :- !.
minY([[_,HY]|T], HY) :- minY(T, Y1), HY < Y1,!.
minY([_|T], Y1) :- minY(T, Y1),!.

maxX([[HX,_]], HX) :- !.
maxX([[HX,_]|T], HX) :- maxX(T, X1), HX > X1,!.
maxX([_|T], X1) :- maxX(T, X1),!.

maxY([[_,HY]], HY) :- !.
maxY([[_,HY]|T], HY) :-maxY(T, Y1), HY > Y1,!.
maxY([_|T], Y1) :- maxY(T, Y1),!.

minpole(L, [[X1,Y1],[X2,Y2]]) :- minX(L, X1),!, maxX(L, X2),!, minY(L, Y1), !, maxY(L, Y2),!.

%zad9
zamien_g([],[]) :- !.
zamien_g([H],[H]):-!.
zamien_g([X,Y|T], [Y|L]) :- X>=Y, zamien_g([X|T], L),!.
zamien_g([X,Y|T], [X|L]) :- X<Y, zamien_g([Y|T], L),!.

zamien_d([],[]) :- !.
zamien_d([H],[H]):-!.
zamien_d([X,Y|T], [Y|L]) :- X<Y, zamien_d([X|T], L),!.
zamien_d([X,Y|T], [X|L]) :- X>=Y, zamien_d([Y|T], L),!.

odwracaj([],[]) :- !.
odwracaj([X],[X]) :- !.
odwracaj([H|T], W) :- odwracaj(T, W1),append(W1, [H], W).

koktajl([],[]) :- !.
koktajl([X], [X]) :- !.
koktajl(L, S) :- zamien_g(L, L1), append(H1, [X], L1), odwracaj(H1, H2), zamien_d(H2, L2), append(L3, [Y], L2), odwracaj(L3, L4), koktajl(L4, H3), append([Y|H3], [X], S),!.

%zad10
ciagFib(N, F1, F2, [F1|L]) :- X is F1 + F2, X =< N,ciagFib(N,F2, X, L),!. %>
ciagFib(_, F1, F2, [F1,F2]) :- !. 

rozklad(LF, N, [X]) :- append(_,[X], LF), X = N,!.
rozklad(LF, N, R) :- append(L1,[X], LF), X < N,  N1 is N - X, rozklad(L1, N1, L),append(L,[X],R),!.
rozklad(LF, N, L) :- append(L1,[X], LF), X > N, rozklad(L1, N, L),!.

rozklad_fib(N, W) :- ciagFib(N, 0, 1, L), rozklad(L, N, W).











