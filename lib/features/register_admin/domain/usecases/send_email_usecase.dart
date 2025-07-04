import 'package:dartz/dartz.dart';
import 'package:key_bridge/imports.dart';

class SendEmailUsecase extends UseCase<ApiResponseModel, String> {
  final RegisterAdminRepository repository;

  SendEmailUsecase(this.repository);

  @override
  Future<Either<Failure, ApiResponseModel>> call(String email) async {
    return await repository.sendEmail(email);
  }
}
