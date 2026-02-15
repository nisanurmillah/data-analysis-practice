
--1. Buat tabel bayangan pengguna clean dengan mengubah format tanggal ke date

create or replace view pengguna_clean as
select 
    userid,
    email,
    -- ubah "data tidak tersedia" jadi NULL, lalu casting ke DATE
    case 
        when last_active ~ '^\d{4}-\d{2}-\d{2}' 
            then to_date(last_active, 'YYYY-MM-DD')
        else null 
    end as last_active_date,
    
    case 
        when last_contacted ~ '^\d{4}-\d{2}-\d{2}' 
            then to_date(last_contacted, 'YYYY-MM-DD')
        else null 
    end as last_contacted_date,
    
    case 
        when start_date ~ '^\d{4}-\d{2}-\d{2}' 
            then to_date(start_date, 'YYYY-MM-DD')
        else null 
    end as start_date_date

from data_user_chat;

SELECT * FROM pengguna_clean;

--2. Mencari total pengguna tiap bulannya dari awal sampai tahun 2024

CREATE OR REPLACE VIEW data_pengguna AS
SELECT 
    DATE_TRUNC('month', start_date_date) AS bulan,
    COUNT(*) AS total_pengguna
FROM pengguna_clean
WHERE start_date_date <= '2024-12-31 23:59:59'::timestamp
GROUP BY DATE_TRUNC('month', start_date_date)
ORDER BY bulan;

SELECT* FROM data_pengguna;

--3.  Mecari total pengguna di tahun 2024 tiap bulannya
CREATE OR REPLACE VIEW data_pengguna_2024 AS
SELECT 
    TO_CHAR(start_date_date, 'FMMonth YYYY') AS bulan,
    COUNT(*) AS total_pengguna
FROM pengguna_clean
WHERE start_date_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY TO_CHAR(start_date_date, 'FMMonth YYYY')
ORDER BY MIN(start_date_date);

SELECT * FROM data_pengguna_2024;

--4. Mencari total pengguna dari tahun ke tahun
CREATE OR REPLACE VIEW pertumbuhan_pertahun AS
SELECT 
    EXTRACT(YEAR FROM start_date_date) AS tahun,
    COUNT(*) AS total_pengguna
FROM pengguna_clean
WHERE start_date_date IS NOT NULL
GROUP BY EXTRACT(YEAR FROM start_date_date)
ORDER BY tahun;

SELECT* FROM pertumbuhan_pertahun

--5. demografi pengguna masing-masing negara
CREATE OR REPLACE VIEW demografi_pengguna_tiap_negara AS
SELECT 
    CASE
        WHEN country = 'data tidak tersedia' THEN 'nama negara tidak ditemukan'
        ELSE country
    END AS negara,
COUNT(*) AS pengguna
FROM data_user_chat
GROUP BY CASE
        WHEN country = 'data tidak tersedia' THEN 'nama negara tidak ditemukan'
        ELSE country
    END
ORDER BY pengguna DESC

SELECT * FROM demografi_pengguna_tiap_negara

--6. Demografi pengguna berdasarkan kota di indonesia
CREATE OR REPLACE VIEW demografi_pengguna_di_Indonesia AS
SELECT city AS kota, COUNT(*) AS jumlah_pengguna
FROM data_user_chat
WHERE country ILIKE '%indonesia%'
GROUP BY city
ORDER BY jumlah_pengguna DESC

SELECT * FROM demografi_pengguna_di_indonesia

--7. Original vs Recent Shift Analysis
SELECT
    CASE
        WHEN "original conversation started page title" =
             "recent conversation started page title"
        THEN 'Same'
        ELSE 'Changed'
    END AS status,
    COUNT(*)
FROM data_user_chat
WHERE "original conversation started page title" IS NOT NULL
AND "recent conversation started page title" IS NOT NULL
GROUP BY status;

--8. Halaman mana paling sering berubah
SELECT
    "original conversation started page title" AS from_page,
    "recent conversation started page title" AS to_page,
    COUNT(*) AS total
FROM data_user_chat
WHERE "original conversation started page title" <>
      "recent conversation started page title"
GROUP BY from_page, to_page
ORDER BY total DESC;


--9. Query – Top 10 Conversation Starter Page
SELECT
    "original conversation started page title" AS page_title,
    COUNT(*) AS total_conversation
FROM data_user_chat
WHERE "original conversation started page title" IS NOT NULL
GROUP BY "original conversation started page title"
ORDER BY total_conversation DESC
LIMIT 10;

--10. Query – Category Strength Analysis
SELECT
    CASE
        WHEN "original conversation started page title" ILIKE '%id card%' THEN 'ID Card'
        WHEN "original conversation started page title" ILIKE '%amplop%' THEN 'Amplop'
        WHEN "original conversation started page title" ILIKE '%box%' THEN 'Box'
        WHEN "original conversation started page title" ILIKE '%coffe%' THEN 'Coffe Cup'
        WHEN "original conversation started page title" ILIKE '%botol%' THEN 'Botol'
        WHEN "original conversation started page title" ILIKE '%banner%' THEN 'Banner'
        WHEN "original conversation started page title" ILIKE '%label%' THEN 'label'
        WHEN "original conversation started page title" ILIKE '%kardus%' THEN 'kardus'
        WHEN "original conversation started page title" ILIKE '%makanan%' THEN 'makanan'
        WHEN "original conversation started page title" ILIKE '%kemasan%' THEN 'kemasan'
        WHEN "original conversation started page title" ILIKE '%standpouch%' THEN 'standpouch'
        WHEN "original conversation started page title" ILIKE '%flat bottom alu%' THEN 'flat bottom alu'
        ELSE 'Other'
    END AS category,
    
    COUNT(*) AS total_conversation

FROM data_user_chat
WHERE "original conversation started page title" IS NOT NULL
GROUP BY category
ORDER BY total_conversation DESC;

--11. persentase conversation berdasarkan kategori
WITH categorized AS (
    SELECT
        CASE
            WHEN "original conversation started page title" ILIKE '%id card%' THEN 'ID Card'
        WHEN "original conversation started page title" ILIKE '%amplop%' THEN 'Amplop'
        WHEN "original conversation started page title" ILIKE '%box%' THEN 'Box'
        WHEN "original conversation started page title" ILIKE '%coffe%' THEN 'Coffe Cup'
        WHEN "original conversation started page title" ILIKE '%botol%' THEN 'Botol'
        WHEN "original conversation started page title" ILIKE '%banner%' THEN 'Banner'
        WHEN "original conversation started page title" ILIKE '%label%' THEN 'label'
        WHEN "original conversation started page title" ILIKE '%kardus%' THEN 'kardus'
        WHEN "original conversation started page title" ILIKE '%makanan%' THEN 'kemasan makanan'
        WHEN "original conversation started page title" ILIKE '%kemasan%' THEN 'kemasan'
        WHEN "original conversation started page title" ILIKE '%standpouch%' THEN 'standpouch'
        WHEN "original conversation started page title" ILIKE '%flat bottom alu%' THEN 'flat bottom alu'
        ELSE 'Other'
        END AS category
    FROM data_user_chat
    WHERE "original conversation started page title" IS NOT NULL
)

SELECT
    category,
    COUNT(*) AS total_conversation,
    ROUND(
        COUNT(*)::numeric /
        SUM(COUNT(*)) OVER() * 100
    ,2) AS percentage_share
FROM categorized
GROUP BY category
ORDER BY total_conversation DESC;

--12. perbandingan original vs recent
with original as (
    SELECT
        CASE
            WHEN "original conversation started page title" ILIKE '%id card%' THEN 'ID Card'
            WHEN "original conversation started page title" ILIKE '%amplop%' THEN 'Amplop'
            WHEN "original conversation started page title" ILIKE '%box%' THEN 'Box'
            WHEN "original conversation started page title" ILIKE '%coffe%' THEN 'Coffe Cup'
            WHEN "original conversation started page title" ILIKE '%botol%' THEN 'Botol'
            WHEN "original conversation started page title" ILIKE '%banner%' THEN 'Banner'
            WHEN "original conversation started page title" ILIKE '%label%' THEN 'Label'
            WHEN "original conversation started page title" ILIKE '%kardus%' THEN 'Kardus'
            WHEN "original conversation started page title" ILIKE '%makanan%' THEN 'Kemasan Makanan'
            WHEN "original conversation started page title" ILIKE '%standpouch%' THEN 'Standpouch'
            ELSE 'Other'
        END AS category
    FROM data_user_chat
    WHERE "original conversation started page title" IS NOT NULL
), 
recent AS (
    SELECT
        CASE
            WHEN "recent conversation started page title" ILIKE '%id card%' THEN 'ID Card'
            WHEN "recent conversation started page title" ILIKE '%amplop%' THEN 'Amplop'
            WHEN "recent conversation started page title" ILIKE '%box%' THEN 'Box'
            WHEN "recent conversation started page title" ILIKE '%coffe%' THEN 'Coffe Cup'
            WHEN "recent conversation started page title" ILIKE '%botol%' THEN 'Botol'
            WHEN "recent conversation started page title" ILIKE '%banner%' THEN 'Banner'
            WHEN "recent conversation started page title" ILIKE '%label%' THEN 'Label'
            WHEN "recent conversation started page title" ILIKE '%kardus%' THEN 'Kardus'
            WHEN "recent conversation started page title" ILIKE '%makanan%' THEN 'Kemasan Makanan'
            WHEN "recent conversation started page title" ILIKE '%standpouch%' THEN 'Standpouch'
            ELSE 'Other'
        END AS category
    FROM data_user_chat
    WHERE "recent conversation started page title" IS NOT NULL
),
original_summary AS (
    SELECT
        category,
        COUNT(*) AS original_total,
        ROUND(
            COUNT(*)::numeric /
            SUM(COUNT(*)) OVER() * 100
        ,2) AS original_percentage
    FROM original
    GROUP BY category
),

recent_summary AS (
    SELECT
        category,
        COUNT(*) AS recent_total,
        ROUND(
            COUNT(*)::numeric /
            SUM(COUNT(*)) OVER() * 100
        ,2) AS recent_percentage
    FROM recent
    GROUP BY category
)

SELECT
    COALESCE(o.category, r.category) AS category,
    COALESCE(o.original_total,0) AS original_total,
    COALESCE(o.original_percentage,0) AS original_percentage,
    COALESCE(r.recent_total,0) AS recent_total,
    COALESCE(r.recent_percentage,0) AS recent_percentage,
    COALESCE(r.recent_percentage,0) - COALESCE(o.original_percentage,0) AS percentage_change
FROM original_summary o
FULL OUTER JOIN recent_summary r
    ON o.category = r.category
ORDER BY category;

--13. Jumlah pengguna tahun 2022–2023
CREATE OR REPLACE VIEW "jumlah_pengguna_2022/2023" AS
SELECT 
    EXTRACT(YEAR FROM start_date_date) AS tahun,
    COUNT(*) AS total_pengguna
FROM pengguna_clean
WHERE start_date_date BETWEEN '2022-01-01' AND '2023-12-31'
GROUP BY tahun
ORDER BY tahun;

SELECT * FROM "jumlah_pengguna_2022/2023";


--14. Customer dengan email duplikat
CREATE OR REPLACE VIEW email_duplikat AS SELECT 
    email, 
    COUNT(*) AS jumlah
FROM data_user_chat
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY jumlah DESC;

Select*FROM email_duplikat;
