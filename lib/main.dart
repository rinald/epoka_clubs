import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'distribute.dart';
import 'subscriptions.dart';
import 'events.dart';
import 'clubs.dart';
import 'login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white
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
        '/subscriptions': (context) => Subscriptions(), // Reni & Halit
        '/events': (context) => Events(), // Albert & Erjon
        '/login': (context) => LoginPage(), // Kristjan & Rinald
        '/clubs': (context) => Clubs(), // Besjon & Arber
      },
      title: 'Epoka Clubs',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Distribute(),
    );
  }
}