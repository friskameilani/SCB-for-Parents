import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:scbforparents/components/kabarseputar_scb.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  hexColor (String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      padding: EdgeInsets.only(top: 8.0),
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/scb news.jpg'),
          AssetImage('images/scb news2.PNG'),
          AssetImage('images/scb news3.PNG'),
        ],
        autoplay: true,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 3.0,
      ),
    );

    return Scaffold(

        body: new ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(7.0),
                ),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.green,),
                title: Text('Selamat datang,\nOrang Tua Friska Meilani',),
              ),
            ),
            imageCarousel,
            new Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              child: new Text(
                "Kabar Seputar SCB",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
             Container(
               height: 380.0,
               child: KabarSeputarSCB(),),
          ],
        ),
    );
  }
}
