import 'package:contacts_app/core/error/failur.dart';

import 'package:contacts_app/features/user/domain/entities/user_entity.dart';
import 'package:contacts_app/features/user/domain/repositoies/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase/no_parameter_usecase.dart';

class GetCurrentUserUseCase extends UseCase {
  final UserRepository userRepository;

  GetCurrentUserUseCase({required this.userRepository});
  @override
  Future<Either<Failure, UserEntity>> call() {
    return userRepository.getUserInformation();
  }
}
