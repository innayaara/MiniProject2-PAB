# 🛍️ Nayo Boutique
Aplikasi manajemen produk butik berbasis Flutter.

| ✨ Nama Lengkap              | 🆔 NIM        | 📚 Kelas                 |
|------------------------------|---------------|--------------------------|
| **Indah Maramin Al Inayah**  | 2409116086    | Sistem Informasi C 2024  |

---

## Deskripsi Aplikasi

Aplikasi Nayo Boutique merupakan aplikasi berbasis Flutter yang dibuat untuk mengelola data produk butik. Aplikasi ini memungkinkan pengguna untuk melakukan registrasi akun, login, menambahkan, mengedit, dan menghapus data produk secara dinamis.

Setiap produk memiliki informasi berupa nama produk, harga, stok, dan foto produk. Data produk disimpan pada database menggunakan Supabase, sedangkan gambar produk disimpan pada Supabase Storage. Aplikasi ini juga menggunakan konsep State Management dengan StatefulWidget dan setState() untuk memperbarui tampilan secara real-time setelah terjadi perubahan data.

Aplikasi ini dibuat sebagai implementasi dari materi Widget Dasar, State Management Dasar, Form Input, Navigasi Antar Halaman, dan Integrasi Backend pada mata kuliah Mobile Application Programming, dengan tujuan memahami cara kerja perubahan state, autentikasi pengguna, serta pengelolaan data berbasis cloud.

---

## Fitur Aplikasi

<details>
<summary><b>1. Halaman Utama</b></summary>
<br>

<div align="center">
  <img width="865" alt="Halaman Utama" src="manajemen_butik/assets/screenshoot/homepage.png" />
  
  <p align="center">
  <b><em>Halaman Utama</em></b><br>
  Halaman utama menampilkan daftar produk yang diambil dari database Supabase. 
  Jika belum ada produk yang tersedia, maka akan muncul pesan 
  <b>"Belum ada produk 🛍️"</b> sebagai indikator bahwa data masih kosong.
  <br><br>
  Pada halaman ini juga terdapat beberapa komponen utama, yaitu:
  <br>
  - Banner aplikasi sebagai identitas visual<br>
  - Judul aplikasi di bagian atas halaman<br>
  - Tombol Login pada AppBar<br>
  - FloatingActionButton (+) untuk menambahkan produk baru<br>
  - Grid daftar produk yang menampilkan foto, nama, harga, dan stok<br>
  </p>

</div>
<br>
</details>

<details>
<summary><b>2. Registrasi Akun</b></summary>
<br>

<div align="center">
  <img width="420" alt="Registrasi Akun" src="assets/screenshoot/register.png" />
  
  <p align="center">
  <b><em>Registrasi Akun</em></b><br>
  Pengguna dapat membuat akun baru dengan mengisi nama lengkap, email, kata sandi, dan konfirmasi kata sandi.
  <br><br>
  Pada proses registrasi, aplikasi akan melakukan validasi:
  <br>
  - Semua field wajib diisi<br>
  - Kata sandi dan konfirmasi kata sandi harus sama<br>
  - Kata sandi minimal 6 karakter<br>
  <br>
  Jika berhasil, akun akan didaftarkan ke Supabase Auth dan pengguna akan diarahkan ke halaman login.
  </p>
</div>
<br>
</details>

<details>
<summary><b>3. Login Pengguna</b></summary>
<br>

<div align="center">
  <img width="420" alt="Login Pengguna" src="assets/screenshoot/login.png" />
  
  <p align="center">
  <b><em>Login Pengguna</em></b><br>
  Pengguna dapat masuk ke aplikasi menggunakan email dan kata sandi yang telah terdaftar.
  <br><br>
  Halaman login dilengkapi dengan beberapa fitur, yaitu:
  <br>
  - Validasi input email dan kata sandi<br>
  - Tombol show/hide password<br>
  - Fitur <b>Lupa Kata Sandi</b><br>
  - Notifikasi login berhasil atau gagal menggunakan SnackBar<br>
  </p>
</div>
<br>
</details>

<details>
<summary><b>4. Menambahkan Produk Baru</b></summary>
<br>

<div align="center">
  <img width="866" alt="Menambahkan Produk Baru" src="assets/screenshoot/formtambahproduk.png" />
  
  <p align="center">
  <b><em>Menambahkan Produk Baru</em></b><br>
  Pengguna dapat menambahkan produk baru dengan mengisi nama produk, harga, stok, dan memilih foto produk melalui halaman form.
  <br><br>
  Data yang dimasukkan akan divalidasi terlebih dahulu, kemudian disimpan ke tabel 
  <b>produk</b> pada database Supabase. Jika pengguna memilih gambar, maka gambar akan diunggah ke 
  <b>Supabase Storage</b>.
  </p>

</div>
<br>
</details>

<details>
<summary><b>5. Menampilkan Daftar Produk</b></summary>
<br>

<div align="center">
  <img width="942" alt="Menampilkan Daftar Produk" src="assets/screenshoot/daftarproduk.png" />

  <p align="center">
  <b><em>Menampilkan Daftar Produk</em></b><br>
  Aplikasi menampilkan daftar produk dalam bentuk card/grid. 
  Setiap card berisi informasi foto produk, nama produk, harga, dan stok yang tersedia.
  Data akan ditampilkan secara dinamis setelah berhasil diambil dari database.
  </p>

</div>
<br>
</details>

<details>
<summary><b>6. Empty State (Belum Ada Produk)</b></summary>
<br>

<div align="center">
  <img width="865" alt="Produk Kosong" src="assets/screenshoot/produkkosong.png" />
  
  <p align="center">
  <b><em>Empty State</em></b><br>
  Jika belum ada produk yang tersimpan pada database, aplikasi akan menampilkan pesan 
  <b>"Belum ada produk 🛍️"</b> sebagai indikator bahwa daftar produk masih kosong.
  </p>

</div>
<br>
</details>

<details>
<summary><b>7. Mengedit Produk</b></summary>
<br>

<div align="center">
  <img width="866" alt="Edit Produk" src="assets/screenshoot/editproduk.png" />

  <p align="center">
  <b><em>Mengedit Produk</em></b><br>
  Pengguna dapat mengubah data produk yang telah ditambahkan melalui tombol edit atau dengan menekan card produk.
  Setelah perubahan disimpan, data pada halaman utama akan langsung diperbarui kembali dari database.
  </p>

</div>
<br>
</details>

<details>
<summary><b>8. Menghapus Produk dengan Konfirmasi</b></summary>
<br>

<div align="center">
  <img width="866" alt="Konfirmasi Hapus" src="assets/screenshoot/konfirmasihapus.png" />

  <p align="center">
  <b><em>Menghapus Produk</em></b><br>
  Pengguna dapat menghapus produk melalui tombol hapus. 
  Sebelum data dihapus secara permanen, akan muncul dialog konfirmasi 
  untuk memastikan tindakan pengguna.
  </p>

</div>
<br>
</details>

<details>
<summary><b>9. Upload dan Preview Foto Produk</b></summary>
<br>

<div align="center">
  <img width="866" alt="Upload Foto Produk" src="assets/screenshoot/uploadfoto.png" />
  
  <p align="center">
  <b><em>Upload dan Preview Foto Produk</em></b><br>
  Aplikasi mendukung pemilihan gambar produk dari galeri menggunakan <b>image_picker</b>.
  <br><br>
  Setelah gambar dipilih, aplikasi akan menampilkan preview gambar sebelum data disimpan.
  Pengguna juga dapat:
  <br>
  - Mengganti gambar yang dipilih<br>
  - Menghapus gambar yang dipilih<br>
  - Menampilkan foto lama saat proses edit produk<br>
  <br>
  Foto produk yang berhasil diunggah akan disimpan di bucket <b>produk-images</b> pada Supabase Storage.
  </p>
</div>
<br>
</details>

<details>
<summary><b>10. Notifikasi Aksi (SnackBar)</b></summary>
<br>

<div align="center">
  <img width="866" alt="Loading atau Notifikasi" src="assets/screenshoot/loading.png" />

  <p align="center">
  <b><em>Notifikasi Aksi</em></b><br>
  Aplikasi menampilkan notifikasi (SnackBar) setelah berhasil melakukan aksi seperti login, registrasi, menambahkan produk, mengedit produk, menghapus produk, maupun saat terjadi kesalahan sebagai bentuk feedback kepada pengguna.
  </p>

</div>
<br>
</details>

---

## 3. Widget yang Digunakan  

Berikut adalah widget yang digunakan dalam pengembangan aplikasi **Nayo Boutique** beserta fungsinya:

- **`MaterialApp`**: Digunakan sebagai root aplikasi yang menerapkan desain Material Design serta mengatur tema dan struktur dasar aplikasi.

- **`Scaffold`**: Berfungsi sebagai kerangka utama halaman yang terdiri dari AppBar, Body, dan FloatingActionButton.

- **`AppBar`**: Digunakan untuk menampilkan judul aplikasi, tombol login, dan navigasi pada bagian atas layar.

- **`Column & Row`**:  
  Column digunakan untuk menyusun widget secara vertikal, sedangkan Row digunakan untuk menyusun widget secara horizontal.

- **`Container`**: Digunakan untuk mengatur ukuran, margin, padding, serta dekorasi pada tampilan.

- **`SingleChildScrollView`**: Digunakan agar halaman dapat digulir, terutama pada form dan halaman autentikasi.

- **`GridView.builder`**: Digunakan untuk menampilkan daftar produk secara dinamis dalam bentuk grid berdasarkan data yang tersedia.

- **`Card / Container`**: Digunakan untuk menampilkan informasi produk dalam tampilan yang lebih terstruktur dan menarik.

- **`Text`**: Digunakan untuk menampilkan teks seperti nama produk, harga, stok, judul halaman, dan pesan lainnya.

- **`TextField`**: Digunakan pada halaman login, register, dan form produk untuk menerima input dari pengguna.

- **`ElevatedButton`**: Digunakan sebagai tombol aksi seperti tombol Login, Daftar, Simpan, dan Hapus.

- **`TextButton`**: Digunakan untuk aksi tambahan seperti navigasi Login pada AppBar dan tombol batal pada dialog.

- **`FloatingActionButton`**: Digunakan untuk menambahkan produk baru.

- **`GestureDetector`**: Digunakan untuk menangani interaksi seperti membuka form edit, memilih gambar, mengganti gambar, dan menghapus gambar.

- **`AlertDialog`**: Digunakan untuk menampilkan konfirmasi sebelum menghapus produk.

- **`SnackBar`**: Digunakan untuk menampilkan notifikasi setelah berhasil melakukan aksi atau ketika terjadi kesalahan.

- **`RefreshIndicator`**: Digunakan untuk memuat ulang data produk dengan cara pull to refresh.

- **`CircularProgressIndicator`**: Digunakan untuk menampilkan indikator loading saat proses login, registrasi, mengambil data, menyimpan produk, dan upload gambar.

- **`Image.asset`**: Digunakan untuk menampilkan banner gambar pada halaman utama aplikasi.

- **`Image.network`**: Digunakan untuk menampilkan foto produk yang diambil dari URL Supabase Storage.

- **`Image.memory`** dan **`Image.file`**: Digunakan untuk menampilkan preview gambar yang dipilih pengguna sebelum diunggah.

- **`State Management (StatefulWidget & setState())`**: Digunakan untuk mengelola perubahan data produk, status loading, autentikasi, dan preview gambar sehingga tampilan akan otomatis diperbarui ketika terjadi perubahan data.
