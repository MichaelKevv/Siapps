import 'package:SiApps/main.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  Detail({required this.list, required this.index});

  List list;
  int index;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  _DetailState();

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
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                          onPressed: () {},
                          child: Text('Edit',
                              style: TextStyle(color: Colors.white)),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        ElevatedButton(
                          onPressed: () {},
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

  // _navigateToEditScreen(BuildContext context, bayarkuliah bayarKuliah) async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => EditDataWidget(bayarKuliah),
  //     ),
  //   );
  // }

  // Future<void> _confirmDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Warning!'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text('Are you sure want delete this item?'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           ElevatedButton(
  //             child: Text('Yes'),
  //             style: ElevatedButton.styleFrom(primary: Colors.red),
  //             onPressed: () {
  //               api.deleteCase(widget.bayarKuliah.id);
  //               Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(
  //                   builder: (BuildContext context) => SiAppsHome(),
  //                 ),
  //               );
  //               Navigator.of(context).push(
  //                 MaterialPageRoute(
  //                   builder: (BuildContext context) => BayarKuliah(),
  //                 ),
  //               );
  //             },
  //           ),
  //           ElevatedButton(
  //             child: const Text('No'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
