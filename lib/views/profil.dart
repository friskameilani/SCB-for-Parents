import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scbforparents/class/darkmode.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  var backgroundColor = Color.fromRGBO(242, 242, 242, 1);
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    themeChange.darkTheme;

    return Scaffold(
      backgroundColor: backgroundColor,
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
                      cardText('Rachel Vennya', 'Nama'),
                      cardText('Ibu', 'Status'),
                      cardText('081234567890', 'Nomor Hp'),
                      cardText('Jalan Raya Dramaga, Dramaga, Bogor, 16680',
                          'Alamat'),
                    ]))),
        Card(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                      cardText('Xabiru', 'Nama'),
                      cardText('181907020', 'NIS'),
                      cardText('0059105165', 'NISN'),
                      cardText('Laki-laki', 'Jenis Kelamin'),
                      cardText(
                        'Tangerang, 10 Mei 1999',
                        'Tempat, Tanggal Lahir',
                      ),
                      cardText('IX', 'Kelas'),
                      cardText(
                        'Asrama Putra Kamar 28',
                        'Asrama',
                      ),
                    ]))),
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: RaisedButton(
            onPressed: () {
              if (themeChange.darkTheme == true) {
                themeChange.darkTheme = false;
              } else if (themeChange.darkTheme == false) {
                themeChange.darkTheme = true;
              }
            },
            color: scbgreen,
            textColor: Colors.white,
            child: Text(
              'Ganti Mode Warna',
              style: TextStyle(fontSize: 18),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
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
              style: TextStyle(fontSize: 18),
            ),
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
