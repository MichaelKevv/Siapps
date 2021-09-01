import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './detail.dart';

void main() {
  runApp(
    MaterialApp(
      home: SiAppsHome(),
      title: 'SiApps',
      routes: <String, WidgetBuilder>{
        '/SiAppsHome': (BuildContext context) => SiAppsHome(),
        '/BayarSekolah': (BuildContext context) => BayarSekolah(),
        '/BayarKuliah': (BuildContext context) => BayarKuliah(),
        '/BayarDonasi': (BuildContext context) => BayarDonasi(),
        '/BayarBerobat': (BuildContext context) => BayarBerobat(),
        '/BayarTransport': (BuildContext context) => BayarTransport(),
        '/TabungEmas': (BuildContext context) => TabungEmas(),
      },
    ),
  );
}

class SiAppsHome extends StatelessWidget {
  String nama = 'Arry';
  String money = '189.000';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    width: 100,
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Assalamu'alaikum, " + nama),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.yellow[600],
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            width: 125,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 0.0, 5.0, 5.0),
                                          child: Icon(
                                            Icons
                                                .account_balance_wallet_outlined,
                                            size: 30.0,
                                            // color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'U M U',
                                          style: TextStyle(),
                                        )
                                      ],
                                    ),
                                    Text(
                                      money,
                                      style: TextStyle(
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          cardUtama(
                              icon: Icons.add_box,
                              teks: 'Top Up',
                              warna: Colors.blue.shade800),
                          cardUtama(
                              icon: FontAwesomeIcons.exchangeAlt,
                              teks: 'Transfer',
                              warna: Colors.blue.shade800),
                          cardUtama(
                              icon: FontAwesomeIcons.history,
                              teks: 'History',
                              warna: Colors.blue.shade800),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        cardLayanan(
                          icon: FontAwesomeIcons.school,
                          teks: 'Bayar Sekolah',
                          warna: Colors.orange,
                          url: '/BayarSekolah',
                        ),
                        cardLayanan(
                          icon: FontAwesomeIcons.graduationCap,
                          teks: 'Bayar Kuliah',
                          warna: Colors.green,
                          url: '/BayarKuliah',
                        ),
                        cardLayanan(
                          icon: FontAwesomeIcons.donate,
                          teks: 'Bayar Donasi',
                          warna: Colors.orange.shade200,
                          url: '/BayarDonasi',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        cardLayanan(
                          icon: FontAwesomeIcons.clinicMedical,
                          teks: 'Bayar Berobat',
                          warna: Colors.red,
                          url: '/BayarBerobat',
                        ),
                        cardLayanan(
                          icon: FontAwesomeIcons.bus,
                          teks: 'Bayar Transport',
                          warna: Colors.blue,
                          url: '/BayarTransport',
                        ),
                        cardLayanan(
                          icon: FontAwesomeIcons.coins,
                          teks: 'Tabung Emas',
                          warna: Colors.amber,
                          url: '/TabungEmas',
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    color: Colors.yellow[600],
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 0, 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Digital",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        cardDigital(
                            icon: Icons.phone_android,
                            teks: 'Paket Data',
                            warna: Colors.blue.shade900),
                        cardDigital(
                            icon: Icons.phone_iphone,
                            teks: 'Pulsa',
                            warna: Colors.blue.shade900),
                        cardDigital(
                            icon: Icons.wifi,
                            teks: 'Internet',
                            warna: Colors.blue.shade900),
                        cardDigital(
                            icon: Icons.bolt,
                            teks: 'Token Listrik',
                            warna: Colors.blue.shade900),
                        cardDigital(
                            icon: Icons.water,
                            teks: 'Utilitas',
                            warna: Colors.blue.shade900),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    color: Colors.indigo[800],
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 0, 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5.0, 0),
                              child: Image.asset(
                                'assets/images/logo_halal_2.png',
                                color: Colors.white,
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Text(
                              "Toko Halal",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        cardTokoHalal(
                          teks: 'Paket Sembako',
                        ),
                        cardTokoHalal(
                          teks: 'Serambi UMKM',
                        ),
                        cardTokoHalal(
                          teks: 'Buku',
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    color: Colors.indigo[800],
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(25, 5, 0, 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Terkini",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  Container(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        cardTerkini(
                            image:
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            teks:
                                "Haedar Nashir: Terima kasih untuk Seluruh Tenaga Pendidikan Muhammadiyah se-Indonesia"),
                        cardTerkini(
                            image:
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                            teks:
                                "Pentingnya Kaderisasi di Tengah Masa Pandemi")
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class cardUtama extends StatelessWidget {
  cardUtama({required this.icon, required this.teks, required this.warna});
  final IconData icon;
  final String teks;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: warna,
                size: 25.0,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  teks.toUpperCase(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class cardLayanan extends StatelessWidget {
  cardLayanan(
      {required this.icon,
      required this.teks,
      required this.warna,
      required this.url});
  final IconData icon;
  final String teks;
  final Color warna;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, url);
          },
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Icon(
                  icon,
                  color: warna,
                  size: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(teks),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class cardDigital extends StatelessWidget {
  cardDigital({required this.icon, required this.teks, required this.warna});
  final IconData icon;
  final String teks;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
                primary: Color(0xff000000),
                textStyle: TextStyle(fontWeight: FontWeight.normal)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    icon,
                    color: warna,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    teks,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class cardTokoHalal extends StatelessWidget {
  cardTokoHalal({required this.teks});
  final String teks;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
                primary: Color(0xff000000),
                textStyle: TextStyle(fontWeight: FontWeight.normal)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: FlutterLogo(
                    size: 80,
                  ),
                ),
                Text(
                  teks,
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class cardTerkini extends StatelessWidget {
  cardTerkini({required this.teks, required this.image});
  final String teks;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Image.network(image),
          Container(
            width: 200,
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
              child: Text(
                teks,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BayarSekolah extends StatefulWidget {
  @override
  _BayarSekolahState createState() => _BayarSekolahState();
}

class _BayarSekolahState extends State<BayarSekolah> {
  List data = [];

  Future getData() async {
    http.Response hasil = await http.get(
      Uri.parse("https://612e3c43d11e5c0017558446.mockapi.io/sekolah"),
      headers: {"Accept": 'application/json'},
    );

    this.setState(() {
      data = jsonDecode(hasil.body);
    });
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Bayar Sekolah'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.all(5),
            child: Card(
              child: Column(
                children: [
                  if (data == '') ...[
                    Text('Data Kosong') // masih belum work buat yg ini
                  ] else ...[
                    Image.network(
                      data[i]['image'],
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        data[i]['nama'] == null
                            ? 'Tidak Ada Data'
                            : data[i]['nama'],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BayarKuliah extends StatefulWidget {
  @override
  _BayarKuliahState createState() => _BayarKuliahState();
}

class _BayarKuliahState extends State<BayarKuliah> {
  Future _getData() async {
    final response =
        await http.get(Uri.parse("http://192.168.1.9/siapps/getdata.php"));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Bayar Kuliah'),
      ),
      body: FutureBuilder(
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
        future: _getData(),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({required this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Detail(
                    list: list,
                    index: i,
                  ),
                ),
              ),
              child: Card(
                child: ListTile(
                  title: Text(list[i]['nama_univ']),
                  leading: Icon(
                    Icons.home,
                    size: 50.0,
                  ),
                  subtitle: Text("Kode Univ : ${list[i]['kode_univ']}"),
                ),
              ),
            ),
          );
        });
  }
}

class BayarDonasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade200,
        title: Text('Bayar Donasi'),
      ),
    );
  }
}

class BayarBerobat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Bayar Berobat'),
      ),
    );
  }
}

class BayarTransport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Bayar Transport'),
      ),
    );
  }
}

class TabungEmas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Tabung Emas'),
      ),
    );
  }
}
