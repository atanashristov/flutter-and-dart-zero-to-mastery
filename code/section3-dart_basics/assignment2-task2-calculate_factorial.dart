// Assignment 2: Task 2: Calculate factorial
// Dart & Flutter - Zero to Mastery [2023] + Clean Architecture on Udemy
// Author: Atanas (Tony) Hristov
//
// Prints:
// factorial(-2) => Error: Assertion failed: "negative value"
// factorial(-1) => Error: Assertion failed: "negative value"
// factorial(0) = 1
// factorial(1) = 1
// factorial(2) = 2
// factorial(3) = 6
// factorial(4) = 24
// factorial(5) = 120
// factorial(6) = 720
// factorial(7) = 5040
// factorial(8) = 40320
// factorial(9) = 362880
// factorial(10) = 3628800
// factorial(11) = 39916800
// factorial(12) = 479001600
// factorial(13) = 6227020800
// factorial(14) = 87178291200
// factorial(15) = 1307674368000
//
// Wiki: https://en.wikipedia.org/wiki/Factorial
// Gist: https://gist.github.com/atanashristov/37cc7e3ed3e2b532e34e70827e4db4fc
// DartPad: https://dartpad.dev/?id=37cc7e3ed3e2b532e34e70827e4db4fc

void main() {
  for (int i = -2; i <= 15; i++) {
    try {
      print('factorial($i) = ${factorial(i)}');
    } catch (error) {
      print('factorial($i) => Error: $error');
    }
  }
}

/// Calculates factorial of [value]
/// Throws error if [value] is negative.
int factorial(int value) {
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
