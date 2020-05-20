import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scbforparents/class/orangtua.dart';
import 'package:scbforparents/views/beranda.dart';
import 'package:scbforparents/views/catatanKhusus.dart';
import 'package:scbforparents/views/login.dart';
import 'package:scbforparents/views/profil.dart';
import 'package:scbforparents/views/tabRoutes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'controllers/auth.dart';

const SERVER_IP = 'https://sso.kato.studio/sso';
final storage = FlutterSecureStorage();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Orangtua user = new Orangtua(
  //   nama: "Friska Meilani",
  //   nomorHp: "081234567890",
  //   alamat: "Jalan Raya Dramaga, Dramaga, Bogor, 16680",
  //   status: "Ibu",
  //   namaAnak: "Kipli"
  // );
  // Future<Orangtua> loadJson(BuildContext context) async {
  //   String data = await DefaultAssetBundle.of(context).loadString('lib/models/orangtua.json');
  //   final ortu = Map<String, dynamic>.from(jsonDecode(data));
  //   this.user = (Orangtua.fromJson(ortu));
  //   return this.user;
  // }
  @override
  // Orangtua getter(AsyncSnapshot<Orangtua> snapshot) {
  //   return snapshot.data;
  // }

  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;

    // @override
    // Widget build(BuildContext context) {
    //   return ChangeNotifierProvider(
    //     create: (_) {
    //       return themeChangeProvider;
    //     },
    //     child: Consumer<DarkThemeProvider>(
    //         builder: (BuildContext context, value, Widget child) {
    //       return FutureBuilder(
    //         builder: (context, snapshot) {
    //           return MaterialApp(
    //             debugShowCheckedModeBanner: false,
    //             theme: Styles.themeData(themeChangeProvider.darkTheme, context),
    //             home: SplashScreen(),
    //             // home: Home(),
    //             routes: <String, WidgetBuilder>{
    //               //Untuk sementara ubah dulu '/login': (context) => Login(), ke '/login': (context) => Dashboard(),
    //               //Kecuali kalian mau coba fitur login pake server lokal, rest API-nya bisa di donlot di github gw
    //               // '/login': (context) => Login(),
    //               '/login': (context) => Home(this.user),
    //               '/beranda': (BuildContext context) => Beranda(this.user),
    //               '/profil': (context) => Profil(),
    //               '/catatanKhusus': (context) => CatatanKhusus(),
    //             },
    //           );
    //         },
    //       );
    //     }),
    //   );
    // }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        backgroundColor: Colors.black,
      ),
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
                //========================================================================//
                //HAVEN'T BEEN TESTED SO IDK IF WE CAN USE THIS YET
                if (storage.read(key: "jwt") != null) {
                  storage.delete(key: "jwt");
                }
                //=======================================================================//
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
        '/beranda': (BuildContext context) => Beranda(),
        '/profil': (context) => Profil(),
        '/catatanKhusus': (context) => CatatanKhusus(),
      },
    );
  }
}
