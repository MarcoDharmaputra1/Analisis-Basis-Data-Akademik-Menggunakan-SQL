```sql
-- =====================================================
-- 04_ENROLLMENT_ANALYSIS.SQL
-- Tujuan: Menganalisis registrasi mata kuliah mahasiswa
-- =====================================================


-- 4.1 Menghitung jumlah mata kuliah yang diambil
-- oleh setiap mahasiswa
SELECT
    m.NPM,
    m.Nama,
    COUNT(k.KodeMK) AS jumlah_mata_kuliah
FROM mahasiswa AS m
LEFT JOIN krs AS k
    ON m.NPM = k.NPM
GROUP BY
    m.NPM,
    m.Nama
ORDER BY jumlah_mata_kuliah DESC;


-- 4.2 Mengidentifikasi mata kuliah dengan
-- minimal tiga pencatatan KRS
SELECT
    mk.KodeMK,
    mk.NamaMK,
    COUNT(k.NPM) AS jumlah_pencatatan
FROM mata_kuliah AS mk
INNER JOIN krs AS k
    ON mk.KodeMK = k.KodeMK
GROUP BY
    mk.KodeMK,
    mk.NamaMK
HAVING COUNT(k.NPM) >= 3
ORDER BY jumlah_pencatatan DESC;


-- 4.3 Mengidentifikasi mahasiswa yang mengambil
-- mata kuliah dengan jumlah SKS maksimum
SELECT DISTINCT
    m.NPM,
    m.Nama,
    mk.KodeMK,
    mk.NamaMK,
    mk.SKS
FROM mahasiswa AS m
INNER JOIN krs AS k
    ON m.NPM = k.NPM
INNER JOIN mata_kuliah AS mk
    ON k.KodeMK = mk.KodeMK
WHERE mk.SKS = (
    SELECT MAX(SKS)
    FROM mata_kuliah
)
ORDER BY m.NPM;


-- 4.4 Mengidentifikasi mahasiswa yang belum
-- mengambil mata kuliah IF101
SELECT
    m.NPM,
    m.Nama
FROM mahasiswa AS m
WHERE NOT EXISTS (
    SELECT 1
    FROM krs AS k
    WHERE k.NPM = m.NPM
      AND k.KodeMK = 'IF101'
)
ORDER BY m.NPM;


-- 4.5 Mengidentifikasi mahasiswa yang mengambil
-- mata kuliah dengan jumlah SKS minimum dan maksimum
-- yang sama-sama bernilai 3
SELECT
    m.NPM,
    m.Nama,
    MIN(mk.SKS) AS sks_minimum,
    MAX(mk.SKS) AS sks_maksimum
FROM mahasiswa AS m
INNER JOIN krs AS k
    ON m.NPM = k.NPM
INNER JOIN mata_kuliah AS mk
    ON k.KodeMK = mk.KodeMK
GROUP BY
    m.NPM,
    m.Nama
HAVING MIN(mk.SKS) = 3
   AND MAX(mk.SKS) = 3;


-- 4.6 Mengidentifikasi mahasiswa yang memiliki
-- tepat satu atau dua pencatatan KRS
SELECT
    m.NPM,
    m.Nama,
    COUNT(k.KodeMK) AS jumlah_pencatatan_krs
FROM mahasiswa AS m
INNER JOIN krs AS k
    ON m.NPM = k.NPM
GROUP BY
    m.NPM,
    m.Nama
HAVING COUNT(k.KodeMK) IN (1, 2)
ORDER BY jumlah_pencatatan_krs, m.NPM;
```
