class StringCalculator {
  int add(String numbers) {
    // For empty strings return 0
    if (numbers.isEmpty) return 0;

    // For comma and new line
    RegExp delimiterRegex = RegExp(r",|\n");

    // Check if the input starts with "//" (indicating a custom delimiter)
    if (numbers.startsWith("//")) {
      // Split the input into two parts: the delimiter definition and the numbers
      final parts = numbers.split('\n');

      // removing the "//" prefix
      String customDelimiter = parts[0].substring(2);

      // Update the delimiter regex to use the custom delimiter
      delimiterRegex = RegExp(RegExp.escape(customDelimiter));

      // Update the numbers string to exclude the delimiter definition line
      numbers = parts.sublist(1).join('\n');
    }

    // Split the string into a list of strings based on the delimiter regex.
    List<String> numberStrings = numbers.split(delimiterRegex);

    // Convert it into a list of integers
    List<int> numberList = numberStrings.map((str) => int.parse(str)).toList();

    // Finding the negative numbers
    List<int> negatives = [];
    for (int num in numberList) {
      if (num < 0) {
        negatives.add(num);
      }
    }

    // If there is any negative number throw an exception
    if (negatives.isNotEmpty) {
      throw FormatException("Negatives not allowed: ${negatives.join(", ")}");
    }

    // Calculate the sum using a loop
    int sum = 0;
    for (int num in numberList) {
      if (num > 1000) continue; // Do not include numbers greater than 1000
      sum += num;
    }

    return sum;
  }
}
