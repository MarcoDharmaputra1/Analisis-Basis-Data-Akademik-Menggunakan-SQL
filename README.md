
# Analisis Basis Data Akademik Menggunakan SQL

## 1. Deskripsi Proyek

Proyek ini merupakan bagian dari tugas mata kuliah Rekayasa Data yang berfokus pada pengolahan dan analisis basis data akademik menggunakan SQL. Basis data yang digunakan terdiri atas empat tabel utama, yaitu `mahasiswa`, `dosen`, `mata_kuliah`, dan `krs`. Melalui proyek ini, SQL digunakan untuk memeriksa kualitas data, menghasilkan statistik deskriptif, mengidentifikasi hubungan antartabel, serta menganalisis informasi terkait mahasiswa, mata kuliah, registrasi akademik, dan nilai.

## 2. Tujuan Proyek
- Memeriksa kualitas data dengan mengidentifikasi nilai kosong dan kemungkinan duplikasi data.
- Menghasilkan statistik deskriptif dan distribusi frekuensi dari atribut akademik.
- Menggabungkan beberapa tabel untuk memperoleh informasi yang saling berkaitan.
- Menganalisis pola pengambilan mata kuliah oleh mahasiswa.
- Mengidentifikasi kondisi akademik tertentu berdasarkan IPK, program studi, jumlah mata kuliah, dan nilai.

## 3. Ruang Lingkup Analisis

### 3.1 Pemeriksaan Kualitas Data
Melakukan pemeriksaan terhadap nilai kosong (*missing values*) pada tabel mahasiswa, dosen, mata kuliah, dan KRS. Selain itu, dilakukan identifikasi terhadap kemungkinan duplikasi pencatatan KRS berdasarkan NPM, kode mata kuliah, dan semester.

### 3.2 Statistik Deskriptif
Menghitung rata-rata, nilai maksimum, nilai minimum, dan standar deviasi IPK mahasiswa. Analisis juga mencakup distribusi frekuensi berdasarkan program studi, angkatan, jumlah SKS, semester, dan kategori nilai.

### 3.3 Analisis Relasi Antartabel
Menggunakan operasi `JOIN` untuk menghubungkan data mahasiswa, KRS, dan mata kuliah. Penggabungan ini digunakan untuk memperoleh informasi lintas tabel dan mengidentifikasi mahasiswa yang mengambil mata kuliah dari program studi yang berbeda.

### 3.4 Analisis Registrasi Mata Kuliah
Menghitung jumlah mata kuliah yang diambil setiap mahasiswa serta mengidentifikasi mata kuliah berdasarkan jumlah mahasiswa yang terdaftar. Analisis ini membantu menggambarkan pola registrasi mata kuliah dalam basis data.

### 3.5 Analisis Performa Akademik
Mengidentifikasi mahasiswa dengan IPK di atas rata-rata keseluruhan, menghitung rata-rata IPK berdasarkan angkatan, serta mengeksplorasi hubungan antara jumlah SKS dan nilai numerik yang diperoleh dari pemetaan kategori nilai.

## 4. Struktur Basis Data
Proyek ini menggunakan empat tabel utama:
| Tabel | Deskripsi |
|---|---|
| `mahasiswa` | Menyimpan NPM, nama, angkatan, program studi, dan IPK mahasiswa. |
| `dosen` | Menyimpan identitas dosen dan program studi. |
| `mata_kuliah` | Menyimpan kode mata kuliah, nama mata kuliah, SKS, dan program studi. |
| `krs` | Menyimpan data registrasi mata kuliah mahasiswa, semester, dan nilai. |

Relasi antartabel dibangun menggunakan atribut NPM sebagai penghubung data mahasiswa dengan KRS serta KodeMK sebagai penghubung KRS dengan mata kuliah.

## 5. Teknik SQL yang Digunakan
- **Penyaringan data:** `SELECT`, `WHERE`, dan kondisi logis.
- **Fungsi agregasi:** `COUNT`, `AVG`, `MIN`, `MAX`, dan `STDDEV`.
- **Pengelompokan data:** `GROUP BY` dan `HAVING`.
- **Penggabungan tabel:** `JOIN` dan `LEFT JOIN`.
- **Subquery:** pengambilan data berdasarkan hasil query lainnya.
- **Ekspresi kondisional:** `CASE`.
- **Pemeriksaan kualitas data:** identifikasi nilai kosong dan kemungkinan duplikasi.

## 6. Teknologi
- MySQL
- SQL
- MySQL Workbench, jika digunakan dalam pengerjaan proyek.

## 7. Hasil Pembelajaran
Proyek ini mengembangkan pemahaman mengenai pengelolaan basis data relasional, pemeriksaan kualitas data, penggunaan fungsi agregasi, penggabungan tabel, dan analisis informasi akademik menggunakan SQL.

Selain itu, proyek ini melatih kemampuan menyusun query untuk menjawab pertanyaan berbasis data secara sistematis.

## 8. Catatan Proyek
Proyek ini merupakan tugas akademik dalam mata kuliah Rekayasa Data. Repository ini mendokumentasikan query SQL dan teknik analisis yang digunakan selama pengerjaan tugas.
