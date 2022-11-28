import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr2/screens/Authorization.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<StatefulWidget> createState() {
    return UserState();
  }
}

class UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Вы авторизовались за пользователя"),
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