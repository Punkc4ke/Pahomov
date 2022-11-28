import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as widget;
import 'package:pr2/data/repositori/auth_repositories_impl.dart';
import 'package:pr2/domain/usecase/auth.dart';
import 'package:pr2/screens/Admin.dart';
import 'package:pr2/screens/User.dart';
import '../domain/entity/role_entity.dart';
import 'Authorization.dart';

class Registation extends StatefulWidget {
  const Registation({super.key});

  @override
  widget.State<StatefulWidget> createState() => RegistationState();
}

class RegistationState extends widget.State<Registation> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: TextFormField(
                      controller: loginController,
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Поле обязательно к заполнению";
                        }
                        if (value.length < 5) {
                          return "Логин должен состоят хотя бы из 5 символов";
                        }
                        if (value.length > 12) {
                          return "Логин должен содержать меньше 12 символов";
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter login", border: OutlineInputBorder()),
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Поле обязательно к заполнению";
                      }
                      if (value.length < 5) {
                        return "Пароль должен состоят хотя бы из 5 символов";
                      }
                      if (value.length > 30) {
                        return "Пароль должен содержать меньше 30 символов";
                      }
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return "Пароль должен иметь хотя бы одну заглавную латинску букву";
                      }
                      if (!value.contains(RegExp(r'[0-9]'))) {
                        return "Пароль должен иметь хотя бы одну цифру";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      
                        hintText: "Enter password", border: OutlineInputBorder()),
                  )
                ],
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;

                    String login = loginController.text;
                    String password = passwordController.text;

                    Future<Either<String, bool>> result =
                        AuthRepositoriesImpl().checkLoginExists(login);
                    bool loginExitsts = false;
                    result.then((value) {
                      if (value.isRight()) {
                        final snackBar = SnackBar(
                            content: Text("Такой пользователь уже существует"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        final snackBar =
                            SnackBar(content: Text("Ошибка регистрации"));

                        String hashPass = md5.convert(utf8.encode(password)).toString();
                        Future<Either<String, bool>> result =
                            AuthRepositoriesImpl()
                                .signUp(login, hashPass);

                        result.then((value) {
                          if (value.isRight()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Authorization()));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      }
                    });
                  },
                  child: const Text("Зарегистрироваться")),
            ),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Authorization()))
                    },
                child: const Text("Назад"))
          ],
        ),
        Expanded(child: Container()),
      ],
    ));
  }
}