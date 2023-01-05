import 'package:basic_widgets/ui/presentation/navigation_example_screens/screen_one.dart';
import 'package:basic_widgets/ui/presentation/navigation_example_screens/screen_two.dart';
import 'package:basic_widgets/ui/root_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Widgets',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
        ),
      ),
      routes: <String, WidgetBuilder>{
        // It is hanging if I specify just '/', thereof use '/root'
        '/root': (context) => const RootBottomNavigation(),
        '/screenOne': (context) => const ScreenOne(),
        '/screenTwo': (context) => const ScreenTwo(),
      },
      home: const RootBottomNavigation(),
    );
  }
}
