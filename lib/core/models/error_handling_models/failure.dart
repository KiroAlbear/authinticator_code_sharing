import 'error_model.dart';

abstract class Failure {
  const Failure();

  ErrorModel toErrorModel();
}

class ServerFailure extends Failure {
  const ServerFailure();

  @override
  ErrorModel toErrorModel() {
    return const ErrorModel(message: "Something went wrong");
  }
}

class NoConnectionFailure extends Failure {
  const NoConnectionFailure();

  @override
  ErrorModel toErrorModel() {
    return const ErrorModel(message: "No Internet Connection");
  }
}

class CustomFailure extends Failure {
  final List<String>? messages;

  const CustomFailure(this.messages);

  @override
  ErrorModel toErrorModel() {
    return ErrorModel(message: messages?.first ?? "");
  }
}

class DataParsingFailure extends Failure {
  String? message;

  DataParsingFailure(this.message);

  @override
  ErrorModel toErrorModel() {
    return const ErrorModel(message: "");
  }
}

class TooManyRequestsFailure extends Failure {
  TooManyRequestsFailure();

  @override
  ErrorModel toErrorModel() {
    return const ErrorModel(message: "");
  }
}

class DataBaseFailure extends Failure {
  const DataBaseFailure();

  @override
  ErrorModel toErrorModel() {
    return const ErrorModel(message: "");
  }
}

class RefreshTokenExpiredFailure extends Failure {
  const RefreshTokenExpiredFailure();

  @override
  ErrorModel toErrorModel() {
    return const ErrorModel(message: "");
  }
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure();

  @override
  ErrorModel toErrorModel() {
    return const ErrorModel(message: "");
  }
}
