class UserEntity {
   int? id;
  late String login;
  late String password;
  late int id_role;

  UserEntity({required this.login, required this.password, required this.id_role});
}