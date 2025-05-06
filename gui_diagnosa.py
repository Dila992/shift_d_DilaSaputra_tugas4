from tkinter import *
from tkinter import ttk
from pyswip import Prolog

prolog = Prolog()
prolog.consult("pakar_kelamin.pl")

gejala_list = []
for g in prolog.query("pertanyaan(Kode, Teks)"):
    gejala_list.append((g["Kode"], g["Teks"]))

gejala_pos = []
index_gejala = 0

def mulai_diagnosa():
    global index_gejala
    index_gejala = 0
    gejala_pos.clear()
    yes_btn.config(state=NORMAL)
    no_btn.config(state=NORMAL)
    start_btn.config(state=DISABLED)
    tampilkan_pertanyaan()

def tampilkan_pertanyaan():
    kotak_pertanyaan.config(state=NORMAL)
    kotak_pertanyaan.delete("1.0", END)
    if index_gejala < len(gejala_list):
        _, teks = gejala_list[index_gejala]
        kotak_pertanyaan.insert(END, teks)
    else:
        konsultasi_prolog()
    kotak_pertanyaan.config(state=DISABLED)

def jawaban(ya):
    global index_gejala
    if index_gejala < len(gejala_list):
        kode, _ = gejala_list[index_gejala]
        if ya:
            gejala_pos.append(kode)
        index_gejala += 1
        tampilkan_pertanyaan()

def konsultasi_prolog():
    yes_btn.config(state=DISABLED)
    no_btn.config(state=DISABLED)
    kotak_pertanyaan.config(state=NORMAL)
    kotak_pertanyaan.insert(END, "\n\nMenganalisis gejala...\n")

    list(prolog.query("retractall(gejala_pos(_))"))
    list(prolog.query("retractall(gejala_neg(_))"))

    for g in gejala_pos:
        prolog.assertz(f"gejala_pos({g})")

    kemungkinan = set()
    for p in prolog.query("cocok(P)"):
        kemungkinan.add(p["P"])

    if kemungkinan:
        kotak_pertanyaan.insert(END, f"\nKemungkinan penyakit kelamin:\n")
        for p in kemungkinan:
            kotak_pertanyaan.insert(END, f"- {p}\n")
    else:
        kotak_pertanyaan.insert(END, "Tidak ditemukan penyakit berdasarkan gejala tersebut.\n")

    kotak_pertanyaan.config(state=DISABLED)
    start_btn.config(state=NORMAL)

# GUI
root = Tk()
root.title("Sistem Pakar Penyakit Kelamin")

mainframe = ttk.Frame(root, padding="10")
mainframe.grid(column=0, row=0, sticky=(N, W, E, S))
root.columnconfigure(0, weight=1)
root.rowconfigure(0, weight=1)

ttk.Label(mainframe, text="Sistem Pakar Penyakit Kelamin",
          font=("Arial", 16)).grid(column=0, row=0, columnspan=3)

ttk.Label(mainframe, text="Pertanyaan:").grid(column=0, row=1)
kotak_pertanyaan = Text(mainframe, height=6, width=50, state=DISABLED)
kotak_pertanyaan.grid(column=0, row=2, columnspan=3)

no_btn = ttk.Button(mainframe, text="Tidak", state=DISABLED,
                    command=lambda: jawaban(False))
no_btn.grid(column=1, row=3)

yes_btn = ttk.Button(mainframe, text="Ya", state=DISABLED,
                     command=lambda: jawaban(True))
yes_btn.grid(column=2, row=3)

start_btn = ttk.Button(mainframe, text="Mulai Diagnosa",
                       command=mulai_diagnosa)
start_btn.grid(column=1, row=4, columnspan=2)

for widget in mainframe.winfo_children():
    widget.grid_configure(padx=5, pady=5)

root.mainloop()
