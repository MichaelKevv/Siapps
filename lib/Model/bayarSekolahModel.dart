class bayarsekolah {
  final String id;
  final String kode_sekolah;
  final String nama_sekolah;
  final String spp;

  bayarsekolah(
      {this.id = '',
      required this.kode_sekolah,
      required this.nama_sekolah,
      required this.spp});

  factory bayarsekolah.fromJson(Map<String, dynamic> json) {
    return bayarsekolah(
      id: json['id'],
      kode_sekolah: json['kode_sekolah'],
      nama_sekolah: json['nama_sekolah'],
      spp: json['spp'],
    );
  }

  @override
  String toString() {
    return 'bayarsekolah{id: $id, kode_sekolah: $kode_sekolah, nama_sekolah: $nama_sekolah, spp: $spp}';
  }
}
