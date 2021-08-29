import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(SiAppsHome());
}

class SiAppsHome extends StatelessWidget {
  String nama = 'Arry';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
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
                                          '189.000',
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
                                warna: Colors.orange),
                            cardLayanan(
                                icon: FontAwesomeIcons.graduationCap,
                                teks: 'Bayar Kuliah',
                                warna: Colors.green),
                            cardLayanan(
                                icon: FontAwesomeIcons.donate,
                                teks: 'Bayar Donasi',
                                warna: Colors.orange.shade100),
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
                                warna: Colors.red),
                            cardLayanan(
                                icon: FontAwesomeIcons.bus,
                                teks: 'Bayar Transport',
                                warna: Colors.blue),
                            cardLayanan(
                                icon: FontAwesomeIcons.coins,
                                teks: 'Tabung Emas',
                                warna: Colors.amber),
                          ],
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45))),
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
                                topRight: Radius.circular(45))),
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
                              )),
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
                                topRight: Radius.circular(45))),
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
        ));
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
  cardLayanan({required this.icon, required this.teks, required this.warna});
  final IconData icon;
  final String teks;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
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
          onPressed: () {},
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
          Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
              child: FlutterLogo(
                size: 40.0,
              )),
          Text(
            teks,
            style: TextStyle(fontSize: 12.0),
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
