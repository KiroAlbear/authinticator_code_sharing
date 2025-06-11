import 'package:equatable/equatable.dart';

abstract class TestFeatureEvent extends Equatable {
  const TestFeatureEvent();

  @override
  List<Object> get props => <Object>[];
}

class getTestFeatureEvent extends TestFeatureEvent {

  const getTestFeatureEvent();

  @override
  List<Object> get props => <Object>[];
}
