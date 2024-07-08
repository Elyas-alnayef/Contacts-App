import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCurrentUserUseCase extends UseCase<dynamic,String >{
  @override
  Future<Either<Failure, dynamic>> call(String params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}