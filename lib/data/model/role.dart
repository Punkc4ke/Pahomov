import 'package:pr1/domain/entity/role_entity.dart';

class Role extends RoleEntity{
  int? id;
  final String role_name;

  Role({required this.role_name}) : super(role_name: role_name);

  Map<String, dynamic> ToMap(){
    return{
      'id': id,
      'role_name': role_name
    };
  }

  factory Role.toFromMap(Map<String, dynamic> json){
    return Role(role_name: json['role_name']);
  }

}