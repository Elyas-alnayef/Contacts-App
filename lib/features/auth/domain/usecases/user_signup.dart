import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/auth_repository.dart';

class UserSignUp extends UseCase<dynamic, SignUpUseCaseParameters> {
  final AuthRepository authRepository;
  UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, dynamic>> call(SignUpUseCaseParameters params) async {
    
    return await authRepository.signUp(params);
  }
}
