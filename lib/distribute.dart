import 'package:flutter/material.dart';

class Distribute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
          child: new RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/reni_halit');
            },
            child: Text('Reni & Halit'),
      ),
        )
    );
  }
}