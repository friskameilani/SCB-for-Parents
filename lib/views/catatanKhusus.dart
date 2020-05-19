import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scbforparents/controllers/catatanKhusus.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scbforparents/models/user.dart';
import 'package:scbforparents/controllers/auth.dart';

class CatatanKhususPage extends StatefulWidget {
  CatatanKhususPage(this.nis);
  final String nis;
  @override
  _CatatanKhususPageState createState() => _CatatanKhususPageState();
}

class _CatatanKhususPageState extends State<CatatanKhususPage> {
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);
  var scbgreen2 = Color.fromRGBO(1, 83, 47, 1);
  static var id;

  Future<CatatanKhusus> futureCat;

  void initState() {
    //Initialize User State
    super.initState();
    //fetchUser function from Auth class
    futureCat = fetchCatatanKhusus();
    // loadData();
  }

  final String url ="http://asrama.systemof.fail/api/poinSiswa/";
  List data;
  var kebaikanList = [];
  var keburukanList = [];

  // Future<String> loadData() async {
  //   var response = await http.get(Uri.encodeFull(url));
  //   setState(() {
  //     var toJsonData = json.decode(response.body);
  //     data = toJsonData['data'];
  //   });

  //   print(data);
  //   print(data.length);
  //   var item;
  //   for (item in data) {
  //     if (item['jenis'] == 'kebaikan') {
  //       kebaikanList.add(item);
  //     } else {
  //       keburukanList.add(item);
  //     }
  //   }
  //   print(kebaikanList);
  //   print(keburukanList);

  //   return 'success';
  // }

  Future<CatatanKhusus> fetchCatatanKhusus() async {
    print(widget.nis);
    final response = await http.get(url+widget.nis.toString());
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print("DAPET RESPONSNYA!");
      CatatanKhusus c = new CatatanKhusus.fromJson(json.decode(response.body));
      for(int i=0; i<4; i++)
        print(c.data[i].id.toString()+'\t'+c.data[i].jenis+'\t'+c.data[i].keterangan);
      return c;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load CatatanKhusus');
    }
  }

  ListView builder(CatatanKhusus c){
    var list = <Widget>[];
    for(int i=-1; i<c.data.length; i++){
      String id, kategori, keterangan;
      TextStyle style;
      if(i == -1){
        id = "NO.";
        kategori = "KATEGORI";
        keterangan = "PREDIKAT";
        style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: scbgreen2);
      }
      else{
        id = c.data[i].id.toString();
        kategori = c.data[i].jenis;
        keterangan = c.data[i].keterangan;
      }
        list.add(
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide()),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    id,
                    style: style,
                  ),
                  Text(
                    kategori,
                    style: style
                  ),
                  Text(
                    keterangan,
                    style: style
                  ),
                ]
              )
            ),
          )
        ); 
    }
    return ListView(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Catatan Khusus"),
        centerTitle: true,
        backgroundColor: scbgreen2,
      ),
      body: Container(
          child: FutureBuilder<CatatanKhusus>(
              future: futureCat,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CatatanKhusus c = snapshot.data;
                  return builder(c);
                }
                else{
                  return Center(
                    child: Text('Terjadi Kesalahan!'),
                  );
                }
              }
          )
      )
    );
  }
}
