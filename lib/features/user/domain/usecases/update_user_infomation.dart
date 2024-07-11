import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:contacts_app/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositoies/user_repository.dart';

class UpdateUserInformationUserCase
    extends UseCase<dynamic, UpdateUserInformationUseCaseParams> {
  final UserRepository userRepository;

  UpdateUserInformationUserCase({required this.userRepository});

  @override
  Future<Either<Failure, UserEntity>> call(
      UpdateUserInformationUseCaseParams params) {
    return userRepository.updateUserInfromation(params: params);
  }
}
