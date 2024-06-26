import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:contacts_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserLogInUseCase extends UseCase<dynamic, LogInUseCaseParameters> {
  final AuthRepository authRepository;
  UserLogInUseCase({required this.authRepository});

  @override
  Future<Either<Failure, dynamic>> call(LogInUseCaseParameters params) async {
    return await authRepository.logIn(params);
  }
}

