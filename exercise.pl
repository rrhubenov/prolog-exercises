len([], 0).
len([_|T], S) :- len(T, Y), S is Y + 1.

sum([], 0).
sum([H|T], X) :- sum(T, Y), X is Y+H.


nthElement(X, 0, [X|_]).
nthElement(X, N, [_|T]) :- nthElement(X, M, T), N is M + 1.

% Генериране на елементи

natural(0).
natural(X) :- natural(Y), X is Y + 1.

even(X) :- natural(X), X mod 2 =:= 0.
even1(X) :- natural(C), X is 2*C.

int(X) :- natural(C), decodeInt(X, C).
decodeInt(X, C) :- C mod 2 =:= 0, X is -1*C//2.
decodeInt(X, C) :- C mod 2 =:= 1, X is C//2 + 1.


int2(X) :- natural(Y), sign(Y, X).
sign(X, X).
sign(X, Y) :- X > 0, Y is -X.


int3(0).
int3(X) :- natural(Y), Y > 0, member(Z, [1,-1]), X is Y*Z.

between(A, _, A).
between(A, B, X) :- A < B, A1 is A + 1, between(A1, B, X).

natural20(X) :- between(0, 20, X).

pairNatural(X, Y) :- natural(Z), between(0, Z, X), Y is Z-X.
