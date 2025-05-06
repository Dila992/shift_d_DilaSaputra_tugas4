% SILSILAH KELUARGA
% FAKTA
% Hubungan orang tua
% Predikat parent/2 (X adalah orang tua dari Y)
parent(alya, bima).
parent(alya, satria).
parent(bima, david).
parent(bima, emma).
parent(satria, yunita).
parent(satria, grace).

% ATURAN

% Hubungan saudara kandung
% sibling(X, Y) berarti X dan Y adalah saudara kandung
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Hubungan kakek/nenek
% grandparent(X, Y) berarti X adalah kakek/nenek dari Y
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Hubungan leluhur
% ancestor(X, Y) berarti X adalah leluhur dari Y
ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).