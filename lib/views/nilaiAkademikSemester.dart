import 'package:flutter/material.dart';
import 'package:scbforparents/class/siswa.dart';
import 'dart:math';
import 'dart:convert';

class NilaiAkademikSmt extends StatefulWidget{
  NilaiAkademikSmt(this.semester, this.nis);
  final String semester;
  final String nis;
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
  
  // void setMap(){
  //   for(int i=0; i<matpel.length; i++){
  //     var rng = Random();
  //     nilai[matpel[i]] = rng.nextInt(100);
  //   }
  //   print(nilai);
  // }

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

  ListView builder(var skor){
    var list = <Widget>[];
    for(int i=-1; i<matpel.length; i++){
      String namaMatpel, nilai, verdict;
      TextStyle style;
      if(i == -1){
        namaMatpel = "Mata Pelajaran";
        nilai = "Nilai";
        verdict = "Predikat";
        style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
      }
      else{
        namaMatpel = matpel[i];
        nilai = skor[i].toString();
        verdict = this.verdict(skor[i]);
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
                    namaMatpel,
                    style: style,
                  )
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        nilai,
                        style: style,
                      ),
                      Text(
                        verdict,
                        style: style,
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

  int getIdx(var listSiswa){
    int i;
    for(i=0; i < (listSiswa?.length ?? 0); i++){
      if(this.widget.nis == listSiswa[i]['nis'])
        return i;
    }
    return null;
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
      body: FutureBuilder(
                future: DefaultAssetBundle
                    .of(context)
                    .loadString('lib/models/anak.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var nilai = jsonDecode(snapshot.data.toString());
                  int idx = getIdx(nilai);
                  return idx != null
                  ? builder(nilai[idx]['nilai'][widget.semester.toString()])
                  : Center(
                    child: Text(
                      "Belum Ada",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )
                  );
                }
      )
    );
  }
}