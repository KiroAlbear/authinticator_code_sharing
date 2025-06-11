class ServerException implements Exception {}

class UnauthorizedException implements Exception {}

class TooManyRequestsException implements Exception {
  TooManyRequestsException();
}

class RefreshTokenExpiredException implements Exception {}

class NoConnectionException implements Exception {}


class DataParsingException implements Exception {
  String? message;
  DataParsingException({this.message});
}

class CustomException implements Exception {
  final List<String>? message;
  CustomException({
    required this.message,
  });
}
