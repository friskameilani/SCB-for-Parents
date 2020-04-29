// TODO Implement this library.
import 'package:flutter/material.dart';
import '../components/nilaiAsrama.dart';

class NilaiAsramaSmt extends StatefulWidget{
  NilaiAsramaSmt(this.semester);
  final String semester;
  @override
  NilaiAsramaSmtState createState() => new NilaiAsramaSmtState();
}

class NilaiAsramaSmtState extends State<NilaiAsramaSmt>{
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);
  var nilai = AspekAsrama.setMap();

  List<Widget> list = new List<Widget>();
  List<Widget> builder(){
    print(nilai[0].aspek+" "+nilai[0].nilai.toString());
    for(int i=0; i<nilai.length; i++){
      list.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              nilai[i].aspek
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  nilai[i].nilai.toString()
                ),
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