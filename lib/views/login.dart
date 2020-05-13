import 'dart:convert';
import 'package:scbforparents/controllers/api.dart';
import 'package:flutter/material.dart';
import 'package:scbforparents/views/beranda.dart';
import 'package:scbforparents/views/tabRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //All Functions that are not shown inside the main app when not invoked
  //Login Function
  void signIn(String email, String password) async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};
    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    var message = body['message'];
    print('success message is $message');

    if (message == 'success') {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => Beranda()),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      print(message);
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('$message'),
          );
        },
      );
    }
  }

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
        onPressed: () {
          // setState(() {
          //   _isLoading = true;
          // });
          //Implement Login Function in Button
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => Home()),
          );
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
