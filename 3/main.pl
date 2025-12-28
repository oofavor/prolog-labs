% Задача 1

is_prime(2). 
is_prime(3).
is_prime(N) :-
	N > 3,
	N mod 2 =\= 0,
	is_prime(N, 3).

is_prime(N, K) :-
	K * K > N.

is_prime(N, K) :-
	K * K =< N,
	N mod K =\= 0,
	K2 is K + 2,
	is_prime(N, K2).

% Задача 2 

prime_factors(N, L) :- 
	N > 1, 
	prime_factors(N, 2, L).

prime_factors(N, D, [D|Fs]) :-
    D * D =< N,
    N mod D =:= 0,
    N1 is N // D,
    prime_factors(N1, D, Fs).

prime_factors(N, D, Fs) :-
    D * D =< N,
    NextD is D + 1,
    prime_factors(N, NextD, Fs).

prime_factors(N, _, [N]).

% Задача 3

prime_factors_mult(N, L) :-
    N > 1,
    find_factors(N, 2, L).

find_factors(1, _, []).

find_factors(N, D, [[D, Count]|Rest]) :-
    N mod D =:= 0,
    count_how_many(N, D, Count, Remainder),
    find_factors(Remainder, D, Rest).

find_factors(N, D, Rest) :-
    N mod D =\= 0,
    D1 is D + 1,
    find_factors(N, D1, Rest).

count_how_many(N, D, Count, Remainder) :-
    count_loop(N, D, 0, Count, Remainder).

count_loop(N, D, Acc, Count, Remainder) :-
    (   N mod D =:= 0 
		->  
		N1 is N // D,
        Acc1 is Acc + 1,
        count_loop(N1, D, Acc1, Count, Remainder)
		;
        Count = Acc,
        Remainder = N
    ).

% 4

prime_range(Low, High, []) :-
    Low > High.

prime_range(Low, High, [Low|Rest]) :-
    Low =< High,
    is_prime(Low),
    Next is Low + 1,
    prime_range(Next, High, Rest).

prime_range(Low, High, Rest) :-
    Low =< High,
    Next is Low + 1,
    prime_range(Next, High, Rest).

% 5

goldbach(N, Pair) :- 
	N > 2,
	N mod 2 =:= 0,
	Low is 2,
	High is N - 2,
	goldbach_helper(Low, High, Pair).

goldbach_helper(Low, High, [Low, High]) :-
	Low =< High,
	is_prime(Low),
	is_prime(High).

goldbach_helper(Low, High, Pair) :-
	Low =< High,
	NextLow is Low + 1,
	NextHigh is High - 1,
	goldbach_helper(NextLow, NextHigh, Pair).

% 6
goldbach_list(Low, High) :-
	goldbach_list(Low, High, 2).

goldbach_list(Low, High, _) :- Low > High, !.

goldbach_list(Low, High, Min) :-
    Low =< High,
	% чзх почему оно оптимизирует если без тернарки
    (goldbach(Low, [A, B]) ->
		A >= Min, 
		format('~d + ~d = ~d~n', [A, B, Low]); 
		true
	),
	Next is Low + 1,
    goldbach_list(Next, High, Min).

goldbach_list(Low, High, Min) :-
    Low =< High,
    Next is Low + 1, 
    goldbach_list(Next, High, Min).

% 7
gcd(A, B, G) :- 
	A =:= 0,
	G = B.

gcd(A, B, G) :- 
	B =:= 0,
	G = A.

gcd(A, B, G) :- 
	B =:= A,
	G = A.

gcd(A, B, G) :- 
	A > B,
	A1 is A - B,
	gcd(A1, B, G).

gcd(A, B, G) :- 
	A < B,
	B1 is B - A,
	gcd(A, B1, G).

% 9
coprime(A,B) :-
	gcd(A, B, G),
	G =:= 1.