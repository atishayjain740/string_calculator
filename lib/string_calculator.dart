class StringCalculator {
  int add(String numbers) {
    // For empty strings return 0
    if (numbers.isEmpty) return 0;

    // Split the string into a list of strings based on comma and new line
    List<String> numberStrings = numbers.split(RegExp(r",|\n"));

    // Convert it into a list of integers
    List<int> numberList = numberStrings.map((str) => int.parse(str)).toList();

    // Calculate the sum using a loop
    int sum = 0;
    for (int num in numberList) {
      sum += num;
    }

    return sum;
  }
}
