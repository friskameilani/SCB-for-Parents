
import 'package:flutter/material.dart';
import 'opsiRapor.dart';
import 'nilaiAkademikSemester.dart';

class CatatanKhusus extends StatefulWidget {
  @override
  _CatatanKhususState createState() => _CatatanKhususState();
}

class _CatatanKhususState extends State<CatatanKhusus> {
  var scbgreen = Color.fromRGBO(6, 123, 84, 1.0);

  @override
  void initState() {
    super.initState();
  }
  SingleChildScrollView _prestasi() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        child: DataTable(
          columns: [

            DataColumn(
              label: Text('Tanggal'),
            ),
            DataColumn(
              label: Text('Kegiatan'),
            ),
            DataColumn(
              label: Text('Point'),
            ),
          ],
          rows: [
            DataRow(cells: [
              DataCell(
                Text("10/10/2019"),
              ),
              DataCell(
                Text(
                  "Juara II Lomba Debat Bahasa Inggris Tingkat SMP Se-Kabupaten Bogor",
                ),
              ),
              DataCell(
                Text(
                  "5",
                ),
              ),
            ]),
          ],
          ),
        ),
      );
  }

  SingleChildScrollView _pelanggaran() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('Tanggal'),
            ),
            DataColumn(
              label: Text('Kegiatan'),
            ),
            DataColumn(
              label: Text('Point'),
            ),
          ],
          rows: [
            DataRow(cells: [
              DataCell(
                Text("15/02/2020"),
              ),
              DataCell(
                Text(
                  "Berantem dengan teman sekamar",
                ),
              ),
              DataCell(
                Text(
                  "-10",
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Catatan Khusus"),
        centerTitle: true,
        backgroundColor: scbgreen,
    ),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
//                controller: _firstNameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Prestasi',
                ),
              ),
            ),
            Expanded(
              child: _prestasi(),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
//                controller: _lastNameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Pelanggaran',
                ),
              ),
            ),
            Expanded(
              child: _pelanggaran(),
            ),
            ]),
    ));
  }
}
