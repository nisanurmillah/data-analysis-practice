# Sales Contribution Analysis – PostgreSQL

## Project Overview

Query ini bertujuan untuk menganalisis kontribusi penjualan dari level produk hingga supplier serta distribusinya berdasarkan kota dengan performa tertinggi.

Analisis dilakukan menggunakan PostgreSQL dengan pendekatan:
- Common Table Expressions (CTE)
- Aggregation (SUM)
- Perhitungan persentase kontribusi
- JOIN antar tabel relasional
- Filtering dan ranking data

---

## Business Questions

### 1. Bagaimana kontribusi tiap produk terhadap total penjualan supplier?

Tujuan:
- Mengidentifikasi produk utama (core product) tiap supplier
- Mengetahui ketergantungan supplier terhadap produk tertentu

Output:
- Total pendapatan produk
- Total pendapatan supplier
- Persentase kontribusi produk terhadap supplier

---

### 2. Seberapa besar kontribusi supplier terhadap total pendapatan perusahaan?

Tujuan:
- Mengukur peran supplier terhadap keseluruhan bisnis
- Mengidentifikasi supplier strategis perusahaan

Output:
- Total pendapatan supplier
- Total pendapatan perusahaan
- Persentase kontribusi supplier terhadap perusahaan

---

### 3. Supplier mana yang memasok ke kota dengan revenue tertinggi?

Tujuan:
- Mengidentifikasi kota dengan performa penjualan tertinggi
- Mengetahui supplier dominan di kota strategis

Pendekatan:
1. Menghitung total revenue per kota
2. Mengambil Top 5 kota dengan revenue terbesar
3. Mengidentifikasi supplier yang berkontribusi di kota tersebut

Output:
- Supplier ID
- Supplier Name
- City
- Total Quantity Supplied
- Total Revenue Generated

---

### 4. Supplier mana yang menyuplai produk terbanyak?

Tujuan:
- Mengidentifikasi supplier dengan variasi produk paling banyak
- Mengukur tingkat diversifikasi produk per supplier
- Mengetahui supplier dengan kapasitas supply paling luas

Pendekatan:
- Menghitung jumlah produk (`COUNT(product_id)`) per supplier
- Menggunakan JOIN antara tabel `suppliers` dan `products`
- Mengurutkan berdasarkan jumlah produk terbanyak (descending)

Output:
- Supplier ID
- Supplier Name
- Total Products Supplied

---

## Query Structure

### `company_revenue`
Menghitung total pendapatan perusahaan dari seluruh transaksi.

### `supplier_revenue`
Menghitung total pendapatan per supplier.

### `product_revenue`
Menghitung total pendapatan per produk dalam masing-masing supplier.

### `city_revenue`
Menghitung total pendapatan per kota.

### `top_cities`
Mengambil 5 kota dengan revenue tertinggi.

---

## Formula Perhitungan

### Kontribusi Produk → Supplier

(Pendapatan Produk / Total Pendapatan Supplier) × 100


Digunakan untuk mengidentifikasi supplier strategis.

---

## 🛠 Tools & Techniques

- PostgreSQL
- CTE (Common Table Expressions)
- JOIN antar tabel
- Aggregation (SUM)
- Numeric Casting (`::numeric`)
- ROUND() untuk pembulatan persentase
- ORDER BY & LIMIT untuk ranking
- Subquery filtering

---

## Dataset Relationship

Relasi utama antar tabel:

- `suppliers` → `products`
- `products` → `orderdetails`
- `orderdetails` → `orders`
- `orders` → `customers`

Struktur ini memungkinkan analisis dari level produk hingga distribusi geografis.

---

## Insight Potential

Dari query ini dapat diperoleh insight seperti:

- Produk dengan kontribusi tertinggi per supplier
- Supplier paling berpengaruh terhadap perusahaan
- Kota dengan performa penjualan terbaik
- Supplier dominan di kota strategis

---

## Use Case

Query ini dapat digunakan untuk:
- Dashboard BI (Looker Studio, Power BI, Tableau)
- Analisis performa supplier
- Market distribution analysis
- Portfolio Data Analyst project

