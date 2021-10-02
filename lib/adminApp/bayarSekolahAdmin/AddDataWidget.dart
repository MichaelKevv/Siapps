import 'package:SiApps/Model/bayarSekolahModel.dart';
import 'package:SiApps/adminApp/bayarKuliahAdmin/bayarKuliahAdmin.dart';
import 'package:SiApps/adminApp/bayarSekolahAdmin/bayarSekolahAdmin.dart';
import 'package:SiApps/main.dart';
import 'package:flutter/material.dart';
import 'package:SiApps/app_service.dart';
import 'package:SiApps/Model/bayarKuliahModel.dart';

class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  _AddDataWidgetState createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  TextEditingController _kodeSekolahController = TextEditingController();
  TextEditingController _namaSekolahController = TextEditingController();
  TextEditingController _sppController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Tambah Sekolah'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10.0),
                width: 440,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Kode Sekolah'),
                          TextFormField(
                            controller: _kodeSekolahController,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan Kode Sekolah',
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Tolong masukkan kode sekolah';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Nama Sekolah'),
                          TextFormField(
                            controller: _namaSekolahController,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan Nama Sekolah',
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Tolong masukkan nama sekolah';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('SPP Sekolah'),
                          TextFormField(
                            controller: _sppController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan SPP Sekolah',
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Tolong masukkan SPP sekolah';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              if (_addFormKey.currentState!.validate()) {
                                _addFormKey.currentState!.save();
                                api.createDataSekolah(
                                  bayarsekolah(
                                    kode_sekolah: _kodeSekolahController.text,
                                    nama_sekolah: _namaSekolahController.text,
                                    spp: _sppController.text,
                                  ),
                                );

                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SiAppsHomeAdmin(),
                                  ),
                                );
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BayarSekolahAdmin(),
                                  ),
                                );
                              }
                            },
                            child: Text('Save',
                                style: TextStyle(color: Colors.white)),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
