import 'package:SiApps/adminApp/bayarKuliahAdmin/bayarKuliahAdmin.dart';
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
  final _kodeUnivController = TextEditingController();
  final _namaUnivController = TextEditingController();

  @override
  void initState() {
    id = "${widget.list[widget.index]['id']}";
    _kodeUnivController.text = "${widget.list[widget.index]['kode_univ']}";
    _namaUnivController.text = "${widget.list[widget.index]['nama_univ']}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data Kuliah'),
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
                                api.updateCases(
                                  bayarkuliah(
                                    id: id,
                                    kode_univ: _kodeUnivController.text,
                                    nama_univ: _namaUnivController.text,
                                  ),
                                );

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BayarKuliahAdmin(),
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
