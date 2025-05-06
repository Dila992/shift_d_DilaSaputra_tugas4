% DATABASE GEJALA PENYAKIT MALARIA

% Fakta dinamis agar dapat diubah selama runtime
:- dynamic gejala/2.

% ATURAN DIAGNOSA PENYAKIT
% Predikat penyakit(X, Y) berarti pasien X mengidap penyakit Y
% berdasarkan gejala-gejala yang dimilikinya.

% Penyakit malaria tertiana
penyakit(X, tertiana) :-
    gejala(X, nyeri_otot),
    gejala(X, muntah),
    gejala(X, kejang).

% Penyakit malaria quartana
penyakit(X, quartana) :-
    gejala(X, nyeri_otot),
    gejala(X, menggigil),
    gejala(X, tidak_enak_badan).

% Penyakit malaria tropika
penyakit(X, tropika) :-
    gejala(X, keringat_dingin),
    gejala(X, sakit_kepala),
    gejala(X, mimisan),
    gejala(X, mual).

% Penyakit malaria pernisiosa
penyakit(X, pernisiosa) :-
    gejala(X, menggigil),
    gejala(X, tidak_enak_badan),
    gejala(X, demam),
    gejala(X, mimisan),
    gejala(X, mual).
