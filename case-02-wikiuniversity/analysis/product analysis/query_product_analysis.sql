--1. Tampilkan produk dengan penjualan teringgi beserta customer yang membelinya
SELECT 
  p.product_id,
  p.product_name,
  SUM(d.quantity) AS total_quantity_sold,
  STRING_AGG(c.customer_name,',') AS nama_customer
FROM products p
LEFT JOIN orderdetails d ON p.product_id = d.product_id
JOIN orders o ON o.order_id=d.order_id
JOIN customers c ON c.customer_id=o.customer_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;

--2. Berapa total pendapatan per produk, dan seberapa besar persentasenya terhadap total pendapatan beserta persentase kumulatifnya
WITH revenue_per_product AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(d.quantity) AS total_terjual,
        SUM(p.price * d.quantity) AS total_revenue
    FROM products p
    JOIN orderdetails d ON d.product_id = p.product_id
    GROUP BY p.product_id, p.product_name
),

total_company_revenue AS (
    SELECT SUM(total_revenue) AS total_revenue_company
    FROM revenue_per_product
)

SELECT
    r.product_id,
    r.product_name,
    r.total_terjual,
    r.total_revenue,
    ROUND(
        r.total_revenue / t.total_revenue_company * 100,
        2
    ) AS persentase_kontribusi,
    ROUND(
        SUM(r.total_revenue) OVER (ORDER BY r.total_revenue DESC)
        / t.total_revenue_company * 100,
        2
    ) AS persentase_kumulatif
FROM revenue_per_product r
CROSS JOIN total_company_revenue t
ORDER BY r.total_revenue DESC;

--3. Analisis Tren Penjualan dan Pertumbuhan Revenue Produk per Bulan
WITH monthly_sales AS (
    SELECT 
        p.product_id,
        p.product_name AS nama_produk,
        DATE_TRUNC('month', o.order_date) AS bulan,
        SUM(od.quantity) AS total_quantity,
        SUM(od.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN orderdetails od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY 
        p.product_id,
        p.product_name,
        DATE_TRUNC('month', o.order_date)
),

product_total AS (
    SELECT
        product_id,
        SUM(total_revenue) AS total_revenue_all_time
    FROM monthly_sales
    GROUP BY product_id
)

SELECT
    m.nama_produk,
    m.bulan,
    m.total_quantity,
    m.total_revenue,

    -- Running total revenue per product
    SUM(m.total_revenue) OVER (
        PARTITION BY m.product_id
        ORDER BY m.bulan
    ) AS kumulatif_revenue,

    -- Growth vs previous month
    m.total_revenue - LAG(m.total_revenue)
        OVER (PARTITION BY m.product_id ORDER BY m.bulan)
        AS selisih_bulanan,

    -- Growth percentage
    ROUND(
        100.0 *
        (m.total_revenue - LAG(m.total_revenue)
            OVER (PARTITION BY m.product_id ORDER BY m.bulan))
        /
        NULLIF(LAG(m.total_revenue)
            OVER (PARTITION BY m.product_id ORDER BY m.bulan), 0),
        2
    ) AS growth_percentage,

    pt.total_revenue_all_time

FROM monthly_sales m
JOIN product_total pt 
    ON m.product_id = pt.product_id
ORDER BY m.nama_produk, m.bulan;
