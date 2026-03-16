# 🛍️ Nayo Boutique

Aplikasi manajemen produk butik berbasis Flutter yang saya buat untuk membantu pengelolaan data produk agar lebih rapi, praktis, dan mudah diakses.

| Nama Lengkap | NIM | Kelas |
|---|---:|---|
| **Indah Maramin Al Inayah** | **2409116086** | **Sistem Informasi C 2024** |

---

## Deskripsi Aplikasi

Nayo Boutique adalah aplikasi berbasis Flutter yang saya buat untuk mengelola data produk butik secara lebih praktis dan terstruktur. Melalui aplikasi ini, pengguna bisa melakukan registrasi akun, login, menambahkan produk, mengedit produk, menghapus produk, serta mengunggah foto produk.

Setiap produk memiliki beberapa informasi utama, yaitu:

- **Nama produk**
- **Harga**
- **Stok**
- **Foto produk**

Untuk penyimpanan data, aplikasi ini menggunakan Supabase sebagai backend. Data produk disimpan pada database Supabase, sedangkan foto produk disimpan melalui Supabase Storage. Selain itu, fitur autentikasi seperti register, login, logout, dan reset password juga memanfaatkan Supabase Auth.

Dalam proses pengembangannya, saya menggunakan StatefulWidget dan setState() untuk mengatur perubahan tampilan secara langsung ketika data berubah, misalnya saat produk berhasil ditambahkan, diedit, dihapus, atau saat proses login berlangsung.

Aplikasi ini dibuat sebagai bagian dari implementasi materi pada mata kuliah Mobile Application Programming, khususnya pada pembahasan:

- Widget Dasar
- State Management Dasar
- Form Input
- Navigasi Antar Halaman
- Integrasi Backend

Melalui project ini, saya jadi lebih memahami bagaimana cara membangun aplikasi Flutter yang terhubung dengan backend, mengelola state, melakukan autentikasi pengguna, serta menyimpan data dan file berbasis cloud.

---

## Fitur Aplikasi

<details>
<summary><b>1. Halaman Utama</b></summary>
<br>

Halaman utama menampilkan daftar produk yang diambil dari database Supabase. Pada halaman ini, pengguna bisa melihat koleksi produk dalam bentuk grid/card yang berisi foto, nama produk, harga, dan stok.

Selain itu, halaman utama juga dilengkapi dengan:

- banner aplikasi sebagai identitas visual
- tombol Login atau Logout
- tombol toggle dark mode / light mode
- tombol tambah produk
- fitur pull to refresh untuk memuat ulang data produk

<p align="center">
  <img src="manajemen_butik/assets/screenshot/homepage-light.png" alt="Homepage Light" width="420"/><br><br>
  <b>Tampilan Homepage (Light Mode)</b>
</p>

<p align="center">
  <img src="manajemen_butik/assets/screenshot/homepage-dark.png" alt="Homepage Dark" width="420"/><br><br>
  <b>Tampilan Homepage (Dark Mode)</b>
</p>

</details>

<details>
<summary><b>2. Registrasi Akun</b></summary>
<br>

Pengguna dapat membuat akun baru dengan mengisi:

- nama lengkap
- email
- kata sandi
- konfirmasi kata sandi

Pada proses registrasi, aplikasi akan melakukan validasi terlebih dahulu, seperti:

- semua field wajib diisi
- kata sandi dan konfirmasi kata sandi harus sama
- kata sandi minimal 6 karakter

Jika data valid, akun akan didaftarkan menggunakan Supabase Auth.

<p align="center">
  <img src="manajemen_butik/assets/screenshot/register-light.png" alt="Register Light" width="420"/><br><br>
  <b>Tampilan Register (Light Mode)</b>
</p>

<p align="center">
  <img src="manajemen_butik/assets/screenshot/register-dark.png" alt="Register Dark" width="420"/><br><br>
  <b>Tampilan Register (Dark Mode)</b>
</p>

</details>

<details>
<summary><b>3. Login Pengguna</b></summary>
<br>

Halaman login digunakan agar pengguna dapat masuk ke aplikasi menggunakan akun yang sudah terdaftar. Pengguna login dengan **email** dan **kata sandi**.

Fitur yang tersedia pada halaman login:

- validasi input email dan password
- tombol show / hide password
- notifikasi berhasil atau gagal login menggunakan SnackBar

<p align="center">
  <img src="manajemen_butik/assets/screenshot/login-light.png" alt="Login Light" width="420"/><br><br>
  <b>Tampilan Login (Light Mode)</b>
</p>

<p align="center">
  <img src="manajemen_butik/assets/screenshot/login-dark.png" alt="Login Dark" width="420"/><br><br>
  <b>Tampilan Login (Dark Mode)</b>
</p>

</details>

<details>
<summary><b>4. Menambahkan Produk</b></summary>
<br>

Pengguna dapat menambahkan produk baru melalui halaman form dengan mengisi:

- nama produk
- harga
- stok
- foto produk

Setelah data diisi, aplikasi akan melakukan validasi terlebih dahulu. Jika valid, data akan disimpan ke tabel produk pada database Supabase. Jika pengguna memilih foto, maka foto akan diunggah ke Supabase Storage.

<p align="center">
  <img src="manajemen_butik/assets/screenshot/tambahproduk-light.png" alt="Tambah Produk Light" width="420"/><br><br>
  <b>Tampilan Tambah Produk (Light Mode)</b>
</p>

<p align="center">
  <img src="manajemen_butik/assets/screenshot/tambahproduk-dark.png" alt="Tambah Produk Dark" width="420"/><br><br>
  <b>Tampilan Tambah Produk (Dark Mode)</b>
</p>

</details>

<details>
<summary><b>5. Menampilkan Daftar Produk</b></summary>
<br>

Data produk yang berhasil ditambahkan akan ditampilkan pada halaman utama dalam bentuk card/grid. Setiap card menampilkan informasi utama produk, yaitu:

- foto produk
- nama produk
- harga
- stok

Daftar produk ditampilkan secara dinamis dari database Supabase.

<p align="center">
  <img src="manajemen_butik/assets/screenshot/daftarproduk.png" alt="Daftar Produk" width="420"/><br><br>
  <b>Tampilan Daftar Produk</b>
</p>

</details>

<details>
<summary><b>6. Empty State (Produk Kosong)</b></summary>
<br>

Jika belum ada produk yang tersimpan di database, aplikasi akan menampilkan tampilan kosong dengan pesan bahwa produk belum tersedia. Fitur ini membantu pengguna agar tetap mendapatkan feedback visual saat data masih kosong.

<p align="center">
  <img src="manajemen_butik/assets/screenshot/produkkosong.png" alt="Produk Kosong" width="420"/><br><br>
  <b>Tampilan Produk Kosong</b>
</p>

</details>

<details>
<summary><b>7. Mengedit Produk</b></summary>
<br>

Produk yang sudah ditambahkan dapat diedit kembali. Pengguna bisa membuka halaman edit dengan menekan card produk atau tombol edit yang tersedia. Pada halaman ini, data lama akan ditampilkan kembali ke dalam form sehingga pengguna tinggal memperbarui data yang ingin diubah. Setelah disimpan, data akan diperbarui kembali pada database.

<p align="center">
  <img src="manajemen_butik/assets/screenshot/editproduk-light.png" alt="Edit Produk Light" width="420"/><br><br>
  <b>Tampilan Edit Produk (Light Mode)</b>
</p>

<p align="center">
  <img src="manajemen_butik/assets/screenshot/editproduk-dark.png" alt="Edit Produk Dark" width="420"/><br><br>
  <b>Tampilan Edit Produk (Dark Mode)</b>
</p>

</details>

<details>
<summary><b>8. Menghapus Produk</b></summary>
<br>

Pengguna dapat menghapus produk melalui tombol hapus yang tersedia pada setiap item produk. Sebelum data dihapus, aplikasi akan menampilkan dialog konfirmasi terlebih dahulu agar pengguna tidak salah menghapus data.

<p align="center">
  <img src="manajemen_butik/assets/screenshot/konfirmasihapus.light.png" alt="Konfirmasi Hapus Light" width="420"/><br><br>
  <b>Tampilan Konfirmasi Hapus (Light Mode)</b>
</p>

<p align="center">
  <img src="manajemen_butik/assets/screenshot/konfirmasihapus-dark.png" alt="Konfirmasi Hapus Dark" width="420"/><br><br>
  <b>Tampilan Konfirmasi Hapus (Dark Mode)</b>
</p>

</details>

<details>
<summary><b>9. Upload dan Preview Foto Produk</b></summary>
<br>

Aplikasi mendukung fitur upload foto produk menggunakan **image_picker**. Setelah gambar dipilih, aplikasi akan langsung menampilkan preview gambar sebelum produk disimpan.

Pada fitur ini, pengguna juga bisa:

- memilih foto dari galeri
- melihat preview foto sebelum upload
- mengganti foto yang sudah dipilih
- menghapus foto yang dipilih
- melihat foto lama saat sedang mengedit produk

Foto yang berhasil diunggah akan disimpan pada bucket **produk-images** di **Supabase Storage**.

<p align="center">
  <img src="manajemen_butik/assets/screenshot/uploadfoto.png" alt="Upload Foto" width="420"/><br><br>
  <b>Tampilan Upload Foto</b>
</p>

<p align="center">
  <img src="manajemen_butik/assets/screenshot/supabase-storage.png" alt="Supabase Storage" width="420"/><br><br>
  <b>Tampilan Supabase Storage</b>
</p>

</details>

<details>
<summary><b>10. Notifikasi Aksi (SnackBar)</b></summary>
<br>

Aplikasi menampilkan notifikasi menggunakan SnackBar sebagai feedback kepada pengguna setelah melakukan suatu aksi. Misalnya:

- login berhasil
- logout berhasil
- produk berhasil ditambahkan
- produk berhasil diperbarui
- produk berhasil dihapus
- terjadi error saat proses tertentu

<p align="center">
  <img src="manajemen_butik/assets/screenshot/notifikasiberhasillogin.png" alt="Notifikasi Login Berhasil" width="420"/><br><br>
  <b>Notifikasi Login Berhasil</b>
</p>

<p align="center">
  <img src="manajemen_butik/assets/screenshot/notifikasiberhasillogout.png" alt="Notifikasi Logout Berhasil" width="420"/><br><br>
  <b>Notifikasi Logout Berhasil</b>
</p>

<p align="center">
  <img src="manajemen_butik/assets/screenshot/notifikasiprodukditambahkan.png" alt="Notifikasi Produk Ditambahkan" width="420"/><br><br>
  <b>Notifikasi Produk Ditambahkan</b>
</p>

<p align="center">
  <img src="manajemen_butik/assets/screenshot/notifikasiprodukdiperbarui.png" alt="Notifikasi Produk Diperbarui" width="420"/><br><br>
  <b>Notifikasi Produk Diperbarui</b>
</p>

<p align="center">
  <img src="manajemen_butik/assets/screenshot/notifikasiprodukdihapus.png" alt="Notifikasi Produk Dihapus" width="420"/><br><br>
  <b>Notifikasi Produk Dihapus</b>
</p>

</details>

<details>
<summary><b>11. Loading Indicator</b></summary>
<br>

Aplikasi juga menampilkan loading indicator saat proses tertentu sedang berjalan, seperti saat mengambil data produk, login, registrasi, maupun menyimpan data produk. Hal ini membantu pengguna mengetahui bahwa sistem sedang memproses permintaan.

<p align="center">
  <img src="manajemen_butik/assets/screenshot/loading.png" alt="Loading" width="420"/><br><br>
  <b>Tampilan Loading</b>
</p>

</details>

<details>
<summary><b>12. Logout</b></summary>
<br>

Ketika pengguna sudah login, tombol Login pada AppBar akan berubah menjadi Logout. Saat tombol tersebut ditekan, aplikasi akan menampilkan dialog konfirmasi sebelum pengguna benar-benar keluar dari akun.

<p align="center">
  <img src="manajemen_butik/assets/screenshot/konfirmasilogout.png" alt="Konfirmasi Logout" width="420"/><br><br>
  <b>Tampilan Konfirmasi Logout</b>
</p>

</details>

<details>
<summary><b>13. Database Produk di Supabase</b></summary>
<br>

Semua data produk disimpan pada tabel **produk** di Supabase. Data yang disimpan meliputi nama produk, harga, stok, dan URL foto produk.

<p align="center">
  <img src="manajemen_butik/assets/screenshot/supabase-table.png" alt="Supabase Table" width="420"/><br><br>
  <b>Tampilan Tabel Produk di Supabase</b>
</p>

</details>

---

## Teknologi yang Digunakan

Aplikasi **Nayo Boutique** dibangun menggunakan beberapa teknologi dan package berikut:

- **Flutter**: framework utama untuk membangun aplikasi
- **Dart**: bahasa pemrograman yang digunakan
- **Supabase**: backend untuk database, authentication, dan storage
- **flutter_dotenv**: menyimpan konfigurasi environment seperti URL dan Anon Key Supabase
- **image_picker**: memilih gambar dari galeri
- **StatefulWidget & setState()**: mengatur state secara sederhana pada aplikasi

---

## Struktur Halaman dan File Utama

Berikut beberapa file utama yang digunakan dalam project ini:

- `main.dart`  
  Sebagai entry point aplikasi, inisialisasi `flutter_dotenv`, inisialisasi Supabase, serta pengaturan tema aplikasi.

- `models/product_model.dart`  
  Berisi model data produk yang digunakan untuk parsing data dari dan ke format JSON.

- `pages/home_page.dart`  
  Halaman utama aplikasi yang menampilkan daftar produk, toggle theme, login/logout, banner, dan navigasi ke form produk.

- `pages/form_page.dart`  
  Halaman form untuk menambahkan dan mengedit produk, termasuk upload dan preview gambar.

- `pages/login_page.dart`  
  Halaman login pengguna menggunakan Supabase Auth.

- `pages/register_page.dart`  
  Halaman registrasi akun baru menggunakan Supabase Auth.

---

## Widget yang Digunakan

Berikut adalah beberapa widget yang digunakan dalam pengembangan aplikasi **Nayo Boutique** beserta fungsinya:

- **`MaterialApp`**  
  Digunakan sebagai root aplikasi untuk mengatur tema, title, dan struktur utama aplikasi.

- **`Scaffold`**  
  Digunakan sebagai kerangka dasar setiap halaman, seperti AppBar, body, dan FloatingActionButton.

- **`AppBar`**  
  Digunakan untuk menampilkan judul aplikasi, tombol login/logout, navigasi, dan toggle tema.

- **`Column`** dan **`Row`**  
  Digunakan untuk menyusun widget secara vertikal dan horizontal.

- **`Container`**  
  Digunakan untuk mengatur ukuran, warna, padding, margin, dan dekorasi pada komponen.

- **`SingleChildScrollView`**  
  Digunakan agar halaman dapat di-scroll, terutama pada form dan halaman autentikasi.

- **`GridView.builder`**  
  Digunakan untuk menampilkan daftar produk secara dinamis dalam bentuk grid.

- **`Text`**  
  Digunakan untuk menampilkan teks seperti judul, nama produk, harga, stok, dan pesan informasi lainnya.

- **`TextField`**  
  Digunakan untuk menerima input pengguna pada halaman login, register, dan form produk.

- **`ElevatedButton`**  
  Digunakan untuk tombol aksi utama seperti login, daftar, simpan, dan hapus.

- **`TextButton`**  
  Digunakan untuk aksi tambahan seperti batal atau login/logout.

- **`FloatingActionButton`**  
  Digunakan untuk menambahkan produk baru.

- **`GestureDetector`**  
  Digunakan untuk menangani interaksi seperti membuka form edit, memilih gambar, mengganti gambar, dan menghapus gambar.

- **`AlertDialog`**  
  Digunakan untuk menampilkan dialog konfirmasi, seperti saat logout dan hapus produk.

- **`SnackBar`**  
  Digunakan untuk menampilkan notifikasi atau feedback kepada pengguna.

- **`RefreshIndicator`**  
  Digunakan untuk memuat ulang data produk dengan fitur pull to refresh.

- **`CircularProgressIndicator`**  
  Digunakan untuk menampilkan indikator loading saat proses berlangsung.

- **`Image.asset`**  
  Digunakan untuk menampilkan gambar banner dari asset lokal.

- **`Image.network`**  
  Digunakan untuk menampilkan gambar produk dari URL Supabase Storage.

- **`Image.memory`** dan **`Image.file`**  
  Digunakan untuk menampilkan preview gambar yang dipilih sebelum diunggah.

- **`StatefulWidget`** dan **`setState()`**  
  Digunakan untuk mengelola perubahan tampilan secara langsung ketika data berubah.
