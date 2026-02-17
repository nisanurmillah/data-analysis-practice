--1. Kontribusi Produk terhadap Supplier
-- + Kontribusi Supplier terhadap Total Perusahaan

WITH company_revenue AS (
    SELECT SUM(p.price * d.quantity) AS total_revenue_company
    FROM products p
    JOIN orderdetails d ON d.product_id = p.product_id
),

supplier_revenue AS (
  SELECT s.supplier_id,
         s.supplier_name,
         SUM(p.price * d.quantity) AS total_dana_supplier
  FROM suppliers s
  JOIN products p ON p.supplier_id = s.supplier_id
  JOIN orderdetails d ON d.product_id = p.product_id
  GROUP BY s.supplier_id, s.supplier_name
),

product_revenue AS (
  SELECT s.supplier_id,
         s.supplier_name,
         p.product_name,
         SUM(p.price * d.quantity) AS total_pendapatan_produk
  FROM suppliers s
  JOIN products p ON p.supplier_id = s.supplier_id
  JOIN orderdetails d ON d.product_id = p.product_id
  GROUP BY s.supplier_id, s.supplier_name, p.product_name
)

SELECT 
       pr.supplier_id,
       pr.supplier_name,
       pr.product_name,
       pr.total_pendapatan_produk,
       sr.total_dana_supplier,
       
       -- Kontribusi produk ke supplier
       ROUND((pr.total_pendapatan_produk::numeric / sr.total_dana_supplier) * 100, 2) 
       AS persentase_produk_ke_supplier,

       -- Kontribusi supplier ke perusahaan
       ROUND((sr.total_dana_supplier::numeric / cr.total_revenue_company) * 100, 2)
       AS persentase_supplier_ke_perusahaan

FROM product_revenue pr
JOIN supplier_revenue sr 
     ON pr.supplier_id = sr.supplier_id
CROSS JOIN company_revenue cr
ORDER BY persentase_produk_ke_supplier DESC;

--2. Bagaimana kontribusi tiap produk terhadap total penjualan supplier?

WITH supplier_revenue AS (
  SELECT s.supplier_id,
         s.supplier_name,
         SUM(p.price * d.quantity) AS total_dana_supplier
  FROM suppliers s
  JOIN products p ON p.supplier_id = s.supplier_id
  JOIN orderdetails d ON d.product_id = p.product_id
  GROUP BY s.supplier_id, s.supplier_name
),
product_revenue AS (
  SELECT s.supplier_id,
         s.supplier_name,
         p.product_name,
         SUM(p.price * d.quantity) AS total_pendapatan_produk
  FROM suppliers s
  JOIN products p ON p.supplier_id = s.supplier_id
  JOIN orderdetails d ON d.product_id = p.product_id
  GROUP BY s.supplier_id, s.supplier_name, p.product_name
)
SELECT pr.supplier_id,
       pr.supplier_name,
       pr.product_name,
       pr.total_pendapatan_produk,
       sr.total_dana_supplier,
       ROUND((pr.total_pendapatan_produk::numeric / sr.total_dana_supplier) * 100, 2) AS persentase_kontribusi
FROM product_revenue pr
JOIN supplier_revenue sr ON pr.supplier_id = sr.supplier_id
ORDER BY persentase_kontribusi DESC;

--3. Supplier mana yang memasok produk ke kota/kawasan penting?
-- Hitung total revenue per kota

WITH city_revenue AS (
    SELECT
        c.city,
        SUM(od.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN customers c 
        ON o.customer_id = c.customer_id
    JOIN orderdetails od 
        ON o.order_id = od.order_id
    JOIN products p 
        ON od.product_id = p.product_id
    GROUP BY c.city
),

--Ambil Top 5 kota dengan revenue terbesar
top_cities AS (
    SELECT city
    FROM city_revenue
    ORDER BY total_revenue DESC
    LIMIT 5
)

-- Supplier yang memasok ke kota tersebut
SELECT
    s.supplier_id,
    s.supplier_name,
    c.city,
    SUM(od.quantity) AS total_quantity_supplied,
    SUM(od.quantity * p.price) AS total_revenue_generated
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
JOIN orderdetails od 
    ON o.order_id = od.order_id
JOIN products p 
    ON od.product_id = p.product_id
JOIN suppliers s 
    ON p.supplier_id = s.supplier_id
WHERE c.city IN (SELECT city FROM top_cities)
GROUP BY 
    s.supplier_id,
    s.supplier_name,
    c.city
ORDER BY 
    c.city,
    total_revenue_generated DESC;

--4. Supplier mana yang menyuplai produk terbanyak?
SELECT
    s.supplier_id,
    s.supplier_name,
    COUNT(p.product_id) AS total_products
FROM suppliers s
JOIN products p 
    ON s.supplier_id = p.supplier_id
GROUP BY
    s.supplier_id,
    s.supplier_name
ORDER BY
    total_products DESC;