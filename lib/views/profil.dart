import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scbforparents/controllers/auth.dart';
import 'package:scbforparents/models/user.dart';
import 'package:scbforparents/main.dart';
import 'package:scbforparents/views/login.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  var backgroundColor = Color.fromRGBO(242, 242, 242, 1);
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);

  //Instantiate User class
  Future<User> futureuser;

  @override
  void initState() {
    //Initialize User State
    super.initState();
    //fetchUser function from Auth class
    futureuser = Auth().fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: 690.0,
            child: FutureBuilder<User>(
              future: futureuser,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(scrollDirection: Axis.vertical, children: <
                      Widget>[
                    Card(
                        margin: EdgeInsets.all(10),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 20.0, 20.0, 8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Data Orangtua',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Divider(
                                    color: Colors.green[800],
                                    height: 20,
                                  ),
                                  cardText('Friska Meilani', 'Nama'),
                                  cardText('Ibu', 'Status'),
                                  cardText('081234567890', 'Nomor Hp'),
                                  cardText(
                                      'Jalan Raya Dramaga, Dramaga, Bogor, 16680',
                                      'Alamat'),
                                ]))),
                    Card(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 20.0, 20.0, 8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Data ${snapshot.data.role}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Divider(
                                    color: Colors.green[800],
                                    height: 20,
                                  ),
                                  cardText('Melan', 'Nama'),
                                  cardText(snapshot.data.email, 'Email'),
                                  cardText(snapshot.data.nis, 'NIS'),
                                  cardText('0059105165', 'NISN'),
                                  cardText('Perempuan', 'Jenis Kelamin'),
                                  cardText(
                                    'Tangerang, 10 Mei 1999',
                                    'Tempat, Tanggal Lahir',
                                  ),
                                  cardText('IX', 'Kelas'),
                                  cardText(
                                    'Asrama Putri Kamar 28',
                                    'Asrama',
                                  ),
                                ]))),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          onPressed: () async {
                            // print(data['orangtua']);
                            print('Pressed');
                            // Auth().getnis().then((value) => print(value));
                            await storage.delete(key: "jwt");
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => Login()));
                          },
                          textColor: Colors.white,
                          color: scbgreen,
                          child: Text(
                            'Keluar',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ]);
                  } else if (snapshot.hasError) {
                    return Text("Data tidak berhasil diambil");
                  }
                  return CircularProgressIndicator();
                },
              )));
  }

  Container cardText(String big, String small) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            small,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            big,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
