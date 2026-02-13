# Case 03 – Data Cleaning & Dashboard (Python)

## Overview

Studi kasus ini bertujuan untuk:

1. Membersihkan data pengguna Kemasaja tahun 2024 menggunakan Python.
2. Menghasilkan dataset bersih dalam format `.csv`.
3. Mengimport data ke Supabase dengan nama tabel `data_user_chat`.
4. Membuat dashboard analisis menggunakan Looker Studio.

---

## Project Structure

case-03-data-cleaning-python/
│
├── data/
│ ├── raw/
│ └── processed/
│
├── script/
├── dashboard/
└── README.md

---

## Data Cleaning Process

Proses dilakukan menggunakan Pandas:

- Handling missing values  
- Validasi UUID & email  
- Validasi Email
- Standarisasi format tanggal  
- Validasi tipe data numerik  
- Menghapus data duplikat

Detail teknis dapat dilihat di folder `script/`.

Output:  
data_users_dumy_2024_celan.csv

---

# Database Integration (Supabase)

Dataset hasil cleaning diimport ke Supabase dengan nama tabel:

**data_user_chat**

Tipe data disesuaikan dengan struktur:

- UUID → uuid
- Date → date/timestamp
- Numeric → integer/float
- Text → varchar/text

---

## Dashboard Analysis

Dashboard menjawab pertanyaan berikut:

- Total pengguna hingga 2024  
- Grafi pertumbuhan pengguna per tahun  
- Demografi pengguna per negara  
- Demografi pengguna berdasarkan kota di Indonesia 
- Pengguna berdasarkan jenis kelamin  
- Top 10 halaman yang paling sering diakses  
- Jumlah pengguna 2022–2023  
- Jumlah customer dengan email yang sama   

Dashboard Interaktif:  
https://lookerstudio.google.com/reporting/d56f2951-e94d-4fdc-9578-df1112b17822

---

# Key Findings

- Total pengguna mencapai 4.585 hingga tahun 2024
- Mayoritas pengguna berasal dari Indonesia
- Distribusi gender relatif seimbang
- Konsentrasi pengguna terbesar berada di kota besar (Jakarta, Bandung, Bekasi)
- Terdapat beberapa email yang muncul lebih dari satu kali (indikasi duplicate account)

---

## Skills Demonstrated

- Data Cleaning (Python – Pandas)
- Data Validation & Type Enforcement
- Duplicate Detection
- Database Integration (Supabase / PostgreSQL)
- Data Visualization (Looker Studio)
- Analytical Thinking & Insight Generation 

---

# End-to-End Workflow

Raw Data  
→ Data Cleaning (Python)  
→ Import Database (Supabase)  
→ Query & Aggregation  
→ Dashboard (Looker Studio)  
→ Insight  


