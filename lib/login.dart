import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';

final _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _signInGoogle() async {
    _googleSignIn.signIn().then((account) {
      print(account.displayName);
      print(account.email);
      print(account.photoUrl);
      print(account.id);

      Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomePage(account),
      ));
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Spacer(flex: 1),
              Image.asset('res/img/epoka_logo.png'),
              Spacer(flex: 1),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  // side: BorderSide(
                  //   color: Colors.black,
                  //   width: 2.0,
                  // ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.person_outline),
                    Text('Sign in with Epoka Mail'),
                  ],
                ),
                onPressed: _signInGoogle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}