import 'package:flutter/material.dart';
import 'package:scbforparents/pages/beranda.dart';
import 'package:scbforparents/splash.dart';
import 'package:scbforparents/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/login' : (context)=> Login(),
        '/beranda': (BuildContext context) => Beranda(),
      },
    );
  }
}