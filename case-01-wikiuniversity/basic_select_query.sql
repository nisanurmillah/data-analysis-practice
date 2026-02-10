-- jumlah customer dari london dan jerman
SELECT COUNT(c. customer_id) FROM customers c
WHERE c.country IN ('Germany','London');

--karyawan yang lulusan psychologi
SELECT e. employee_id, e. first_name, e. last_name 
FROM employees e
WHERE notes LIKE '%psychology%'
  
-- siapa saja customer yang berasal dari London dan 
SELECT c.customer_name, c.city FROM customers c WHERE c.city='London' OR c.city='Berlin' OR c.city='garut';

--produk dengan harga tertinggi
SELECT p.product_id, p.product_name, p.price
FROM products p
ORDER BY p.price DESC;

--tampilkan 10 baris pertama data customers
SELECT * FROM customers LIMIT 10;
