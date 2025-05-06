% GEJALA PENYAKIT MALARIA
% DATABASE
:- dynamic gejala_pos/1.
:- dynamic gejala_neg/1.

% FAKTA PENYAKIT
penyakit("Malaria Tertiana").
penyakit("Malaria Quartana").
penyakit("Malaria Tropika").
penyakit("Malaria Pernisiosa").

% FAKTA GEJALA UNTUK MASING-MASING PENYAKIT
gejala(nyeri_otot, "Malaria Tertiana").
gejala(muntah, "Malaria Tertiana").
gejala(kejang, "Malaria Tertiana").

gejala(nyeri_otot, "Malaria Quartana").
gejala(menggigil, "Malaria Quartana").
gejala(tidak_enak_badan, "Malaria Quartana").

gejala(keringat_dingin, "Malaria Tropika").
gejala(sakit_kepala, "Malaria Tropika").
gejala(mimisan, "Malaria Tropika").
gejala(mual, "Malaria Tropika").

gejala(menggigil, "Malaria Pernisiosa").
gejala(tidak_enak_badan, "Malaria Pernisiosa").
gejala(demam, "Malaria Pernisiosa").
gejala(mimisan, "Malaria Pernisiosa").
gejala(mual, "Malaria Pernisiosa").

% PERTANYAAN UNTUK MASING-MASING GEJALA
pertanyaan(nyeri_otot, "Apakah Anda merasa nyeri otot?").
pertanyaan(muntah, "Apakah Anda muntah-muntah?").
pertanyaan(kejang, "Apakah Anda mengalami kejang-kejang?").
pertanyaan(menggigil, "Apakah Anda sering menggigil?").
pertanyaan(tidak_enak_badan, "Apakah Anda merasa tidak enak badan?").
pertanyaan(keringat_dingin, "Apakah Anda mengalami keringat dingin?").
pertanyaan(sakit_kepala, "Apakah Anda sering sakit kepala?").
pertanyaan(mimisan, "Apakah Anda sering mimisan?").
pertanyaan(mual, "Apakah Anda merasa mual?").
pertanyaan(demam, "Apakah Anda demam?").
