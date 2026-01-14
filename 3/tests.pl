:- consult('main.pl').
:- use_module(library(plunit)).

% Задача 2.1 - is_prime
:- begin_tests(is_prime).

test(prime_2) :- is_prime(2).
test(prime_3) :- is_prime(3).
test(prime_5) :- is_prime(5).
test(prime_7) :- is_prime(7).
test(prime_11) :- is_prime(11).
test(prime_13) :- is_prime(13).
test(prime_97) :- is_prime(97).
test(prime_101) :- is_prime(101).

test(not_prime_1, [fail]) :- is_prime(1).
test(not_prime_4, [fail]) :- is_prime(4).
test(not_prime_6, [fail]) :- is_prime(6).
test(not_prime_9, [fail]) :- is_prime(9).
test(not_prime_15, [fail]) :- is_prime(15).
test(not_prime_100, [fail]) :- is_prime(100).
test(not_prime_121, [fail]) :- is_prime(121).  % 11*11

:- end_tests(is_prime).

% Задача 2.2 - prime_factors
:- begin_tests(prime_factors).

test(factors_2, [nondet]) :- 
    prime_factors(2, L), L == [2].

test(factors_6, [nondet]) :- 
    prime_factors(6, L), L == [2, 3].

test(factors_8, [nondet]) :- 
    prime_factors(8, L), L == [2, 2, 2].

test(factors_12, [nondet]) :- 
    prime_factors(12, L), L == [2, 2, 3].

test(factors_315, [nondet]) :- 
    prime_factors(315, L), L == [3, 3, 5, 7].

test(factors_100, [nondet]) :- 
    prime_factors(100, L), L == [2, 2, 5, 5].

test(factors_prime_17, [nondet]) :- 
    prime_factors(17, L), L == [17].

test(factors_1, [fail]) :- 
    prime_factors(1, _).

:- end_tests(prime_factors).

% Задача 2.3 - prime_factors_mult
:- begin_tests(prime_factors_mult).

test(factors_mult_315, [nondet]) :- 
    prime_factors_mult(315, L), 
    L == [[3,2], [5,1], [7,1]].

test(factors_mult_12, [nondet]) :- 
    prime_factors_mult(12, L), 
    L == [[2,2], [3,1]].

test(factors_mult_8, [nondet]) :- 
    prime_factors_mult(8, L), 
    L == [[2,3]].

test(factors_mult_100, [nondet]) :- 
    prime_factors_mult(100, L), 
    L == [[2,2], [5,2]].

test(factors_mult_prime_17, [nondet]) :- 
    prime_factors_mult(17, L), 
    L == [[17,1]].

test(factors_mult_2, [nondet]) :- 
    prime_factors_mult(2, L), 
    L == [[2,1]].

:- end_tests(prime_factors_mult).

% Задача 2.4 - prime_range
:- begin_tests(prime_range).

test(range_2_10, [nondet]) :- 
    prime_range(2, 10, L), 
    L == [2, 3, 5, 7].

test(range_10_20, [nondet]) :- 
    prime_range(10, 20, L), 
    L == [11, 13, 17, 19].

test(range_1_1, [nondet]) :- 
    prime_range(1, 1, L), 
    L == [].

test(range_2_2, [nondet]) :- 
    prime_range(2, 2, L), 
    L == [2].

test(range_20_30, [nondet]) :- 
    prime_range(20, 30, L), 
    L == [23, 29].

test(range_empty, [nondet]) :- 
    prime_range(14, 16, L), 
    L == [].

test(range_invalid, [nondet]) :- 
    prime_range(10, 5, L), 
    L == [].

:- end_tests(prime_range).

% Задача 2.5 - goldbach
:- begin_tests(goldbach).

test(goldbach_4, [nondet]) :- 
    goldbach(4, [A, B]), 
    is_prime(A), is_prime(B), 
    4 =:= A + B.

test(goldbach_28, [nondet]) :- 
    goldbach(28, [A, B]), 
    is_prime(A), is_prime(B), 
    28 =:= A + B.

test(goldbach_10, [nondet]) :- 
    goldbach(10, [A, B]), 
    is_prime(A), is_prime(B), 
    10 =:= A + B.

test(goldbach_100, [nondet]) :- 
    goldbach(100, [A, B]), 
    is_prime(A), is_prime(B), 
    100 =:= A + B.

test(goldbach_odd_fail, [fail]) :- 
    goldbach(27, _).

test(goldbach_2_fail, [fail]) :- 
    goldbach(2, _).

:- end_tests(goldbach).

% Задача 2.7 - gcd
:- begin_tests(gcd).

test(gcd_36_63) :- 
    gcd(36, 63, G), G == 9.

test(gcd_48_18) :- 
    gcd(48, 18, G), G == 6.

test(gcd_100_25) :- 
    gcd(100, 25, G), G == 25.

test(gcd_17_13) :- 
    gcd(17, 13, G), G == 1.

test(gcd_same_number) :- 
    gcd(42, 42, G), G == 42.

test(gcd_with_zero_first) :- 
    gcd(0, 15, G), G == 15.

test(gcd_with_zero_second) :- 
    gcd(15, 0, G), G == 15.

test(gcd_commutative) :- 
    gcd(36, 63, G1), 
    gcd(63, 36, G2), 
    G1 == G2.

test(gcd_large_numbers) :- 
    gcd(1071, 462, G), G == 21.

:- end_tests(gcd).

% Задача 2.8 - coprime
:- begin_tests(coprime).

test(coprime_35_64) :- coprime(35, 64).
test(coprime_14_15) :- coprime(14, 15).
test(coprime_8_9) :- coprime(8, 9).
test(coprime_1_anything) :- coprime(1, 100).
test(coprime_primes) :- coprime(17, 23).

test(not_coprime_12_18, [fail]) :- coprime(12, 18).
test(not_coprime_6_9, [fail]) :- coprime(6, 9).
test(not_coprime_100_25, [fail]) :- coprime(100, 25).
test(not_coprime_same, [fail]) :- coprime(42, 42).

:- end_tests(coprime).
:- initialization(run_tests).
