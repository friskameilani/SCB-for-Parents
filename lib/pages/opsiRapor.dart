import 'package:flutter/material.dart';
import 'akademikPilihSmt.dart';


class OpsiRapor extends StatelessWidget {
  
 @override
 Widget build(BuildContext context) {
   return Scaffold(
    body: ListView(
      children: <Widget> [
        Container(
          padding: EdgeInsets.fromLTRB(15,15,15,0),
          height: 150,
          width: double.maxFinite,
          child: new InkWell(
            onTap: () {
              print("tapped");
            },
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,5,15,15),
                child: ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                          width: 200,
                          child: Text(
                            'Akademik',
                            style: TextStyle(
                              fontSize: 25, height: 3,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Icon(
                            Icons.school,
                            color: Colors.green[500],
                            size: 100,
                          ),
                        ),
                      ],
                    ),
                  ]
                ),
              ),
            ),
          )
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15,15,15,0),
          height: 150,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15,5,15,15),
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                        width: 200,
                        child: Text(
                          'Asrama',
                          style: TextStyle(
                            fontSize: 25, height: 3
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Icon(
                          Icons.home,
                          color: Colors.green[500],
                          size: 100,
                        ),
                      ),
                    ],
                  ),
                ]
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15,15,15,0),
          height: 150,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15,10,15,15),
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                        width: 200,
                        child: Text(
                          'Catatan Khusus',
                          style: TextStyle(
                            fontSize: 25, height: 3
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Icon(
                          Icons.assignment,
                          color: Colors.green[500],
                          size: 100,
                        ),
                      ),
                    ],
                  ),
                ]
              ),
            ),
          ),
        ),
      ]
    )
   );
 }
}