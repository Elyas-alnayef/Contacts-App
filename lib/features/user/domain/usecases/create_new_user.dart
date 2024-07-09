import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:contacts_app/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositoies/user_repository.dart';

class CreateNewUserUseCase
    extends UseCase<dynamic, CreateNewUserUseCaseParams> {
  final UserRepository userRepository;

  CreateNewUserUseCase({required this.userRepository});
  @override
  Future<Either<Failure, UserEntity>> call(CreateNewUserUseCaseParams params) {
    return userRepository.createNewUser(params: params);
  }
}
