// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final _googleSignIn = GoogleSignIn();
final _firebaseAuth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // FirebaseUser _user;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signIn() async {
    _firebaseAuth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ).then((user) {
      print('Sign in sucessful.');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(user),
      ));
    }).catchError((error) {
      print('Sign in failed : $error.');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                // prefixIcon: Icon(Icons.person_outline),
              ),
              controller: _emailController,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                // prefixIcon: Icon(Icons.visibility),
              ),
              controller: _passwordController,
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: _signIn,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}