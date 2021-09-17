import 'package:SiApps/memberApp/bayarKuliahMember/DetailM.dart';
import 'package:SiApps/main.dart';
import 'package:flutter/material.dart';

class DetailM extends StatefulWidget {
  DetailM({required this.list, required this.index});

  List list;
  int index;

  @override
  _DetailMState createState() => _DetailMState();
}

class _DetailMState extends State<DetailM> {
  _DetailMState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ' + "${widget.list[widget.index]['title']}"),
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
                          onPressed: () {
                            _confirmDialog();
                          },
                          child: Text('Bayar Sekarang',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
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
          title: Text('Bayar'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Apakah anda ingin membayar ' +
                    "${widget.list[widget.index]['nama_univ']}" +
                    "?"),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Ya'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => BayarKuliahMember(),
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
