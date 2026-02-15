-- Dummy Data for KOTA Table
INSERT INTO KOTA (id_kota, nama_kota, provinsi, negara) VALUES
('JKT', 'Jakarta', 'DKI Jakarta', 'Indonesia'),
('DPS', 'Denpasar', 'Bali', 'Indonesia'),
('SUB', 'Surabaya', 'Jawa Timur', 'Indonesia'),
('SIN', 'Singapore', 'Pulau Ujong', 'Singapore'),
('KUL', 'Kuala Lumpur', 'Federal Territory of Kuala Lumpur', 'Malaysia'),
('BKK', 'Bangkok', 'Central Thailand', 'Thailand');

-- Dummy Data for BANDARA Table
INSERT INTO BANDARA (id_bandara, id_kota, nama_bandara, kode_icao, kode_iata) VALUES
('CGK', 'JKT', 'Soekarno-Hatta International Airport', 'WIII', 'CGK'),
('DPS', 'DPS', 'Ngurah Rai International Airport', 'WADD', 'DPS'),
('SUB', 'SUB', 'Juanda International Airport', 'WARR', 'SUB'),
('SIN', 'SIN', 'Changi Airport', 'WSSS', 'SIN'),
('KUL', 'KUL', 'Kuala Lumpur International Airport', 'WMKK', 'KUL'),
('BKK', 'BKK', 'Suvarnabhumi Airport', 'VTBS', 'BKK');

-- Dummy Data for JENIS_PESAWAT Table
INSERT INTO JENIS_PESAWAT (id_jenis_pesawat, nama_jenis, deskripsi) VALUES
('B737', 'Boeing 737-800', 'Pesawat lorong tunggal jarak menengah populer.'),
('A320', 'Airbus A320', 'Pesawat keluarga lorong tunggal serbaguna.'),
('B777', 'Boeing 777-300ER', 'Pesawat berbadan lebar jarak jauh.'),
('A330', 'Airbus A330-300', 'Pesawat berbadan lebar jarak menengah hingga jauh.');

-- Dummy Data for PESAWAT Table
INSERT INTO PESAWAT (id_pesawat, id_jenis_pesawat, nama_pesawat, nomor_registrasi, kapasitas_penumpang) VALUES
('PK-LKN', 'B737', 'Lion Air 1', 'PK-LKN', 189),
('GA-GTU', 'A320', 'Garuda Indonesia 1', 'GA-GTU', 180),
('SQ-STF', 'B777', 'Singapore Airlines 1', 'SQ-STF', 365),
('MH-MHD', 'A330', 'Malaysia Airlines 1', 'MH-MHD', 290),
('PK-CRZ', 'B737', 'Citilink 1', 'PK-CRZ', 180);

-- Dummy Data for PELANGGAN Table
INSERT INTO PELANGGAN (id_pelanggan, nama, email, telepon, alamat) VALUES
('CUST001', 'Budi Santoso', 'budi.s@example.com', '081234567890', 'Jl. Merdeka No. 1, Jakarta'),
('CUST002', 'Siti Aminah', 'siti.a@example.com', '082345678901', 'Jl. Kembang No. 5, Denpasar'),
('CUST003', 'John Doe', 'john.doe@example.com', '085678901234', '123 Main St, Singapore'),
('CUST004', 'Maria Lestari', 'maria.l@example.com', '087890123456', 'Jl. Pahlawan No. 10, Surabaya');

-- Dummy Data for PENERBANGAN Table
INSERT INTO PENERBANGAN (id_penerbangan, id_pesawat, id_bandara_asal, id_bandara_tujuan, waktu_keberangkatan, waktu_kedatangan, nomor_penerbangan, harga_dasar) VALUES
('FL001', 'PK-LKN', 'CGK', 'DPS', '2025-08-01 07:00:00', '2025-08-01 09:00:00', 'JT201', 750000.00),
('FL002', 'GA-GTU', 'DPS', 'CGK', '2025-08-01 10:00:00', '2025-08-01 12:00:00', 'GA302', 850000.00),
('FL003', 'SQ-STF', 'SIN', 'CGK', '2025-08-02 14:00:00', '2025-08-02 15:30:00', 'SQ950', 1500000.00),
('FL004', 'MH-MHD', 'KUL', 'SUB', '2025-08-03 09:30:00', '2025-08-03 11:00:00', 'MH870', 1200000.00),
('FL005', 'PK-CRZ', 'CGK', 'SIN', '2025-08-05 18:00:00', '2025-08-05 20:00:00', 'QG520', 900000.00),
('FL006', 'GA-GTU', 'CGK', 'BKK', '2025-08-10 13:00:00', '2025-08-10 16:00:00', 'GA866', 1800000.00);

-- Dummy Data for PEMESANAN Table
INSERT INTO PEMESANAN (id_pemesanan, id_pelanggan, tanggal_pemesanan, total_harga, status_pemesanan) VALUES
('ORD001', 'CUST001', '2025-07-14', 750000.00, 'Terkonfirmasi'),
('ORD002', 'CUST002', '2025-07-14', 850000.00, 'Terkonfirmasi'),
('ORD003', 'CUST003', '2025-07-15', 1500000.00, 'Terkonfirmasi'),
('ORD004', 'CUST004', '2025-07-16', 2400000.00, 'Terkonfirmasi'); -- Example for multi-passenger booking

-- Dummy Data for DETAIL_PEMESANAN Table
INSERT INTO DETAIL_PEMESANAN (id_detail_pemesanan, id_pemesanan, id_penerbangan, jumlah_penumpang, harga_per_kursi) VALUES
('DET001', 'ORD001', 'FL001', 1, 750000.00),
('DET002', 'ORD002', 'FL002', 1, 850000.00),
('DET003', 'ORD003', 'FL003', 1, 1500000.00),
('DET004', 'ORD004', 'FL004', 2, 1200000.00);
