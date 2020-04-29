// TODO Implement this library.
import 'package:flutter/material.dart';
import 'dart:math';

class NilaiAkademikSmt extends StatefulWidget{
  NilaiAkademikSmt(this.semester);
  final String semester;
  @override
  NilaiAkademikSmtState createState() => new NilaiAkademikSmtState();
}

class NilaiAkademikSmtState extends State<NilaiAkademikSmt>{
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);

  static var matpel = [
    "Pendidikan Agama Islam",
    "Pendidikan Pancasila dan Kewarganegaraan",
    "Bahasa Indonesia",
    "Matematika",
    "Fisika",
    "Biologi",
    "Kimia",
    "Ilmu Pengetahuan Sosial",
    "Bahasa Arab",
    "Pendidikan Jasmani, Olahraga, dan Kesehatan",
    "Seni Budaya dan Keterampilan"
  ];

  Map<String, int> nilai= new Map<String, int>();
  
  void setMap(){
    for(int i=0; i<matpel.length; i++){
      var rng = Random();
      nilai[matpel[i]] = rng.nextInt(100);
    }
    print(nilai);
  }

  String verdict(int nilai){
    String res;
    if(nilai > 80)
      res = "Sangat Baik";
    else if(nilai > 70)
      res = "Baik";
    else if (nilai > 70)
      res = "Cukup";
    else res = "Kurang";
    return res;
  }

  ListView builder(){
    var list = <Widget>[];
    for(int i=-1; i<matpel.length; i++){
      setMap();
      String nama_matpel, nilai, verdict;
      if(i == -1){
        nama_matpel = "Mata Pelajaran";
        nilai = "Nilai";
        verdict = "Predikat";
      }
      else{
        nama_matpel = matpel[i];
        nilai = this.nilai[nama_matpel].toString();
        verdict = this.verdict(this.nilai[nama_matpel]);
      }
      list.add(
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide()),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    nama_matpel
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        nilai
                      ),
                      Text(
                        verdict
                      )
                    ],
                  )
                )
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Text("Rapor Semester "+widget.semester),
        centerTitle: true,
        backgroundColor: scbgreen,
      ),
      body: builder(),
    );
  }
}