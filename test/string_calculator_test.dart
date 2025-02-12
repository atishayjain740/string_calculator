import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });

  test('Empty string returns 0', () {
    expect(calculator.add(""), equals(0));
  });

  test('Single number returns the number itself', () {
    expect(calculator.add("7"), equals(7));
  });
}
