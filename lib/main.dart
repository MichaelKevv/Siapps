import 'package:SiApps/bayarKuliahAdmin/AddDataWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'bayarKuliahAdmin/Detail.dart';
import 'bayarKuliahMember/DetailM.dart';
// @dart=2.9

String name = '';
String money = '';
void main() {
  runApp(
    MaterialApp(
      home: LoginPage(),
      title: 'SiApps',
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => LoginPage(),
        '/SiAppsHomeAdmin': (BuildContext context) => SiAppsHomeAdmin(
              name: name,
              money: money,
            ),
        '/SiAppsHomeMember': (BuildContext context) => SiAppsHomeMember(
              name: name,
              money: money,
            ),
        '/BayarSekolah': (BuildContext context) => BayarSekolah(),
        '/BayarKuliahAdmin': (BuildContext context) => BayarKuliahAdmin(),
        '/BayarKuliahMember': (BuildContext context) => BayarKuliahMember(),
        '/BayarDonasi': (BuildContext context) => BayarDonasi(),
        '/BayarBerobat': (BuildContext context) => BayarBerobat(),
        '/BayarTransport': (BuildContext context) => BayarTransport(),
        '/TabungEmas': (BuildContext context) => TabungEmas(),
      },
    ),
  );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _login() async {
    final response = await http
        .post(Uri.parse('https://siapps.000webhostapp.com/login.php'), body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login gagal, silakan ulangi!";
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/SiAppsHomeAdmin');
      } else if (datauser[0]['level'] == 'member') {
        Navigator.pushReplacementNamed(context, '/SiAppsHomeMember');
      }

      setState(() {
        name = datauser[0]['name'];
        money = datauser[0]['money'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                child: Text(
                  'Login SiApps',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  width: 440,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Username",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            TextField(
                              controller: user,
                              decoration: InputDecoration(hintText: 'Username'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Password",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            TextField(
                              controller: pass,
                              obscureText: true,
                              decoration: InputDecoration(hintText: 'Password'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            ElevatedButton(
                              child: Text("Login"),
                              onPressed: () {
                                _login();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                              child: Text(
                                msg,
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SiAppsHomeAdmin extends StatelessWidget {
  SiAppsHomeAdmin({required this.name, required this.money});
  final String name;
  final String money;
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
                      child: Text("Assalamu'alaikum, " + name),
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
                          url: '/BayarKuliahAdmin',
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

class SiAppsHomeMember extends StatelessWidget {
  SiAppsHomeMember({required this.name, required this.money});
  final String name;
  final String money;
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
                      child: Text("Assalamu'alaikum, " + name),
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
                          url: '/BayarKuliahMember',
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

class BayarSekolah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Bayar Sekolah'),
      ),
    );
  }
}

class BayarKuliahAdmin extends StatefulWidget {
  const BayarKuliahAdmin({Key? key}) : super(key: key);

  @override
  _BayarKuliahAdminState createState() => _BayarKuliahAdminState();
}

class _BayarKuliahAdminState extends State<BayarKuliahAdmin> {
  // We will fetch data from this Rest api
  final _baseUrl =
      'https://siapps.000webhostapp.com/bayarKuliah/getDataKuliah.php';

  // At the beginning, we fetch the first 20 posts
  int _page = 1;
  int _limit = 20;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List _posts = [];

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res = await http.get(Uri.parse("$_baseUrl?page=$_page"));
      setState(() {
        _posts = json.decode(res.body);
      });
    } catch (err) {
      print(err);
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  _navigateToAddScreen(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => AddDataWidget(),
      ),
    );
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        final res = await http.get(Uri.parse("$_baseUrl?page=$_page"));

        final List fetchedPosts = json.decode(res.body);
        if (fetchedPosts.length > 0) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print(err);
        print('Something went wrong!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bayar Kuliah'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: _isFirstLoadRunning
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _posts.length,
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Detail(list: _posts, index: index),
                        ),
                      ),
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: ListTile(
                          title: Text(_posts[index]['nama_univ']),
                          subtitle: Text("Kode Universitas : " +
                              _posts[index]['kode_univ']),
                        ),
                      ),
                    ),
                  ),
                ),

                // when the _loadMore function is running
                if (_isLoadMoreRunning == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                // When nothing else to load
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.amber,
                    child: Center(
                      child: Text('You have fetched all of the content'),
                    ),
                  ),
              ],
            ),
    );
  }
}

// NEXT

class BayarKuliahMember extends StatefulWidget {
  const BayarKuliahMember({Key? key}) : super(key: key);

  @override
  _BayarKuliahMemberState createState() => _BayarKuliahMemberState();
}

class _BayarKuliahMemberState extends State<BayarKuliahMember> {
  // We will fetch data from this Rest api
  final _baseUrl =
      'https://siapps.000webhostapp.com/bayarKuliah/getDataKuliah.php';

  // At the beginning, we fetch the first 20 posts
  int _page = 1;
  int _limit = 20;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List _posts = [];

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res = await http.get(Uri.parse("$_baseUrl?page=$_page"));
      setState(() {
        _posts = json.decode(res.body);
      });
    } catch (err) {
      print(err);
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        final res = await http.get(Uri.parse("$_baseUrl?page=$_page"));

        final List fetchedPosts = json.decode(res.body);
        if (fetchedPosts.length > 0) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print(err);
        print('Something went wrong!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bayar Kuliah'),
      ),
      body: _isFirstLoadRunning
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _posts.length,
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailM(list: _posts, index: index)),
                      ),
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: ListTile(
                          title: Text(_posts[index]['nama_univ']),
                          subtitle: Text("Kode Universitas : " +
                              _posts[index]['kode_univ']),
                        ),
                      ),
                    ),
                  ),
                ),

                // when the _loadMore function is running
                if (_isLoadMoreRunning == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                // When nothing else to load
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.amber,
                    child: Center(
                      child: Text('You have fetched all of the content'),
                    ),
                  ),
              ],
            ),
    );
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
