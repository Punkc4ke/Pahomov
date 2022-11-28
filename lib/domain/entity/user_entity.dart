import 'package:pr2/domain/entity/role_entity.dart';

class UserEntity{
  int? id;
  final String login;
  final String password;
  final int idRole;

  UserEntity({required this.login, required this.password, required this.idRole});
}