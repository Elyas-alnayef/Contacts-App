import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/no_parameter_usecase.dart';

import 'package:dartz/dartz.dart';

import '../repositoies/user_repository.dart';

class DeleteAllUsersUseCAse extends UseCase{
  final UserRepository userRepository;

  DeleteAllUsersUseCAse({required this.userRepository});

  @override
  Future<Either<Failure, dynamic>> call() {
    return userRepository.deleteAllUsers();
  }
}
