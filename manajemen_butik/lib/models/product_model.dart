class Product {
  int? id;
  String nama;
  int harga;
  int stok;
  String? fotoUrl;

  Product({
    this.id,
    required this.nama,
    required this.harga,
    required this.stok,
    this.fotoUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      stok: json['stok'],
      fotoUrl: json['foto_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'harga': harga,
      'stok': stok,
      'foto_url': fotoUrl,
    };
  }
}