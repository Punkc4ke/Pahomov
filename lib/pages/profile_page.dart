import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firestorage/screens/signIn_screen.dart';
import 'package:firestorage/utils/firebase_util.dart';

import '../utils/message_util.dart';
import '../utils/user_util.dart';
import 'package:firestorage/models/user.dart' as models;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    loginController.text = FirebaseAuth.instance.currentUser!.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: loginController,
                        validator: (value) {
                          if (value == "") {
                            return "Поле не должны быть пустым";
                          }
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "Email"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Новый пароль"),
                      ),
                    )
                  ],
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) return;

                      if (passwordController.text != "") {
                        if (passwordController.text.length >= 6) {
                          UserUtil.instanse
                              .getUser(FirebaseAuth.instance.currentUser!.uid)
                              .then((user) {
                            if (user.password != passwordController.text) {
                              FireBaseUtils.instance
                                  .updatePassword(passwordController.text)
                                  .then((status) {
                                UserUtil.instanse.update(
                                    FirebaseAuth.instance.currentUser!.email!,
                                    user.password,
                                    FirebaseAuth.instance.currentUser!.uid);
                                if (status.isSuccess) {
                                  showMessage(
                                      "Пароль успешно обновлён", context);
                                } else {
                                  showMessage(status.errorMessage!, context);
                                }
                              });
                            }
                          });
                        } else {
                          showMessage("Пароль не может быть меньше 6 симовлов",
                              context);
                        }
                      }

                      if (FirebaseAuth.instance.currentUser!.email! !=
                          loginController.text) {
                        FireBaseUtils.instance
                            .updateEmail(loginController.text)
                            .then((status) {
                          if (status.isSuccess) {
                            UserUtil.instanse
                                .getUser(FirebaseAuth.instance.currentUser!.uid)
                                .then((user) {
                              UserUtil.instanse.update(
                                  FirebaseAuth.instance.currentUser!.email!,
                                  user.password,
                                  FirebaseAuth.instance.currentUser!.uid);
                            });
                            showMessage("Почта успешно обновлена", context);
                          } else {
                            showMessage(status.errorMessage!, context);
                          }
                        });
                      }
                    },
                    child: const Text("Сохранить изменения")),
                ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EnterScreen()));
                    },
                    child: const Text("Выйти"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}