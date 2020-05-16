import 'package:flutter/cupertino.dart';
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
  var scbgreen2 = Color.fromRGBO(1, 83, 47, 1);

  final String url = "lib/models/prestasiDanPelanggaran.json";
  List<Catatan> catatanSiswa = [];
  var prestasiList = [];
  var pelanggaranList = [];

  @override
  void initState() {
    loadData();
  }

  Future<String> loadData() async {
    // var nis = {'nis': 'g64170089'};
//    http.Response jsonText= await http.post(url, body: {"jenis": "prestasi"});
    var jsonText = await rootBundle.loadString(url);
    var dataText = json.decode(jsonText);
    print(dataText);
    var data;
    for (data in dataText) {
      catatanSiswa.add(new Catatan(
          data['nis'], data['jenis'], data['tanggal'], data['kegiatan'], data['point']));
    }
    var item;
    for(item in dataText){
      if (item['jenis'] == 'Prestasi') {
        prestasiList.add(item);
      }
      else {
        pelanggaranList.add(item);
      }
    }
    print(prestasiList);
    print(pelanggaranList);
    setState(() {});

    return 'success';
  }

  Widget _prestasi(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DataTable(
            columnSpacing: 20,
            columns: [
              DataColumn(
                label: Text('Tanggal'),
              ),
              DataColumn(
                label: Text('Kegiatan'),
              ),
              DataColumn(
                label: Text('Point'),
//              numeric: false,
//              tooltip: "",
              ),
            ],
            rows: prestasiList.map((element) =>
                DataRow(
                    cells: <DataCell> [
                      DataCell(Text(element['tanggal'])),
                      DataCell(Container(
                        width: 190, //SET WIDTH
                        child: Text(
                            element['kegiatan']
                        ),
                      )),
                      DataCell(Text(element['point'])),
                    ]),).toList(),
          ),
          _pelanggaran(1)
        ],
        );
    }

  Widget _pelanggaran(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Text("Pelanggaran",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
        ),
        Container(
          child: DataTable(
              columnSpacing: 20,
              columns: [
                DataColumn(
                  label: Text('Tanggal'),
                ),
                DataColumn(
                  label: Text('Kegiatan'),
                ),
                DataColumn(
                  label: Text('Point'),
                ),
              ],
              rows: pelanggaranList.map((element) =>
                  DataRow(
                      cells: <DataCell> [
                        DataCell(Text(element['tanggal'])),
                        DataCell(Container(
                          width: 190, //SET width
                          child: Text(
                              element['kegiatan']
                          ),
                        )),
                        DataCell(Text(element['point'])),
                      ]),).toList(),
            ),
        )
    ]
    );
  }

//  Widget _pelanggaran(index) {
//    pelanggaran += 1;
//    if(pelanggaran==1) {
//      return Container(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: [
//            Container(
//              padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
//              child: Text("Pelanggaran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
//            ),
//            Container(
//              color: Colors.green[50],
//              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
//              child: Row(
//                children: [
//                  Expanded(flex: 2, child: Text("Tanggal")),
//                  Expanded(flex: 4, child: Text("Kegiatan")),
//                  Expanded(flex: 1, child: Text("Point")),
//                ],),
//            ),
//            Container(
//              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
//              child: Row(
//                children: [
//                  Expanded(flex: 2, child: Text(catatanSiswa[index].tanggal),),
//                  Expanded(flex: 4, child: Text(catatanSiswa[index].kegiatan),),
//                  Expanded(flex: 1, child: Text(catatanSiswa[index].point),),
//                ],),
//            )
//          ],
//        ),
//      );
//    }
//    else {
//      return Container(
//        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
//        child: Row(
//          children: [
//            Expanded(flex: 2, child: Text(catatanSiswa[index].tanggal),),
//            Expanded(flex: 4, child: Text(catatanSiswa[index].kegiatan),),
//            Expanded(flex: 1, child: Text(catatanSiswa[index].point),),
//          ],),
//      );
//    }
//  }
  fungsiX(jenis, fungsi){
    Container(
        decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.all(Radius.circular(15))),
        margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
        padding: EdgeInsets.fromLTRB(0, 15, 0, 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text("$jenis",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
              ),
              fungsi,
            ])
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

      body: ListView.builder(
            itemCount: 1,
            itemBuilder: (_, index) {
              return catatanSiswa.length != 0?
              Container(
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                padding: EdgeInsets.fromLTRB(0, 15, 0, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text("Prestasi",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                      ),
                      _prestasi(index)
                    ],
                  ))
                  : Container(
                    margin: EdgeInsets.fromLTRB(15, 100, 15, 15),
                        child: Text("Tidak ada data",
                            textAlign: TextAlign.center),
                    );
            })

    );
  }
}
