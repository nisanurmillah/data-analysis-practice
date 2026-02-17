--1. Kategori yang memiliki jumlah produk terbanyak

SELECT 
    c.category_name,
    COUNT(p.product_id) AS total_produk
FROM categories c
JOIN products p 
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY total_produk DESC;

--2.Kategori ang paling diminati customer
SELECT 
    c.category_name,
    SUM(od.quantity) AS total_terjual
FROM categories c
JOIN products p 
    ON c.category_id = p.category_id
JOIN orderdetails od 
    ON p.product_id = od.product_id
GROUP BY c.category_name
ORDER BY total_terjual DESC;

--3. Revenue categori per revenue total
SELECT 
    c.category_name,
    SUM(od.quantity * p.price) AS revenue_per_category,
    SUM(SUM(od.quantity * p.price)) OVER () AS total_revenue_overall
FROM categories c
JOIN products p 
    ON c.category_id = p.category_id
JOIN orderdetails od 
    ON p.product_id = od.product_id
GROUP BY c.category_name
ORDER BY revenue_per_category DESC;

--4. Tren Pendapatan Bulanan per Kategori Produk
SELECT 
    c.category_name,
    DATE_TRUNC('month', o.order_date) AS bulan,
    SUM(od.quantity * p.price) AS revenue_per_month
FROM categories c
JOIN products p 
    ON c.category_id = p.category_id
JOIN orderdetails od 
    ON p.product_id = od.product_id
JOIN orders o 
    ON od.order_id = o.order_id
GROUP BY 
    c.category_name,
    DATE_TRUNC('month', o.order_date)
ORDER BY 
    bulan,
    revenue_per_month DESC;