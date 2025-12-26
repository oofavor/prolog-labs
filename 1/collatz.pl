:- use_module(library(plunit)).

fact(N, F) :- N mod 2 =:= 0, F is N // 2 .
fact(N, F) :- N mod 2 =:= 1, F is N * 3 + 1 .

:- begin_tests(factorial).

test(f1, true(F == 4)) :-
    fact(1, F).

test(f2, true(F == 1)) :-
    fact(2, F).

test(f3, true(F == 16)) :-
    fact(5, F).

test(f4, true(F == 3)) :-
    fact(6, F).

:- end_tests(factorial).

