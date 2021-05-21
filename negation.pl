
% p1(X, Y) <-> Има елемент на Х, който е в елемент на Y,
% Х е списък от елементи, Y е списък от списъци от елементи

p1(List1, List2) :- member(A, List1), member(B, List2), member(A, B).

% p2(X, Y) <-> Има ел. на Х, който е във всеки елемент на Y


% Ex in X s.t. Vy in Y, x in y
% Ea-Eb-member(a,b).
p2(List1, List2) :- member(X, List1), not( (member(Y, List2), not(member(X, Y))) ).


% p3(X, Y) <-> Всеки елемент на X е в елемент на Y
% Vx in X, Ey in Y s.t. x in y
% -Ea-Eb member(a,b)

p3(X, Y) :- not( (member(A, X), not( (member(B, Y), member(A, B)) )) ).


% p4(X, Y) <-> Всеки ел. на X е във всеки ел. на Y
% Va in X, Vb in Y, a in b
% -EaEb-member(a, b)

p4(X, Y) :- not( (member(A, X), member(B, Y), not(member(A, B))) ).

% prefix
prefix(P, L) :- append(P, _, L).

% suffix
suffix(L, S) :- append(_, S, L).

% sublist
% K is prefix for L, then something appended to our given sublist will give K.
sublist(SL, L) :- append(K, _, L), append(_, SL, K).


% subsequences

subsequence([], []).
subsequence([H|T], [H|Res]) :- subsequence(T, Res).
subsequence([_|T], Res) :- subsequence(T, Res).


% subset without negation

subset(_, []).
subset(S, [H|SST]) :- member(H, S), subset(S, SST).

% subset with negation
% Vsst in SS, sst in S
% -Ea-member(a, S).

subset1(S, SS) :- not( (member(A,SS), not(member(A, S))) ).

% Generate set of all subsets of a set
% in other words m(X, L) <-> L is the set of all subsets consisting of elements in X

% Va in L, Vb in a, b in X
% -Ea- -Eb- member(b, X).

m(X, L) :- not( (member(A, L), member(B, A), not(member(B, X))) ).


% k(X, L) :- L consists only of elements in X
% Va in L, a in X
% -Ea-member(A, X)

k(X, L) :- not( (member(A, L), not(member(A, X))) ).


% last element in a list
last([Last], Last).
last([_|T], Last) :- last(T, Last).

% without the last element
without_last(L, R) :- last(L, K), append(R, [K], L).

% reverse a list in n^2 time
reverse1([], []).
reverse1([H|T], R) :- reverse1(T, R1), append(R1, [H], R).

% reverse a list in n time
reverse2(L, R) :- reverse2(L, [], R).
reverse2([], Stack, Stack).
reverse2([H|T], Stack, Result) :- reverse2(T, [H|Stack], Result).

% palindrome

palindrome(L) :- reverse2(L, L).


% decart(L, R). L is a list of lists. R is an element of the cartesian product of the lists in L

decart(L, [A, B|[]]) :- member(X, L), member(Y, L), X \= Y, member(A, X), member(B, Y).