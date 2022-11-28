import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as wgt;
import 'package:pr2/data/repositori/auth_repositories_impl.dart';
import 'package:pr2/domain/usecase/auth.dart';
import 'package:flutter/material.dart';
import 'package:pr2/screens/Admin.dart';
import 'package:pr2/screens/Registration.dart';
import 'package:pr2/screens/User.dart';
import '../domain/entity/role_entity.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  wgt.State<StatefulWidget> createState() => AuthorizationState();
}

class AuthorizationState extends wgt.State<Authorization> {
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
                        if (value.length > 50) {
                          return "Логин должен содержать меньше 30 символов";
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

                    final snackBar = SnackBar(
                        content:
                            Text("Не тот пользователь"));
                    String hashPass = md5.convert(utf8.encode(password)).toString();
                    Future<Either<String, RoleEnum>> result =
                        AuthRepositoriesImpl().signIn(login, hashPass);

                    result.then((value) {
                      if (value.isRight()) {
                        RoleEnum enumResult =
                            value.getOrElse(() => RoleEnum.anon);
                        switch (enumResult) {
                          case RoleEnum.admin:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Admin()));
                            break;
                          case RoleEnum.user:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => User()));
                            break;
                          default:
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  },
                  child: const Text("Войти")),
            ),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registation()))
                    },
                child: const Text("Зарегистрироваться"))
          ],
        ),
        Expanded(child: Container()),
      ],
    ));
  }
}