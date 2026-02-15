--Ubah nama negara pada tabel country Brazil=Indonesia
UPDATE customers c SET country='Indonesia' WHERE country='Brazil';

--Hapus data order dan order_details pada tahun 1997
DELETE FROM orderdetails d WHERE d.order_id IN(SELECT o.order_id FROM orders o WHERE EXTRACT (YEAR FROM o.order_date)=1997);
DELETE FROM orders o WHERE EXTRACT(YEAR FROM order_date)=1997;

--Ubah struktur type column categoryname jadi varchar 100 pada tabel actegories
ALTER TABLE categories
ALTER COLUMN category_name TYPE VARCHAR(100);

--Ubah nama produk jadi "makanan dari laut" untuk semua produk dengan kategori seafood
UPDATE products p SET product_name='makanan dari laut' 
  WHERE p.category_id IN(
  SELECT c.category_id FROM categories c 
  WHERE category_name='Seafood');

-- cara 2
UPDATE products p SET product_name='makanan dari laut' 
FROM categories c 
WHERE p.category_id=c.category_id 
AND c.category_name='Seafood';

--ubah nama produk yang kategorinya seafood dan suppliernya dari negara jepang dengan nama produk best seller
UPDATE products p
SET product_name = 'best seller'
FROM categories c, suppliers s
WHERE p.category_id = c.category_id
  AND p.supplier_id = s.supplier_id
  AND c.category_name = 'Seafood'
  AND s.country = 'Jepang';

--cara 2 pake IN 
UPDATE products p
SET product_name = 'best seller'
WHERE p.category_id IN (
      SELECT c.category_id
      FROM categories c
      WHERE c.category_name = 'Seafood')
AND p.supplier_id IN (
      SELECT s.supplier_id
      FROM suppliers s
      WHERE  s.country = 'Jepang');

--cara 3 pake EXISTS
UPDATE products p SET p.product_name = 'Best Seller' 
WHERE EXISTS (                                     
               SELECT *
               FROM categories c
               JOIN suppliers s ON s.supplier_id = p.supplier_id
               WHERE c.category_id = p.category_id
               AND c.category_name = 'Seafood'
               AND s.country = 'Jepang')

