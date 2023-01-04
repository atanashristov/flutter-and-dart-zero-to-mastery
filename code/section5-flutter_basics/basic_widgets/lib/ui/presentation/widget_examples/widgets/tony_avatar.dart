import 'package:flutter/material.dart';

class TonyAvatar extends StatelessWidget {
  const TonyAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 140,
      width: 140,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/tony.jpg'),
      ),
    );
  }
}
