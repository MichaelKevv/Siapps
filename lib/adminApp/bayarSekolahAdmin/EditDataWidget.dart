import 'package:SiApps/Model/bayarSekolahModel.dart';
import 'package:SiApps/adminApp/bayarSekolahAdmin/bayarSekolahAdmin.dart';
import 'package:SiApps/main.dart';
import 'package:flutter/material.dart';
import 'package:SiApps/app_service.dart';
import 'package:SiApps/Model/bayarKuliahModel.dart';

class EditDataWidget extends StatefulWidget {
  EditDataWidget({required this.list, required this.index});

  List list;
  int index;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _kodeSekolahController = TextEditingController();
  final _namaSekolahController = TextEditingController();
  final _sppController = TextEditingController();

  @override
  void initState() {
    id = "${widget.list[widget.index]['id']}";
    _kodeSekolahController.text =
        "${widget.list[widget.index]['kode_sekolah']}";
    _namaSekolahController.text =
        "${widget.list[widget.index]['nama_sekolah']}";
    _sppController.text = "${widget.list[widget.index]['spp']}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data Sekolah'),
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
                              hintText: 'Masukkan Kode Universitas',
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
                          Text('SPP'),
                          TextFormField(
                            controller: _sppController,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan SPP Sekolah',
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Tolong masukkan spp sekolah';
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
                                api.updateDataSekolah(
                                  bayarsekolah(
                                    id: id,
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
                          )
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
