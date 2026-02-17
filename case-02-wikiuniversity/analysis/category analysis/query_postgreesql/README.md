# Analisis Performa Kategori Produk

Folder ini berisi kumpulan query SQL untuk menganalisis performa kategori produk berdasarkan jumlah produk, minat customer, kontribusi revenue, serta tren pendapatan bulanan.

Struktur database yang digunakan terdiri dari tabel utama:

- `categories`
- `products`
- `orderdetails`
- `orders`
- `customers`

Analisis dilakukan dengan pendekatan agregasi (COUNT, SUM) dan window function untuk menghasilkan insight bisnis yang lebih komprehensif.

---

## 1. Kategori dengan Jumlah Produk Terbanyak

### Tujuan
Mengidentifikasi kategori yang memiliki variasi produk paling banyak.

### Konsep Analisis
- Menghubungkan tabel kategori dengan produk
- Menghitung jumlah produk per kategori
- Mengurutkan dari jumlah terbesar ke terkecil

### Insight
- Mengetahui distribusi produk
- Evaluasi strategi inventori
- Identifikasi kategori dengan diversifikasi produk tinggi

---

## 2. Kategori yang Paling Diminati Customer

### Tujuan
Menentukan kategori yang paling sering dibeli oleh customer.

### Konsep Analisis
- Menghubungkan kategori → produk → detail transaksi
- Menjumlahkan total unit terjual
- Mengurutkan berdasarkan jumlah penjualan tertinggi

### Insight
- Preferensi pembelian customer
- Kategori dengan demand tertinggi
- Dasar evaluasi strategi pemasaran

---

## 3. Revenue per Kategori dan Total Revenue Keseluruhan

### Tujuan
Mengukur kontribusi pendapatan masing-masing kategori terhadap total revenue bisnis.

### Konsep Analisis
- Menghitung revenue dari hasil perkalian quantity dan price
- Mengelompokkan berdasarkan kategori
- Menggunakan window function untuk mendapatkan total revenue keseluruhan dalam satu dataset

### Insight
- Kategori dengan kontribusi pendapatan terbesar
- Perbandingan revenue antar kategori
- Identifikasi kategori bernilai tinggi (high-value category)

---

## 4. Tren Pendapatan Bulanan per Kategori Produk

### Tujuan
Menganalisis perkembangan revenue setiap kategori dari waktu ke waktu.

### Konsep Analisis
- Menggunakan tanggal transaksi (order_date)
- Mengelompokkan data berdasarkan bulan
- Menghitung revenue per kategori setiap bulan

### Insight
- Tren kenaikan atau penurunan pendapatan
- Pola musiman (seasonality)
- Stabilitas performa kategori dalam jangka waktu tertentu

---

# Rekomendasi Visualisasi

Untuk dashboard (misalnya di Looker Studio), analisis ini dapat divisualisasikan dengan:

- **Bar Chart** → Perbandingan jumlah produk & revenue per kategori
- **Scorecard** → Total revenue keseluruhan
- **Line Chart (Time Series)** → Tren revenue bulanan per kategori

---

# Kesimpulan

Keempat analisis ini saling melengkapi:

1. Struktur Produk → (Jumlah Produk)
2. Perilaku Customer → (Total Terjual)
3. Kontribusi Finansial → (Revenue)
4. Perkembangan Waktu → (Tren Bulanan)

Dengan menggabungkan seluruh analisis, kita dapat memperoleh gambaran menyeluruh mengenai performa kategori produk dari sisi operasional, permintaan pasar, hingga kontribusi pendapatan.
