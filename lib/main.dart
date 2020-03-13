import 'package:flutter/material.dart';
import 'package:scbforparents/splash.dart';
import 'package:scbforparents/pages/login.dart';
import 'package:scbforparents/pages/profil.dart';
import 'package:scbforparents/pages/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{

        '/login' : (context)=> Login(),
        // '/login' : (context)=> Profil(),
        '/beranda': (BuildContext context) => Dashboard(),
        '/profil': (context)=> Profil(),
        '/dashboard': (context)=>Dashboard(),
      },
    );
  }
}