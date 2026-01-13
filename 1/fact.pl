:- use_module(library(plunit)).

fact(0, 1).

fact(N, F) :- N > 0, M is N - 1, fact(M, F1), F is N * F1.

:- begin_tests(factorial).

test(first, true(F == 1)) :-
    fact(0, F).

test(second, true(F == 1)) :-
    fact(1, F).

test(third, true(F == 120)) :-
    fact(5, F).

test(forth, true(F == 720)) :-
    fact(6, F).

:- end_tests(factorial).
:- initialization(run_tests).
