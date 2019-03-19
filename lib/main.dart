import 'package:flutter/material.dart';
import 'distribute.dart';
import 'subscriptions.dart';
import 'events.dart';
import 'clubs.dart';
import 'authentication/login.dart';
import 'authentication/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/subscriptions': (context) => Subscriptions(), // Reni & Halit
        '/events': (context) => Events(), // Albert & Erjon
        '/login': (context) => LoginPage(), // Kristjan & Rinald
        '/register': (context) => RegisterPage(), // Kristjan & Rinald
        '/clubs': (context) => Clubs(), // Besjon & Arber
      },
      title: 'Epoka Clubs',
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      // ),
      home: Distribute(),
    );
  }
}