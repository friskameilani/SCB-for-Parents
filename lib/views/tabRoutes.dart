import 'package:flutter/material.dart';
import 'package:scbforparents/views/beranda.dart';
import 'package:scbforparents/views/profil.dart';
import 'package:scbforparents/views/opsiRapor.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    hexColor(String colorhexcode) {
      String colornew = '0xff' + colorhexcode;
      colornew = colornew.replaceAll('#', '');
      int colorint = int.parse(colornew);
      return colorint;
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/Logo-SCB_Putih.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ],
          ),
          backgroundColor: Color(hexColor('#01532F')),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            new Container(child: Beranda()),
            new Container(
              child: OpsiRapor(),
            ),
            new Container(
              height: 800,
              child: Profil(),
            ),
          ],
        ),
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              icon: new Icon(Icons.home),
              child: Text(
                'Beranda',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Tab(
              icon: new Icon(Icons.book),
              child: Text(
                'Rapor',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Tab(
              icon: new Icon(Icons.person),
              child: Text(
                'Profil',
                style: TextStyle(fontSize: 12),
              ),
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
