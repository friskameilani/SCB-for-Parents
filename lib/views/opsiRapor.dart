import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scbforparents/class/orangtua.dart';
import 'package:scbforparents/views/pilihSmt.dart';
import 'package:scbforparents/class/siswa.dart';

class OpsiRapor extends StatelessWidget {
  OpsiRapor(this.user);
  Orangtua user;

  Siswa chooser(var snapshot){
    var listSiswa = jsonDecode(snapshot.data.toString());
    int i;
    for(i=0; i<snapshot.length; i++){
      if(this.user.namaAnak == listSiswa[i]['nama'])
        return listSiswa[i];
    }
  }

  Container builder(BuildContext context, var value, Siswa siswa) {
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PilihSmt(value, siswa)));
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
            if(chooser(snapshot) != null){
              return ListView(children: <Widget>[
                builder(context, "Akademik", chooser(snapshot)),
                builder(context, "Asrama", chooser(snapshot)),
                Container(
                  //Catatan Khusus
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  height: 120,
                  width: double.maxFinite,
                  child: Card(
                    elevation: 5,
                    child: new InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/catatanKhusus');
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
            }
          },
        ));
  }
}
