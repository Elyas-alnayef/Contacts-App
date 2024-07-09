import 'package:contacts_app/core/error/failur.dart';
import 'package:dartz/dartz.dart';


import '../../../../core/usecase/no_parameter_usecase.dart';
import '../repositoies/user_repository.dart';

class GetUserInformationUseCase extends UseCase {
  final UserRepository userRepository;

  GetUserInformationUseCase({required this.userRepository});

  @override
  Future<Either<Failure, dynamic>> call() {
    return userRepository.getUserInformation();
  }
}
