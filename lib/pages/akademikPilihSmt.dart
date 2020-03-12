// TODO Implement this library.
import 'package:flutter/material.dart';
import 'opsiRapor.dart';

class AkademikPilihSmt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Text("Rapor Akademik"),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Kelas VII",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.school),
                        Text(
                          "Semester I",
                          style: TextStyle(),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.school),
                        Text(
                          "Semester II",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "Kelas VIII",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Row(
                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.school),
                        Text(
                          "Semester I",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.school),
                        Text(
                          "Semester II",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "Kelas IX",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Row(
                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.school),
                        Text(
                          "Semester I",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.school),
                        Text(
                          "Semester II",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]
      ),
    );
  }
}