
import 'package:contacts_app/core/error/failur.dart';
import 'package:contacts_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class DeleteUserByIdUseCas extends UseCase<dynamic,int>{
  @override
  Future<Either<Failure, dynamic>> call(int params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}