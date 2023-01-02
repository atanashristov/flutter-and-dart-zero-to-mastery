// Task F1: Quiz poker
// Dart & Flutter - Zero to Mastery [2023] + Clean Architecture on Udemy
// Author: Atanas (Tony) Hristov

import 'package:flutter/material.dart';

// DRY constants
const _kTextTitle = 'Quiz Poker';
const _kColorBackground = Colors.green;
const _kColorBody = Colors.lime;
const _kColorText = Colors.pink;

void main() {
  // Theme to control the overall app style
  final themeData = ThemeData(
    primarySwatch: _kColorBackground,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _kColorBackground.shade200,
      actionTextColor: _kColorText,
      contentTextStyle: const TextStyle(
        color: _kColorText,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: _kColorBody.shade200,
  );

  runApp(MyApp(themeData: themeData));
}

// Quiz poker app main widget with MaterialApp
class MyApp extends StatelessWidget {
  final ThemeData themeData;
  const MyApp({required this.themeData, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _kTextTitle,
      theme: themeData,
      home: const QuizPokerHomeScreen(title: _kTextTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Quiz poker app home screen with Scaffold
class QuizPokerHomeScreen extends StatelessWidget {
  final String title;
  const QuizPokerHomeScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          QuizPokerAppBar(title: title, key: const Key('quizpoker-appbar')),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, idx) => Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Number $idx'),
              ),
              childCount: 20,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSnackBar(context, 'TODO: Do something'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// App bar for the quiz poker app.
class QuizPokerAppBar extends StatelessWidget {
  final String title;
  const QuizPokerAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.login),
          tooltip: 'Sign in',
          onPressed: () => _showSnackBar(context, 'TODO: Sign in'),
        ),
      ],
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
        'https://cdn.pixabay.com/photo/2019/11/01/14/23/joker-4594387_960_720.jpg',
        fit: BoxFit.cover,
      )),
    );
  }
}

/// Shows a snackbar with the specified [text]
void _showSnackBar(BuildContext context, String text) {
  // Customize theme style on this particular occasion by making the text italic
  final snackBarTheme =
      Theme.of(context).snackBarTheme.copyWith(contentTextStyle: const TextStyle(fontStyle: FontStyle.italic));
  final snackBar = SnackBar(content: Text(text, style: snackBarTheme.contentTextStyle));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
