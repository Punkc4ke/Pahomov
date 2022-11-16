import 'package:flutter/material.dart';
import 'package:pr1/core/db/data_base_helper.dart';
import 'package:pr1/Screen.dart';
import 'package:sqflite/sqflite.dart';


Future<void> main() async {

  await DataBaseHelper.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}
