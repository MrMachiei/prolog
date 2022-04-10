next(świnoujście, kołobrzeg).
next(świnoujście, szczecin).
next(kołobrzeg,ustka).
next(ustka, gdańsk).
next(gdańsk,toruń).
next(gdańsk,olsztyn).
next(olsztyn,toruń).
next(olsztyn,białystok).
next(szczecin,bydgoszcz).
next(szczecin,gorzów-wlkp).
next(bydgoszcz,toruń).
next(bydgoszcz,poznań).
next(poznań,toruń).
next(gorzów-wlkp,poznań).
next(gorzów-wlkp,zielona-góra).
next(zielona-góra,poznań).
next(zielona-góra,wrocław).
next(toruń,łódź).
next(toruń,warszawa).
next(białystok,warszawa).
next(białystok,ź).
next(warszawa,radom).
next(warszawa,łódź).
next(radom,lublin).
next(radom,kielce).
next(wrocław,łódź).
next(łód,radom).
next(łódź,częstochowa).
next(częstochowa,kielce).
next(częstochowa,katowice).
next(katowice,kraków).
next(kielce,kraków).
next(kielce,rzeszów).
next(lublin,kielce).
next(lublin,rzeszów).
next(kraków,rzeszów).

połączenie(X,Y):-next(X,Y).
połączenie(X,Z):- next(X, Y),połączenie(Y,Z).

zjazd(Z,Y,Z) :- next(Z,Y).
zjazd(X,Y,Z) :- next(X,W), zjazd(W,Y,Z).

obok(X,Y) :- next(X,Y).
obok(X,Y) :- next(X,W), obok(W,Y).

trasa(X,Y,obok(X,Y)) :- next(X,Y).
trasa(X,Y,obok(X,obok(P,Z))) :- next(X,P), trasa(P,Y,obok(P,Z)).

trasa2(X,Y,obok(X,Y)) :- next(X,Y).
trasa2(X,Y,obok(obok(P,W),Y)) :- next(W,Y), trasa2(X,W,obok(P,W)).




