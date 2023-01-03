// Assignment 6: Task 6: Hangman
// Dart & Flutter - Zero to Mastery [2023] + Clean Architecture on Udemy
// Author: Atanas (Tony) Hristov
//
// Requirements:
// - Have a list of ten words
// - Choose a random word
// - Ask the user to enter a letter
// - Each user has 10 lives
// - When the entered letter matches one or more letters of the searched
// word, print it out, otherwise remove one live
// - All letters that are not guessed are replaced with a whitespaces,
// underscore or something else
// - If the user has no lives left, the game is over
//
// ---
// Example output:
//
// Word: lap__p, lives (9), game on (true), game win (false)
// Enter a letter or enter to exit:
// d
// Word: lap__p, lives (8), game on (true), game win (false)
// Enter a letter or enter to exit:o
// Word: lap_op, lives (8), game on (true), game win (false)
// Enter a letter or enter to exit:
// p
// Word: lap_op, lives (8), game on (true), game win (false)
// Enter a letter or enter to exit:
// t
// Word: laptop, lives (8), game on (false), game win (true)
// See you soon
//
// Review:
//
// Lovely soultion, i like how you split up the different classes and how you use them.
// its great to see that you have added additional functionality, like adding a number for revealed letters.
// But there it would be useful to use named constructors, then everyone understand it directly, for what the 3 is used for.
//
// I was only confused about the words, that it was not one of _kWords and you have given a new array for it. so i would suggest that you move the kWords to top of the class and use it to create your HangmanPresenter or remove it.
// You have a good documentation inside your code, keep this for your next projects.
//

import 'dart:async';
import 'dart:io';
import 'dart:math';

void main() async {
  await HangmanPresenter(HangmanGameData(3, ['phone', 'laptop']))
    ..play();
  print('See you soon');
  exit(0);
}

class HangmanPresenter {
  late final HangmanGameData _gameData;
  late final HangmanGameController _gameController;
  late final StreamSubscription<HangmanViewData> _viewSubscription;

  HangmanViewData? _viewData;

  /// Holds view data stream. Will print upon stream events.
  HangmanPresenter([HangmanGameData? gameData]) {
    _gameData = gameData ?? HangmanGameData();
    _gameController = HangmanGameController(gameData: _gameData);
    _viewSubscription = _gameController.onGameDataChanged.listen(
      (viewData) {
        _viewData = viewData;
        print(_viewData);
      },
      onError: (err) => print('Oof Listener error: $err'),
      onDone: () {},
    );

    _gameController.applyGuess(''); // Tricky, but just to force display data
  }

  Future play() async {
    do {
      if (_viewData != null && _viewData!.gameOn == false) {
        await _viewSubscription.cancel();
        break;
      }

      print("Enter a letter or enter to exit:");
      final letter = stdin.readLineSync()?.trim() ?? '';
      if (letter.isEmpty) {
        await _viewSubscription.cancel();
        break;
      }

      _gameController.applyGuess(letter);
    } while (true);
  }
}

class HangmanViewData {
  final String guess;
  final int lives;
  final bool gameOn;
  final bool gameWin;
  HangmanViewData({required this.guess, required this.lives, required this.gameOn, required this.gameWin});

  @override
  String toString() => 'Word: $guess, lives ($lives), game on ($gameOn), game win ($gameWin)';
}

class HangmanGameController {
  /// Holds game data
  final HangmanGameData gameData;

  /// Stream controller
  late final StreamController<HangmanViewData> _controller = StreamController<HangmanViewData>(sync: true);

  /// Returns stream to listen to
  Stream<HangmanViewData> get onGameDataChanged => _controller.stream;

  HangmanGameController({required this.gameData});

  /// Guess a letter
  void applyGuess(String letter) {
    gameData.applyGuess(letter);
    _emit();
    if (gameData.gameOver) {
      _controller.close();
    }
  }

  /// Emits new state upon state changes
  void _emit() {
    final event = HangmanViewData(
        guess: gameData.guess, lives: gameData.lives, gameOn: gameData.gameOn, gameWin: gameData.gameWin);
    if (!_controller.isClosed) {
      _controller.sink.add(event);
    }
  }
}

class HangmanGameData {
  static const _kUnderscore = '_';
  static const _kMaxLives = 10;
  static const _kWords = [
    'book',
    'button',
    'cherry',
    'foot',
    'light',
    'magazine',
    'number',
    'student',
    'suitcase',
    'woman',
  ];

  /// Contains list of words to select from
  late final List<String> _words;

  /// Keeps the word to be guessed
  late final List<String> _word;

  /// Keeps underscores or letters to represent the progress of the guess.
  late List<String> _guess;

  /// How many remaining lives
  late int _lives;

  /// Shows the current guess in form of letters and underscores.
  /// Letters represent guess matches.
  /// Underscores represent letters yes to guess.
  String get guess => _guess.join();

  /// Shows remaining lives
  int get lives => _lives;

  /// Keep on playing - not all letters guessed and has remaining lives.
  bool get gameOn => _guess.any((s) => s == _kUnderscore) && _lives > 0;
  // Game is over
  bool get gameOver => !gameOn;
  // Game finished a win
  bool get gameWin => gameOver && _lives > 0;

  /// Is this game a loss?
  bool get gameLoss => gameOver && _lives < 1;

  HangmanGameData([int numberOflettersToReveal = 0, List<String> words = _kWords]) {
    _words = words;
    _word = _pickRandomWordFromList();
    _guess = List<String>.generate(_word.length, (idx) => _kUnderscore);
    _lives = _kMaxLives;

    _revealLetters(numberOflettersToReveal);
  }

  void applyGuess(String letter) {
    if (_guess.any((s) => s == letter)) {
      // Have some mercy
      return;
    }

    if (!_word.any((s) => s == letter)) {
      // So sorry
      _lives--;
      return;
    }

    for (int i = 0; i < _word.length; i++) {
      if (_guess[i] == _kUnderscore && _word[i] == letter) {
        _guess[i] = letter;
      }
    }
  }

  List<String> _pickRandomWordFromList() {
    final wordIdx = Random().nextInt(_words.length); // Note: max range is exclusive
    return List<String>.generate(_words[wordIdx].length, (letterIdx) => _words[wordIdx][letterIdx]);
  }

  void _revealLetters(int numberOflettersToReveal) {
    while (numberOflettersToReveal > 0) {
      final letterToReveal = _word.firstWhere((letter) => !_guess.contains(letter), orElse: () => '');
      if (letterToReveal == '') {
        break;
      }
      applyGuess(letterToReveal);
      numberOflettersToReveal--;
    }
  }
}
