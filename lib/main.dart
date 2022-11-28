import 'package:flutter/material.dart';
import 'package:pr2/core/db/data_base_helper.dart';
import 'package:pr2/screens/Authorization.dart';
import 'package:sqflite/sqflite.dart';


Future<void> main() async {
   await DataBaseHelper.instance.init().whenComplete(() {
    runApp(const App());
  });
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Authorization(),
      debugShowCheckedModeBanner: false,
    );
  }
}
