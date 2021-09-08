import 'package:SiApps/bayarKuliah/detailwidget.dart';
import 'package:flutter/material.dart';
import 'package:SiApps/Model/bayarKuliahModel.dart';

class ListKuliah extends StatelessWidget {
  final List<bayarkuliah> bayarKuliah;
  ListKuliah({required this.bayarKuliah});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bayarKuliah == null ? 0 : bayarKuliah.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailWidget(bayarKuliah[index])),
              );
            },
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(bayarKuliah[index].nama_univ),
              subtitle: Text(bayarKuliah[index].kode_univ),
            ),
          ),
        );
      },
    );
  }
}
