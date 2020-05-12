import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;

class NilaiAsramaAPI
{
//  String nis;
//  String aspek;
//
//  NilaiAsramaAPI({this.nis, this.aspek});
//
//  factory NilaiAsramaAPI.createNilaiAsrama(Map<String, dynamic> object)
//  {
//    return NilaiAsramaAPI(
//      nis: object['nis'].toString(),
//      aspek: object['apek']
//    );
//  }
//
//  static Future<List<NilaiAsramaAPI>> getNilaiAsramaSiswa(String nis) async
//  {
//    String apiURL = "network_utils/transkripAsrama.json" + nis;
//
//    var apiResult = await http.get(apiURL);
//    var jsonObject = jsonDecode(apiResult.body);
//    List<dynamic> nilaiAsramaAPI = (jsonObject as Map<String, dynamic>)['aspek'];
//
//    List<NilaiAsramaAPI> nilaiAsramaSiswa = [];
//    for(int i=0; i< nilaiAsramaAPI.length; i++)
//      nilaiAsramaSiswa.add(NilaiAsramaAPI.createNilaiAsrama(nilaiAsramaAPI[i]));
//
//    return nilaiAsramaSiswa;
//  }

  final String url = "network_utils/transkripAsrama.json";
  List data;

  @override
  void initState(){
    this.getJsonData();
  }

  Future<NilaiAsramaAPI> getJsonData() async{
    var response = await http.get(url);
    data = jsonDecode(response.body);
    var dataAsrama = (data as Map<String, dynamic>)['aspek'];

    print(response.body);

    return dataAsrama;
  }
}