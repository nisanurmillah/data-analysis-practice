# Dashboard Analisa Keuangan – Rekening BCA Saeful Malik (Desember 2022)

Dashboard ini merupakan hasil visualisasi dari data rekening koran BCA bulan Desember 2022 yang telah melalui proses ETL menggunakan Python dan divalidasi di Google Sheets.

Tujuan utama dashboard adalah membantu memahami arus kas, pola transaksi, serta pihak-pihak yang paling sering terlibat dalam pemasukan maupun pengeluaran.

---

## Tujuan Dashboard

Melalui dashboard ini, pengguna dapat dengan cepat:

- Melihat total uang masuk dan keluar  
- Memahami tren transaksi dari waktu ke waktu  
- Mengetahui siapa penerima/pengirim terbesar  
- Menemukan transaksi tertentu melalui fitur pencarian  
- Melakukan analisa berdasarkan rentang tanggal  

---

## Sumber Data

PDF Rekening Koran → Python ETL → CSV → Google Sheets → Looker Studio

Data yang digunakan mencakup:

- tanggal  
- keterangan  
- counterparty  
- kategori  
- channel  
- pemasukan  
- pengeluaran  
- saldo  

---

## Komponen yang Tersedia di Dashboard

### 1. KPI Ringkasan
Di bagian atas dashboard terdapat informasi:

- **Total Pengeluaran**
- **Total Pemasukan**

Angka ini otomatis berubah mengikuti filter tanggal.

---

### 2. Filter Rentang Tanggal
User dapat memilih periode tertentu untuk melihat transaksi hanya pada tanggal yang diinginkan.

---

### 3. Pencarian Counterparty
Memudahkan pencarian transaksi berdasarkan nama penerima atau pengirim.

Contoh penggunaan:
ketik **ERLINA**, maka seluruh visual akan menyesuaikan hanya untuk transaksi tersebut.

---

### 4. Tabel Pemasukan
Menampilkan daftar transaksi uang masuk lengkap dengan tanggal, nama pengirim, dan nominal.

---

### 5. Tabel Pengeluaran
Menampilkan seluruh transaksi uang keluar dengan detail penerima dan jumlah uang.

---

### 6. Grafik Tren Pemasukan & Pengeluaran
Grafik garis memperlihatkan perubahan nominal transaksi dari hari ke hari.

---

### 7. Grafik Persentase Harian
Menunjukkan kontribusi masing-masing hari terhadap total transaksi.

---

### 8. Pie Chart Pengeluaran
Memperlihatkan distribusi uang keluar berdasarkan penerima atau jenis transaksi.

---

### 9. Pie Chart Pemasukan
Menampilkan sumber dana terbesar selama periode laporan.

---

## Hasil Analisa & Temuan Penting

Berdasarkan dashboard, diperoleh informasi berikut:

1. **Total transfer ke ERLINA** sebesar **Rp 3.515.000**  
2. **Frekuensi transfer ke ERLINA** sebanyak **6 kali**  
3. **Total uang masuk dari LAELA KOMALASARI** sebesar **Rp 4.450.000**  
4. **Pengeluaran terbesar** terjadi pada **19 Desember 2025** dengan nominal **Rp 3.685.000**  
5. **Pemasukan terbesar** terjadi pada **1 Desember 2025** sebesar **Rp 5.190.279,02**  
6. **Transfer terbesar** diberikan kepada **SAEFUL MALIK – Transfer ATM/EDC/Virtual Account** sebesar **Rp 4.191.500** atau sekitar **17,3%** dari total pengeluaran.

Temuan ini diperoleh melalui kombinasi penggunaan filter, tabel transaksi, dan pie chart distribusi.

---

## Link Dashboard

**Dashboard Looker Studio:**  
`[ https://lookerstudio.google.com/reporting/e70d8a4a-77c8-4c9c-add9-de6606f4db4c ]`

---

## Catatan

Data pada dashboard telah melalui proses pembersihan dan validasi sehingga hasil perhitungan sudah sesuai dengan rekening koran asli.
