import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestorage/models/status.dart';
import 'package:firestorage/models/user.dart' as models;
import 'package:firestorage/utils/firestore_util.dart';
import 'package:firestorage/models/user.dart';

class UserUtil {
  static UserUtil get instanse => UserUtil();

  CollectionReference<Map<String, dynamic>> get userCollection =>
      FireStoreUtil.firestoreUtil.collection("users");

  Future<Status> create(String userName, String password, String uid) async {
    return userCollection
        .doc(uid)
        .set(models.User(userName: userName, password: password).toJson())
        .then((value) => Status())
        .catchError((error) => Status(errorMessage: error));
  }

  Stream<List<models.User>> get() {
    return userCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => models.User.fromJson(doc.data())).toList());
  }

  Future<models.User> getUser(String uid) async {
    final data = await userCollection.doc(uid).get().then((DocumentSnapshot documentSnapshot) => {
      documentSnapshot.data() as Map<String, dynamic>
    });
    Map<String, dynamic> firstUser = data.first;
    models.User user = models.User(userName: firstUser["userName"], password: firstUser["password"]);
    return user;
  }

  Future<Status> update(String userName, String password, String uid) async {
    return userCollection
        .doc(uid)
        .set(models.User(userName: userName, password: password).toJson())
        .then((value) => Status())
        .catchError((error) => Status(errorMessage: error));
  }

  Future<Status> delete(String uid) async {
    return userCollection
        .doc(uid)
        .delete()
        .then((value) => Status())
        .catchError((error) => Status(errorMessage: error));
  }
}