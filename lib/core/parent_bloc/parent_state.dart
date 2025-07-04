import 'package:equatable/equatable.dart';
import 'package:key_bridge/imports.dart';

// enum Status { initial, loading, success, empty, error }

class ParentState extends Equatable {
  Status status;

  Status savingStatus;
  String errorMessage;
  String successMessage;

  ParentState(
      {this.status = Status.loading,
      this.savingStatus = Status.initial,
      this.successMessage = "",
      this.errorMessage = ""});

  @override
  bool operator ==(Object other) {
    return other is ParentState &&
        other.status == status &&
        other.successMessage == successMessage &&
        other.savingStatus == savingStatus &&
        other.errorMessage == errorMessage;
  }

  @override
  List<Object?> get props => [status, savingStatus, errorMessage];

  @override
  int get hashCode =>
      status.hashCode ^ savingStatus.hashCode ^ errorMessage.hashCode;
}
