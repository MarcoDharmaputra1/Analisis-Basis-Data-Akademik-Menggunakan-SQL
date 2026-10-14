```sql
-- =====================================================
-- 05_ACADEMIC_PERFORMANCE.SQL
-- Tujuan: Analisis performa akademik
-- =====================================================


-- 5.1 Mengidentifikasi mahasiswa dengan IPK
-- di atas rata-rata seluruh mahasiswa
SELECT
    NPM,
    Nama,
    Angkatan,
    Prodi,
    IPK
FROM mahasiswa
WHERE IPK > (
    SELECT AVG(IPK)
    FROM mahasiswa
    WHERE IPK IS NOT NULL
)
ORDER BY IPK DESC;


-- 5.2 Menghitung rata-rata IPK berdasarkan angkatan
SELECT
    Angkatan,
    COUNT(IPK) AS jumlah_mahasiswa_dengan_ipk,
    AVG(IPK) AS rata_rata_ipk
FROM mahasiswa
GROUP BY Angkatan
ORDER BY Angkatan;


-- 5.3 Memetakan kategori nilai menjadi nilai numerik
-- Skala berikut mengikuti pemetaan pada query awal.
SELECT
    NPM,
    KodeMK,
    Semester,
    Nilai,
    CASE
        WHEN Nilai = 'A'  THEN 4.0
        WHEN Nilai = 'A-' THEN 3.7
        WHEN Nilai = 'B+' THEN 3.3
        WHEN Nilai = 'B'  THEN 3.0
        WHEN Nilai = 'B-' THEN 2.7
        WHEN Nilai = 'C+' THEN 2.3
        WHEN Nilai = 'C'  THEN 2.0
        ELSE NULL
    END AS nilai_numerik
FROM krs;


-- 5.4 Menghitung rata-rata nilai numerik
-- berdasarkan kategori nilai yang tersedia
SELECT
    Nilai,
    CASE
        WHEN Nilai = 'A'  THEN 4.0
        WHEN Nilai = 'A-' THEN 3.7
        WHEN Nilai = 'B+' THEN 3.3
        WHEN Nilai = 'B'  THEN 3.0
        WHEN Nilai = 'B-' THEN 2.7
        WHEN Nilai = 'C+' THEN 2.3
        WHEN Nilai = 'C'  THEN 2.0
        ELSE NULL
    END AS nilai_numerik,
    COUNT(*) AS jumlah_pencatatan
FROM krs
GROUP BY Nilai
ORDER BY nilai_numerik DESC;
```
