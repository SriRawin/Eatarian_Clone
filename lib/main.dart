import 'package:fleska_assignment/Screens/Home.dart';
import 'package:fleska_assignment/Utils/Constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fleksa Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: KprimaryYellow,
        fontFamily: "Poppins",
      ),
      home: Home(),
    );
  }
}
