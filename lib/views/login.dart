import 'package:flutter/services.dart';
import 'package:scbforparents/class/orangtua.dart';
import 'package:flutter/material.dart';
import 'package:scbforparents/views/tabRoutes.dart';
import 'package:scbforparents/controllers/auth.dart';
import 'package:scbforparents/main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  bool _isHidePassword = true;
  void _toggle() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => SystemNavigator.pop(),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }

  Orangtua user;
  @override
  Widget build(BuildContext context) {
    //Main App
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
                          pwBox('Password', 'Masukkan Password Anda',
                              passwordController),
                          loginBtn(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
            style: TextStyle(fontSize: 16),
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

  Container pwBox(String input, String hint, textcontroller) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          input,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: _isHidePassword,
          controller: textcontroller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.green)),
              hintText: hint,
              suffixIcon: GestureDetector(
                onTap: () {
                  _toggle();
                },
                child: Icon(
                  _isHidePassword ? Icons.visibility_off : Icons.visibility,
                  color: _isHidePassword ? Colors.grey : Colors.green[800],
                ),
              )),
        ),
        SizedBox(
          height: 16.0,
        ),
      ],
    ));
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
