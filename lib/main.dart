// @dart=2.9
import 'package:SiApps/adminApp/bayarKuliahAdmin/AddDataWidget.dart';
import 'package:SiApps/adminApp/bayarKuliahAdmin/bayarKuliahAdmin.dart';
import 'package:SiApps/PaymentList/PaymentList.dart';
import 'package:SiApps/adminApp/bayarSekolahAdmin/bayarSekolahAdmin.dart';
import 'package:SiApps/memberApp/bayarKuliahMember/bayarKuliahMember.dart';
import 'package:SiApps/memberApp/bayarSekolahMember/bayarSekolahMember.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'adminApp/bayarKuliahAdmin/Detail.dart';
import 'memberApp/bayarKuliahMember/DetailM.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginStatus { notSignIn, signIn }
enum isAdmin { admin, member }
void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      title: 'SiApps',
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => Login(),
        '/SiAppsHomeAdmin': (BuildContext context) => SiAppsHomeAdmin(),
        '/SiAppsHomeMember': (BuildContext context) => SiAppsHomeMember(),
        '/BayarSekolahAdmin': (BuildContext context) => BayarSekolahAdmin(),
        '/BayarSekolahMember': (BuildContext context) => BayarSekolahMember(),
        '/BayarKuliahAdmin': (BuildContext context) => BayarKuliahAdmin(),
        '/BayarKuliahMember': (BuildContext context) => BayarKuliahMember(),
        '/BayarDonasi': (BuildContext context) => BayarDonasi(),
        '/BayarBerobat': (BuildContext context) => BayarBerobat(),
        '/BayarTransport': (BuildContext context) => BayarTransport(),
        '/TabungEmas': (BuildContext context) => TabungEmas(),
        '/PaymentList': (BuildContext context) => PaymentList(),
      },
    ),
  );
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String msg = '';
  String user;
  String pass;
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  isAdmin _isAdmin;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http
        .post(Uri.parse('https://siapps.000webhostapp.com/login.php'), body: {
      "username": user,
      "password": pass,
    });

    var datauser = json.decode(response.body);
    String nameAPI = datauser[0]['name'];
    String moneyAPI = datauser[0]['money'];
    String id = datauser[0]['id'];

    if (datauser.length == 0) {
      print("fail");
      setState(() {
        msg = "Login gagal, silakan ulangi!";
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        setState(() {
          int value = 1;
          int admin = 1;
          _loginStatus = LoginStatus.signIn;
          _isAdmin = isAdmin.admin;
          savePref(admin, value, nameAPI, moneyAPI, id);
          print(admin);
        });
        print('Berhasil login admin');
      } else if (datauser[0]['level'] == 'member') {
        setState(() {
          int value = 1;
          int admin = 0;
          _loginStatus = LoginStatus.signIn;
          _isAdmin = isAdmin.member;
          savePref(admin, value, nameAPI, moneyAPI, id);
        });
        print('Berhasil login member');
      }
    }
  }

  savePref(int admin, int value, String name, String money, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("isAdmin", admin);
      preferences.setInt("value", value);
      preferences.setString("name", name);
      preferences.setString("money", money);
      preferences.setString("id", id);
      preferences.commit();
    });
  }

  var value, admin;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      admin = preferences.getInt("isAdmin");
      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
      _isAdmin = admin == 1 ? isAdmin.admin : isAdmin.member;
      print(_isAdmin);
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              children: <Widget>[
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                            child: Text(
                              'Login SiApps',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          //card for Email TextFormField
                          Card(
                            elevation: 2.0,
                            child: TextFormField(
                              validator: (e) {
                                if (e.isEmpty) {
                                  return "Please Insert Email";
                                }
                              },
                              onSaved: (e) => user = e,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 15),
                                  child:
                                      Icon(Icons.person, color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(18),
                                labelText: "Username",
                              ),
                            ),
                          ),

                          // Card for password TextFormField
                          Card(
                            elevation: 2.0,
                            child: TextFormField(
                              validator: (e) {
                                if (e.isEmpty) {
                                  return "Password Can't be Empty";
                                }
                              },
                              obscureText: _secureText,
                              onSaved: (e) => pass = e,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                              decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 15),
                                  child: Icon(Icons.phonelink_lock,
                                      color: Colors.black),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: showHide,
                                  icon: Icon(_secureText
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                                contentPadding: EdgeInsets.all(18),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(14.0),
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Column(
                              children: <Widget>[
                                ElevatedButton(
                                  child: Text("Login"),
                                  onPressed: () {
                                    check();
                                  },
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
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
                ),
              ],
            ),
          ),
        );
        break;

      case LoginStatus.signIn:
        switch (_isAdmin) {
          case isAdmin.admin:
            return SiAppsHomeAdmin();
            break;
          case isAdmin.member:
            return SiAppsHomeMember();
            break;
        }
        break;
    }
  }
}

class SiAppsHomeAdmin extends StatefulWidget {
  const SiAppsHomeAdmin({Key key}) : super(key: key);

  @override
  _SiAppsHomeAdminState createState() => _SiAppsHomeAdminState();
}

class _SiAppsHomeAdminState extends State<SiAppsHomeAdmin> {
  LoginStatus _loginStatus = LoginStatus.signIn;
  isAdmin _isAdmin = isAdmin.admin;
  String money = "", name = "", id = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
      name = preferences.getString("name");
      money = preferences.getString("money");
    });
    print("id" + id);
    print("name" + name);
    print("money" + money);
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

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
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      setState(() {
                        preferences.remove("isAdmin");
                        preferences.remove("value");
                        preferences.remove("name");
                        preferences.remove("money");
                        preferences.remove("id");

                        preferences.commit();
                        _loginStatus = LoginStatus.notSignIn;
                        _isAdmin = null;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext ctx) => Login()));
                    },
                    child: Text('Logout'),
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
                          url: '/BayarSekolahAdmin',
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

class SiAppsHomeMember extends StatefulWidget {
  const SiAppsHomeMember({Key key}) : super(key: key);

  @override
  _SiAppsHomeMemberState createState() => _SiAppsHomeMemberState();
}

class _SiAppsHomeMemberState extends State<SiAppsHomeMember> {
  LoginStatus _loginStatus = LoginStatus.signIn;
  isAdmin _isAdmin = isAdmin.admin;
  String money = "", name = "", id = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
      name = preferences.getString("name");
      money = preferences.getString("money");
    });
    print("id" + id);
    print("name" + name);
    print("money" + money);
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

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
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      setState(() {
                        preferences.remove("isAdmin");
                        preferences.remove("value");
                        preferences.remove("name");
                        preferences.remove("money");
                        preferences.remove("id");

                        preferences.commit();
                        _loginStatus = LoginStatus.notSignIn;
                        _isAdmin = null;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext ctx) => Login()));
                    },
                    child: Text('Logout'),
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
                          url: '/BayarSekolahMember',
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
  cardUtama({this.icon, this.teks, this.warna});
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
  cardLayanan({this.icon, this.teks, this.warna, this.url});
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
  cardDigital({this.icon, this.teks, this.warna});
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
  cardTokoHalal({this.teks});
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
  cardTerkini({this.teks, this.image});
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
