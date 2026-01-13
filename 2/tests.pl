% 1. Кто является родителем Петра?
?- parent(X, petr_petrov).
% X = ivan_petrov ;
% X = maria_petrova.

% 2. Кто является матерью Алексея?
?- mother(X, alexey_petrov).
% X = elena_petrova.

% 3. Кто является отцом Ольги?
?- father(X, olga_petrova).
% X = petr_petrov.

% 4. Кто является отпрыском Елены?
?- offspring(X, elena_petrova).
% X = alexey_petrov ;
% X = olga_petrova.

% 5. Кто является бабушкой Алексея?
?- babushka(X, alexey_petrov).
% X = maria_petrova ;
% X = anna_sidorova.

% 6. Кто является дедушкой Ольги?
?- dedushka(X, olga_petrova).
% X = ivan_petrov ;
% X = nikolay_sidorov.

% 7. Кто является внуком Ивана?
?- vnuk(X, ivan_petrov).
% X = alexey_petrov.

% 8. Кто является внучкой Марии?
?- vnuchka(X, maria_petrova).
% X = olga_petrova.

% 9. Кто является дядей Алексея?
?- dyadya(X, alexey_petrov).
% X = sergey_petrov.

% 10. Кто является племянником Сергея?
?- plemyannik(X, sergey_petrov).
% X = alexey_petrov.

% 11. Кто является племянницей Сергея?
?- plemyannitsa(X, sergey_petrov).
% X = olga_petrova.

% 12. Кто является свекровью для кого-либо?
?- svekrov(X, Y).
% X = maria_petrova, Y = elena_petrova.

% 13. Кто является тёщей Дмитрия?
?- tyoshcha(X, dmitriy_ivanov).
% X = elena_petrova.

% 14. Кто является тестем Дмитрия?
?- test(X, dmitriy_ivanov).
% X = petr_petrov.

% 15. Кто является зятем Петра?
?- zyat(X, petr_petrov).
% X = dmitriy_ivanov.