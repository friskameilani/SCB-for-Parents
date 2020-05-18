import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scbforparents/models/humasItems.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HumasApi {
  final String url =
      'https://cdn.contentful.com/spaces/n2o2oyh78lcv/environments/master/';
  final String accessToken = 'yNw9k6la9B3Q06h04menoajN6zNllx-ifEK1E8Ia5GU';
  var image_id = '68OOvZNC2ljIu4SuJviqb4';
  Future<dynamic> getEntities() async {
    var fullUrl = url + 'entries?access_token=' + accessToken;
    var response = await http.get(fullUrl);
    Map<String, dynamic> res = json.decode(response.body);
    print(res['items']);
    print(res['items'].sys);
    return response;
  }

  // Future<dynamic> getBlogPost() async {
  //   var fullUrl =
  //       'https://cdn.contentful.com/spaces/n2o2oyh78lcv/environments/master/entries?access_token=yNw9k6la9B3Q06h04menoajN6zNllx-ifEK1E8Ia5GU&content_type=blogPost';
  //   var response = await http.get(fullUrl);
  //   var decoded = json.decode(response.body);
  //   var items = decoded['items'];
  //   // Map<String, dynamic> res = json.decode(response.body);
  //   print(items);
  // }

  Future<List<Items>> getBlogPost() async {
    List<Items> list;
    var fullUrl =
        '${url}entries?select=fields.gambarArtikel,fields.title&content_type=blogPost&access_token=${accessToken}';
    var response = await http.get(fullUrl);
    var decoded = json.decode(response.body);
    var items = decoded['items'] as List;
    print(items);
    list = items.map<Items>((json) => Items.fromJson(json)).toList();
    print("List Size: ${list.length}");
    return list;
  }

  Future<dynamic> getImageUrl() async {
    var imageIDUrl =
        'https://cdn.contentful.com/spaces/n2o2oyh78lcv/environments/master/entries?select=fields.gambarArtikel&content_type=blogPost&access_token=${accessToken}';
    var fullUrl =
        'https://cdn.contentful.com/spaces/n2o2oyh78lcv/environments/master/assets/${image_id}?select=fields.file&access_token=${accessToken}';
    var response = await http.get(fullUrl);
    var decode = json.decode(response.body);
    var urls = decode['fields']['file']['url'];
    print(urls);
  }
}
