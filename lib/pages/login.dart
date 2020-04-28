import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
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
                  textBox('Username', 'Masukkan Usernam Anda'),
                  textBox('Password', 'Masukkan Password Anda'),
                  loginBtn(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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

  Container textBox(String input, String hint) {
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
          Navigator.pushNamed(context, '/beranda');
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
