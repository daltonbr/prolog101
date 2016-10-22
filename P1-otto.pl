member(X,[X|_]).
member(X,[_|T]) :-
    member(X,T).

len([],0).
len([_|T],L) :-
    len(T,L1), L is L1+1.

twice([], []).
twice([H|T],[H1|T1]):-
  H1 is 2*H, twice(T, T1).

removeFirst(_,[],[]).
removeFirst(X,[X|T],T).
removeFirst(X,[H|T],[H|T2]):-
  removeFirst(X,T,T2).

odd(N):- 1 is mod(N,2).
allOdd([]).
allOdd([ H | T]):- odd(H),allOdd(T).
