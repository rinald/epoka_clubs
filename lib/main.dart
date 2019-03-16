import 'package:flutter/material.dart';
import 'distribute.dart';
import 'reni_halit.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/reni_halit': (context) => Subscriptions(),
      },
      title: 'Epoka Clubs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Distribute(),
    );
  }
}