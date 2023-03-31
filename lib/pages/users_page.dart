import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestorage/models/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:firestorage/models/image.dart';
import 'package:firestorage/utils/file_util.dart';
import 'package:firestorage/utils/firestore_util.dart';
import 'package:firestorage/utils/image_util.dart';
import 'package:firestorage/utils/user_util.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_android/url_launcher_android.dart';
import '../models/user.dart';
import '../utils/firestorage_util.dart';
import 'package:path/path.dart' as p;

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UsersPageState();
}

class UsersPageState extends State<UsersPage> {
  late Stream<List<ImageFile?>> images;

  @override
  void initState() {
    images = ImageFileUtil.instanse.get(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  TextEditingController filenameController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  void showImageDialog(String filenameBase, filenameEdit, path) {
    filenameController.text = filenameEdit;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                      key: key,
                      child: TextFormField(
                        controller: filenameController,
                        validator: (value) {
                          if (value == "" || value == null) {
                            return "Имя файла не должно быть пустым";
                          }
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            if (!key.currentState!.validate()) return;
                            File file = await FileUtil.fileFromImageUrl(path);
                            final size = file.lengthSync();
                            final fileExtension = p.extension(file.path);
                            final imagefile = ImageFile(
                                size: size,
                                file: file,
                                fileExtension: fileExtension);
                            String newFileName =
                                FireStorageUtil.getFileNameByName(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    filenameController.text + fileExtension);
                            await FileUtil.updateFile(
                                filenameBase, newFileName, imagefile);
                            Navigator.of(context).pop();
                          },
                          child: Text("Сохранить")),
                      ElevatedButton(
                          onPressed: () {
                            filenameController.text = "";
                            Navigator.of(context).pop();
                          },
                          child: Text("Отмена"))
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FileUtil.uploadImage();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: StreamBuilder(
          stream: images,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return ListView(
                children: snapshot.data!.map((image) {
                  if (image != null) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(
                                  width: 200, height: 200),
                              child: Image(image: NetworkImage(image.path!)),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 4)),
                            Text("Название файла: " +
                                FileUtil.restructFileName(image.filename!)),
                            Padding(padding: EdgeInsets.only(bottom: 4)),
                            Text("Размер файла: " +
                                FileUtil.restructSize(image.size)),
                            Padding(padding: EdgeInsets.only(bottom: 4)),
                            GestureDetector(
                              onTap: () async {
                                Uri uri = Uri(path: image.path!);
                                await UrlLauncherAndroid().launch(
                                  image.path!,
                                  useSafariVC: true,
                                  useWebView: false,
                                  enableJavaScript: false,
                                  enableDomStorage: true,
                                  universalLinksOnly: false,
                                  headers: <String, String>{
                                    'my_header_key': 'my_header_value'
                                  },
                                );
                              },
                              child: Text(
                                "Ссылка: " + image.path!,
                                style: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                                    textAlign: TextAlign.center,
                              ),
                            ),
                           
                                ElevatedButton(
                                    onPressed: () {
                                      showImageDialog(
                                          image.filename!,
                                          FileUtil
                                              .restructFileNameWithOutExtension(
                                                  image.filename!),
                                          image.path!);
                                    },
                                    child: Text("Изменить название")),
                                ElevatedButton(
                                    onPressed: () async {
                                      String filename = image.filename!;
                                      FileUtil.deleteImage(filename);
                                    },
                                    child: Text("Удалить"))
                              
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
