% ПОЛ
male(ivan_petrov).
male(nikolay_sidorov).
male(petr_petrov).
male(sergey_petrov).
male(alexey_petrov).
male(dmitriy_ivanov).

female(maria_petrova).
female(anna_sidorova).
female(elena_petrova).
female(olga_petrova).

% ФАМИЛИИ 
surname(ivan_petrov, petrov).
surname(maria_petrova, petrova).
surname(nikolay_sidorov, sidorov).
surname(anna_sidorova, sidorova).
surname(petr_petrov, petrov).
surname(elena_petrova, petrova).
surname(sergey_petrov, petrov).
surname(alexey_petrov, petrov).
surname(olga_petrova, petrova).
surname(dmitriy_ivanov, ivanov).

% РОДИТЕЛИ 
parent(ivan_petrov, petr_petrov).
parent(ivan_petrov, sergey_petrov).
parent(maria_petrova, petr_petrov).
parent(maria_petrova, sergey_petrov).
parent(nikolay_sidorov, elena_petrova).
parent(anna_sidorova, elena_petrova).
parent(petr_petrov, alexey_petrov).
parent(petr_petrov, olga_petrova).
parent(elena_petrova, alexey_petrov).
parent(elena_petrova, olga_petrova).

% БРАК 
married(ivan_petrov, maria_petrova).
married(nikolay_sidorov, anna_sidorova).
married(petr_petrov, elena_petrova).
married(dmitriy_ivanov, olga_petrova).

spouse(X, Y) :- married(X, Y).
spouse(X, Y) :- married(Y, X).

% ========== БАЗОВЫЕ ОТНОШЕНИЯ ==========
offspring(X, Y) :- parent(Y, X).
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).
babushka(X, Y) :- mother(X, Z), parent(Z, Y).
dedushka(X, Y) :- father(X, Z), parent(Z, Y).
vnuk(X, Y) :- male(X), parent(Z, X), parent(Y, Z).
vnuchka(X, Y) :- female(X), parent(Z, X), parent(Y, Z).
dyadya(X, Y) :- brother(X, Z), parent(Z, Y).
tyotya(X, Y) :- sister(X, Z), parent(Z, Y).
plemyannik(X, Y) :- male(X), sibling(Y, Z), parent(Z, X).
plemyannitsa(X, Y) :- female(X), sibling(Y, Z), parent(Z, X).
svekrov(X, Y) :- female(Y), spouse(Y, Z), male(Z), mother(X, Z).
svekor(X, Y) :- female(Y), spouse(Y, Z), male(Z), father(X, Z).
tyoshcha(X, Y) :- male(Y), spouse(Y, Z), female(Z), mother(X, Z).
test(X, Y) :- male(Y), spouse(Y, Z), female(Z), father(X, Z).
zyat(X, Y) :- male(X), spouse(X, Z), female(Z), parent(Y, Z).