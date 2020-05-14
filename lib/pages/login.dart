import 'dart:convert';
import 'package:scbforparents/network_utils/api.dart';
import 'package:flutter/material.dart';
import 'package:scbforparents/pages/beranda.dart';
import 'package:scbforparents/pages/tabRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scbforparents/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, base64, ascii;

var appToken = "11e7aea8-4394-4393-8f45-d70f893adb8c";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    //Main App
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                loginLogo(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 0.0),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        textBox(
                            'Email', 'Masukkan Email Anda', emailController),
                        textBox('Password', 'Masukkan Password Anda',
                            passwordController),
                        loginBtn(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  //Attempt to Log In Function Starts Here (Asynchronous function)
  Future<String> ssoToken(String email, String password) async {
    // var ssotoken;
    var res = await http.post("$SERVER_IP/login",
        body: {"email": email, "password": password},
        headers: {"Content-Type": "application/x-www-form-urlencoded"});
    if (res.statusCode == 200) {
      print(res.body);
      Map<String, dynamic> token = json.decode(res.body);
      // return token['token'];
      print(token['token']);
      return jwtToken(token['token']);
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
      // var token = jwt['token'];
      print(jwt['token']);
      return jwt['token'];
      // return res.redirect(url.parse(req.url).pathname);;
    } else {
      return null;
    }
  }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  //Logo
  Container loginLogo() {
    return Container(
        padding: const EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 0.0),
        child: SafeArea(
          child: Image.asset(
            "images/Logo-SCB_Hitam.png",
            width: 80,
            height: 80,
          ),
        ));
  }

  //TextFormField Controllers
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //TextFormFields
  Container textBox(String input, String hint, textcontroller) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(
            input,
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: textcontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.green)),
              hintText: hint,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
        ]));
  }

  //Login Button
  Container loginBtn() {
    return Container(
      child: RaisedButton(
        onPressed: () async {
          setState(() {
            _isLoading = true;
          });
          var email = emailController.text;
          var password = passwordController.text;
          var ssotoken = await ssoToken(email, password);
          if (ssotoken != null) {
            storage.write(key: "sso", value: ssotoken);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          } else {
            displayDialog(context, "An Error Occured",
                "No account was found matching that username and password");
            setState(() {
              _isLoading = false;
            });
          }
          //Implement Login Function in Button
          // signIn(emailController.text, passwordController.text);
        },
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0),
        ),
        child: Text(
          'Masuk',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        textColor: Colors.white,
        color: Colors.green[800],
      ),
      height: 60,
    );
  }
}
