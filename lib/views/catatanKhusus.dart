import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scbforparents/controllers/catatanKhusus.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;


class CatatanKhusus extends StatefulWidget {
  @override
  _CatatanKhususState createState() => _CatatanKhususState();
}

class _CatatanKhususState extends State<CatatanKhusus> {
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);

  final String url = "lib/models/prestasiDanPelanggaran.json";
  List<catatan> catatanSiswa = [];


  @override
  void initState() {
    loadData();
  }

  Future<String> loadData() async {
    // var nis = {'nis': 'g64170089'};
//    http.Response jsonText= await http.post(url, body: {"jenis": "prestasi"});
    var jsonText = await rootBundle.loadString(url);
    var dataText = json.decode(jsonText);
    var data;
    for (data in dataText) {
      catatanSiswa.add(new catatan(
          data['nis'], data['jenis'], data['tanggal'], data['kegiatan'], data['point']));
    }
    setState(() {});
//    print(data["nis"]);
    print(jsonText);
    return 'success';
  }

//  SingleChildScrollView _prestasi() {
//    return SingleChildScrollView(
//      scrollDirection: Axis.vertical,
//      child: SingleChildScrollView(
//        child: DataTable(
//          columnSpacing: 30,
//          columns: [
//            DataColumn(
//              label: Text('Tanggal'),
//            ),
//            DataColumn(
//              label: Text('Kegiatan'),
//            ),
//            DataColumn(
//              label: Text('Point'),
//            ),
//          ],
//          rows: [
//            DataRow(cells: [
//              DataCell(
//                Text(
//                    "10/10/2019",
//                ),
//              ),
//              DataCell(
//                Container(
//                  width: 170, //SET width
//                  child: Text(
//                      "Juara II Lomba Debat Bahasa Inggris Tingkat SMP Se-Kabupaten Bogor",
//                    ),
//                )
//              ),
//              DataCell(
//                Text(
//                  "5",
//                ),
//              ),
//            ]),
//          ],
//          ),
//        ),
//      );
//  }
  Widget _pelanggaran() {
//    return new ListView.builder(
//        itemCount: catatanSiswa.length,
//        itemBuilder: (_, index){
//          print("print " + catatanSiswa[0].kegiatan);
//          print("print " + catatanSiswa[1].kegiatan);
//          print("print " + catatanSiswa[2].kegiatan);
          return Container(
                child: DataTable(
                  columnSpacing: 30,
                  columns: [
                    DataColumn(
                      label: Text('Tanggal'),
                      numeric: false,
                      tooltip: "",
                    ),
                    DataColumn(
                      label: Text('Kegiatan'),
                      numeric: false,
                      tooltip: "",
                    ),
                    DataColumn(
                      label: Text('Point'),
                      numeric: false,
                      tooltip: "",
                    ),
                  ],
                  rows: catatanSiswa.map((element) =>
                    DataRow(
                        cells:  <DataCell> [
                          DataCell(Text(element.tanggal)),
                          DataCell(Container(
                            width: 170, //SET width
                            child: Text(
                                element.kegiatan
                              ),
                          )),
                          DataCell(Text(element.point)),
                  ]),
                  ).toList(),
                ),

          );
//      }
//    );
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
        backgroundColor: scbgreen,
    ),

      body: catatanSiswa.length == 0
        ? new Center(
        child: new CircularProgressIndicator(),
      ) : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Prestasi',
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: 200.0,
                child: _pelanggaran(), //data prestasi dan pelanggaran belum dipisah
              ),
            ),


            Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Pelanggaran',
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: 200.0,
                child: _pelanggaran(), //data prestasi dan pelanggaran belum dipisah
              ),
            ),
            ]),
    )
    );
  }
}
