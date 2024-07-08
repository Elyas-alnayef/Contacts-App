import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositoies/user_repository.dart';

class UpdateUserInformationUserCase extends UseCase<dynamic,UpdateUserInformationUseCaseParams>{
  @override
  Future<Either<Failure, dynamic>> call(UpdateUserInformationUseCaseParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}