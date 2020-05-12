// TODO Implement this library.
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:scbforparents/controllers/transkripAsrama.dart';

class NilaiAsramaSmt extends StatefulWidget{
  NilaiAsramaSmt(this.semester);
  final String semester;
  @override
  NilaiAsramaSmtState createState() => new NilaiAsramaSmtState();
}

class NilaiAsramaSmtState extends State<NilaiAsramaSmt>{
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);

  NilaiAsramaAPI nilaiAsramaAPI = null;
  static var aspek = [
    " ",
    "Tahsin",
    "Tahfiz",
    "Hafalan",
    "Hadist (Tulis)",
    "Hadist (Lisan)",
    "Mufrodat",
    "Do'a dan Dzikir (Tulis)",
    "Do'a dan Dzikir (Lisan)",
    "Asmaul Husna",
    "Ta'lim",
    "Hafalan Surat Pilihan",
    " ",
    "Barber Shop Literasi",
    "Tata Boga",
    "Sol dan Aneka Sepatu dan Sandal",
    "Pertukangan dan Elektronik",
    "Tata Busana",
    "Crafting, Sablon dan Grafiti"
  ];

  Map<String, int> nilaiAsrama = new Map<String, int>();

  void setMap(){
    for(int i=0; i<aspek.length; i++){
      var rng = Random();
      nilaiAsrama[aspek[i]] = rng.nextInt(100);
    }
    print(nilaiAsrama);
  }

  String verdict(int nilai){
    String res;
    if(nilai > 80)
      res = "A";
    else if(nilai > 75)
      res = "B";
    else if (nilai > 65)
      res = "C";
    else if (nilai > 60)
      res = "D";
    else res = "E";
    return res;
  }

  ListView builder(){
    var list = <Widget>[];
    var namaAspek = [
      "MATERI KEASRAMAAN",
      "KETERAMPILAN",
      "KEMANDIRIAN",
      "TANGGUNG JAWAB",
      "KEDISIPLINAN",
      "KERAPIHAN",
    ];
    int j=0;
    for(int i=0; i<aspek.length; i++){
      setMap();
      String aspekPenilaian, verdict;
      TextStyle styleTitle;
      if(i == 0 || i == 12){
        aspekPenilaian = "ASPEK " + namaAspek[j].toString();
        verdict = "NILAI";
        styleTitle = TextStyle(
            fontWeight: FontWeight.bold,
            color: scbgreen,
            fontSize: 16,
        );
        j++;
      }
      else{
        aspekPenilaian = aspek[i];
        verdict = this.verdict(this.nilaiAsrama[aspekPenilaian]);
      }
      list.add(
          Container(
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