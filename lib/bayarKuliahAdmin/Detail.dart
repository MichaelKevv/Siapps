import 'package:SiApps/bayarKuliahAdmin/EditDataWidget.dart';
import 'package:SiApps/main.dart';
import 'package:flutter/material.dart';
import 'package:SiApps/app_service.dart';
import 'package:SiApps/Model/bayarKuliahModel.dart';

class Detail extends StatefulWidget {
  Detail({required this.list, required this.index});

  List list;
  int index;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  _DetailState();

  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ' + "${widget.list[widget.index]['nama_univ']}"),
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
                        Text("${widget.list[widget.index]['kode_univ']}")
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
                        Text("${widget.list[widget.index]['nama_univ']}")
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
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditDataWidget(
                                  list: widget.list, index: widget.index),
                            ),
                          ),
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
                Text('Apakah ana yakin ingin menghapus data ini?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Ya'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                api.deleteCase("${widget.list[widget.index]['id']}");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => BayarKuliahAdmin(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Tidak'),
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
