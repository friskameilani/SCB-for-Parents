import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scbforparents/main.dart';

void main() => runApp(new MaterialApp(
  home: new SplashScreen(),
  routes: <String, WidgetBuilder>{
    '/main': (BuildContext context) => new MyApp()
  },
)
);

class SplashScreen extends StatefulWidget {
//  final String state;
//  SplashScreen({Key key, @required this.state}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/main');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/Logo-SCB.png",
              width: 151,
              height: 168,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Text(
              "SCB for Parents",
              style: TextStyle(
                  color: Color(hexColor('#01532F')),
                  fontSize: 33.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
