import 'dart:convert';

import 'package:pr2/domain/entity/role_entity.dart';
import 'package:pr2/domain/entity/user_entity.dart';

class User extends UserEntity {
  int? id; 

  User({required super.login, required super.password, required super.idRole});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'password': password,
      'id_role': idRole,
    };
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
        login: json['login'],
        password: json['password'],
        idRole: RoleEnum.values
            .firstWhere((element) => element.id == (json['id_role'] as int))
            .id);
  }
}
