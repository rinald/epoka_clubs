import 'package:flutter/material.dart';
import 'distributeButton.dart';

class Distribute extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Epoka Clubs'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      
      body: Center(    
        // decoration:  BoxDecoration(
        //   gradient:  RadialGradient(
        //     radius: 0.6,
        //     colors: [
        //       Colors.blueAccent,
        //       Colors.black,
        //     ],
        //   ),
        // ),
        child: Container(
          child:  Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Button(text: 'Subscriptions', route: '/subscriptions'),
                Divider(height: 5.0),
                Button(text: 'Clubs', route: '/clubs'),
                Divider(height: 5.0),
                Button(text: 'Events', route: '/events'),
                Divider(height: 5.0),
                Button(text: 'Login', route: '/login'),
            ],
          ),
        ),
      ),
    );
  }
}
