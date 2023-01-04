import 'package:flutter/material.dart';

class SecondColumnChild extends StatelessWidget {
  const SecondColumnChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'Second column child',
        style: TextStyle(
          color: Colors.red,
          fontSize: 20,
        ),
      ),
    );
  }
}
