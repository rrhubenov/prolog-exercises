
empty(c).
add(X, C, f(X, C)).

first(X, [X|_]).
second(X, [_|Tail]) :- first(X, Tail).
last(X, [X]).
last(X, [_|Tail]) :- last(X, Tail).

member(X, [X|_]).
member(X, [_|Tail]) :- member(X, Tail).

append1([], B, B).
append1([X|Tail], B, [X|C]) :- append1(Tail, B, C).

firstUsingAppend(X, L) :- append1([X], _, L).
secondUsingAppend(X, L) :- append1([_], [X|_], L).

lastUsingAppend(X, L) :- append1(_, [X], L).

memberUsingAppend(X, L) :- append1(_, [X|_], L).

insert(X, List, Result) :- append1(List1, List2, List), append1(List1, [X|List2], Result).
remove(X, List, Result) :- append1(List1, [X|List2], List), append1(List1, List2, Result).

permutation1([], []).
permutation1(L, [X|P]) :- remove(X, L, M), permutation(M, P).

permutation2([], []).
permutation2([Head|Tail], Result) :- permutation(Tail, Q), insert(Head, Q, Result).


lessOrEqual(X, Y) :- X =< Y.

isSortedList([]).
isSortedList([_]).
isSortedList([X, Y|Tail]) :- lessOrEqual(X, Y), isSortedList([Y|Tail]).



