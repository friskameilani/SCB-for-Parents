// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:scbforparents/controllers/nilaiAsrama.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class NilaiAsramaSmt extends StatefulWidget {
  NilaiAsramaSmt(this.semester);
  final String semester;
  @override
  NilaiAsramaSmtState createState() => new NilaiAsramaSmtState();
}

class NilaiAsramaSmtState extends State<NilaiAsramaSmt> {
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);

  static var aspek = [
    'Tahsin',
    'Tahfiz',
    'Hafalan',
    'Hadist Tulis',
    'Hadist Lisan',
    'Mufrodat',
    'Doa dan Dzikir Tulis',
    'Doa dan Dzikir Lisan',
    'Asmaul Husna',
    'Talim',
    'Hafalan Surat Pilihan'
  ];

  final String url = 'lib/models/transkripAsrama.json';
  List<NilaiAsrama> transkripAsrama = [];
//  Map<String, int> nilaiAsrama = new Map<String, int>();

  @override
  // void initState() {
  //   loadData();
  // }

//   Future<String> loadData() async {
// //    var nis = {'nis': 'g64170089'};
// //    http.Response jsonText= await http.post(url, body: {"jenis": "prestasi"});
//     var jsonText = await rootBundle.loadString(url);
//     var dataText = json.decode(jsonText);
//     var data;
//     int i = 1;
//     print(dataText);
    // for (data in dataText) {
    //   transkripAsrama.add(new NilaiAsrama(
    //       data['nis'],
    //       data['nama'],
    //       data['nilai']));
    // }

  //   return 'success';
  // }

  String verdict(int nilai) {
    String res;
    if (nilai > 80)
      res = 'A';
    else if (nilai > 75)
      res = 'B';
    else if (nilai > 65)
      res = 'C';
    else if (nilai > 60)
      res = 'D';
    else
      res = 'E';
    return res;
  }

  List<String> verdictGenerator(Nilai x){
    List<String> ver= [];
    ver.add(this.verdict(x.tahsin));
    ver.add(this.verdict(x.tahfiz));
    ver.add(this.verdict(x.hafalan));
    ver.add(this.verdict(x.hadistTulis));
    ver.add(this.verdict(x.hadistLisan));
    ver.add(this.verdict(x.mufrodat));
    ver.add(this.verdict(x.doaDanDzikirTulis));
    ver.add(this.verdict(x.doaDanDzikirLisan));
    ver.add(this.verdict(x.asmaulHusna));
    ver.add(this.verdict(x.talim));
    ver.add(this.verdict(x.hafalanSuratPilihan));
    return ver;
  }

  ListView builder() {
    var list = <Widget>[];
    List<String> verdicts = this.verdictGenerator(transkripAsrama[0].nilai[int.parse(widget.semester)]);
    print(verdicts);
    for (int i = -1; i < aspek.length; i++) {
      String aspekPenilaian, verdict;
      TextStyle styleTitle;
      if (i == -1) {
        aspekPenilaian = "Aspek Materi Keasramaan";
        verdict = "Nilai";
        styleTitle = TextStyle(
          fontWeight: FontWeight.bold,
          color: scbgreen,
          fontSize: 16,
        );
      }
     else{
       aspekPenilaian = (aspek[i] != 'Talim')?aspek[i]:"Ta'lim";
       verdict = verdicts[i];
     }
      list.add(Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide()),
        ),
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Text(
                      aspekPenilaian,
                      style: styleTitle,
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        verdict,
                        style: styleTitle,
                      ),
                    ],
                  ))
                ])),
      ));
    }
    return ListView(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Rapor Semester " + widget.semester),
        centerTitle: true,
        backgroundColor: scbgreen,
      ),
      body: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString("lib/models/transkripAsrama.json"),
              builder: (context, snapshot) {
                // Decode the JSON
                var nilai = jsonDecode(snapshot.data.toString());
                print(snapshot.hasData);
                print(nilai);
                for(int i=0; i < (nilai?.length ?? 0); i++){
                  print(nilai[i]);
                  this.transkripAsrama.add(new NilaiAsrama.fromJson(nilai[i] as Map<String, dynamic>));
                }
                print(nilai);
                int idx = 0;
                return (snapshot.hasData) 
                ? builder()
                : Center(
                    child: Text(
                      "Belum Ada",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )
                  );
                }
      )
    );
  }
}
