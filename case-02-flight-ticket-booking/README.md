# Case 02 – Flight Ticket Booking Analysis


## Background
Perusahaan penerbangan membutuhkan analisis data pemesanan tiket untuk
memahami performa rute, kontribusi pendapatan, serta perilaku pelanggan.
Analisis ini dapat membantu manajemen dalam menentukan strategi harga,
penambahan jadwal penerbangan, dan program loyalitas customer.

Project ini mensimulasikan environment nyata industri airline
menggunakan database relasional.

---

## Business Questions
Beberapa pertanyaan bisnis yang dijawab dalam analisis ini:

### Customer & Booking
- Siapa pelanggan dengan total pembelian terbesar (top spender)?
- Berapa jumlah pelanggan yang sudah melakukan pemesanan?
- Siapa saja repeat customer?
- Berapa persentase pelanggan yang melakukan lebih dari satu order?
- Detail perjalanan pelanggan tertentu (contoh: Maria Lestari).

### Sales & Revenue
- Berapa total dan rata-rata pendapatan per pesawat?
- Pesawat/maskapai mana yang menghasilkan revenue terbesar?
- Bagaimana tren penjualan harian?
- Bagaimana tren penjualan bulanan?

### Route & Destination Performance
- Rute mana yang paling populer berdasarkan jumlah penumpang?
- Negara tujuan mana yang menghasilkan revenue terbesar?
- Berapa rata-rata harga tiket tiap rute?
- Menampilkan daftar penerbangan antar kota tertentu.

### Operational / Capacity
- Berapa tingkat keterisian kursi (load factor) setiap penerbangan?
- Apakah ada pesawat dengan utilisasi tinggi atau rendah?

---

## Data Model
Database terdiri dari tabel berikut:

- pelanggan  
- pemesanan  
- detail_pemesanan  
- penerbangan  
- pesawat  
- jenis_pesawat  
- bandara  
- kota  

Relasi utama:
customer → booking → flight → aircraft → airport → city.

---

## Skills Demonstrated
Dalam project ini saya mempraktikkan:

- Multi-table JOIN
- Aggregation (SUM, AVG, COUNT)
- GROUP BY & HAVING
- CTE (Common Table Expression)
- Date & time analysis
- Business KPI calculation
- Load factor & revenue computation
- Customer segmentation (loyal vs non loyal)
- Ranking & trend analysis

---

## Key Findings & Business Insight

Berikut beberapa temuan utama dari hasil analisis data:

### Revenue Performance
- Rata-rata pendapatan booking pada bulan Juli menunjukkan bahwa  
  **Malaysia Airlines 1** menjadi kontributor terbesar dengan nilai sekitar **2.4 juta**.
- Diikuti oleh Singapore Airlines, Garuda Indonesia, dan Lion Air.

Hal ini menunjukkan armada berbadan besar atau rute tertentu
memberikan kontribusi pendapatan lebih tinggi.

---

### Popular Route
Rute dengan jumlah penumpang terbanyak adalah:

✈️ **Kuala Lumpur → Surabaya**

Rute ini berpotensi untuk:
- penambahan frekuensi penerbangan  
- penggunaan pesawat berkapasitas lebih besar  

---

### Top Revenue Aircraft
Pesawat dengan total revenue terbesar adalah:

**Malaysia Airlines 1**

Menunjukkan performa komersial yang sangat baik dibanding armada lain.

---

### Top Spending Customer
Pelanggan dengan total transaksi terbesar:

**Maria Lestari**

Customer seperti ini berpotensi masuk program loyalitas
atau penawaran premium.

---

### Customer Loyalty
Persentase repeat customer saat ini masih:

**0%**

Artinya mayoritas pelanggan baru melakukan 1 kali transaksi.
Ini membuka peluang besar untuk strategi retensi dan membership.

---

### Load Factor (Tingkat Keterisian Kursi)
Urutan utilisasi pesawat dari tertinggi:

1. Malaysia Airlines → ~69%  
2. Garuda Indonesia → ~56%  
3. Lion Air → ~53%  
4. Singapore Airlines → ~27%

Beberapa armada masih memiliki ruang besar untuk optimasi okupansi.

---

### Daily Sales Trend
Pendapatan harian menunjukkan pola:

14 Juli → 1.6 juta  
15 Juli → 1.5 juta (sedikit turun)  
16 Juli → 2.4 juta (lonjakan signifikan)

Terlihat adanya peningkatan kuat di akhir periode.
Hal ini bisa disebabkan oleh:
- rute populer  
- pemesanan grup  
- atau harga tiket lebih tinggi.

---

### Top Revenue Destination
Negara tujuan dengan kontribusi pendapatan terbesar adalah:

**Indonesia**

---

### Average Ticket Price per Route
Beberapa rute internasional menunjukkan harga rata-rata lebih tinggi
dibanding domestik, yang berdampak langsung pada peningkatan revenue.


---

## Tech Stack
PostgreSQL / Supabase

---

## Repository Structure


---

## Author
**Nisanurmillah**  
Aspiring Data Analyst

