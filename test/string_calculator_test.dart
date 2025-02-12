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

  test('Two numbers separated by a comma return their sum', () {
    expect(calculator.add("1,2"), equals(3));
  });

  test('Handles an unknown amount of numbers', () {
    expect(calculator.add("1,2,3,4,5"), equals(15));
  });

  test('Handles new lines as delimiters', () {
    expect(calculator.add("1\n2,3"), equals(6));
  });

  test('Supports custom single-character delimiters', () {
    expect(calculator.add("//;\n1;2"), equals(3));
  });

  test('Throws exception for negative numbers', () {
    expect(() => calculator.add("1,-2,3,-4"), throwsFormatException);
  });

  test('Ignore numbers greater than 1000', () {
    expect(calculator.add("2,1001"), equals(2));
  });

  test('Supports delimiters of any length', () {
    expect(calculator.add("//[***]\n1***2***3"), equals(6));
  });

  test('Supports delimiters of any length', () {
    expect(calculator.add("//[*][%]\n1*2%3"), equals(6));
  });

  test('Supports delimiters of any length', () {
    expect(calculator.add("//[**][%%]\n1**2%%3"), equals(6));
  });
}
