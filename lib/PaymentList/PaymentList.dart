// @dart=2.9
import 'package:SiApps/Model/paymentListModel.dart';
import 'package:SiApps/app_service.dart';
import 'package:SiApps/main.dart';
import 'package:SiApps/memberApp/bayarKuliahMember/bayarKuliahMember.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PaymentList extends StatefulWidget {
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  final ApiService api = ApiService();
  List<paymentlist> listItem = [];

  @override
  Widget build(BuildContext context) {
    if (listItem == null) {
      listItem = [];
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pilih Cara Bayar'),
      ),
      body: new Container(
        child: new Center(
            child: new FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return listItem.length > 0
                ? new ListItem(paymentList: listItem)
                : new Center(
                    child: Text('Tidak ada data ditemukan, silakan tambahkan!'),
                  );
          },
        )),
      ),
    );
  }

  Future loadList() {
    Future<List<paymentlist>> futureCases = api.getData();
    futureCases.then((casesList) {
      setState(() {
        this.listItem = casesList;
      });
    });
    return futureCases;
  }
}

class ListItem extends StatelessWidget {
  final List<paymentlist> paymentList;
  ListItem({this.paymentList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: paymentList == null ? 0 : paymentList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => SiAppsHomeMember(),
                ),
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => BayarKuliahMember(),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.credit_card,
                size: 50.0,
              ),
              title: Text(paymentList[index].payment),
              subtitle: Text("Nomer : " + paymentList[index].number_va),
            ),
          ),
        );
      },
    );
  }
}
