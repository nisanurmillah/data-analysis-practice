# Case 04 – ETL Rekening Koran BCA & Dashboard Keuangan

Project ini bertujuan melakukan proses **Extract – Transform – Load (ETL)** terhadap data rekening koran bank dalam bentuk PDF menjadi CSV menggunakan Python, kemudian divisualisasikan dalam bentuk dashboard interaktif.

Sumber data berasal dari file:

`rekening_bca_saepul_desember_2022.pdf`

---

## Tujuan Project

1. Mengubah data PDF menjadi dataset terstruktur (CSV)  
2. Mengelompokkan transaksi berdasarkan kategori  
3. Menghitung total pemasukan & pengeluaran  
4. Memastikan keakuratan data melalui proses validasi  
5. Menyediakan insight keuangan melalui dashboard  
6. Menjawab pertanyaan bisnis terkait transaksi  

---

## Arsitektur Alur Data

PDF → Python ETL → CSV → Google Sheets → Looker Studio → Dashboard

---

## Proses ETL dengan Python

Tahapan yang dilakukan script:

### Extract
- Membaca PDF menggunakan `pdfplumber`
- Mengambil:
  - tanggal transaksi  
  - keterangan  
  - nominal debit / kredit  
  - saldo  
  - counterparty  
  - reference id  
  - metadata rekening  

### Transform
- Normalisasi angka rupiah  
- Pemisahan pemasukan & pengeluaran  
- Deteksi channel transaksi (BI-Fast, M-BCA, E-Banking, Virtual Account, dll)  
- Klasifikasi kategori seperti:
  - Tagihan  
  - Gaji  
  - Transfer  
  - Pinjaman online  
  - Belanja online  
  - dll  

### Load
Disimpan menjadi file:

`mutasi_bca.csv`

---

## Validasi Data Menggunakan Spreadsheet

Sebelum digunakan di dashboard, data CSV diupload ke **Google Sheets** untuk memastikan:

- Total pemasukan sesuai dengan rekening koran asli  
- Total pengeluaran sesuai  
- Tidak ada transaksi ganda  
- Format tanggal sudah benar  
- Nama counterparty terbaca dengan tepat  

Beberapa pengecekan yang dilakukan:

- SUM kolom pemasukan  
- SUM kolom pengeluaran  
- Filter transaksi tertentu (misalnya ke ERLINA)  
- Pencocokan saldo akhir  

Tahap ini penting agar hasil analisa di dashboard dapat dipercaya.

---

## Isi Dashboard

Dashboard menampilkan:

- Total Pengeluaran  
- Total Pemasukan  
- Grafik histori transaksi per hari  
- Persentase pengeluaran  
- Persentase pemasukan  
- Tabel transaksi masuk  
- Tabel transaksi keluar  
- Fitur pencarian  
- Filter tanggal  

---

## Pertanyaan yang Harus Bisa Dijawab

Dari dashboard, user harus bisa mengetahui:

1. Berapa total uang yang ditransfer ke **ERLINA**  
2. Berapa kali transfer ke **ERLINA**  
3. Berapa total uang masuk dari **LAELA KOMALASARI**  
4. Pada tanggal berapa pengeluaran paling besar  
5. Pada tanggal berapa pemasukan paling besar  
6. Transfer paling besar ke siapa / untuk pembayaran apa  

---

## Link Project

**Dashboard Looker Studio:**  
https://lookerstudio.google.com/reporting/e70d8a4a-77c8-4c9c-add9-de6606f4db4c

---

## Insight yang Bisa Dikembangkan

Project ini masih bisa diperluas menjadi:

- Analisa cashflow bulanan  
- Deteksi pengeluaran rutin  
- Identifikasi top merchant  
- Prediksi kebutuhan dana  
- Monitoring gaya hidup finansial  


