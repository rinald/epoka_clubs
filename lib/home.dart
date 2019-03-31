import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'distributeButton.dart';


class HomePage extends StatelessWidget {
  final GoogleSignInAccount _user;
  final GoogleSignIn _googleSignIn;
  HomePage(this._user, this._googleSignIn);

  @override
  Widget build(BuildContext context) {
    void _signOut() {
      _googleSignIn.signOut().then((_) {
        Navigator.pop(context);
        Navigator.pop(context);
        print('Signed out.');
      });
    }

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          // borderRadius: BorderRadius.only(
                          //   bottomLeft: Radius.circular(15.0),
                          //   bottomRight: Radius.circular(15.0),
                          // ),
                        ),
                        height: 100,
                      ),
                    )
                  ],
                ),
                Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: GoogleUserCircleAvatar(identity: _user),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 5),
                      child: Text('${_user.displayName}', 
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('${_user.email}', 
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Button(text: 'Subscriptions', route: '/subscriptions'),
            Divider(height: 5.0),
            Button(text: 'Clubs', route: '/clubs'),
            Divider(height: 5.0),
            Button(text: 'Events', route: '/events'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: RaisedButton(
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
                    Icon(Icons.exit_to_app),
                    Text('Sign out'),
                  ],
                ),
                onPressed: _signOut,
              ),
            ),
            // Divider(height: 5.0),
            // Button(text: 'Login', route: '/login'),
          ]
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: <Widget>[
          
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.error, 
                size: 100,
                color: Colors.grey,
              ),
              Text('Nothing to see'),
            ],
          ),
        ),
      ),
    );
  }
}