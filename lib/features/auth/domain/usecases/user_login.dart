import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:contacts_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserLogIn extends UseCase<dynamic, Map<String, dynamic>> {
  final AuthRepository authRepository;
  UserLogIn({required this.authRepository});

  @override
  Future<Either<Failure, dynamic>> call(Map<String, dynamic> params) async {
    return await authRepository.logIn(params);
  }
}
