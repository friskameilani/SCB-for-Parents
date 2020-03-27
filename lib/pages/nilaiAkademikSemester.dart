// TODO Implement this library.
import 'package:flutter/material.dart';

class NilaiAkademikSmt extends StatefulWidget{
  NilaiAkademikSmt(this.semester);
  final String semester;
  @override
  NilaiAkademikSmtState createState() => new NilaiAkademikSmtState();
}

class NilaiAkademikSmtState extends State<NilaiAkademikSmt>{
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);

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
      body: ListView.builder(
        itemBuilder: null
      ),
    );
  }
}