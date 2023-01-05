import 'package:basic_widgets/ui/presentation/navigation_example_screens/screen_one.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
        backgroundColor: Colors.blue,
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
            child: const Text('Replace with screen one by route name'),
            onPressed: () => Navigator.pushReplacementNamed(context, '/screenOne'),
          ),
          TextButton(
            child: const Text('Replace with screen one by MaterialPageRoute'),
            onPressed: () =>
                Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const ScreenOne()))),
          ),
        ],
      ),
    );
  }
}
