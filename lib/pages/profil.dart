import 'package:flutter/material.dart';
import 'package:scbforparents/pages/profilCard.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
    hexColor (String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SCB For Parents'),
        backgroundColor: Color(hexColor('#01532F')),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProfilCard(),
      ),
    );
  }
}