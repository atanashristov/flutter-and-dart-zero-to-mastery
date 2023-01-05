import 'package:basic_widgets/ui/presentation/counter/counter_screen.dart';
import 'package:basic_widgets/ui/presentation/list_example/list_example_screen.dart';
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
        ],
      ),
      // Can be custom implemented bottom navigation bar, or use `BottomNavigationBar` material component.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.amber.shade300,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'widget examples',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'counter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'list example',
          ),
        ],
      ),
    );
  }
}
