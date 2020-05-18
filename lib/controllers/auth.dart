import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show base64Url, json, utf8;
import 'package:scbforparents/models/user.dart';

class Auth {
  var storage = FlutterSecureStorage();

  Future<User> fetchUser() async {
    var token = await storage.read(key: "jwt");
    var data = parseJwt(token);
    return User.fromJson(data);
  }

  getEmail() async {
    var token = await storage.read(key: "jwt");
    var data = parseJwt(token);
    var email = data['email'];
    return email;
  }

  getName() async {
    var token = await storage.read(key: "jwt");
    var data = parseJwt(token);
    var name = data['name'];
    return name;
  }

  getNis() async {
    //Code for NIS will be Here
  }

  var appToken = "11e7aea8-4394-4393-8f45-d70f893adb8c";

  final SERVER_IP = 'https://sso.kato.studio/sso';

  Future<String> ssoToken(String email, String password) async {
    // var ssotoken;
    var res = await http.post("$SERVER_IP/login",
        body: {"email": email, "password": password},
        headers: {"Content-Type": "application/x-www-form-urlencoded"});
    if (res.statusCode == 200) {
      // print(res.body);
      Map<String, dynamic> ssotoken = json.decode(res.body);
      print(ssotoken['token']);
      return jwtToken(ssotoken['token']);
    } else {
      return null;
    }
  }

  Future<String> jwtToken(String ssotoken) async {
    if (ssotoken != null) {
      var res = await http.get("$SERVER_IP/verifyToken?ssoToken=$ssotoken",
          headers: {"Authorization": "Bearer $ssotoken"});
      Map<String, dynamic> jwt = json.decode(res.body);
      print(res.body);
      // parseJwt(jwt['token']);
      print(jwt['token']);
      // parseJwt(jwt['token']);
      return jwt['token'];
    } else {
      return null;
    }
  }

  parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    print('payload =' + payload);
    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }
    print('decode' + utf8.decode(base64Url.decode(output)));
    return utf8.decode(base64Url.decode(output));
  }
}
