import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/subscriptions.dart';
import 'pages/events.dart';
import 'pages/clubs.dart';
import 'pages/login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue[900]
  ));
  runApp(EpokaClubs());
}

class EpokaClubs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/subscriptions': (context) => Subscriptions(), // Reni & Halit
        '/events': (context) => Events(), // Albert & Erjon
        '/clubs': (context) => Clubs(), // Besjon & Arber
      },
      title: 'Epoka Clubs',
      theme: ThemeData(
        primaryColor: Colors.blue[800],
      ),
    );
  }
}