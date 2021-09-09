import 'package:SiApps/main.dart';
import 'package:flutter/material.dart';
import 'package:SiApps/app_service.dart';
// import 'editdatawidget.dart';
import 'package:SiApps/Model/bayarKuliahModel.dart';

class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  _AddDataWidgetState createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  TextEditingController _kodeUnivController = TextEditingController();
  TextEditingController _namaUnivController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Tambah Kuliah'),
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
                          Text('Kode Universitas'),
                          TextFormField(
                            controller: _kodeUnivController,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan Kode Universitas',
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Tolong masukkan kode universitas';
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
                          Text('Nama Universitas'),
                          TextFormField(
                            controller: _namaUnivController,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan Nama Universitas',
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Tolong masukkan nama universitas';
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
                                api.createCase(
                                  bayarkuliah(
                                    kode_univ: _kodeUnivController.text,
                                    nama_univ: _namaUnivController.text,
                                  ),
                                );

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BayarKuliah(),
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
