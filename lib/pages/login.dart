import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scbforparents/pages/tabRoutes.dart';
import 'package:scbforparents/network_utils/auth.dart';
import 'package:scbforparents/main.dart';

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
          var jwt = await Auth().ssoToken(email, password);

          // await ssoToken(email, password);
          if (jwt != null) {
            storage.write(key: "jwt", value: jwt);
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
