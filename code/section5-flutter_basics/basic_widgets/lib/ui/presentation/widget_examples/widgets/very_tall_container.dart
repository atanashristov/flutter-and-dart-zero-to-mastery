import 'package:flutter/material.dart';

class VeryTallContainer extends StatelessWidget {
  const VeryTallContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: Colors.green,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'I am too tall to fit, so I need a scrollable content, so SingleChildScrollView is just fine.',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
