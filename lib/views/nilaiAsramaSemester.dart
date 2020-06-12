import 'package:flutter/material.dart';
import 'package:scbforparents/controllers/nilaiAsrama.dart';
import 'dart:convert';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class NilaiAsramaSmt extends StatefulWidget {
  NilaiAsramaSmt(this.semester);
  final String semester;
  @override
  NilaiAsramaSmtState createState() => new NilaiAsramaSmtState();
}

class NilaiAsramaSmtState extends State<NilaiAsramaSmt> {
  
  var table = <DataRow>[];

  Future<void> _createPDF() async {
    //Membuat file PDF
    PdfDocument document = PdfDocument();

    PdfPage page = document.pages.add();
    DateTime now = DateTime.now();
    //Mebuat tabel nilai
    DataTable dataTable = DataTable(columns: const <DataColumn>[
      DataColumn(label: Text('Aspek Materi Keasramaan', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Predikat', style: TextStyle(fontWeight: FontWeight.bold),)),
      ], rows: this.table
    );

    //Membuat PdfGrid
    PdfGrid grid = PdfGrid();
    PdfGridStyle gridStyle = PdfGridStyle(
      cellSpacing: 2,
      cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
    );
    grid.rows.applyStyle(gridStyle);
    grid.dataSource = dataTable;
    grid.columns[1].width = 70;
    grid.style.cellPadding = PdfPaddings(left: 5, top: 5, right: 5, bottom: 5);
    grid.draw(
        page: page, bounds: const Rect.fromLTWH(0, 0, 0, 0));

    String text = """
    Bogor, ${DateFormat('dd MMM yyyy').format(now)},





    Kepala Sekolah SMP Cendekia BAZNAS
    """;
    page.graphics.drawString(
      text, PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(
          0, 550, page.getClientSize().width, page.getClientSize().height),
      format: PdfStringFormat(
          alignment: PdfTextAlignment.right,
          paragraphIndent: 35));


    //Menyimpan file PDF
    //File('Rapor Asrama.pdf').writeAsBytes(document.save());
    List<int> bytes = document.save();

    document.dispose();

    //Mengakses penyimpanan eksternal
    final directory = await getExternalStorageDirectory();

    final path = directory.path;

    //Membuat file kosong untuk menyimpan file PDF
    File file = File('$path/Nilai Asrama.pdf');

    //Menyimpan file PDF
    await file.writeAsBytes(bytes, flush: true);

    //Membuka file PDF
    OpenFile.open('$path/Nilai Asrama.pdf');
  }
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
    List<String> verdicts = this.verdictGenerator(transkripAsrama[0].nilai[int.parse(widget.semester)-1]);
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
       this.table.add(
          DataRow(cells: <DataCell>[
          DataCell(Text(aspekPenilaian)),
          DataCell(Text(verdict))
        ]),
      );
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

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.file_download),
            tooltip: 'Simpan',
            onPressed: _createPDF,
          )
        ],
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
                print((int.parse(widget.semester)-1).toString()+"  "+transkripAsrama[0].nilai.length.toString());
                return (int.parse(widget.semester)-1 < this.transkripAsrama[0].nilai.length) 
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
