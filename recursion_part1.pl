%%% Recursion Exercises from Haskell to PROLOG
% PART 1

% member(3,[5,4,2], true).
% No need to use a boolean variable
% member(_,[],false). % empty list has no member
% member(X, [X|_],true). % true when the first element is X
% member(X,[_|T],true) :- member(X,T,true). % when X!=H, look at X in T
% member(_,_,false). % did not find X in T

member([X|_], X) :- !.
member([_|T], X) :- member(T, X).

% length1([1,7,3,5],N). % >>> N = 4
length1(L,N) :- length2(L,0,N). % fassade starts Acc as 0
length2([], Acc, Acc). % length of empty list is Acc (which value is 0)
length2([_|T], Acc, N) :- % when in not an empty list...
  Acc1 is Acc+1, % Acc++
  length2(T, Acc1, N). % length of list minus Head

% twice([1,2,3],N). %>>> N = [2,4,6]
twice([],[]). % empty list has no twice
twice([H|T], [TimesTwo|R]) :-
  TimesTwo is (H*2),
  twice(T,R).

% removeFirst(3,[4,2,8,3,5,2,3],N). %>>> N = [4,2,8,5,2,3]
removeFirst(_,[],[]).
removeFirst(X,[X|T],T).
removeFirst(X,[H|T],[H|R]) :- removeFirst(X,T,R).

% allOdd([3,5,7,1],N). %>>> N = true
odd(N) :- 1 is N mod 2.
allOdd([],true).
allOdd([H|T],true) :- odd(H), allOdd(T,true).
allOdd(_,false).

% andMap(odd,[1,7,5,9], N). %>>> N = true
andMap(_,[],true).
andMap(X,[H|T],true) :- call(X,H), andMap(X,T,true).
andMap(_,_,false).

% some(odd,[2,4,6,8,9],N). %>>> N = true
some(_,[],false).
some(X,[H|T],true) :- call(X,H); some(X,T,true).
some(_,_,false).

% sum([6,5,4],N). %>>> N = 15
sum([],0).
sum([H|T],R) :- sum(T,SumOfTail), R is H + SumOfTail.

% count(9,[1,9,2,9,9,3],N). %>>> N = 3
count(_,[],0).
count(X,[X|T],R) :- count(X,T,SumOfTail), R is 1 + SumOfTail.
count(X,[_|T],R) :- count(X,T,SumOfTail), R is 0 + SumOfTail.

% TO DO: MAP IN PROLOG
succ(X,R) :- R is X + 1.
% map(succ,[1,2,3],N). %>>> N = [2,3,4]

% filter(odd,[1,2,3,4],N). %>>> N = [1,3]
filter(_,[],[]).
filter(X,[H|T],[H|R]) :- call(X,H), filter(X,T,R).
filter(X,[_|T],R) :- filter(X,T,R).
