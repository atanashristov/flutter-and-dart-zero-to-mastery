// Assignment 3: Task 3: Guess a random number
// Dart & Flutter - Zero to Mastery [2023] + Clean Architecture on Udemy
// Author: Atanas (Tony) Hristov
//
// Example:
//
// $ assignment3-task3-guess_random_number.dart
//
// Please enter number between 0 and 10 or press enter to exit
// 6
// Too high, try again
// Please enter number between 0 and 10 or press enter to exit
// 3
// Too low, try again
// Please enter number between 0 and 10 or press enter to exit
// 4
// Bingo! This is the right number
//
// Review:
//
// Great solution, it works as expected. the code is good to read.
// I like that you  check the input variable.
//
// I would only move the output prints into a own function to have it more separated.
// and i do not like the while(true) statement, it can result in endless running programs
// and i would use own variable that can be checked there.
//

import 'dart:io';
import 'dart:math';

const kMax = 10;

void main() {
  // Generate a random number and ask the user to guess this number.
  final randomNumber = Random().nextInt(kMax + 1); // Note: max range is exclusive

  // Holds the result of the game turn.
  // Note: `GameTurnResult.undefined` is an initial value and means user is yet to play.
  var turnResult = GameTurnResult.undefined;

  do {
    // Ask user to enter a number
    final guess = enterNumberGuess();

    // Based on the user input, see what is the turn result (what is to do next).
    turnResult = getTurnResult(guess, randomNumber);
    final turnResultMessage = turnResult.title;

    // If there is a message based on the turn result, print it out.
    if (turnResultMessage != null) {
      print(turnResultMessage);
    }

    // Only exit if the result of the game turn is a match or user enter empty string.
  } while (turnResult.keepPlaying);
}

/// Returns result of the game turn by evaluating the [guessNumber] and the [randomNumber]
GameTurnResult getTurnResult(int? guessNumber, int randomNumber) {
  if (guessNumber == null) {
    return GameTurnResult.empty;
  } else if (guessNumber < randomNumber) {
    return GameTurnResult.noMatchTooLow;
  } else if (guessNumber > randomNumber) {
    return GameTurnResult.noMatchTooHigh;
  }
  return GameTurnResult.match;
}

/// Contains result of a game turn
enum GameTurnResult {
  /// Initial status, before first turn (user has to play)
  undefined(null),

  /// Empty input, user wants to exit
  empty('See you soon'),

  /// The number the user gave is a match
  match('Bingo! This is the right number'),

  /// The number the user gave is too low
  noMatchTooLow('Too low, try again'),

  /// The number the user gave is too hight
  noMatchTooHigh('Too high, try again'),
  ;

  final String? title;

  const GameTurnResult(this.title);

  bool get keepPlaying => [GameTurnResult.empty, GameTurnResult.match].contains(this) == false;
}

/// Contains extension methods on [GameTurnResult]
///
/// Note: This is not needed with the new enhanced Dart enums
/// See: https://www.woolha.com/tutorials/dart-enhanced-enums-with-members-examples
// extension GameTurnResultExtension on GameTurnResult {
//   /// Returns a string to inform the user about the turn result
//   String? get title {
//     switch (this) {
//       case GameTurnResult.empty:
//         return 'See you soon';
//       case GameTurnResult.match:
//         return 'Bingo! This is the right number';
//       case GameTurnResult.noMatchTooLow:
//         return 'Too low, try again';
//       case GameTurnResult.noMatchTooHigh:
//         return 'Too high, try again';
//       default:
//         return null;
//     }
//   }

//   /// Returns whether to keep playing and ask for another guess or if false - exit the game.
//   /// Note: Only exit if the result of the game turn is a match or user enter empty string.
//   bool get keepPlaying => [GameTurnResult.empty, GameTurnResult.match].contains(this) == false;
// }

/// Takes user guess between 0 and [kMax].
/// Returns null if user wants to exit.
int? enterNumberGuess() {
  print('Please enter number between 0 and $kMax or press enter to exit');

  var inputValidation = InputValidationResult.undefined;
  int? guessNumber;

  do {
    String guessInput = stdin.readLineSync()?.trim() ?? '';
    guessNumber = int.tryParse(guessInput);
    inputValidation = validateInput(guessInput, guessNumber);

    final validationErrorMessage = inputValidation.errorMessage;
    if (validationErrorMessage != null) {
      print(validationErrorMessage);
    }
  } while (!inputValidation.isValid);

  return guessNumber;
}

/// Validate user input
InputValidationResult validateInput(String guessInput, int? guessNumber) =>
    validateInputString(guessInput) ?? validateParsedInputNumber(guessNumber);

/// Validate user input: see if the input string resolves to validation result.
/// Note: Particularly this validation is only concerned with empty input, which means - user wants to exit.
InputValidationResult? validateInputString(String inputString) {
  if (inputString.isEmpty) {
    return InputValidationResult.empty;
  }
  return null;
}

/// Validate user input: see if the parsed as integer input resolves to validation result.
InputValidationResult validateParsedInputNumber(int? parsedInputNumber) {
  if (parsedInputNumber == null) {
    return InputValidationResult.cannotBeNull;
  } else if (parsedInputNumber < 0) {
    return InputValidationResult.cannotBeNegative;
  } else if (parsedInputNumber > kMax) {
    return InputValidationResult.cannotExceedMax;
  }
  return InputValidationResult.valid;
}

/// Contains result of validation of guess input
enum InputValidationResult {
  /// Initial status, before first turn (user has to play)
  undefined,

  /// Empty input, user wants to exit
  empty,

  /// Valid input: a positive integer number was entered
  valid,

  /// User input is not a valid integer number
  cannotBeNull,

  /// User entered a negative integer number
  cannotBeNegative,

  /// User entered a positive integer number greater than the allowed maximum value
  cannotExceedMax,
}

/// Contains extension methods on [InputValidationResult]
extension InputValidationResultExtension on InputValidationResult {
  /// Return error message if input validation did not pass, or `null` if input validation is successful.
  String? get errorMessage {
    switch (this) {
      case InputValidationResult.undefined:
        return 'Please enter a number';
      case InputValidationResult.cannotBeNull:
        return 'Please enter a valid number';
      case InputValidationResult.cannotBeNegative:
        return 'The number should be positive';
      case InputValidationResult.cannotExceedMax:
        return 'The number cannot be bigger that $kMax';
      default:
        return null;
    }
  }

  /// Checks is the user input is valid.
  /// Note: If this is false, ask the user to repeat input.
  bool get isValid => [InputValidationResult.empty, InputValidationResult.valid].contains(this);
}
