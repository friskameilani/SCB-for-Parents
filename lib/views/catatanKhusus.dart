import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scbforparents/controllers/catatanKhusus.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scbforparents/models/user.dart';
import 'package:scbforparents/controllers/auth.dart';

class CatatanKhusus extends StatefulWidget {
  @override
  _CatatanKhususState createState() => _CatatanKhususState();
}

class _CatatanKhususState extends State<CatatanKhusus> {
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);
  var scbgreen2 = Color.fromRGBO(1, 83, 47, 1);
  static var id;

  Future<User> futureuser;

  @override
  void initState() {
    //Initialize User State
    super.initState();
    //fetchUser function from Auth class
    futureuser = Auth().fetchUser();
    loadData();
  }

  final String url =
      "http://asrama.systemof.fail/api/poinSiswa/" + id.toString();
  List data;
  var kebaikanList = [];
  var keburukanList = [];

  Future<String> loadData() async {
    var response = await http.get(Uri.encodeFull(url));
    setState(() {
      var toJsonData = json.decode(response.body);
      data = toJsonData['data'];
    });

    print(data);
    print(data.length);
    var item;
    for (item in data) {
      if (item['jenis'] == 'kebaikan') {
        kebaikanList.add(item);
      } else {
        keburukanList.add(item);
      }
    }
    print(kebaikanList);
    print(keburukanList);

    return 'success';
  }

  Widget _kebaikan(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataTable(
          columnSpacing: 20,
          columns: [
            DataColumn(
              label: Text('Keterangan'),
            ),
            DataColumn(
              label: Text('Poin'),
            ),
          ],
          rows: kebaikanList
              .map(
                (element) => DataRow(cells: <DataCell>[
                  DataCell(Container(
                    width: 240, //SET WIDTH
                    child: Text(element['keterangan']),
                  )),
                  DataCell(Text(element['poin'].toString())),
                ]),
              )
              .toList(),
        ),
        _keburukan(1)
      ],
    );
  }

  Widget _keburukan(index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Text(
            "Keburukan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )),
      Container(
        child: DataTable(
          columnSpacing: 20,
          columns: [
            DataColumn(
              label: Text('Keterangan'),
            ),
            DataColumn(
              label: Text('Poin'),
            ),
          ],
          rows: keburukanList
              .map(
                (element) => DataRow(cells: <DataCell>[
                  DataCell(Container(
                    width: 240, //SET width
                    child: Text(element['keterangan']),
                  )),
                  DataCell(Text(element['poin'].toString())),
                ]),
              )
              .toList(),
        ),
      )
    ]);
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
          child: FutureBuilder<User>(
              future: futureuser,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  id = snapshot.data.name;
                  print(id);
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (_, index) {
                        return data != null
                            ? Card(
                                // decoration: BoxDecoration(
                                //     // color: Colors.green[50],
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(15))
                                //         ),
                                margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                // padding: EdgeInsets.fromLTRB(0, 15, 0, 20),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 0, 20, 0),
                                          child: Text(
                                            "Kebaikan",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          )),
                                      _kebaikan(index)
                                    ],
                                  ),
                                ))
                            :
                             Container(
                                 margin: EdgeInsets.fromLTRB(15, 150, 15, 15),
                                 child: Text("Tidak ada data",
                                     textAlign: TextAlign.center,
                                   style: TextStyle(fontSize: 18)
                                 ),
                               );
//                            CircularProgressIndicator();
                      });
                } else if (snapshot.hasError) {
                  return Text("Data tidak berhasil diambil");
                }
                return Text("Data is NULL");
              })),
    );
  }
}
