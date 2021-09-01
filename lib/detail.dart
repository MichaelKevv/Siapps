import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({required this.list, required this.index});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['nama_univ']}"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Center(
            child: Column(
              children: [
                Image.network("${widget.list[widget.index]['image_univ']}"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                ),
                Text(
                  "${widget.list[widget.index]['nama_univ']}",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Kode Univ : ${widget.list[widget.index]['kode_univ']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Bayar Kuliah Anda'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
