import 'package:basic_widgets/ui/presentation/counter/counter_screen.dart';
import 'package:basic_widgets/ui/presentation/list_example/list_example_screen.dart';
import 'package:basic_widgets/ui/presentation/theme_animation/theme_animation_screen.dart';
import 'package:basic_widgets/ui/presentation/widget_examples/widget_examples_screen.dart';
import 'package:flutter/material.dart';

class RootBottomNavigation extends StatefulWidget {
  const RootBottomNavigation({super.key});

  @override
  State<RootBottomNavigation> createState() => _RootBottomNavigationState();
}

class _RootBottomNavigationState extends State<RootBottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          WidgetExamplesScreen(),
          CounterScreen(),
          ListExampleScreen(),
          ThemeAnimationScreen(),
        ],
      ),
      // Can be custom implemented bottom navigation bar, or use `BottomNavigationBar` material component.
      bottomNavigationBar: BottomNavigationBar(
        // It's weird sometimes, fixed saves the day...
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        // selectedItemColor: Colors.blue,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'widget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'counter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'list',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.color_lens), label: 'theme')
        ],
      ),
    );
  }
}
