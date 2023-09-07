//compatible versi terbaru
// lebar widget dan tinggi masih di atur dengan angka, ada kemungkinan stack overflow di layar yang besar
// di deploy pada smartphone samsung galxy s8+

import 'package:belajar/view/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
