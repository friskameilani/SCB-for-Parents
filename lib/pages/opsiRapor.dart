import 'package:flutter/material.dart';
import 'package:scbforparents/pages/pilihSmt.dart';


class OpsiRapor extends StatelessWidget {

 @override
 Widget build(BuildContext context) {
   return Scaffold(
    body: ListView(
      children: <Widget> [
        Container(  //Akademik
          padding: EdgeInsets.fromLTRB(15,15,15,0),
          height: 150,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: new InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PilihSmt("Akademik")));
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,5,15,15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Akademik',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Flexible(
                      child: Icon(
                        Icons.school,
                        color: Colors.green[800],
                        size: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(  //Asrama
          padding: EdgeInsets.fromLTRB(15,15,15,0),
          height: 150,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: new InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PilihSmt("Asrama")));
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,5,15,15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Asrama',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Icon(
                      Icons.home,
                      color: Colors.green[800],
                      size: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(  //Catatan Khusus
          padding: EdgeInsets.fromLTRB(15,15,15,0),
          height: 150,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: new InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/catatanKhusus');
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,5,15,15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Catatan Khusus',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Icon(
                      Icons.assignment,
                      color: Colors.green[800],
                      size: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]
    )
   );
 }
}