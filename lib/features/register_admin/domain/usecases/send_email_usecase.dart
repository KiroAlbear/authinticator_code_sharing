import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';

class SendEmailUsecase extends UseCase<ApiResponseModel, String> {
  final RegisterAdminRepository repository;

  SendEmailUsecase(this.repository);

  @override
  Future<Either<Failure, ApiResponseModel>> call(String email) async {
    return await repository.sendEmail(email);
  }
}
