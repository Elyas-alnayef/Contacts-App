import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase/no_parameter_usecase.dart';
import '../repositoies/user_repository.dart';

class GetAllUsersUseCase extends UseCase {
  final UserRepository userRepository;

  GetAllUsersUseCase({required this.userRepository});

  @override
  Future<Either<Failure, List<UserEntity>>> call() {
    return userRepository.getAllUsers();
  }
}
