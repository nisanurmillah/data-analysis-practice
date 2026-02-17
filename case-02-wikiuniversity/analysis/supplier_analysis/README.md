# Suppliers Analysis Dashboard

## Deskripsi

Folder **`suppliers_analysis`** berisi hasil query PostgreSQL dan visualisasi dashboard untuk menganalisis performa supplier berdasarkan:

- Kontribusi produk terhadap supplier
- Kontribusi supplier terhadap perusahaan
- Distribusi supplier di kota utama
- Variasi jumlah produk per supplier

Analisis ini bertujuan untuk memahami peran strategis supplier dalam struktur pendapatan perusahaan.

---

## Business Questions

1. Bagaimana kontribusi masing-masing produk terhadap total penjualan supplier?
2. Supplier mana yang berkontribusi paling besar terhadap pendapatan perusahaan?
3. Supplier mana yang aktif memasok di kota-kota dengan pendapatan tertinggi?
4. Supplier mana yang memiliki variasi produk paling banyak?

---

## Dashboard Interaktif

Dashboard interaktif dapat diakses melalui link berikut:

https://lookerstudio.google.com/reporting/28e80093-6e43-4611-b0b5-6bba6b5b301a

Dashboard memungkinkan pengguna untuk:
- Menggunakan dropdown filter berdasarkan supplier
- Melihat komposisi produk secara dinamis
- Mengeksplorasi distribusi supplier di kota utama
- Membandingkan total pendapatan antar supplier

---

## Hasil Analisis

### 1. Kontribusi Produk terhadap Supplier

Kontribusi produk terhadap total penjualan supplier bersifat **beragam**.

Detail kontribusi dapat dilihat pada:

- **Pie Chart (Komposisi Penjualan Produk per Supplier)**
- Tersedia **dropdown filter berdasarkan nama supplier**
- Menampilkan persentase kontribusi tiap produk terhadap total pendapatan supplier

Visualisasi ini membantu mengidentifikasi produk dominan dari masing-masing supplier.

---

### 2. Supplier dengan Kontribusi Terbesar terhadap Perusahaan

Supplier dengan kontribusi terbesar terhadap total pendapatan perusahaan adalah:

> **Aux Joyeux ecclesiastiques**

Produk utama penyumbang pendapatan:
- Cota de Blaye
- Chartreuse verte

Kontribusi terhadap total pendapatan perusahaan:
> **17.53%**

Supplier ini memiliki peran signifikan dalam struktur revenue perusahaan.

---

### 3. Distribusi Supplier di Kota Utama (Heatmap Analysis)

Heatmap menampilkan distribusi supplier berdasarkan jumlah quantity produk di 5 kota dengan pendapatan tertinggi:

- Montreal
- Sao Paulo
- Graz
- Boise
- Alburquerque

#### Struktur Heatmap

- **Sumbu X** → Nama Supplier  
- **Sumbu Y** → Nama Kota  
- **Warna semakin gelap** → Quantity semakin besar  

#### Insight Utama

Supplier yang terdistribusi di kelima kota sekaligus:
- Plutzer Lebensmittelgrobmarket AG
- Formaggi Fortini s.r.l

Supplier yang memasok ke seluruh top 5 kota revenue tertinggi menunjukkan:

- Jangkauan distribusi yang luas  
- Stabilitas penjualan lintas wilayah  
- Peran strategis dalam menopang pusat-pusat revenue utama perusahaan  

Hal ini mengindikasikan bahwa supplier tersebut memiliki **market coverage yang kuat, risiko geografis yang lebih rendah, dan layak dipertimbangkan sebagai strategic long-term partner**.

Kota dengan jumlah supplier terbanyak:
> **Graz**

Hal ini menunjukkan Graz memiliki penetrasi supplier paling luas dibanding kota lainnya.

---

### 4. Supplier dengan Variasi Produk Terbanyak

Supplier dengan jumlah jenis produk terbanyak adalah:

- Pavlova, Ltd
- Plutzer Lebensmittelgrobmarket AG

Jumlah variasi produk:
> **5 jenis produk berbeda**

Kedua supplier memiliki tingkat diversifikasi produk paling tinggi.

---

## Komponen Dashboard

Dashboard terdiri dari:

1. **Bar Chart** → Total pendapatan per supplier  
2. **Pie Chart** → Komposisi penjualan produk per supplier (dengan dropdown filter)  
3. **Heatmap** → Distribusi quantity supplier di 5 kota utama  
4. **Table / Bar Indicator** → Jumlah produk per supplier  

---

## Tools & Technologies

- PostgreSQL
- CTE (Common Table Expressions)
- JOIN antar tabel relasional
- Aggregation (SUM)
- Perhitungan persentase kontribusi
- Looker Studio untuk visualisasi

---

## Kesimpulan

- Kontribusi produk terhadap supplier bervariasi.
- Aux Joyeux ecclesiastiques merupakan supplier paling berpengaruh terhadap pendapatan perusahaan.
- Graz adalah kota dengan konsentrasi supplier tertinggi.
- Pavlova, Ltd dan Plutzer Lebensmittelgrobmarket AG memiliki diversifikasi produk paling luas.

---
