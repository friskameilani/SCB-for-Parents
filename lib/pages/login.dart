import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      Column(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150.0,
          color: Colors.green[800],
          child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 48.0, 32.0, 0.0),
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                  )
                )
              )
        ),
        Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
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
                hintText: 'Masukan Username Anda',
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
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
              
                hintText: 'Masukan Password Anda',
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
      ],)
      );
  }
}