import 'package:flutter/material.dart';
import 'package:scbforparents/pages/beranda.dart';
import 'package:scbforparents/pages/profil.dart';


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     hexColor (String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      body: TabBarView(
      children: [
            new Container(
             child: Beranda()
            ),
            new Container(
              color: Colors.orange,
            ),
            new Container(
              child: Profil(),
            ),
          ],
        ),
        bottomNavigationBar:  new TabBar(
  tabs: [
    Tab(
      icon: new Icon(Icons.home),
      child: Text(
        'Beranda',
        style: TextStyle(
        fontSize: 10
        ),),
    ),
    Tab(
      icon: new Icon(Icons.book),
      child: Text(
        'Rapor',
        style: TextStyle(
        fontSize: 10
        ),),
    ),
    Tab(
      icon: new Icon(Icons.person),
      child: Text(
        'Profil',
        style: TextStyle(
        fontSize: 10
        ),),
    ),
  ],
  labelColor: Color(hexColor('#01532F')),
  unselectedLabelColor: Colors.grey[700],
  indicatorSize: TabBarIndicatorSize.label,
  indicatorColor: Colors.blue,
),
  backgroundColor: Colors.white,
      ),
    );
  }
}