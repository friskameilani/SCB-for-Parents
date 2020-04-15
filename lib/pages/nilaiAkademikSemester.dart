// TODO Implement this library.
import 'package:flutter/material.dart';
import '../components/nilaiAkademik.dart';

class NilaiAkademikSmt extends StatefulWidget{
  NilaiAkademikSmt(this.semester);
  final String semester;
  @override
  NilaiAkademikSmtState createState() => new NilaiAkademikSmtState();
}

class NilaiAkademikSmtState extends State<NilaiAkademikSmt>{
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);
  var nilai = Siswa.setMap();

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
  List<Widget> list = new List<Widget>();
  List<Widget> builder(){
    for(int i=0; i<nilai.length; i++){
      list.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              nilai[i].matpel
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  nilai[i].nilai.toString()
                ),
                Text(
                  verdict(nilai[i].nilai)
                )
              ],
            )
          ]
        )
      );
    }
    return list;
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
        title: Text("Rapor "+widget.semester),
        centerTitle: true,
        backgroundColor: scbgreen,
      ),
      body: ListView(
        children: builder(),
      )
    );
  }
}