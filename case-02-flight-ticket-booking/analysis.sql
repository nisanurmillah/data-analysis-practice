-- =========================================
-- Flight Ticket Booking Analysis
-- Author: Nisanurmillah
-- =========================================


--1. Tampilkan data nama bandara asal, nama bandara tujuan, nama_pesawat, waktu keberangkatan, waktu kedatangan, dan nama kota tujuan untuk  pelanggan atas nama Maria Lestari
SELECT ba.nama_bandara AS nama_bandara_asal, 
        bt.nama_bandara AS nama_bandara_tujuan, 
        ps.nama_pesawat, pn.waktu_keberangkatan, 
        pn.waktu_kedatangan, 
        k.nama_kota
FROM kota k
JOIN bandara ba ON ba.id_kota=k.id_kota
JOIN penerbangan pn ON ba.id_bandara=pn.id_bandara_asal
JOIN bandara bt ON bt.id_bandara=pn.id_bandara_tujuan
JOIN pesawat ps ON pn.id_pesawat=ps.id_pesawat
JOIN detail_pemesanan d ON d.id_penerbangan=pn.id_penerbangan
JOIN pemesanan p ON p.id_pemesanan=d.id_pemesanan
JOIN pelanggan pl ON pl.id_pelanggan=p.id_pelanggan
WHERE pl.nama='Maria Lestari';

--tampilkan pesanan, detail pemesanan, dan data pelanggan untuk penerbangan menggunakan pesawat singapore airline dan garuda indonesia
SELECT l.id_pelanggan, 
      l.nama AS nama_pelanggan, 
      l.email, 
      l.telepon, 
      l.alamat, 
      m.id_pemesanan, 
      m.tanggal_pemesanan, 
      m.total_harga, 
      m.status_pemesanan, 
      d.id_detail_pemesanan, 
      d.jumlah_penumpang, 
      d.harga_per_kursi, 
      s.nama_pesawat 
FROM detail_pemesanan d
JOIN pemesanan m ON d.id_pemesanan=m.id_pemesanan
JOIN pelanggan l ON l.id_pelanggan=m.id_pelanggan
JOIN penerbangan p ON d.id_penerbangan=p.id_penerbangan
JOIN pesawat s ON s.id_pesawat=p.id_pesawat
WHERE s.nama_pesawat IN('Singapore Airlines 1', 'Garuda Indonesia 1');

--hitung total pendapatan rata-rata maskapai pesawat bulan juli
SELECT p.id_pesawat, p.nama_pesawat, AVG(pm.total_harga) AS "pendapatan rata-rata bulan juni"
FROM pesawat p
JOIN penerbangan pn ON p.id_pesawat=pn.id_pesawat
JOIN detail_pemesanan d ON d.id_penerbangan=pn.id_penerbangan
JOIN pemesanan pm ON pm.id_pemesanan=d.id_pemesanan
JOIN pelanggan pl ON pl.id_pelanggan=pm.id_pelanggan
WHERE EXTRACT(MONTH FROM pm.tanggal_pemesanan)=7
GROUP BY p.id_pesawat, p.nama_pesawat
ORDER by "pendapatan rata-rata bulan juni" DESC;

--tampilkan semua penerbangan dari Jakarta ke Surabaya 
SELECT pn.id_penerbangan, 
        ba.nama_bandara AS nama_bandara_asal, 
        ka.nama_kota AS kota_asal, 
        bt.nama_bandara AS nama_bandara_tujuan, 
        kt.nama_kota AS kota_tujuan, 
        pn.nomor_penerbangan, 
        pn.waktu_keberangkatan, 
        pn.waktu_kedatangan, 
        pn.harga_dasar, 
        ps.nama_pesawat
FROM penerbangan pn
         LEFT JOIN bandara ba ON ba.id_bandara=pn.id_bandara_asal
         LEFT JOIN kota ka ON ka.id_kota=ba.id_kota
         JOIN bandara bt ON bt.id_bandara=pn.id_bandara_tujuan
         JOIN kota kt ON kt.id_kota=bt.id_kota
         JOIN pesawat ps ON ps.id_pesawat=pn.id_pesawat
         WHERE kt.provinsi='Bali' AND ka.nama_kota='Jakarta';

--pelanggan yang melakukan lebih dari satu pemesanan
SELECT pl.id_pelanggan, pl.nama, COUNT(pm.id_pemesanan) AS jumlah_pemesanan
FROM pelanggan pl
JOIN pemesanan pm ON pl.id_pelanggan=pm.id_pelanggan
GROUP BY pl.id_pelanggan, pl.nama
HAVING COUNT(pm.id_pemesanan)>1;

SELECT pl.id_pelanggan, pl.nama, COUNT(pm.id_pemesanan) AS jumlah_pemesanan
FROM pelanggan pl
JOIN pemesanan pm ON pl.id_pelanggan = pm.id_pelanggan
GROUP BY pl.id_pelanggan, pl.nama
ORDER BY jumlah_pemesanan DESC;

--berapa jumlah pelanggan yang melakukan pemesanan
SELECT COUNT(id_pelanggan) AS jumlah_pelanggan_memesan FROM pemesanan;

--Rute paling populer (banyak penumpang)
SELECT 
    ka.nama_kota AS kota_asal,
    kt.nama_kota AS kota_tujuan,
    SUM(d.jumlah_penumpang) AS total_penumpang
FROM detail_pemesanan d
JOIN penerbangan pn ON d.id_penerbangan = pn.id_penerbangan
JOIN bandara ba ON pn.id_bandara_asal = ba.id_bandara
JOIN kota ka ON ba.id_kota = ka.id_kota
JOIN bandara bt ON pn.id_bandara_tujuan = bt.id_bandara
JOIN kota kt ON bt.id_kota = kt.id_kota
GROUP BY ka.nama_kota, kt.nama_kota
ORDER BY total_penumpang DESC;

--Maskapai pesawat dengan revenue terbesar
SELECT 
    ps.nama_pesawat,
    SUM(d.jumlah_penumpang * d.harga_per_kursi) AS total_revenue
FROM detail_pemesanan d
JOIN penerbangan pn ON d.id_penerbangan = pn.id_penerbangan
JOIN pesawat ps ON pn.id_pesawat = ps.id_pesawat
GROUP BY ps.nama_pesawat
ORDER BY total_revenue DESC;

--Customer Top Spender
SELECT 
    pl.nama,
    SUM(pm.total_harga) AS total_belanja
FROM pemesanan pm
JOIN pelanggan pl ON pm.id_pelanggan = pl.id_pelanggan
GROUP BY pl.nama
ORDER BY total_belanja DESC;

--Presentase repeat customer
WITH customer_orders AS (
    SELECT id_pelanggan, COUNT(*) AS jumlah_order
    FROM pemesanan
    GROUP BY id_pelanggan
)
SELECT 
    COUNT(*) FILTER (WHERE jumlah_order > 1) * 100.0 / COUNT(*) 
    AS persentase_repeat_customer
FROM customer_orders;

--Tingkat keterisian kursi 
SELECT 
    pn.id_penerbangan,
    ps.nama_pesawat,
    ps.kapasitas_penumpang,
    SUM(d.jumlah_penumpang) AS total_penumpang,
    ROUND(
        SUM(d.jumlah_penumpang) * 100.0 / ps.kapasitas_penumpang, 2
    ) AS load_factor_percent
FROM detail_pemesanan d
JOIN penerbangan pn ON d.id_penerbangan = pn.id_penerbangan
JOIN pesawat ps ON pn.id_pesawat = ps.id_pesawat
GROUP BY pn.id_penerbangan, ps.nama_pesawat, ps.kapasitas_penumpang
ORDER BY load_factor_percent DESC;

--Tren penjualan per hari
SELECT 
    tanggal_pemesanan,
    SUM(total_harga) AS total_revenue
FROM pemesanan
GROUP BY tanggal_pemesanan
ORDER BY tanggal_pemesanan;

--Tren penjualan per bulan
SELECT 
    DATE_TRUNC('month', tanggal_pemesanan) AS bulan,
    SUM(total_harga) AS total_revenue
FROM pemesanan
GROUP BY bulan
ORDER BY bulan;

--Tujuan paling menghasilkan user
SELECT 
    k.negara,
    SUM(d.jumlah_penumpang * d.harga_per_kursi) AS revenue
FROM detail_pemesanan d
JOIN penerbangan pn ON d.id_penerbangan = pn.id_penerbangan
JOIN bandara b ON pn.id_bandara_tujuan = b.id_bandara
JOIN kota k ON b.id_kota = k.id_kota
GROUP BY k.negara
ORDER BY revenue DESC;

--Rata-rata harga tiket per rute
SELECT 
    ka.nama_kota AS asal,
    kt.nama_kota AS tujuan,
    AVG(d.harga_per_kursi) AS rata_harga
FROM detail_pemesanan d
JOIN penerbangan pn ON d.id_penerbangan = pn.id_penerbangan
JOIN bandara ba ON pn.id_bandara_asal = ba.id_bandara
JOIN kota ka ON ba.id_kota = ka.id_kota
JOIN bandara bt ON pn.id_bandara_tujuan = bt.id_bandara
JOIN kota kt ON bt.id_kota = kt.id_kota
GROUP BY asal, tujuan
ORDER BY rata_harga DESC;


