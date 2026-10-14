```sql
-- =====================================================
-- 02_DESCRIPTIVE_STATISTICS.SQL
-- Tujuan: Statistik deskriptif dan distribusi frekuensi
-- =====================================================


-- 2.1 Statistik deskriptif IPK mahasiswa
SELECT
    COUNT(IPK) AS jumlah_mahasiswa_dengan_ipk,
    AVG(IPK) AS rata_rata_ipk,
    MIN(IPK) AS ipk_minimum,
    MAX(IPK) AS ipk_maksimum,
    STDDEV_SAMP(IPK) AS standar_deviasi_ipk
FROM mahasiswa;


-- 2.2 Distribusi mahasiswa berdasarkan program studi
SELECT
    Prodi,
    COUNT(*) AS jumlah_mahasiswa
FROM mahasiswa
GROUP BY Prodi
ORDER BY jumlah_mahasiswa DESC;


-- 2.3 Distribusi mahasiswa berdasarkan angkatan
SELECT
    Angkatan,
    COUNT(*) AS jumlah_mahasiswa
FROM mahasiswa
GROUP BY Angkatan
ORDER BY Angkatan;


-- 2.4 Distribusi dosen berdasarkan program studi
SELECT
    Prodi,
    COUNT(*) AS jumlah_dosen
FROM dosen
GROUP BY Prodi
ORDER BY jumlah_dosen DESC;


-- 2.5 Distribusi mata kuliah berdasarkan program studi
SELECT
    Prodi,
    COUNT(*) AS jumlah_mata_kuliah
FROM mata_kuliah
GROUP BY Prodi
ORDER BY jumlah_mata_kuliah DESC;


-- 2.6 Distribusi mata kuliah berdasarkan jumlah SKS
SELECT
    SKS,
    COUNT(*) AS jumlah_mata_kuliah
FROM mata_kuliah
GROUP BY SKS
ORDER BY SKS;


-- 2.7 Distribusi pencatatan KRS berdasarkan semester
SELECT
    Semester,
    COUNT(*) AS jumlah_pencatatan_krs
FROM krs
GROUP BY Semester
ORDER BY Semester;


-- 2.8 Distribusi nilai pada tabel KRS
SELECT
    Nilai,
    COUNT(*) AS jumlah_pencatatan
FROM krs
GROUP BY Nilai
ORDER BY jumlah_pencatatan DESC;


-- 2.9 Frekuensi pengambilan setiap mata kuliah
SELECT
    mk.KodeMK,
    mk.NamaMK,
    COUNT(k.NPM) AS jumlah_mahasiswa_terdaftar
FROM mata_kuliah AS mk
LEFT JOIN krs AS k
    ON mk.KodeMK = k.KodeMK
GROUP BY
    mk.KodeMK,
    mk.NamaMK
ORDER BY jumlah_mahasiswa_terdaftar DESC;
```
