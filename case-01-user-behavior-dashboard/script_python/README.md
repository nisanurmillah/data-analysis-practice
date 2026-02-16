# User Data Cleaning Pipeline (Python – Pandas)

## Project Overview

Project ini bertujuan untuk membersihkan dan menstandarisasi dataset user tahun 2024 agar siap digunakan untuk analisis lanjutan maupun integrasi sistem.

Dataset awal memiliki berbagai permasalahan umum pada data real-world, seperti:

- Missing values dalam berbagai format
- UUID tidak valid
- Format tanggal tidak konsisten
- Email tidak valid
- Duplikasi user
- Inconsistent text formatting
- Numeric field tercampur string

Pipeline ini dibuat menggunakan Python dan Pandas dengan pendekatan reproducible data cleaning workflow.

---

## Dataset

- **Input:** `data_users_dumy_2024.csv`
- **Output:** `data_users_dumy_2024_celan.csv`

Kolom utama yang diproses:

- userId  
- driftUserId  
- name  
- lastName  
- email  
- phone  
- start_date  
- last_active  
- last_contacted  
- CQL Score  
- githubFollowers  
- twitterFollowers  
- latitude  
- longitude  

---

## 🛠 Tools & Libraries

- Python 3.x  
- pandas  
- numpy  
- uuid  
- datetime  
- regex  

---

## Data Cleaning Workflow

### 1.Handling Missing Values

NA-like values yang ditangani:
["", " ", "NA", "N/A", "Null", "null", "none", "-", "--"]


Langkah:

- Menghapus kolom yang seluruh nilainya kosong
- Mengganti empty string pada kolom teks menjadi `"data tidak tersedia"`
- Numeric column tetap menggunakan `NaN`

---

### 2. UUID Validation & Standardization

Kolom:
- `userId`
- `driftUserId`

Logic:

- Jika valid UUID → dipertahankan
- Jika tidak valid → generate UUID baru
- Jika kosong → `None`

Tujuan: menjaga konsistensi identifier unik.

---

### 3. Date Parsing & Standardization

Kolom:
- `start_date`
- `last_active`
- `last_contacted`

Format yang didukung:

- `YYYY-MM-DD`
- `DD-MM-YYYY`
- `YYYY/MM/DD`
- `DD/MM/YYYY`

Jika gagal parsing → menjadi `NaT`.

---

### 4. Email Validation

Menggunakan regex dasar:

^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$


Langkah:

- Email invalid → diubah menjadi `NA`
- Email distandarisasi menjadi lowercase

---

### 5️⃣ Numeric Type Enforcement

Kolom:

- CQL Score  
- githubFollowers  
- twitterFollowers  
- latitude  
- longitude  

Langkah:

- NA-like → `NaN`
- Dipaksa menjadi numeric (`errors="coerce"`)

Tujuan: menjaga integritas tipe data untuk analisis statistik.

---

### 6️⃣ Duplicate Handling

Prioritas utama:

- Drop duplicate berdasarkan `userId`

Fallback:

- Kombinasi `email + start_date`

---

### Text Standardization

- Semua nama kolom → lowercase
- Semua string value → lowercase
- Field seperti `type`, `state`, `name`, `lastName` distandarisasi

---

## Final Dataset Characteristics

Dataset akhir memiliki:

- Tidak ada kolom kosong penuh
- UUID valid
- Kolom numerik bertipe numeric
- Format tanggal konsisten
- Email tervalidasi
- Tidak ada duplikasi userId
- Konsistensi penamaan kolom

---

## Why This Project Matters

Data cleaning adalah tahap krusial dalam data analytics.  
Pipeline ini menunjukkan kemampuan:

- Data preprocessing
- Type enforcement
- Data validation
- Handling messy real-world dataset
- Writing reproducible cleaning logic
- Defensive programming (fallback & validation)

---

## Potential Improvements

- Menambahkan logging system
- Membuat reusable function-based pipeline
- Menambahkan unit test
- Membuat EDA summary otomatis
- Packaging menjadi CLI tool

---

## How to Run

```bash
pip install pandas numpy
python your_script_name.py

Output file akan tersimpan sebagai:
data_users_dumy_2024_celan.csv




