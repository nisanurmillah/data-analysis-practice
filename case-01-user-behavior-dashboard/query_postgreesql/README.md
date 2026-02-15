# Analisis Data Pengguna & Conversation

Dokumen ini berisi kumpulan query PostgreSQL untuk analisis data pengguna dan aktivitas percakapan dari tabel utama **data_user_chat**.

Tujuan utama:
- Membersihkan format data tanggal  
- Menghitung pertumbuhan user  
- Melihat demografi  
- Menganalisis perubahan halaman awal percakapan  
- Mengelompokkan topik percakapan ke dalam kategori bisnis  

---

## Sumber Data

Semua query berasal dari tabel:

**data_user_chat**

Field penting yang sering dipakai:
- `userid`
- `email`
- `country`
- `city`
- `start_date`
- `last_active`
- `last_contacted`
- `original conversation started page title`
- `recent conversation started page title`

---

## Urutan Eksekusi (PENTING)

Beberapa view bergantung pada view lain.

Jalankan berurutan seperti ini:

1. pengguna_clean  
2. data_pengguna  
3. data_pengguna_2024  
4. pertumbuhan_pertahun  
5. dan seterusnya

Jika `pengguna_clean` belum dibuat → query setelahnya akan error.

---

# Daftar View & Fungsinya

---

## 1. pengguna_clean

Membersihkan kolom tanggal.

Fungsi:
- Mengubah teks `"data tidak tersedia"` → `NULL`
- Mengubah string tanggal → tipe `DATE`

Output utama:
- `last_active_date`
- `last_contacted_date`
- `start_date_date`

View ini adalah **pondasi** untuk analisis waktu.

---

## 2. data_pengguna

Menghitung total user **per bulan** dari awal sampai akhir 2024.

Contoh insight:
- Bulan mana growth tertinggi
- Tren kenaikan user

---

## 3. data_pengguna_2024

Fokus hanya tahun **2024**, ditampilkan per bulan dengan format nama bulan.

Biasanya dipakai untuk:
- laporan tahunan  
- grafik marketing  

---

## 4. pertumbuhan_pertahun

Jumlah user berdasarkan **tahun**.

Bisa menjawab:
> Tahun berapa akuisisi paling besar?

---

## 5. demografi_pengguna_tiap_negara

Menampilkan jumlah user berdasarkan negara.

Jika negara = `"data tidak tersedia"` → diganti menjadi  
`nama negara tidak ditemukan`.

---

## 6. demografi_pengguna_di_indonesia

Menampilkan kota dengan user terbanyak di Indonesia.

Berguna untuk:
- target sales  
- distribusi campaign  
- pembukaan cabang  

---

---

# Analisis Conversation

---

## 7. Original vs Recent Shift

Melihat apakah user berpindah halaman.

Hasil:
- **Same** → tetap di topik awal  
- **Changed** → pindah topik  

---

## 8. Halaman yang Paling Sering Berubah

Menampilkan:

dari halaman mana → pindah ke mana

Bisa dipakai untuk membaca:
- alur minat user  
- potensi upselling  

---

## 9. Top 10 Conversation Starter Page

Halaman yang paling sering jadi titik awal percakapan.

---

# Kategorisasi Produk

Karena nama halaman panjang & beragam, kita kelompokkan dengan keyword seperti:

| Keyword | Masuk Kategori |
|---|---|
| id card | ID Card |
| amplop | Amplop |
| box | Box |
| botol | Botol |
| banner | Banner |
| dll | Other |

---

## 10. Category Strength Analysis

Menampilkan jumlah conversation tiap kategori.

---

## 11. Persentase Tiap Kategori

Selain jumlah, kita hitung juga **market share** dalam persen.

---

## 12. Perbandingan Original vs Recent Category

Menjawab pertanyaan penting:

> Setelah ngobrol, minat user bergeser ke kategori apa?

Ada kolom:
- original %
- recent %
- selisih perubahan

---

---

# Analisis Tambahan

---

## 13. Jumlah Pengguna 2022–2023

Melihat total user khusus dua tahun tersebut.

---

## 14. Email Duplikat

Mendeteksi data ganda berdasarkan email.

Biasanya dipakai untuk:
- data cleaning  
- validasi CRM  
- menghindari double broadcast  

---

# Contoh Pertanyaan Bisnis yang Bisa Dijawab

Dengan query ini kamu bisa tahu:

- dari negara mana user paling banyak  
- kota terkuat di Indonesia  
- tren pertumbuhan tahunan  
- topik paling diminati  
- apakah user pindah minat setelah masuk  
- kategori mana yang naik / turun  
- apakah ada email double  

---

# Kebutuhan Sistem

- PostgreSQL  
- Akses ke tabel `data_user_chat`  
- Permission membuat VIEW  

---
