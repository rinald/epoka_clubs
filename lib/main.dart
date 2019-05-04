import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/index.dart';

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
        '/subscriptions': (context) => SubscriptionsPage(), // Reni & Halit
        '/events': (context) => EventsPage(), // Albert & Erjon
        '/clubs': (context) => ClubsPage(), // Besjon & Arber
      },
      title: 'Epoka Clubs',
      theme: ThemeData(
        primaryColor: Colors.blue[800],
      ),
    );
  }
}