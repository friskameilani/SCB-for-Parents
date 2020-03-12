import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(children: <Widget>[
        SizedBox(
          height: 80,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(32.0, 80.0, 32.0, 0.0),
          child: SafeArea(
            child: Image.asset("images/Logo-SCB_Hitam.png", width:80, height: 80,),
          )
        ),
        Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 80.0, 32.0, 0.0),
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800]
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField( 
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: const BorderSide(color: Colors.green)),
                    hintText: 'Masukkan Username Anda',
                  ),
                ),   
                SizedBox(height: 16.0,),
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800]
                  ),
                ),
                SizedBox(height: 10.0,),
                TextFormField( 
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    hintText: 'Masukkan Password Anda',
                  ),
                ),
                SizedBox(height: 16.0,),
                RaisedButton(
                  onPressed: (){
                      Navigator.pushNamed(context, '/beranda');
                  },
                  child: Text('Masuk'),
                  color: Colors.green[800],
                  textColor: Colors.white,
                ),
              ],
            ),
        ),
      ),
      ],),
    );
  }
}