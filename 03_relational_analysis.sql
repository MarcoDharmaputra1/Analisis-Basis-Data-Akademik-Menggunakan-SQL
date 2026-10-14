```sql
-- =====================================================
-- 03_RELATIONAL_ANALYSIS.SQL
-- Tujuan: Analisis hubungan antartabel akademik
-- =====================================================


-- 3.1 Menggabungkan data mahasiswa, KRS, dan mata kuliah
SELECT
    m.NPM,
    m.Nama AS nama_mahasiswa,
    m.Prodi AS prodi_mahasiswa,
    k.Semester,
    mk.KodeMK,
    mk.NamaMK AS nama_mata_kuliah,
    mk.Prodi AS prodi_mata_kuliah,
    mk.SKS,
    k.Nilai
FROM mahasiswa AS m
INNER JOIN krs AS k
    ON m.NPM = k.NPM
INNER JOIN mata_kuliah AS mk
    ON k.KodeMK = mk.KodeMK
ORDER BY
    m.NPM,
    k.Semester,
    mk.KodeMK;


-- 3.2 Mengidentifikasi mahasiswa yang mengambil
-- mata kuliah dari program studi berbeda
SELECT DISTINCT
    m.NPM,
    m.Nama,
    m.Prodi AS prodi_mahasiswa,
    mk.KodeMK,
    mk.NamaMK,
    mk.Prodi AS prodi_mata_kuliah
FROM mahasiswa AS m
INNER JOIN krs AS k
    ON m.NPM = k.NPM
INNER JOIN mata_kuliah AS mk
    ON k.KodeMK = mk.KodeMK
WHERE m.Prodi <> mk.Prodi
ORDER BY
    m.NPM,
    mk.KodeMK;


-- 3.3 Menghitung jumlah mahasiswa yang pernah
-- mengambil mata kuliah lintas program studi
SELECT
    COUNT(DISTINCT m.NPM) AS jumlah_mahasiswa_lintas_prodi
FROM mahasiswa AS m
INNER JOIN krs AS k
    ON m.NPM = k.NPM
INNER JOIN mata_kuliah AS mk
    ON k.KodeMK = mk.KodeMK
WHERE m.Prodi <> mk.Prodi;


-- 3.4 Menghitung proporsi mahasiswa yang pernah
-- mengambil mata kuliah lintas program studi
SELECT
    COUNT(DISTINCT CASE
        WHEN m.Prodi <> mk.Prodi THEN m.NPM
    END) AS mahasiswa_lintas_prodi,
    (SELECT COUNT(DISTINCT NPM)
     FROM mahasiswa) AS total_mahasiswa,
    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN m.Prodi <> mk.Prodi THEN m.NPM
        END)
        / NULLIF(
            (SELECT COUNT(DISTINCT NPM)
             FROM mahasiswa),
            0
        ),
        2
    ) AS persentase_mahasiswa_lintas_prodi
FROM mahasiswa AS m
LEFT JOIN krs AS k
    ON m.NPM = k.NPM
LEFT JOIN mata_kuliah AS mk
    ON k.KodeMK = mk.KodeMK;
```
