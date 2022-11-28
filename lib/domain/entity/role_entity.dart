class RoleEntity {
  int? id;
  final String role;

  RoleEntity({required this.role});
}

enum RoleEnum { 
  anon(
    id: 0,
    role: 'Аноним',
  ),
  admin(
    id: 1, 
    role: 'Администратор',
  ),
  user(
    id: 2, 
    role: 'Клиент'
  );

  const RoleEnum({
    required this.id,
    required this.role
  });
  
  final int id;
  final String role;

}
