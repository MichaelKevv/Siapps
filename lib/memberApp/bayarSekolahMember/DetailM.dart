import 'package:SiApps/memberApp/bayarKuliahMember/DetailM.dart';
import 'package:SiApps/main.dart';
import 'package:SiApps/PaymentList/PaymentList.dart';
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
        title: Text('Detail ' + "${widget.list[widget.index]['nama_sekolah']}"),
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
                          'Kode Sekolah:',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Text("${widget.list[widget.index]['kode_sekolah']}")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        Text('Nama Sekolah:',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8))),
                        Text("${widget.list[widget.index]['nama_sekolah']}")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[
                        Text('SPP Sekolah:',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8))),
                        Text("${widget.list[widget.index]['spp']}")
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
                    "${widget.list[widget.index]['nama_sekolah']}" +
                    "?"),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Ya'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PaymentList(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text('Tidak'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
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
