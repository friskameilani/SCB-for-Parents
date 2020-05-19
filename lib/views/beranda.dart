import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:scbforparents/components/kabarseputar_scb.dart';
import 'package:scbforparents/models/user.dart';
import 'package:scbforparents/controllers/auth.dart';
import 'package:url_launcher/url_launcher.dart';

class Beranda extends StatefulWidget {
  // Beranda(this.user);
  // final Orangtua user;
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);
  var backgroundColor = Color.fromRGBO(242, 242, 242, 1);

  Future<User> futureuser;

  @override
  void initState() {
    //Initialize User State
    super.initState();
    //fetchUser function from Auth class
    futureuser = Auth().fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/scb news.jpg'),
          AssetImage('images/scb news2.PNG'),
          AssetImage('images/scb news3.PNG'),
        ],
        autoplay: true,
        animationDuration: Duration(milliseconds: 3000),
        dotSize: 4.0,
        indicatorBgPadding: 3.0,
      ),
    );

    return Scaffold(
      body: new ListView(
        children: <Widget>[
          FutureBuilder<User>(
            future: futureuser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.green[600],
                    ),
                    title: Text(
                      'Selamat datang,\nOrang Tua Melan',
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("Data tidak berhasil diambil");
              }
              return CircularProgressIndicator();
            },
          ),
          imageCarousel,
          new Padding(
              padding: const EdgeInsets.fromLTRB(30, 10.0, 30, 5.0),
              child: new Column(
                children: [
                  new Text(
                    "Kabar Seputar SCB",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    color: scbgreen,
                    thickness: 3,
                  )
                ],
              )),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
              padding: EdgeInsets.fromLTRB(10, 12, 10, 10),
              height: 498,
              child: KabarSeputarSCB()),
          new Container(
            padding: EdgeInsets.fromLTRB(100.0, 0, 100.0, 15.0),
            child: FlatButton(
              color: scbgreen,
              splashColor: Colors.black,
              onPressed: () => launch('https://www.cendekiabaznas.sch.id'),
              child: Text('Show more'),
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
