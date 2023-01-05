import 'package:basic_widgets/ui/presentation/navigation_example_screens/screen_two.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            child: const Text('Go back'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Pop until home'),
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
          TextButton(
            child: const Text('Go to screen two by route name'),
            onPressed: () => Navigator.pushNamed(context, '/screenTwo'),
          ),
          TextButton(
            child: const Text('Go to screen two by MaterialPageRoute'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const ScreenTwo()))),
          ),
        ],
      ),
    );
  }
}
