import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:scbforparents/class/siswa.dart';
import 'dart:math';
import 'dart:convert';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:indonesia/indonesia.dart';

class NilaiAkademikSmt extends StatefulWidget{
  NilaiAkademikSmt(this.semester, this.nis);
  final String semester;
  final String nis;
  @override
  NilaiAkademikSmtState createState() => new NilaiAkademikSmtState();
}

class NilaiAkademikSmtState extends State<NilaiAkademikSmt>{
  
  var table = <DataRow>[];

  Future<void> _createPDF() async {
    //Membuat file PDF
    PdfDocument document = PdfDocument();

    PdfPage page = document.pages.add();
    PdfPageTemplateElement header = PdfPageTemplateElement(
      Rect.fromLTWH(0, 0, document.pages[0].getClientSize().width, 100));

    String head = """SMP Cendekia BAZNAS
    Alamat: Jl. Cirangkong No.14, Cemplang, Kec. Cibungbulang, Bogor, Jawa Barat 16630
    Telepon: (0251) 8591072


    Nama: Melan
    NIS : ${widget.nis.toString()}
    """;
    //Create the composite field with date field
    PdfCompositeField compositefields = PdfCompositeField(
        font: PdfStandardFont(PdfFontFamily.helvetica, 13),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        text: head,);

    //Add composite field in header
    compositefields.draw(header.graphics,
        Offset(0, 50 - PdfStandardFont(PdfFontFamily.helvetica, 40).height));

    //Add the header at top of the document
    document.template.top = header;

    DateTime now = DateTime.now();
    //Mebuat tabel nilai
    DataTable dataTable = DataTable(columns: const <DataColumn>[
      DataColumn(label: Text('Mata Pelajaran')),
      DataColumn(label: Text('Nilai')),
      DataColumn(label: Text('Predikat')),
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
    grid.columns[1].width = 50;
    grid.columns[2].width = 90;
    grid.style.cellPadding = PdfPaddings(left: 5, top: 5, right: 5, bottom: 5);
    grid.draw(
        page: page, bounds: const Rect.fromLTWH(0, 50, 0, 0));

    String text = """
    Bogor, ${tanggal(now)},





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

    page.graphics.drawString(
      "Created at ${now.toString()}", PdfStandardFont(PdfFontFamily.helvetica, 10),
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(
          0, 650, page.getClientSize().width, page.getClientSize().height),
      format: PdfStringFormat(
          alignment: PdfTextAlignment.left,));

    //Menyimpan file PDF
    //File('Rapor Akademik.pdf').writeAsBytes(document.save());
    List<int> bytes = document.save();

    document.dispose();

    //Mengakses penyimpanan eksternal
    final directory = await getExternalStorageDirectory();

    final path = directory.path;

    //Membuat file kosong untuk menyimpan file PDF
    File file = File('$path/Nilai Akademik.pdf');

    //Menyimpan file PDF
    await file.writeAsBytes(bytes, flush: true);

    //Membuka file PDF
    OpenFile.open('$path/Nilai Akademik.pdf');
  }

  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);

  static var matpel = [
    'Pendidikan Agama dan Budi Pekerti',
    'Pendidikan Kewarganegaraan' ,
    'Bahasa dan Sastra Indonesia' ,
    'Bahasa Inggris',
    'Matematika',
    'Ilmu Pengetahuan Alam',
    'Ilmu Pengetahuan Sosial',
    'Seni Budaya',
    'Pendidikan Jasmani, Olahraga dan Kesehatan',
    'Tahfiz Tahsin Quran',
    'Teknologi Informasi dan Komunikasi',
    'Bahasa dan Sastra Sunda',
    'Prakarya',
    'Bahasa Arab',
  ];

  String verdict(int nilai){
    String res;
    if(nilai >= 92)
      res = "A";
    else if(nilai >= 82)
      res = "B";
    else if (nilai >= 72)
      res = "C";
    else res = "D";
    return res;
  }
  

  ListView builder(var skor){
    var list = <Widget>[];
    for(int i=-1; i<matpel.length; i++){
      String namaMatpel, nilai, verdict;
      TextStyle style;
      if(i == -1){
        namaMatpel = "Mata Pelajaran";
        nilai = "Nilai";
        verdict = "Predikat";
        style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
      }
      else{
        namaMatpel = matpel[i];
        nilai = null;
        if(skor[namaMatpel] != null){  
          nilai = skor[namaMatpel].toString();
          print(nilai);
          verdict = this.verdict(skor[namaMatpel]);
        }
      }
      if(nilai != null){
        ClipOval verdictCircle = 
          ClipOval(
            child: Material(
                    color: (verdict=='A')?Colors.teal
                            :((verdict=='B')?Colors.yellow[900]
                            :((verdict=='C')?Colors.orange[900]
                            :Colors.red[800])), // button color
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text(verdict, 
                            style: TextStyle(color: Colors.white,
                                              fontWeight: FontWeight.bold),
                          )))));
        list.add(
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide()),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      namaMatpel,
                      style: style,
                    )
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          nilai,
                          style: (i==-1)?style:TextStyle(fontSize: 20),
                        ),
                        (i!=-1)?verdictCircle:Text(verdict, style: style,)
                      ],
                    )
                  )
                ]
              )
            ),
          )
        );
        if (nilai != 'Nilai')
          this.table.add(
              DataRow(cells: <DataCell>[
              DataCell(Text(namaMatpel)),
              DataCell(Text(nilai)),
              DataCell(Text(verdict))
            ]),
          );
      } 
    }
    return ListView(
      children: list,
    );
  }

  int getIdx(var listSiswa){
    int i;
    for(i=0; i < (listSiswa?.length ?? 0); i++){
      if(this.widget.nis == listSiswa[i]['nis'])
        return i;
    }
    return null;
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
        title: Text("Rapor Semester "+widget.semester),
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
                future: DefaultAssetBundle
                    .of(context)
                    .loadString('lib/models/anak.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var nilai = jsonDecode(snapshot.data.toString());
                  int idx = getIdx(nilai);
                  Siswa s = (idx != null)?new Siswa.fromJson(nilai[idx] as Map<String, dynamic>):null;
                  print(idx);
                  print(s.nilaiAkademik[int.parse(widget.semester)].nilai);
                  print("sempet disini");
                  return (idx != null && s.nilaiAkademik[int.parse(widget.semester)].nilai != null )
                  //nilai[idx]['nilaiAkademik'][int.parse(widget.semester)] ) 
                  ? builder(s.nilaiAkademik[int.parse(widget.semester)].nilai)
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
      ),
      //floatingActionButton: FloatingActionButton(
        //onPressed: _createPDF,
        //child: Text('Cetak'),
        //backgroundColor: scbgreen,
      //),
    );
  }
}