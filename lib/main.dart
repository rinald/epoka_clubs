import 'package:flutter/material.dart';
import 'distribute.dart';
import 'reni_halit.dart';
import 'albert_erjon.dart';
import 'kristjan_renald.dart';
import 'besjon_arber.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/reni_halit': (context) => Subscriptions(),
        '/albert_erjon': (context) => Events(),
        '/kristjan_renald': (context) => Login(),
        '/besjon_arber': (context) => Clubs(),
      },
      title: 'Epoka Clubs',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Distribute(),
    );
  }
}