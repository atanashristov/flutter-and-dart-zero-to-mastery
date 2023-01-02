// Assignment 3: Task 3: Guess a random number
// Dart & Flutter - Zero to Mastery [2023] + Clean Architecture on Udemy
// Author: Atanas (Tony) Hristov
//

import 'dart:io';
import 'dart:math';

const kMax = 10;

void main() {
  final number = Random().nextInt(kMax + 1); // Note: max range is exclusive
  do {
    int? guess = getNumberGuess();
    if (guess == null) {
      print('See you soon');
      break;
    }

    if (guess == number) {
      print('Bingo! $guess is the right number');
      break;
    } else if (guess < number) {
      print('Too low, try again');
    } else if (guess > number) {
      print('Too high, try again');
    }
  } while (true);
}

/// Takes user guess between 0 and [kMax].
/// Returns null if user wants to exit.
int? getNumberGuess() {
  print('Please enter number between 0 and $kMax or press enter to exit');
  do {
    String input = stdin.readLineSync()?.trim() ?? '';
    if (input == '') {
      return null;
    }

    int? number = int.tryParse(input);
    if (number == null) {
      print('Please enter a valid number');
      continue;
    }
    if (number < 0) {
      print('The number should be positive');
      continue;
    }
    if (number > kMax) {
      print('The number cannot be bigger that $kMax');
      continue;
    }
    return number;
  } while (true);
}
