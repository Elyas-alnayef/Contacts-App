import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:contacts_app/features/user/domain/repositoies/user_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteUserByIdUseCas extends UseCase<dynamic, String> {
  final UserRepository userRepository;

  DeleteUserByIdUseCas({required this.userRepository});

  @override
  Future<Either<Failure, dynamic>> call(String params) {
    return userRepository.deleteUserByUserId(userId: params);
  }
}
