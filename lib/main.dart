import 'package:epokaclubs/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'subscriptions.dart';
import 'events.dart';
import 'clubs.dart';
import 'login.dart';

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
        '/': (context) => MyHomePage(),
        '/subscriptions': (context) => Subscriptions(), // Reni & Halit
        '/events': (context) => Events(), // Albert & Erjon
        '/clubs': (context) => MyHomePage(), // Besjon & Arber
      },
      title: 'Epoka Clubs',
      theme: ThemeData(
        primaryColor: Colors.blue[800],
      ),
    );
  }
}