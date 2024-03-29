import 'dart:convert';
import 'package:SiApps/Model/bayarKuliahModel.dart';
import 'package:SiApps/Model/bayarSekolahModel.dart';
import 'package:SiApps/Model/paymentListModel.dart';
import 'package:http/http.dart';

class ApiService {
  // bayar sekolah
  Future<bayarsekolah> createDataSekolah(bayarsekolah BayarSekolah) async {
    final Response response = await post(
      Uri.parse(
          'https://siapps.000webhostapp.com/bayarSekolah/addDataSekolah.php'),
      body: {
        'kodeSekolah': BayarSekolah.kode_sekolah,
        'namaSekolah': BayarSekolah.nama_sekolah,
        'spp': BayarSekolah.spp,
      },
    );
    if (response.statusCode == 200) {
      return bayarsekolah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal menambahkan data');
    }
  }

  Future<bayarsekolah> updateDataSekolah(bayarsekolah BayarSekolah) async {
    final Response response = await post(
      Uri.parse(
          'https://siapps.000webhostapp.com/bayarSekolah/editDataSekolah.php'),
      body: {
        'id': BayarSekolah.id,
        'kodeSekolah': BayarSekolah.kode_sekolah,
        'namaSekolah': BayarSekolah.nama_sekolah,
        'spp': BayarSekolah.spp,
      },
    );
    if (response.statusCode == 200) {
      return bayarsekolah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal update data');
    }
  }

  Future<void> deleteDataSekolah(String id) async {
    Response res = await post(
      Uri.parse(
          'https://siapps.000webhostapp.com/bayarSekolah/deleteDataSekolah.php'),
      body: {
        'id': id,
      },
    );

    if (res.statusCode == 200) {
      print("Data Sekolah Terhapus");
    } else {
      throw "Gagal menghapus data";
    }
  }

  // bayar kuliah
  Future<List<bayarkuliah>> getCases() async {
    Response res = await get(
      Uri.parse(
          'https://siapps.000webhostapp.com/bayarKuliah/getDataKuliah.php'),
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<bayarkuliah> bayarKuliah =
          body.map((dynamic item) => bayarkuliah.fromJson(item)).toList();
      return bayarKuliah;
    } else {
      throw "Gagal load data";
    }
  }

  Future<bayarkuliah> createCase(bayarkuliah BayarKuliah) async {
    final Response response = await post(
      Uri.parse(
          'https://siapps.000webhostapp.com/bayarKuliah/addDataKuliah.php'),
      body: {
        'kodeUniv': BayarKuliah.kode_univ,
        'namaUniv': BayarKuliah.nama_univ,
      },
    );
    if (response.statusCode == 200) {
      return bayarkuliah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal menambahkan data');
    }
  }

  Future<bayarkuliah> updateCases(bayarkuliah BayarKuliah) async {
    final Response response = await post(
      Uri.parse(
          'https://siapps.000webhostapp.com/bayarKuliah/editDataKuliah.php'),
      body: {
        'id': BayarKuliah.id,
        'kodeUniv': BayarKuliah.kode_univ,
        'namaUniv': BayarKuliah.nama_univ,
      },
    );
    if (response.statusCode == 200) {
      return bayarkuliah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal update data');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await post(
      Uri.parse(
          'https://siapps.000webhostapp.com/bayarKuliah/deleteDataKuliah.php'),
      body: {
        'id': id,
      },
    );

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Gagal menghapus data";
    }
  }

  // payment
  Future<List<paymentlist>> getData() async {
    Response res = await get(
      Uri.parse('https://613635f28700c50017ef5497.mockapi.io/payment_list'),
    );
    // print("${res.statusCode}");
    // print("${res.body}");
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<paymentlist> paymentList =
          body.map((dynamic item) => paymentlist.fromJson(item)).toList();
      return paymentList;
    } else {
      throw "Gagal load data";
    }
  }
}
