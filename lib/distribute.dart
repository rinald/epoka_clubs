import 'package:flutter/material.dart';
import 'distributeButton.dart';

class Distribute extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
          decoration: new BoxDecoration(
            gradient: new RadialGradient(
              radius: 0.6,
              colors: [
                Colors.blueAccent,
                Colors.black,
              ],
            ),
          ),
          child: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Button(text: 'Subscriptions', route: '/reni_halit'),
                new Button(text: 'Clubs', route: '/besjon_arber'),
                new Button(text: 'Events', route: '/albert_erjon'),
                new Button(text: 'Login', route: '/kristjan_renald'),
              ],
            ),
          ),
        )
    );
  }
}
