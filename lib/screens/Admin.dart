import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Authorization.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<StatefulWidget> createState() {
    return AdminState();
  }
}

class AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Вы авторизовались за админа"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Authorization()));
                },
                child: const Text("Выйти"))
          ],
        ),
      ]),
    );
  }
}