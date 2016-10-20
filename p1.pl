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

% count 'b' ['a', 'b', 'b', c'] >>> 2

% TODO: make a odd/even function
odd(1).
odd(3).
odd(5).
odd(7).
odd(9).

% all_odd([5,3,9]) must be true

poeta(castro_alves).
poeta(drummond).
poeta(joao_cabral).
poeta(mano_brown).
poeta(arnaldo_antunes).
morto(drummond).
morto(joao_cabral).
morto(castro_alves).
morto(d_pedro_I).

poeta_morto(X) :- poeta(X), morto(X).
% some_dead_poet([X]) :- poeta_morto(X).
some_dead_poet([H|_]) :- poeta_morto(H).
some_dead_poet([_|T]) :- some_dead_poet(T).

% stammer ['a', 'b', 'c', 'd']  >>> ['a', 'a', 'b', 'b', 'c', 'c', 'd', 'd']

% take(3,[1,10,100,1000],[1,10,100]).

% drop(2,[1,10,100,1000],[10,100]).

% alternate([1,3][10,11],[1,10,3,11]).

% max2
% max2(X,Y,X) :- X > Y.
% max2(X,Y,Y) :- Y >= X.

% max_filter
max_filter([3,7,0],7).

% append2([1,2],[3,4],[1,2,3,4],X). %already has a native append command

%substitute(c,d,[a,c,c,e],[a,d,d,e]).
