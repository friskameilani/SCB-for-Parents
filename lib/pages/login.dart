import 'dart:convert';
import 'package:scbforparents/network_utils/api.dart';
import 'package:flutter/material.dart';
import 'package:scbforparents/pages/beranda.dart';
import 'package:scbforparents/pages/tabRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scbforparents/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, base64, ascii;

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
                        textBox('Username', 'Masukkan Usernam Anda',
                            emailController),
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
    var res = await http.post("$SERVER_IP",
        body: {"email": email, "password": password},
        headers: {"Content-Type": "application/x-www-form-urlencoded"});
    if (res.statusCode == 200) {
      print(res.body);
      Map<String, dynamic> token = json.decode(res.body);
      return token['token'];
    } else {
      return null;
    }
  }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );
  //All Functions that are not shown inside the main app when not invoked
  //Login Function
  // void signIn(String email, String password) async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   var data = {'email': email, 'password': password};
  //   var res = await Network().authData(data, '/login');
  //   var body = json.decode(res.body);
  //   var message = body['message'];
  //   print('success message is $message');

  //   if (message == 'success') {
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.setString('token', json.encode(body['token']));
  //     localStorage.setString('user', json.encode(body['user']));
  //     Navigator.push(
  //       context,
  //       new MaterialPageRoute(builder: (context) => Beranda()),
  //     );
  //   } else {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     print(message);
  //     return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: Text('$message'),
  //         );
  //       },
  //     );
  //   }
  // }

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
