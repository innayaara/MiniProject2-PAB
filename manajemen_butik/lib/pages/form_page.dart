import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/product_model.dart';

final supabase = Supabase.instance.client;

class FormPage extends StatefulWidget {
  final Product? product;
  final String pesan;

  const FormPage({
    super.key,
    this.product,
    required this.pesan,
  });

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController stokController = TextEditingController();

  File? _selectedImageFile;
  Uint8List? _selectedImageBytes;
  String? _existingFotoUrl;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      namaController.text = widget.product!.nama;
      hargaController.text = widget.product!.harga.toString();
      stokController.text = widget.product!.stok.toString();
      _existingFotoUrl = widget.product!.fotoUrl;
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    hargaController.dispose();
    stokController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 75,
        maxWidth: 800,
      );

      if (pickedFile == null) return;

      if (kIsWeb) {
        final Uint8List bytes = await pickedFile.readAsBytes();
        setState(() {
          _selectedImageBytes = bytes;
          _selectedImageFile = null;
        });
      } else {
        setState(() {
          _selectedImageFile = File(pickedFile.path);
          _selectedImageBytes = null;
        });
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal memilih gambar: $e"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _showImageSourceSheet() async {
    await _pickImage(ImageSource.gallery);
  }

  Future<String?> _uploadImage() async {
    final bool hasNewWebImage = _selectedImageBytes != null;
    final bool hasNewMobileImage = _selectedImageFile != null;

    if (!hasNewWebImage && !hasNewMobileImage) {
      return _existingFotoUrl;
    }

    final fileName = 'produk_${DateTime.now().millisecondsSinceEpoch}.jpg';

    if (kIsWeb && _selectedImageBytes != null) {
      await supabase.storage.from('produk-images').uploadBinary(
            fileName,
            _selectedImageBytes!,
            fileOptions: const FileOptions(
              contentType: 'image/jpeg',
              upsert: false,
            ),
          );
    } else if (!kIsWeb && _selectedImageFile != null) {
      await supabase.storage.from('produk-images').upload(
            fileName,
            _selectedImageFile!,
            fileOptions: const FileOptions(
              contentType: 'image/jpeg',
              upsert: false,
            ),
          );
    }

    final String publicUrl =
        supabase.storage.from('produk-images').getPublicUrl(fileName);

    return publicUrl;
  }

  Future<void> saveProduct() async {
    if (namaController.text.isEmpty ||
        hargaController.text.isEmpty ||
        stokController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Semua field wajib diisi!"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (int.tryParse(hargaController.text) == null ||
        int.tryParse(stokController.text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Harga dan stok harus berupa angka!"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isUploading = true);

    try {
      final String? fotoUrl = await _uploadImage();

      final data = {
        'nama': namaController.text.trim(),
        'harga': int.parse(hargaController.text),
        'stok': int.parse(stokController.text),
        'foto_url': fotoUrl,
      };

      if (widget.product == null) {
        await supabase.from('produk').insert(data);
      } else {
        if (widget.product!.id == null) {
          throw Exception('ID produk tidak ditemukan saat update');
        }

        await supabase
            .from('produk')
            .update(data)
            .eq('id', widget.product!.id!);
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.product == null
                ? "Produk berhasil ditambahkan"
                : "Produk berhasil diperbarui",
          ),
          backgroundColor: const Color(0xFFFF4081),
          behavior: SnackBarBehavior.floating,
        ),
      );

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal simpan produk: $e"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isUploading = false);
      }
    }
  }

  void _removeSelectedImage() {
    setState(() {
      _selectedImageFile = null;
      _selectedImageBytes = null;
    });
  }

  void _removeExistingImage() {
    setState(() {
      _existingFotoUrl = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.product == null ? "Tambah Produk" : "Edit Produk",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.pesan,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.white70 : Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Foto Produk",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _showImageSourceSheet,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF1E1E1E)
                      : const Color(0xFFFFF0F5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFFF4081).withOpacity(0.3),
                    width: 1.5,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
                child: _buildImagePreview(isDark),
              ),
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: namaController,
              label: "Nama Produk",
              icon: Icons.shopping_bag_outlined,
              isDark: isDark,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: hargaController,
              label: "Harga (Rp)",
              icon: Icons.payments_outlined,
              keyboardType: TextInputType.number,
              isDark: isDark,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: stokController,
              label: "Stok",
              icon: Icons.inventory_2_outlined,
              keyboardType: TextInputType.number,
              isDark: isDark,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _isUploading ? null : saveProduct,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4081),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.pink[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: _isUploading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                    : const Text(
                        "SIMPAN PRODUK",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 15,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview(bool isDark) {
    if (_selectedImageBytes != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.memory(_selectedImageBytes!, fit: BoxFit.cover),
            Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _showImageSourceSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text(
                            "Ganti",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: _removeSelectedImage,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.delete_outline,
                              color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text(
                            "Hapus",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    if (_selectedImageFile != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.file(_selectedImageFile!, fit: BoxFit.cover),
            Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _showImageSourceSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text(
                            "Ganti",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: _removeSelectedImage,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.delete_outline,
                              color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text(
                            "Hapus",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    if (_existingFotoUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              _existingFotoUrl!,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Center(
                child: Icon(
                  Icons.broken_image_outlined,
                  color: Color(0xFFFF4081),
                  size: 48,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _showImageSourceSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text(
                            "Ganti",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: _removeExistingImage,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.delete_outline,
                              color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text(
                            "Hapus",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.add_photo_alternate_outlined,
          size: 48,
          color: Color(0xFFFF4081),
        ),
        const SizedBox(height: 10),
        const Text(
          "Tap untuk upload foto",
          style: TextStyle(
            color: Color(0xFFFF4081),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "JPG, PNG • Maks 5MB",
          style: TextStyle(
            color: isDark ? Colors.white54 : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isDark,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: isDark ? Colors.white70 : Colors.grey,
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xFFFF4081),
          size: 20,
        ),
        filled: true,
        fillColor: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFFAFAFA),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.white24 : Colors.grey[200]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFFF4081),
            width: 1.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}