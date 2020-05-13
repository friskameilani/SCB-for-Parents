import 'package:flutter/material.dart';
import 'package:scbforparents/views/beranda.dart';
import 'package:scbforparents/views/catatanKhusus.dart';
import 'package:scbforparents/splash.dart';
import 'package:scbforparents/views/login.dart';
import 'package:scbforparents/views/profil.dart';
import 'package:scbforparents/views/tabRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      // home: CheckAuth(),
      routes: <String, WidgetBuilder>{
        //Untuk sementara ubah dulu '/login': (context) => Login(), ke '/login': (context) => Dashboard(),
        //Kecuali kalian mau coba fitur login pake server lokal, rest API-nya bisa di donlot di github gw
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/beranda': (BuildContext context) => Beranda(),
        '/profil': (context) => Profil(),
        '/catatanKhusus': (context) => CatatanKhusus(),
      },
    );
  }
}
// =========================================================================================================== //
//Code to be used Later on (Jangan Dihapus yak!)
//Code ini gabisa diapa2in kecuali di invoke kok

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = Home();
    } else {
      child = Login();
    }
    return Scaffold(
      body: child,
    );
  }
}
// =========================================================================================================== //
