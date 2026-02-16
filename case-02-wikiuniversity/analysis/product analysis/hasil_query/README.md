# 🗃 SQL Queries – Product Performance Analysis

Folder ini berisi kumpulan query SQL yang digunakan untuk menganalisis performa produk pada dataset Northwind.

Seluruh query ditulis menggunakan PostgreSQL dan difokuskan pada analisis:

- Volume penjualan
- Kontribusi revenue
- Analisis Pareto (80/20 Rule)
- Tren dan pertumbuhan revenue bulanan

---

# Struktur File

| File | Deskripsi |
|------|-----------|
| `01_top_selling_products.sql` | Analisis produk dengan penjualan tertinggi dan customer yang membelinya |
| `02_revenue_contribution_pareto.sql` | Analisis total revenue per produk dan kontribusi kumulatif |
| `03_monthly_growth_analysis.sql` | Analisis tren penjualan dan pertumbuhan revenue per bulan |

---

# 1. Top Selling Products & Customers

## Objective
Mengidentifikasi produk dengan total quantity terjual tertinggi serta customer yang membelinya.

## Business Value
- Mengetahui produk paling diminati pasar
- Mengidentifikasi customer utama
- Mendukung strategi retargeting & loyalty program
- Membantu analisis pola pembelian

---

# 2. Revenue Contribution & Pareto Analysis

## Objective
Menghitung:
- Total revenue per produk
- Persentase kontribusi terhadap total revenue perusahaan
- Persentase kumulatif revenue

## Business Value
- Mengidentifikasi revenue driver utama
- Menilai ketergantungan bisnis pada produk tertentu
- Mendukung strategi prioritas produk
- Mengurangi revenue concentration risk

Analisis ini membantu menentukan apakah perusahaan mengikuti pola 80/20 (Pareto Principle).

---

# 3. Monthly Revenue & Growth Analysis

## Objective
Menganalisis performa produk dari waktu ke waktu berdasarkan:
- Total quantity per bulan
- Total revenue per bulan
- Kumulatif revenue
- Growth revenue antar bulan
- Growth percentage

## Business Value
- Mengidentifikasi tren pertumbuhan
- Mendeteksi penurunan performa lebih awal
- Menilai stabilitas revenue
- Mengamati potensi seasonality

Growth negatif yang konsisten dapat menjadi early warning terhadap penurunan performa produk.

---

# Technical Approach

Query menggunakan:

- JOIN antar tabel transaksi
- Aggregation (SUM, GROUP BY)
- Window Functions (LAG, SUM OVER)
- CTE (Common Table Expression)
- Growth Rate Calculation
- Cumulative Percentage Calculation

---

# Integration

Output dari query ini digunakan sebagai dasar pembuatan dashboard visualisasi pada Looker Studio yang tersedia di folder utama project.

---

