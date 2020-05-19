import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scbforparents/class/orangtua.dart';
import 'package:scbforparents/controllers/auth.dart';
import 'package:scbforparents/models/user.dart';
import 'package:scbforparents/views/beranda.dart';
import 'package:scbforparents/views/profil.dart';
import 'package:scbforparents/views/opsiRapor.dart';

// class Home extends StatelessWidget {
//   Home(this.user);
// final Orangtua user;

// import 'package:scbforparents/pages/beranda.dart';
// import 'package:scbforparents/pages/profil.dart';
// import 'package:scbforparents/pages/opsRapor.dart';
// import 'package:scbforparents/models/user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<User> futureuser;

  @override
  void initState() {
    //Initialize User State
    super.initState();
    //fetchUser function from Auth class
    futureuser = Auth().fetchUser();
  }

  Orangtua user = new Orangtua(
      nama: "Friska Meilani",
      nomorHp: "081234567890",
      alamat: "Jalan Raya Dramaga, Dramaga, Bogor, 16680",
      status: "Ibu",
      namaAnak: "Kipli");

  @override
  Widget build(BuildContext context) {
    var scbgreen2 = Color.fromRGBO(1, 83, 47, 1);

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
          backgroundColor: scbgreen2,
        ),
        body: FutureBuilder<User>(
              future: futureuser,
              builder: (context, snapshot) {
                return (snapshot.hasData) ? TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    new Container(child: Beranda()),
                    new Container(
                      child: OpsiRapor(snapshot.data.name),
                    ),
                    new Container(
                      height: 800,
                      child: Profil(),
                    ),
                  ],
                ):Center(child: Text("Terjadi Kesalahan: "+snapshot.data.name),);
              }
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
          labelColor: Colors.green[700],
          unselectedLabelColor: Colors.grey[700],
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.transparent,
        ),
        // backgroundColor: darktheme ? Colors.white : Colors.black,
      ),
    );
  }
}
