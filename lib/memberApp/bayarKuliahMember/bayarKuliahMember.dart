// @dart=2.9
import 'package:SiApps/memberApp/bayarKuliahMember/DetailM.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class BayarKuliahMember extends StatefulWidget {
  const BayarKuliahMember({Key key}) : super(key: key);

  @override
  _BayarKuliahMemberState createState() => _BayarKuliahMemberState();
}

class _BayarKuliahMemberState extends State<BayarKuliahMember> {
  TextEditingController kode_univ = TextEditingController();
  TextEditingController nama_univ = TextEditingController();

  final _searchUrl =
      'https://siapps.000webhostapp.com/bayarKuliah/searchDataKuliah.php';

  // We will fetch data from this Rest api
  final _baseUrl =
      'https://siapps.000webhostapp.com/bayarKuliah/getDataKuliah.php';

  // At the beginning, we fetch the first 20 posts
  int _page = 1;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List _posts = [];

  void _searchData() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      var kodeuniv = kode_univ.text;
      var namauniv = nama_univ.text;
      final res = await http
          .get(Uri.parse("$_searchUrl?kodeUniv=$kodeuniv&namaUniv=$namauniv"));
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
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showsearchform(context);
            },
          )
        ],
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

  void showsearchform(context) {
    String _valGender;
    List _listGender = ["CLOSED", "OPEN"];

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: MediaQuery.of(context).size.height * 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Text(
                        "Search",
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      TextField(
                        controller: kode_univ,
                        // textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.format_list_numbered),
                          hintText: 'Input Kode Universitas disini',
                          labelText: 'Kode Universitas',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: nama_univ,
                        // textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.format_list_numbered),
                          hintText: 'Input Nama Universitas disini',
                          labelText: 'Nama Universitas',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // DropdownButton(
                      //   isExpanded: true,
                      //   hint: Text("Select The Status"),
                      //   value: _valGender,
                      //   items: _listGender.map((value) {
                      //     return DropdownMenuItem(
                      //       child: Text(value),
                      //       value: value,
                      //     );
                      //   }).toList(),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       _valGender = value;
                      //     });
                      //   },
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _searchData();
                            Navigator.pop(context);
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search),
                            Text("Search"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }

  // _selectDate(BuildContext context) async {
  //   DateTime newSelectedDate = await showDatePicker(
  //       context: context,
  //       initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2040),
  //       builder: (BuildContext context, Widget child) {
  //         return Theme(
  //           data: ThemeData.dark().copyWith(
  //             colorScheme: ColorScheme.light(
  //               primary: Colors.green,
  //               onPrimary: Colors.black,
  //               surface: Colors.black,
  //               onSurface: Colors.black,
  //             ),
  //             dialogBackgroundColor: Colors.white,
  //           ),
  //           child: child,
  //         );
  //       });

  //   if (newSelectedDate != null) {
  //     _selectedDate = newSelectedDate;
  //     _textEditingController
  //       ..text = DateFormat("d-MMM-yy").format(_selectedDate)
  //       ..selection = TextSelection.fromPosition(
  //         TextPosition(
  //             offset: _textEditingController.text.length,
  //             affinity: TextAffinity.upstream),
  //       );
  //   }
  // }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
