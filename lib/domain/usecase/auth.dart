import 'package:dartz/dartz.dart';
import 'package:pr2/core/usecase/auth_usecase.dart';
import 'package:pr2/domain/repositories/auth_repositories.dart';
import '../entity/role_entity.dart';

class Auth implements AuthUseCase<String, AuthParams>{
  Auth(this._repositories);

  final AuthRepositories _repositories;

  @override
  Future<Either<String, RoleEnum>> signIn(AuthParams params){
    return _repositories.signIn(params.login, params.password);
  }

  @override 
    Future<Either<String, bool>> signUp(AuthParams params){
      return _repositories.signUp(params.login, params.password);
    }
}

  class AuthParams {
    final String login;
    final String password;

    AuthParams({
      required this.login,
      required this.password,

    });
  }


