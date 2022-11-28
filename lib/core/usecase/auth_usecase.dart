import 'package:dartz/dartz.dart';
import 'package:pr2/domain/entity/role_entity.dart';

abstract class AuthUseCase<String, Params>{
    Future<Either<String, RoleEnum>> signIn(Params params);
    Future<Either<String, bool>> signUp(Params params);
}