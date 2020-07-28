import 'package:flutter/material.dart';

Widget button(IconData _icon) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[300],
      shape: BoxShape.circle,
      // borderRadius: BorderRadius.all(Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[600],
          offset: Offset(4.0, 4.0),
          blurRadius: 15,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-4.0, -4.0),
          blurRadius: 15,
          spreadRadius: 1.0,
        )
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.grey[200],
          Colors.grey[300],
          Colors.grey[400],
          Colors.grey[500],
        ],
        // This property decides where each color should stop, ranges from 0 - 1
        stops: [0.1, 0.3, 0.8, 1.0],
      ),
    ),
    padding: EdgeInsets.all(40),
    child: Icon(
      _icon,
      color: Colors.grey[800],
    ),
  );
}

Widget tapButton(IconData _icon) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[300],
      shape: BoxShape.circle,
      // borderRadius: BorderRadius.all(Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[600],
          offset: Offset(4.0, 4.0),
          blurRadius: 15,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-4.0, -4.0),
          blurRadius: 15,
          spreadRadius: 1.0,
        )
      ],
    ),
    padding: EdgeInsets.all(40),
    child: Icon(
      _icon,
      color: Colors.grey[800],
    ),
  );
}
