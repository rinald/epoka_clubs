// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final _googleSignIn = GoogleSignIn();
final _firebaseAuth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // FirebaseUser _user;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signUp() async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (user != null) {
      print('Sign up successful.');
    } else {
      print('Sign up failed.');
    }
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
              'Register',
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
              child: Text('Register'),
              onPressed: _signUp,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}