% === BASIS PENGETAHUAN ===
:- dynamic gejala_pos/1.
:- dynamic gejala_neg/1.

% Daftar penyakit
penyakit("Gonore").
penyakit("Sifilis").
penyakit("Klamidia").
penyakit("Herpes Genital").
penyakit("Trikomoniasis").

% Relasi gejala -> penyakit
gejala(nyeri_saat_buang_air_kecil, "Gonore").
gejala(keluarnya_nanah, "Gonore").
gejala(pembengkakan_testis, "Gonore").

gejala(luka_di_alat_kelamin, "Sifilis").
gejala(ruam, "Sifilis").
gejala(demam, "Sifilis").

gejala(nyeri_saat_buang_air_kecil, "Klamidia").
gejala(keluarnya_cairan, "Klamidia").
gejala(nyeri_perut_bawah, "Klamidia").

gejala(lepuhan_berair, "Herpes Genital").
gejala(nyeri_saat_buang_air_kecil, "Herpes Genital").
gejala(gatal_genital, "Herpes Genital").

gejala(keluar_cairan_bening, "Trikomoniasis").
gejala(berbau_tidak_sedap, "Trikomoniasis").
gejala(rasa_gatal, "Trikomoniasis").

% Pertanyaan untuk tiap gejala
pertanyaan(nyeri_saat_buang_air_kecil, "Apakah Anda merasa nyeri saat buang air kecil?").
pertanyaan(keluarnya_nanah, "Apakah keluar nanah dari alat kelamin?").
pertanyaan(pembengkakan_testis, "Apakah testis Anda bengkak?").
pertanyaan(luka_di_alat_kelamin, "Apakah ada luka di alat kelamin?").
pertanyaan(ruam, "Apakah Anda mengalami ruam?").
pertanyaan(demam, "Apakah Anda demam?").
pertanyaan(keluarnya_cairan, "Apakah keluar cairan dari alat kelamin?").
pertanyaan(nyeri_perut_bawah, "Apakah Anda merasa nyeri di perut bawah?").
pertanyaan(lepuhan_berair, "Apakah muncul lepuhan berair di area genital?").
pertanyaan(gatal_genital, "Apakah area genital terasa gatal?").
pertanyaan(keluar_cairan_bening, "Apakah keluar cairan bening dari alat kelamin?").
pertanyaan(berbau_tidak_sedap, "Apakah alat kelamin berbau tidak sedap?").
pertanyaan(rasa_gatal, "Apakah Anda merasa gatal di area genital?").

% Aturan cocok penyakit
cocok(P) :-
    penyakit(P),
    forall(gejala(G, P), gejala_pos(G)).

% ==== PROGRAM UTAMA (main/0) ====
main :-
    retractall(gejala_pos(_)),
    retractall(gejala_neg(_)),
    tanya_semua_gejala,
    diagnosa.

tanya_semua_gejala :-
    findall(Kode, pertanyaan(Kode, _), GejalaList),
    tanya_gejala_list(GejalaList).

tanya_gejala_list([]).
tanya_gejala_list([G|T]) :-
    pertanyaan(G, Teks),
    format("~w (iya/tidak): ", [Teks]),
    read(Jawaban),
    (Jawaban == iya -> assertz(gejala_pos(G)); assertz(gejala_neg(G))),
    tanya_gejala_list(T).

diagnosa :-
    findall(P, cocok(P), List),
    nl,
    ( List \= [] ->
        write("Kemungkinan penyakit kelamin Anda: "), nl,
        tampilkan_list(List)
    ;
        write("Tidak ditemukan penyakit yang sesuai dengan gejala yang Anda alami."), nl
    ).

tampilkan_list([]).
tampilkan_list([H|T]) :-
    format("- ~w~n", [H]),
    tampilkan_list(T).
