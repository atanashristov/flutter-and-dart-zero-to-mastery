import 'package:flutter/material.dart';

class FirstColumnChild extends StatelessWidget {
  const FirstColumnChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Text(
        'First column child',
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 20,
        ),
      ),
    );
  }
}
