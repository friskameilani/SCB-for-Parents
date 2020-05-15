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
  List<catatan> catatanSiswa = [];
  var prestasi = 0;
  var pelanggaran = 0;


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

    return 'success';
  }

  Widget _prestasi(index) {
    prestasi += 1;
    if(prestasi==1) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: Text("Prestasi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ),
          Container(
            color: Colors.green[50],
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Row(
              children: [
                Expanded(flex: 2, child: Text("Tanggal")),
                Expanded(flex: 4, child: Text("Kegiatan")),
                Expanded(flex: 1, child: Text("Point")),
              ],),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Row(
              children: [
                Expanded(flex: 2, child: Text(catatanSiswa[index].tanggal),),
                Expanded(flex: 4, child: Text(catatanSiswa[index].kegiatan),),
                Expanded(flex: 1, child: Text(catatanSiswa[index].point),),
              ],),
          )
        ],
      ),
    );
    }
    else {
      return Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Row(
          children: [
            Expanded(flex: 2, child: Text(catatanSiswa[index].tanggal),),
            Expanded(flex: 4, child: Text(catatanSiswa[index].kegiatan),),
            Expanded(flex: 1, child: Text(catatanSiswa[index].point),),
          ],),
      );
    }
//    ~~~~~~ JIKA TIDAK ADA DATA PELANGGARAN ~~~~~~
//    if((index == (catatanSiswa.length-1)) && (pelanggaran == 0)){
//      return Container(
//        child: Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: [
//              Container(
//              padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
//                child: Text("Pelanggaran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
//              ),
//              Container(
//                color: Colors.green[50],
//                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
//                child: Row(
//                children: [
//                  Expanded(flex: 2, child: Text("Tanggal")),
//                  Expanded(flex: 3, child: Text("Kegiatan")),
//                  Expanded(flex: 1, child: Text("Point")),
//                ],),
//              ),
//              Container(
//                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
//                child:  Text ("Tidak ada data"),)
//          ]
//    ));
//  }
  }

  Widget _pelanggaran(index) {
    pelanggaran += 1;
    if(pelanggaran==1) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
              child: Text("Pelanggaran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            ),
            Container(
              color: Colors.green[50],
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(
                children: [
                  Expanded(flex: 2, child: Text("Tanggal")),
                  Expanded(flex: 4, child: Text("Kegiatan")),
                  Expanded(flex: 1, child: Text("Point")),
                ],),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(
                children: [
                  Expanded(flex: 2, child: Text(catatanSiswa[index].tanggal),),
                  Expanded(flex: 4, child: Text(catatanSiswa[index].kegiatan),),
                  Expanded(flex: 1, child: Text(catatanSiswa[index].point),),
                ],),
            )
          ],
        ),
      );
    }
    else {
      return Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Row(
          children: [
            Expanded(flex: 2, child: Text(catatanSiswa[index].tanggal),),
            Expanded(flex: 4, child: Text(catatanSiswa[index].kegiatan),),
            Expanded(flex: 1, child: Text(catatanSiswa[index].point),),
          ],),
      );
    }
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
            itemCount: catatanSiswa.length,
            itemBuilder: (_, index) {
              return catatanSiswa[index].jenis == 'Prestasi' ?
              Container(child: _prestasi(index))
                  : Container(child: _pelanggaran(index));
            })

    );
  }
}
