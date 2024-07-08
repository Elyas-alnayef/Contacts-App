import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositoies/user_repository.dart';

class CreateNewUserUseCase extends UseCase<dynamic,CreateNewUserUseCaseParams>{
  @override
  Future<Either<Failure, dynamic>> call(CreateNewUserUseCaseParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}