import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  Button({
    this.text, this.route
  });
  final String text;
  final String route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        Navigator.pushNamed(context, route);
      },

      child: ListTile (
        
        // color: Colors.black54,
        title: Text(
          text,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        // onPressed: () {
        //   Navigator.pushNamed(context, route);
        // },
      ),
    );
  }
}