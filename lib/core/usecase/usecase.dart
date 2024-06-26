import 'package:contacts_app/core/error/failur.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<SuccessType, Params > {
  Future<Either<Failure, SuccessType>> call(Params params);
}
