import 'package:contacts_app/features/auth/domain/entities/user_entity.dart';

import '../../../../core/error/failur.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> logIn();
  Future<Either<Failure, String>> signUp();
  Future<Either<Failure, String>> resetPassword();
  Future<Either<Failure, UserEntity>> fetchCurrentAuthenticatedUser();
}
