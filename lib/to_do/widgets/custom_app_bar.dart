import 'package:flutter/material.dart';

AppBar appBar({required String title}) => AppBar(
  iconTheme: IconThemeData(color: Colors.white),
  elevation: 0,
  backgroundColor: Colors.blue,
  title: Text(title, style: TextStyle(color: Colors.white)),
);
