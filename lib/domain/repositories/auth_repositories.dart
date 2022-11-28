import 'package:dartz/dartz.dart';
import 'package:pr2/domain/entity/role_entity.dart';

abstract class AuthRepositories{
  //Авторизация пользователя
  Future<Either<String, RoleEnum>> signIn(String login, String password);
  //Регистрация пользователя
  Future<Either<String, bool>> signUp(String login, String password);

}

