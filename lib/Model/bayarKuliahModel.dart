class bayarkuliah {
  final String id;
  final String kode_univ;
  final String nama_univ;

  bayarkuliah({this.id = '', required this.kode_univ, required this.nama_univ});

  factory bayarkuliah.fromJson(Map<String, dynamic> json) {
    return bayarkuliah(
      id: json['id'],
      kode_univ: json['kode_univ'],
      nama_univ: json['nama_univ'],
    );
  }

  @override
  String toString() {
    return 'bayarkuliah{id: $id, kode_univ: $kode_univ, nama_univ: $nama_univ}';
  }
}
