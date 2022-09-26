import 'package:flutter/material.dart';
import 'package:pr1/MindDeepRelax.dart';
import 'package:pr1/Medinow.dart';
import 'package:pr1/ASongOfMoon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ASongOfMoon(),
    );
}
}
