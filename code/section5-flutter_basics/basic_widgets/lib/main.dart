import 'package:basic_widgets/ui/application/theme_service.dart';
import 'package:basic_widgets/ui/presentation/navigation_example_screens/screen_one.dart';
import 'package:basic_widgets/ui/presentation/navigation_example_screens/screen_two.dart';
import 'package:basic_widgets/ui/root_bottom_navigation.dart';
import 'package:basic_widgets/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          title: 'Basic Widgets',
          themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routes: <String, WidgetBuilder>{
            // It is hanging if I specify just '/', thereof use '/root'
            '/root': (context) => const RootBottomNavigation(),
            '/screenOne': (context) => const ScreenOne(),
            '/screenTwo': (context) => const ScreenTwo(),
          },
          home: const RootBottomNavigation(),
        );
      },
    );
  }
}
