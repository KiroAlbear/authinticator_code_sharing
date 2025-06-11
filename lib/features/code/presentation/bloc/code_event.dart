import 'package:equatable/equatable.dart';

abstract class CodeEvent extends Equatable {
  const CodeEvent();

  @override
  List<Object> get props => <Object>[];
}

class requestCodeEvent extends CodeEvent {
  final String email;
  final String userCode;

  const requestCodeEvent({required this.email, required this.userCode});

  @override
  List<Object> get props => <Object>[email, userCode];
}
