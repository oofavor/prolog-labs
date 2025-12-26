:- use_module(library(plunit)).

fib(1, 0).
fib(2, 1).

fib(N, F) :-
    N > 2,
    M1 is N - 1,
    M2 is N - 2,
    fib(M1, F1),
    fib(M2, F2),
    F is F1 + F2 .

:- begin_tests(fib).

test(f1, true(F == 0)) :-
    fib(1, F).

test(f2, true(F == 1)) :-
    fib(2, F).

test(f3, true(F == 1)) :-
    fib(3, F).

test(f4, true(F == 2)) :-
    fib(4, F).

test(f5, true(F == 3)) :-
    fib(5, F).

test(f6, true(F == 5)) :-
    fib(6, F).

:- end_tests(fib).

