import 'package:flutter/cupertino.dart';

class RoleEntity{
   int? id;
  final String role_name;

  RoleEntity({required this.role_name});

}

enum RoleEnum {admin, user}