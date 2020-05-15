import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scbforparents/class/orangtua.dart';
import 'package:scbforparents/views/beranda.dart';
import 'package:scbforparents/views/catatanKhusus.dart';
import 'package:scbforparents/splash.dart';
import 'package:scbforparents/views/login.dart';
import 'package:scbforparents/views/profil.dart';
import 'package:scbforparents/views/tabRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'class/darkmode.dart';
import 'class/themedata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  Orangtua user = new Orangtua(
    nama: "Friska Meilani",
    nomorHp: "081234567890",
    alamat: "Jalan Raya Dramaga, Dramaga, Bogor, 16680",
    status: "Ibu",
    namaAnak: "Kipli"
  );
  Future<Orangtua> loadJson(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString('lib/models/orangtua.json');
    final ortu = Map<String, dynamic>.from(jsonDecode(data));
    this.user = (Orangtua.fromJson(ortu));
    return this.user;
  }
  @override
  void initState() {
    // super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  Orangtua getter(AsyncSnapshot<Orangtua> snapshot) {
    return snapshot.data;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget child) {
        return FutureBuilder(
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: SplashScreen(),
              // home: Home(),
              routes: <String, WidgetBuilder>{
                //Untuk sementara ubah dulu '/login': (context) => Login(), ke '/login': (context) => Dashboard(),
                //Kecuali kalian mau coba fitur login pake server lokal, rest API-nya bisa di donlot di github gw
                // '/login': (context) => Login(),
                '/login': (context) => Home(this.user),
                '/beranda': (BuildContext context) => Beranda(this.user),
                '/profil': (context) => Profil(),
                '/catatanKhusus': (context) => CatatanKhusus(),
              },
            );
          },
        );
      }),
    );
  }

  // return MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   theme: Styles.themeData(themeChangeProvider.darkTheme, context),
  //   // home: SplashScreen(),
  //   home: Home(),
  //   routes: <String, WidgetBuilder>{
  //     //Untuk sementara ubah dulu '/login': (context) => Login(), ke '/login': (context) => Dashboard(),
  //     //Kecuali kalian mau coba fitur login pake server lokal, rest API-nya bisa di donlot di github gw
  //     // '/login': (context) => Login(),
  //     '/home': (context) => Home(),
  //     '/beranda': (BuildContext context) => Beranda(),
  //     '/profil': (context) => Profil(),
  //     '/catatanKhusus': (context) => CatatanKhusus(),
  //   },
  // );
  // }
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
    } else {
      child = Login();
    }
    return Scaffold(
      body: child,
    );
  }
}
// =========================================================================================================== //
