import 'package:flutter/material.dart';
import 'package:scbforparents/pages/catatanKhusus.dart';
import 'package:scbforparents/splash.dart';
import 'package:scbforparents/pages/login.dart';
import 'package:scbforparents/pages/profil.dart';
import 'package:scbforparents/pages/dashboard.dart';
import 'package:scbforparents/pages/catatanKhusus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{

        '/login' : (context)=> Login(),
        '/beranda': (BuildContext context) => Dashboard(),
        '/profil': (context)=> Profil(),
        '/dashboard': (context)=>Dashboard(),
        '/catatanKhusus': (context)=>CatatanKhusus(),

      },
    );
  }
}