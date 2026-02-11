# Case 01 – WikiUniversity Dataset

## Sales Performance Analysis using Northwind Dataset

### Project Overview

Case study ini menggunakan dataset **Northwind** untuk menganalisis performa penjualan perusahaan distribusi produk makanan dan minuman.

Analisis dilakukan menggunakan SQL dengan pendekatan:

* 01_basic_select → Query dasar untuk eksplorasi data
* 02_join → Analisis relasi antar tabel
* 03_aggregation → Perhitungan total, revenue, dan KPI
* 04_subquery_cte → Analisis lanjutan menggunakan CTE & subquery
* 05_data_manipulation → Simulasi update, delete, dan perubahan struktur data

---

## Project Scope

Proyek ini mencakup eksplorasi dan analisis dataset Northwind dari berbagai aspek bisnis, meliputi:

- Customer Analysis  
- Product Performance  
- Supplier Contribution  
- Employee Performance  
- Order & Revenue Analysis  
- Data Maintenance Simulation  

---

## Business Questions - Sales & Customer Analysis

### 1. Customer Analysis
**Tujuan:** Memahami perilaku pembelian dan nilai customer.  

| No | Business Question | Fokus Analisis |
|----|-----------------|----------------|
| 1  | Siapa saja customer dengan pembayaran tertinggi? | Identifikasi VIP customer untuk strategi loyalitas. |
| 2  | Apa saja produk yang dibeli oleh customer utama? | Rekomendasi upselling / cross-selling. |
| 3  | Customer mana yang membeli produk dari lebih dari 3 kategori atau supplier? | Segmentasi customer loyal dan multi-category. |
| 4  | Berapa total pembelian per customer? | Mengukur Customer Lifetime Value (CLV). |

---

### 2. Product Analysis
**Tujuan:** Memahami performa produk dan profitabilitas.  

| No | Business Question | Fokus Analisis |
|----|-----------------|----------------|
| 1  | Produk apa yang paling banyak terjual? | Menentukan top selling product. |
| 2  | Produk mana yang memiliki kontribusi penjualan terbesar? | Fokus stok & promosi produk unggulan. |
| 3  | Produk berdasarkan kategori atau supplier tertentu? | Strategi kategori & sourcing. |
| 4  | Produk mana yang memiliki potensi keuntungan maksimal? | Pricing strategy dan margin planning. |

---

### 3. Supplier Analysis
**Tujuan:** Memahami kontribusi supplier dan efektivitas sourcing.  

| No | Business Question | Fokus Analisis |
|----|-----------------|----------------|
| 1  | Supplier mana yang memiliki penjualan terbesar? | Menentukan supplier strategis. |
| 2  | Bagaimana kontribusi tiap produk terhadap total penjualan supplier? | Fokus produk unggulan supplier. |
| 3  | Supplier mana yang memasok produk ke kota/kawasan penting? | Optimasi logistik & distribusi. |

---

### 4. Sales / Order Analysis
**Tujuan:** Mengukur performa penjualan dan tren transaksi.  

| No | Business Question | Fokus Analisis |
|----|-----------------|----------------|
| 1  | Total order per kategori atau produk | Mengukur demand per produk/kategori. |
| 2  | Total penjualan per customer dan produk | Mengetahui kontribusi revenue. |
| 3  | Persentase penjualan tiap produk dibanding total | Strategi marketing dan promosi. |
| 4  | Potensi pendapatan jika produk dijual dengan markup tertentu | Forecasting & margin planning. |

---

### 5. Category Analysis
**Tujuan:** Memahami distribusi produk menurut kategori.  

| No | Business Question | Fokus Analisis |
|----|-----------------|----------------|
| 1  | Kategori mana yang memiliki jumlah produk terbanyak? | Inventory planning. |
| 2  | Kategori mana yang paling diminati customer? | Fokus promosi kategori unggulan. |

---

### 6. Data / Operational Maintenance
**Tujuan:** Menjaga data tetap valid dan siap analisis.  

| No | Business Question | Fokus Analisis |
|----|-----------------|----------------|
| 1  | Bagaimana memperbarui nama negara / informasi customer yang salah? | Konsistensi data. |
| 2  | Data order lama atau tidak relevan perlu dihapus? | Membersihkan database untuk analisis akurat. |
| 3  | Perlu update nama produk atau kategori untuk standarisasi? | Standarisasi data untuk laporan dan dashboard. |

---

## Metodologi Analisis Bisnis

### 1. Tujuan Analisis
Analisis ini dilakukan untuk mendapatkan **insight bisnis yang relevan** dari data penjualan, customer, produk, dan supplier. Tujuan utama dari analisis ini adalah:  
1. Memahami **perilaku customer**, termasuk segmentasi berdasarkan nilai pembelian, jenis produk yang dibeli, dan loyalty terhadap kategori atau supplier tertentu.  
2. Mengevaluasi **performa produk**, menentukan produk terlaris, produk dengan kontribusi penjualan terbesar, dan potensi keuntungan dari setiap produk.  
3. Menilai **kontribusi supplier** dan efektivitas strategi sourcing, serta menentukan supplier strategis berdasarkan penjualan produk dan area distribusi.  
4. Mendukung pengambilan keputusan strategis terkait **penjualan, promosi, inventory, dan pricing**.

### 2. Sumber Data
Analisis ini menggunakan data historis yang berasal dari beberapa tabel utama: 
* customers
* orders
* order_details
* products
* categories
* employees
* Supliers.  

Sebelum analisis, data dilakukan **pembersihan dan standarisasi**, antara lain:  
- Koreksi nama negara dan kota agar konsisten.  
- Penghapusan data order lama atau tidak relevan.  
- Standarisasi nama produk berdasarkan kategori dan supplier.  

### 3. Pendekatan Analisis
Pendekatan analisis dilakukan dengan menggabungkan **metode deskriptif dan kuantitatif**. Beberapa langkah yang dilakukan antara lain:  

#### Customer Analysis
- Identifikasi customer dengan pembayaran tertinggi untuk menentukan **VIP customer**.  
- Menentukan produk yang dibeli oleh setiap customer untuk strategi **upselling dan cross-selling**.  
- Mengelompokkan customer yang membeli dari lebih dari 3 kategori atau supplier untuk segmentasi **loyal dan multi-category**.  
- Menghitung total pembelian per customer untuk menghitung **Customer Lifetime Value (CLV)**.

#### Product Analysis
- Menghitung jumlah unit terjual per produk dan kategori.  
- Menilai kontribusi tiap produk terhadap total penjualan.  
- Menganalisis potensi keuntungan dengan asumsi markup tertentu.  
- Mengidentifikasi produk unggulan untuk strategi **stok dan promosi**.

#### Supplier Analysis
- Menentukan supplier dengan penjualan terbesar.  
- Mengukur kontribusi tiap produk terhadap total penjualan supplier.  
- Mengidentifikasi supplier yang memasok produk ke kota atau kawasan strategis untuk **optimasi distribusi**.

#### Sales / Order Analysis
- Evaluasi total order per kategori dan produk.  
- Menghitung persentase kontribusi penjualan tiap produk terhadap total penjualan.  
- Mengestimasi potensi pendapatan jika produk dijual dengan harga target tertentu.

#### Category Analysis
- Menghitung jumlah produk per kategori.  
- Menentukan kategori yang paling diminati customer untuk **fokus promosi dan inventori**.

### 4. Teknik Analisis
Beberapa teknik analisis yang digunakan meliputi:  
- **Join dan Aggregasi**: Menggabungkan beberapa tabel untuk menghitung total penjualan, total unit, dan kontribusi supplier atau produk.  
- **Filter dan Segmentasi**: Memisahkan data berdasarkan kategori, supplier, lokasi customer, atau tahun transaksi.  
- **Subquery dan CTE (Common Table Expressions)**: Membuat tabel bayangan untuk perhitungan total per supplier, produk, atau customer.  
- **Perhitungan KPI**: Total pembelian, total unit terjual, persentase kontribusi produk, dan potensi keuntungan.  
- **Fungsi Statistik Dasar**: SUM, COUNT, AVG, dan STRING_AGG untuk merangkum informasi.

### 5. Visualisasi
Hasil analisis dapat divisualisasikan untuk mendukung pengambilan keputusan, antara lain:  
- **Top Customer / Revenue Contribution** → Bar chart atau Pie chart.  
- **Produk Terlaris & Kontribusi Penjualan** → Column chart atau Pareto chart.  
- **Supplier Kontribusi Produk** → Stacked bar chart.  
- **Distribusi Penjualan Per Kategori** → Pie chart atau Tree map.  

### 6. Kesimpulan
Metodologi ini memungkinkan perusahaan untuk:  
- Menentukan strategi penjualan dan promosi berdasarkan data aktual.  
- Mengoptimalkan stok dan inventori produk unggulan.  
- Memprioritaskan supplier strategis untuk efisiensi sourcing dan distribusi.  
- Merencanakan harga jual dan potensi keuntungan dengan lebih akurat.  
- Mendukung pengambilan keputusan berbasis data untuk pertumbuhan bisnis.

---

## Analysis Results


---

## Key Insights

* Dataset menunjukkan variasi harga produk yang sangat lebar.
* Beberapa kategori memiliki jumlah produk lebih dominan.
* Customer tersebar secara geografis, namun analisis lanjutan diperlukan untuk melihat kontribusi revenue per wilayah.
* Produk premium memiliki potensi revenue tinggi meskipun volume mungkin lebih kecil.

---

## Conclusion

Berdasarkan analisis SQL terhadap dataset Northwind:

* Struktur data mendukung analisis penjualan berbasis produk, kategori, dan customer.
* Terdapat perbedaan signifikan dalam harga produk yang dapat mempengaruhi strategi penjualan.
* Analisis agregasi membantu mengidentifikasi produk dan customer bernilai tinggi.
* Dataset ini cocok digunakan untuk simulasi analisis bisnis skala kecil hingga menengah.

---

## Future Improvement

* Analisis revenue per negara
* Analisis performa karyawan berdasarkan total order
* Time-based analysis (monthly/yearly sales)
* Identifikasi produk slow-moving

---

**Author:**
Nisa Nurmillah
SQL Data Analysis Practice Project
