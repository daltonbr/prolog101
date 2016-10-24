%%% Recursion Exercises from Haskell to PROLOG
% PART 2

% stammer([1,2,3],N). %>>> N = [1,1,2,2,3,3]
stammer([],[]).
stammer([H|T],[H,H|R]) :- stammer(T,R).

% listRef([8,3,5,2],0,N). %>>> N = 8
listRef([H|_],0,H). % if X == 0 result is H
listRef([_|T],X,R) :- NewX is X-1, listRef(T,NewX,R).

% listTail([1,2,3,4],0,[1,2,3,4]).
% listTail([1,2,3,4],2,[3,4]).
listTail([],_,[]).
listTail(L,0,L).
listTail([_|T],X,R) :- NewX is X-1, listTail(T,NewX,R).

% alternate([1,2,3,4],N). %>>> N = [2,1,4,3]
alternate([],[]).
alternate([H1,H2|T],[H2,H1|R]) :- alternate(T,R).

% sorted([1,2,3]). %>>> true
sorted([]).
sorted([_]).
sorted([H1,H2|T]) :- H1@=<H2, sorted([H2|T]).

% odds([8,7,3,6,1,9],N). %>>> N = [8,3,1]
odds([],[]).
odds([_],[_]).
odds([H1,_|T],[H1|R]) :- odds(T,R).

% unique([1,1,1,2,2,2,2,3,4,4],N). %>>> N = [1,2,3,4]
  unique_(_,[],[]).
  unique_(N,[N|T],R) :- unique_(N,T,R).
  unique_(_,[H|T],[H|R]) :- unique_(H,T,R).
unique([],[]).
unique([H|T],[H|R]) :- unique_(H,T,R).

% merge([2,6,18,54],[1,3,9,18,27,81],N). %>>> N = [1,2,3,6,9,18,18,27,54,81]
merge_([],[],[]).
merge_([_],[],[_]).
merge_([H1|T1],[H2|T2],[H1|R]) :- H1@<H2, merge_(T1,[H2|T2],R).
merge_([H1|T1],[H2|T2],[H2|R]) :- merge_([H1|T1],T2,R).
