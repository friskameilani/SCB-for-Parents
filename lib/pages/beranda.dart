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
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/scb news.jpg'),
          AssetImage('images/scb news.jpg'),
          AssetImage('images/scb news.jpg'),
        ],
        autoplay: true,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 3.0,
      ),
    );

    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(hexColor('#01532F')),
          title: Text('SCB for Parents'),),
        body: new ListView(
          children: <Widget>[
            imageCarousel,
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Text("Kabar Seputar SCB"),
            ),
            Container(
              height: 320.0,
              child: KabarSeputarSCB(),
            )
          ],
        ),
    );
  }
}
