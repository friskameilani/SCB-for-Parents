import 'package:flutter/material.dart';
import 'package:scbforparents/network_utils/auth.dart';
import 'package:scbforparents/pages/beranda.dart';
import 'package:scbforparents/pages/catatanKhusus.dart';
import 'package:scbforparents/splash.dart';
import 'package:scbforparents/pages/login.dart';
import 'package:scbforparents/pages/profil.dart';
import 'package:scbforparents/pages/tabRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;

const SERVER_IP = 'https://sso.kato.studio/sso';
final storage = FlutterSecureStorage();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new FutureBuilder(
          future: jwtOrEmpty,
          builder: (context, snapshot) {
            print(snapshot.hasData);
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if (snapshot.data != "") {
              var jwt = snapshot.data;
              // var jwt = str.split(".");
              print('jwt = ' + jwt);
              print(DateTime.now());
              var payload = Auth().parseJwt(jwt);
              print(DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000));
              if (DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000)
                  .isAfter(DateTime.now())) {
                return Home();
                //SplashScreen-nya mengarah ke home
                // return SplashScreen(state: 'home');
              } else {
                return Login();
                //SplashScreen-nya mengarah ke login
                // return SplashScreen(state: 'login');
              }
            } else {
              return Login();
            }
          }),
      routes: <String, WidgetBuilder>{
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/beranda': (BuildContext context) => Beranda(),
        '/profil': (context) => Profil(),
        '/catatanKhusus': (context) => CatatanKhusus(),
      },

      // home: SplashScreen(),
      // // home: CheckAuth(),
      // routes: <String, WidgetBuilder>{
      //   //Untuk sementara ubah dulu '/login': (context) => Login(), ke '/login': (context) => Dashboard(),
      //   //Kecuali kalian mau coba fitur login pake server lokal, rest API-nya bisa di donlot di github gw
      //   '/login': (context) => Login(),
      //   '/home': (context) => Home(),
      //   '/beranda': (BuildContext context) => Beranda(),
      //   '/profil': (context) => Profil(),
      //   '/catatanKhusus': (context) => CatatanKhusus(),
      // },
    );
  }
}
