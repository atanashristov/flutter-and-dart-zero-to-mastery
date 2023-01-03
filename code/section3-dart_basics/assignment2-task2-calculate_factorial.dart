// Assignment 2: Task 2: Calculate factorial
// Dart & Flutter - Zero to Mastery [2023] + Clean Architecture on Udemy
// Author: Atanas (Tony) Hristov
//
// Prints:
// calculateFactorial(-2) => Error: Assertion failed: "negative value"
// calculateFactorial(-1) => Error: Assertion failed: "negative value"
// calculateFactorial(0) = 1
// calculateFactorial(1) = 1
// calculateFactorial(2) = 2
// calculateFactorial(3) = 6
// calculateFactorial(4) = 24
// calculateFactorial(5) = 120
// calculateFactorial(6) = 720
// calculateFactorial(7) = 5040
// calculateFactorial(8) = 40320
// calculateFactorial(9) = 362880
// calculateFactorial(10) = 3628800
// calculateFactorial(11) = 39916800
// calculateFactorial(12) = 479001600
// calculateFactorial(13) = 6227020800
// calculateFactorial(14) = 87178291200
// calculateFactorial(15) = 1307674368000
//
// Wiki: https://en.wikipedia.org/wiki/Factorial
// Gist: https://gist.github.com/atanashristov/37cc7e3ed3e2b532e34e70827e4db4fc
// DartPad: https://dartpad.dev/?id=37cc7e3ed3e2b532e34e70827e4db4fc
//
// Review:
//
// Great solution, i like that you have implemented some sort of testing in your main to calculate it for different values.
// A good point is the assert in your factorial function as well.
// I would only rename the method factorial in something like calculateFactorial or so.
//

void main() {
  for (int i = -2; i <= 15; i++) {
    try {
      print('calculateFactorial($i) = ${calculateFactorial(i)}');
    } catch (error) {
      print('calculateFactorial($i) => Error: $error');
    }
  }
}

/// Calculates factorial of [value]
/// Throws error if [value] is negative.
int calculateFactorial(int value) {
  assert(value >= 0, 'negative value');

  // Factorial of 0 is 1
  // Factorial of 1 is 1
  // Calculate factorial starting from 2 onwards
  int res = 1;
  while (value > 1) {
    res = res * value;
    value--;
  }
  return res;
}
