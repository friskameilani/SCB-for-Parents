import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 690.0,
      child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Card(
            margin: EdgeInsets.all(10),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Data Orangtua',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Divider(
                        color: Colors.green[800],
                        height: 20,
                      ),
                      cardText('Friska Meilani', 'Nama'),
                      cardText('081234567890', 'Nomor Hp'),
                      cardText('Jalan Raya Dramaga, Dramaga, Bogor, 16680',
                          'Alamat'),
                      cardText(
                        'Laki-Laki',
                        'Jenis Kelamin',
                      ),
                      cardText(
                        'IX',
                        'Kelas',
                      ),
                      cardText(
                        'Asrama Putri Kamar 28',
                        'Asrama',
                      ),
                    ]))),
        Card(
            margin: EdgeInsets.all(10),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Data Anak',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Divider(
                        color: Colors.green[800],
                        height: 20,
                      ),
                      cardText('Kipli Meilani', 'Nama'),
                      cardText('181907020', 'NIS'),
                      cardText('0059105165', 'NISN'),
                      cardText(
                        'Tempat, Tanggal Lahir',
                        'Tangerang, 10 Mei 1999',
                      )
                    ]))),
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            onPressed: () {
              // print(data['orangtua']);
            },
            textColor: Colors.white,
            color: scbgreen,
            child: Text(
              'Keluar',
              style: TextStyle(
                  fontSize: 18),),
          ),
        ),
      ]),
    ));
  }

  Container cardText(String big, String small) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            small,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            big,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
