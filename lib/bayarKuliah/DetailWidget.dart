import 'package:SiApps/bayarKuliah/EditDataWidget.dart';
import 'package:SiApps/main.dart';
import 'package:flutter/material.dart';
import 'package:SiApps/app_service.dart';
import 'package:SiApps/Model/bayarKuliahModel.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget(this.bayarKuliah);

  final bayarkuliah bayarKuliah;

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState();

  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ' + widget.bayarKuliah.nama_univ),
      ),
      body: SingleChildScrollView(
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
                        Text(
                          'Kode Universitas:',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Text(widget.bayarKuliah.kode_univ)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        Text('Nama Universitas:',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8))),
                        Text(widget.bayarKuliah.nama_univ)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                          onPressed: () {
                            _navigateToEditScreen(context, widget.bayarKuliah);
                          },
                          child: Text('Edit',
                              style: TextStyle(color: Colors.white)),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        ElevatedButton(
                          onPressed: () {
                            _confirmDialog();
                          },
                          child: Text('Delete',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _navigateToEditScreen(BuildContext context, bayarkuliah bayarKuliah) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditDataWidget(bayarKuliah),
      ),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Yes'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                api.deleteCase(widget.bayarKuliah.id);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => BayarKuliah(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
