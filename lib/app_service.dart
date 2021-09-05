import 'dart:convert';
import 'package:SiApps/Model/bayarKuliahModel.dart';
import 'package:http/http.dart';

class ApiService {
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
}
