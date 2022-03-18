import 'package:flutter/material.dart';

const Color KprimaryYellow = Color(0xffFFEE32);
const Color KyelloLite = Color(0xffFEFCE8);
const TextStyle subHeader = TextStyle(
  fontSize: 38,
  wordSpacing: 1.6,
  fontWeight: FontWeight.w700,
);
const TextStyle paragraph = TextStyle(
  height: 1.6,
  wordSpacing: 1,
  fontSize: 20.4,
);

BoxDecoration gradientButtonDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      KprimaryYellow,
      Color(0xffFFDE16),
      Color(0xffFFD507),
    ],
  ),
);
