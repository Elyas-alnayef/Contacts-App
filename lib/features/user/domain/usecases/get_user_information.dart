import 'package:contacts_app/core/error/failur.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositoies/user_repository.dart';

class GetUserInformationByIdUseCase extends UseCase<dynamic, String> {
  final UserRepository userRepository;

  GetUserInformationByIdUseCase({required this.userRepository});

  @override
  Future<Either<Failure, UserEntity>> call(String params) {
    return userRepository.getUserInformationByUserId(userId: params);
  }
}
