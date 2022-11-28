import 'package:pr2/domain/entity/role_entity.dart';

class Role extends RoleEntity {
    int? id_role;
    late String role;

  Role({required this.role}) : super(role: role);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'role': role,
    };
  }

  factory Role.toFromMap(Map<String, dynamic> json) {
    return Role(role: json['role']);
  }
}
