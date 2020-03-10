import 'package:flutter/material.dart';
import 'package:scbforparents/pages/cardText.dart';

class ProfilCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text(
                'Data Orangtua', 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ), 
              ),
              Divider(
                color: Colors.green[800],
                height: 20,
                thickness: 1.5,
              ),
               CardText(
                 big: 'Friska Meilani',
                 small: 'Nama'
               ),
               CardText(
                 big: '081234567890', 
                 small: 'Nomor Hp'
               ),
               CardText(
                 big: 'Jalan Raya Dramaga, Dramaga, Bogor, 16680',
                 small: 'Alamat'
               ),
            ])
          )
          ),
      SizedBox(height: 16.0,),
      Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text(
                'Data Anak', 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ), 
              ),
              Divider(
                color: Colors.green[800],
                height: 20,
                thickness: 1.5,
              ),
               CardText(
                 big: 'Kipli Meilani',
                 small: 'Nama'
               ),
               CardText(
                 big: '181907020', 
                 small: 'NIS'
               ),
               CardText(
                 big: '0059105165',
                 small: 'NISN'
               ),
               CardText(
                 small:'Tempat, Tanggal Lahir' , 
                 big: 'Tangerang, 10 Mei 1999',
                 )
            ])
          )
          ),
       
      ]
      );
  }
}