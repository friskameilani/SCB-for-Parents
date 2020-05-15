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
    'Pendidikan Agama dan Budi Pekerti',
    'Pendidikan Kewarganegaraan' ,
    'Bahasa dan Sastra Indonesia' ,
    'Bahasa Inggris',
    'Matematika',
    'Ilmu Pengetahuan Alam',
    'Ilmu Pengetahuan Sosial',
    'Seni Budaya',
    'Pendidikan Jasmani, Olahraga dan Kesehatan',
    'Tahfiz Tahsin Quran',
    'Teknologi Informasi dan Komunikasi',
    'Bahasa dan Sastra Sunda',
    'Prakarya',
    'Bahasa Arab',
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
    if(nilai >= 92)
      res = "A";
    else if(nilai >= 82)
      res = "B";
    else if (nilai >= 72)
      res = "C";
    else res = "D";
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
        nilai = null;
        if(skor[namaMatpel] != null){  
          nilai = skor[namaMatpel].toString();
          verdict = this.verdict(skor[namaMatpel]);
        }
      }
      if(nilai != null){
        ClipOval verdictCircle = 
          ClipOval(
            child: Material(
                    color: (verdict=='A')?Colors.teal
                            :((verdict=='B')?Colors.yellow[900]
                            :((verdict=='C')?Colors.orange[900]
                            :Colors.red[800])), // button color
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text(verdict, 
                            style: TextStyle(color: Colors.white,
                                              fontWeight: FontWeight.bold),
                          )))));
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
                          style: (i==-1)?style:TextStyle(fontSize: 20),
                        ),
                        (i!=-1)?verdictCircle:Text(verdict, style: style,)
                      ],
                    )
                  )
                ]
              )
            ),
          )
        );
      } 
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
                  return (idx != null && nilai[idx]['nilaiAkademik'][widget.semester.toString()] != null) 
                  ? builder(nilai[idx]['nilaiAkademik'][widget.semester.toString()])
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