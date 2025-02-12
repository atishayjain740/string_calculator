class StringCalculator {
  int add(String numbers) {
    return numbers.isEmpty ? 0 : int.parse(numbers);
  }
}
