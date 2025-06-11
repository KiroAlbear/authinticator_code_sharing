import 'package:code_grapper/core/utils/common_validators.dart';
import 'package:test/test.dart';

void main() {
  test('isValidPassword working correctly', () {
    // test isValidPassword
    expect(CommonValidators.isValidPassword('123456'), false);
    expect(CommonValidators.isValidPassword('asdasd123'), false);
    expect(CommonValidators.isValidPassword('asdasd123@'), false);
    expect(CommonValidators.isValidPassword('Asd1236@'), true);
    expect(CommonValidators.isValidPassword('As1236@'), false);
  });
}
