% Basic algorithms in Prolog

% Grafo
% grafo entre cidades - a eh uma relacao(g,h).

a(d,a).
a(g,d).
a(e,d).
a(h,f).
a(e,f).
a(a,e).
a(a,b).
a(b,f).
a(b,c).
a(f,c).

vizinhas(C,D) :- a(C,D).
vizinhas(C,D) :- a(D,C).

chegar(Partida,Chegada) :- a(Partida,Chegada).
chegar(Partida,Chegada) :- a(Partida,C),chegar(C,Chegada).

% lenght2 function - [tested - Dalton]
length2([], 0).
length2([_|T],L) :- length2(T,L1),L is L1 + 1.

% twice function - [tested - Dalton]
twice([],[]).
twice([H|T], [H1|T1]) :- H1 is H * 2, twice(T,T1).

% sum2 [1,3,5] >>> 9 - [not working - Dalton]
sum2([],0).
sum2([H|T],L) :- L is L1 + H, sum(T,L1).