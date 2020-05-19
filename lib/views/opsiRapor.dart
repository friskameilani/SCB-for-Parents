import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scbforparents/class/orangtua.dart';
import 'package:scbforparents/views/catatanKhusus.dart';
import 'package:scbforparents/views/pilihSmt.dart';
import 'package:scbforparents/class/siswa.dart';

class OpsiRapor extends StatefulWidget {
  OpsiRapor(this.user);
  Orangtua user;

  @override
  _OpsiRaporState createState() => _OpsiRaporState();
}

class _OpsiRaporState extends State<OpsiRapor> {
  String chooser(var listSiswa) {
    int i;
    for (i = 0; i < (listSiswa?.length ?? 0); i++) {
      print('sebelum cek ' + this.widget.user.namaAnak.toString());
      if (this.widget.user.namaAnak == listSiswa[i]['nama'])
        return listSiswa[i]['nis'];
    }
    return null;
  }

  Container builder(BuildContext context, var value, String siswa) {
    var icon;
    if (value == "Akademik") {
      icon = Icons.school;
    } else if (value == "Asrama") {
      icon = Icons.home;
    } else {
      icon = Icons.assignment;
    }
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      height: 120,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: new InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PilihSmt(value, siswa)));
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Flexible(
                  child: Icon(
                    icon,
                    color: Colors.green[800],
                    size: 60,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('lib/models/anak.json'),
      builder: (context, snapshot) {
        dynamic list = jsonDecode(snapshot.data.toString());
        String x = chooser(list);
        if ((x != null)) {
          return ListView(children: <Widget>[
            builder(context, "Akademik", x),
            builder(context, "Asrama", x),
            Container(
              //Catatan Khusus
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              height: 120,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: new InkWell(
                  onTap: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>CatatanKhususPage(x)));
                    print(x);
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Catatan Khusus',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.assignment,
                          color: Colors.green[800],
                          size: 60,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]);
        } else {
          return Center(
              child: Text(
            "Error",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ));
        }
      },
    ));
  }
}
