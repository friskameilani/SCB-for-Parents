import 'dart:convert';
import 'package:http/http.dart' as http;

class catatan {
  String nis, jenis, tanggal, kegiatan, point;

  catatan(this.nis, this.jenis, this.tanggal, this.kegiatan, this.point);

  catatan.fromJson(Map<String, dynamic> json) {
    nis = json['nis'];
    jenis = json['jenis'];
    tanggal = json['tanggal'];
    kegiatan = json['kegiatan'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nis'] = this.nis;
    data['jenis'] = this.jenis;
    data['tanggal'] = this.tanggal;
    data['kegiatan'] = this.kegiatan;
    data['point'] = this.point;
    return data;
  }
}
//class catatanList{
//  List<catatan> breeds;
//
//  catatanList({this.breeds});
//
//  factory catatanList.fromJson(List<dynamic> json) {
//    return catatanList(
//        breeds: json
//            .map((e) => catatan.fromJson(e as Map<String, dynamic>))
//            .toList());
//  }
//}