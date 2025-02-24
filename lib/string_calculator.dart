class StringCalculator {
  int add(String numbers) {
    // For empty strings return 0
    if (numbers.isEmpty) return 0;

    // For comma and new line
    RegExp delimiterRegex = RegExp(r",|\n");

    // Check if the input starts with "//" (indicating a custom delimiter)
    if (numbers.startsWith("//")) {
      final delimiterMatch =
          RegExp(r"//(\[.*?\])+\n|//(.)\n").matchAsPrefix(numbers);
      if (delimiterMatch != null) {
        final delimiterSection = delimiterMatch.group(0)!;
        numbers = numbers.substring(delimiterSection.length);

        if (delimiterMatch.group(1) != null) {
          // Multi-character delimiters in [brackets]
          final delimiters = RegExp(r"\[(.*?)\]")
              .allMatches(delimiterSection)
              .map((m) => RegExp.escape(m.group(1)!))
              .join("|");
          delimiterRegex = RegExp(delimiters);
        } else if (delimiterMatch.group(2) != null) {
          // Single-character delimiter
          delimiterRegex = RegExp(RegExp.escape(delimiterMatch.group(2)!));
        }
      }
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

    // Calculate the sum/product using a loop.
    bool hasStar = delimiterRegex.pattern.contains('*');

    return (hasStar) ? findProduct(numberList) : findSum(numberList);
  }

  int findSum(List numberList) {
    int sum = 0;
    for (int num in numberList) {
      if (num > 1000) continue; // Do not include numbers greater than 1000

      sum += num;
    }

    return sum;
  }

  int findProduct(List numberList) {
    int product = 1;
    for (int num in numberList) {
      if (num > 1000) continue; // Do not include numbers greater than 1000

      product *= num;
    }

    return product;
  }
}
