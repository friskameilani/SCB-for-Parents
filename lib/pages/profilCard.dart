import 'package:flutter/material.dart';
import 'package:scbforparents/pages/cardText.dart';

class ProfilCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Card(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Data Orangtua',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Divider(
                      color: Colors.green[800],
                      height: 20,
                    ),
                    CardText(big: 'Friska Meilani', small: 'Nama'),
                    CardText(big: '081234567890', small: 'Nomor Hp'),
                    CardText(
                        big: 'Jalan Raya Dramaga, Dramaga, Bogor, 16680',
                        small: 'Alamat'),
                    CardText(
                      big: 'Laki-Laki',
                      small: 'Jenis Kelamin',
                    ),
                    CardText(
                      big: 'IX',
                      small: 'Kelas',
                    ),
                    CardText(
                      big: 'Asrama Putri Kamar 28',
                      small: 'Asrama',
                    ),
                  ]))),
      SizedBox(
        height: 16.0,
      ),
      Card(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Data Anak',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Divider(
                      color: Colors.green[800],
                      height: 20,
                    ),
                    CardText(big: 'Kipli Meilani', small: 'Nama'),
                    CardText(big: '181907020', small: 'NIS'),
                    CardText(big: '0059105165', small: 'NISN'),
                    CardText(
                      small: 'Tempat, Tanggal Lahir',
                      big: 'Tangerang, 10 Mei 1999',
                    )
                  ]))),
      Container(
        padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          child: Text(
            'Keluar',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          textColor: Colors.white,
          color: Colors.green[800],
        ),
        height: 80.0,
      ),
    ]);
  }
}
