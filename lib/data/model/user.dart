import 'package:pr1/domain/entity/user_entity.dart';

class Users extends UserEntity{
  int? id;
  final String login;
  final String password;
  final int id_role;


  Users({required this.login, required this.password, required this.id_role}) : super(login: login, password: password, id_role: id_role);

  Map<String, dynamic> ToMap(){
    return{
      'id': id,
      'login': login,
      'password': password,
      'id_role': id_role
    };
  }

  factory Users.toFromMap(Map<String, dynamic> json){
    return Users(login: json['login'], password: json['password'], id_role: json['id_role']);
  }

}