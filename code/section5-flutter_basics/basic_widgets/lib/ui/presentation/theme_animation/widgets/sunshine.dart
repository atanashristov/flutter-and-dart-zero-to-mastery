import 'package:flutter/material.dart';

class Sunshine extends StatelessWidget {
  final double radius;
  final Widget child;
  const Sunshine({super.key, required this.radius, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(.1),
      ),
      child: Center(child: child),
    );
  }
}
