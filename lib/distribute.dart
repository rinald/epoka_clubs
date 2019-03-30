import 'package:flutter/material.dart';
import 'distributeButton.dart';

class Distribute extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          decoration:  BoxDecoration(
            gradient:  RadialGradient(
              radius: 0.8,
              colors: [
                Colors.white,
                Colors.blueAccent,
              ],
            ),
          ),
          child: Center(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Button(text: 'Subscriptions', route: '/subscriptions'),
                 Button(text: 'Clubs', route: '/clubs'),
                 Button(text: 'Events', route: '/events'),
                 Button(text: 'Login', route: '/login'),
              ],
            ),
          ),
        )
    );
  }
}
