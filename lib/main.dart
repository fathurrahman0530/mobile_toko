// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:mobile_toko/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fathur Rahman Abdullah',
      home: HomePage(),
    );
  }
}
