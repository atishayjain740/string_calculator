import 'dart:io';

Future<void> runTests() async {
  print("Running all test cases...");

  final result = await Process.run('dart', ['test']);
  print(result.stdout); // test output
  print(result.stderr); // errors if any

  if (result.exitCode != 0) {
    print("Tests failed! Stopping execution.");
    exit(1); // Stop execution if tests fail
  }

  print("All tests passed!");
}

void main() async {
  await runTests(); // Run tests
}
