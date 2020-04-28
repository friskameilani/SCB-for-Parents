import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:scbforparents/pages/beranda.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

  signIn(String email, String password) async {
    // print('$email $password');
    Map data = {
      email: email,
      password: password,
    };
    var jsonResponse = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(
      "http://localhost:8000/api/login",
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: data,
    );
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Beranda()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Cannot Connect'),
          );
        },
      );
    }
  }

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

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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

  Container loginBtn() {
    return Container(
      child: RaisedButton(
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          signIn(emailController.text, passwordController.text);

          // //Testing Retrieve Texts
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       content:
          //           Text('${emailController.text} ${passwordController.text}'),
          //     );
          //   },
          // );
          // Navigator.pushNamed(context, '/beranda');
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
