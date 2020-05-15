import 'package:flutter/material.dart';
import 'package:scbforparents/views/pilihSmt.dart';

class OpsiRapor extends StatelessWidget {
  var backgroundColor = Color.fromRGBO(242, 242, 242, 1);
  Container builder(BuildContext context, var value) {
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
                MaterialPageRoute(builder: (context) => PilihSmt(value)));
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
      backgroundColor: backgroundColor,
        body: ListView(children: <Widget>[
          builder(context, "Akademik"),
          builder(context, "Asrama"),
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
    ]));
  }
}
