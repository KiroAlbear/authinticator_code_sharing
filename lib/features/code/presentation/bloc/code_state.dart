import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:key_bridge/imports.dart';

part 'code_state.g.dart';

@CopyWith()
class CodeState extends ParentState {
  CodeResponseModel? codeData;

  CodeState({this.codeData});

  @override
  List<Object?> get props => [codeData];
}
