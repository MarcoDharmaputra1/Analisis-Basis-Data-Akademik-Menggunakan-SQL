```sql
-- =====================================================
-- 01_DATA_QUALITY_CHECKS.SQL
-- Tujuan: Memeriksa kualitas data akademik
-- Database: Rekayasa Data
-- =====================================================

-- Sesuaikan nama database dengan database yang digunakan.
-- USE nama_database;


-- 1.1 Memeriksa nilai kosong pada tabel mahasiswa
SELECT
    COUNT(*) AS total_data,
    SUM(NPM IS NULL) AS npm_kosong,
    SUM(Nama IS NULL) AS nama_kosong,
    SUM(Angkatan IS NULL) AS angkatan_kosong,
    SUM(Prodi IS NULL) AS prodi_kosong,
    SUM(IPK IS NULL) AS ipk_kosong
FROM mahasiswa;


-- 1.2 Memeriksa nilai kosong pada tabel dosen
SELECT
    COUNT(*) AS total_data,
    SUM(NIDN IS NULL) AS nidn_kosong,
    SUM(Nama IS NULL) AS nama_kosong,
    SUM(Prodi IS NULL) AS prodi_kosong
FROM dosen;


-- 1.3 Memeriksa nilai kosong pada tabel mata_kuliah
SELECT
    COUNT(*) AS total_data,
    SUM(KodeMK IS NULL) AS kodemk_kosong,
    SUM(NamaMK IS NULL) AS namamk_kosong,
    SUM(SKS IS NULL) AS sks_kosong,
    SUM(Prodi IS NULL) AS prodi_kosong
FROM mata_kuliah;


-- 1.4 Memeriksa nilai kosong pada tabel KRS
SELECT
    COUNT(*) AS total_data,
    SUM(NPM IS NULL) AS npm_kosong,
    SUM(KodeMK IS NULL) AS kodemk_kosong,
    SUM(Semester IS NULL) AS semester_kosong,
    SUM(Nilai IS NULL) AS nilai_kosong
FROM krs;


-- 1.5 Mengidentifikasi kemungkinan duplikasi data KRS
-- Kombinasi NPM, KodeMK, dan Semester diasumsikan
-- sebagai kandidat identitas pencatatan KRS.

SELECT
    NPM,
    KodeMK,
    Semester,
    COUNT(*) AS jumlah_pencatatan
FROM krs
GROUP BY
    NPM,
    KodeMK,
    Semester
HAVING COUNT(*) > 1
ORDER BY jumlah_pencatatan DESC;
```
