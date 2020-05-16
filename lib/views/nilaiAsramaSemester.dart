// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:scbforparents/controllers/nilaiAsrama.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class NilaiAsramaSmt extends StatefulWidget {
  NilaiAsramaSmt(this.semester);
  final String semester;
  @override
  NilaiAsramaSmtState createState() => new NilaiAsramaSmtState();
}

class NilaiAsramaSmtState extends State<NilaiAsramaSmt> {
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);

  static var aspek = [
    "Tahsin",
    "Tahfiz",
    "Hafalan",
    "Hadist Tulis",
    "Hadist Lisan",
    "Mufrodat",
    "Doa dan Dzikir Tulis",
    "Doa dan Dzikir Lisan",
    "Asmaul Husna",
    "Ta'lim",
    "Hafalan Surat Pilihan"
  ];

  final String url = "lib/models/transkripAsrama.json";
  List<NilaiAsrama> transkripAsrama = [];
//  Map<String, int> nilaiAsrama = new Map<String, int>();

  @override
  void initState() {
    loadData();
    print(transkripAsrama[0]);
  }

  Future<String> loadData() async {
//    var nis = {'nis': 'g64170089'};
//    http.Response jsonText= await http.post(url, body: {"jenis": "prestasi"});
    var jsonText = await rootBundle.loadString(url);
    var dataText = json.decode(jsonText);
    var data;
    for (data in dataText) {
      transkripAsrama.add(new NilaiAsrama(
          data['nis'],
          data['nama'],
          data['aspek'],
          data['aspek']['tahsin'],
          data['aspek']['tahfiz'],
          data['aspek']['hafalan'],
          data['aspek']['hadistTulis'],
          data['aspek']['hadistLisan'],
          data['aspek']['mufrodat'],
          data['aspek']['doaDzikirTulis'],
          data['aspek']['doaDzikirLisan'],
          data['aspek']['asmaulHusna'],
          data['aspek']['talim'],
          data['aspek']['hafalanSuratPilihan']));
    }
    setState(() {});

    return 'success';
  }

  String verdict(int nilai) {
    String res;
    if (nilai > 80)
      res = "A";
    else if (nilai > 75)
      res = "B";
    else if (nilai > 65)
      res = "C";
    else if (nilai > 60)
      res = "D";
    else
      res = "E";
    return res;
  }

  ListView builder() {
    var list = <Widget>[];
    int j = 0;
    for (int i = 0; i < aspek.length; i++) {
      String aspekPenilaian, verdict;
      TextStyle styleTitle;
      if (i == 0) {
        aspekPenilaian = "Aspek Materi Keasramaan";
        verdict = "Nilai";
        styleTitle = TextStyle(
          fontWeight: FontWeight.bold,
          color: scbgreen,
          fontSize: 16,
        );
        j++;
      }
//      else{
//        aspekPenilaian = aspek[i];
//        verdict = this.verdict(transkripAsrama[0].aspek);
//      }
      list.add(Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide()),
        ),
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Text(
                      aspekPenilaian,
                      style: styleTitle,
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        verdict,
                        style: styleTitle,
                      ),
                    ],
                  ))
                ])),
      ));
    }
    return ListView(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Rapor Semester " + widget.semester),
        centerTitle: true,
        backgroundColor: scbgreen,
      ),
      body: builder(),
    );
  }
}
