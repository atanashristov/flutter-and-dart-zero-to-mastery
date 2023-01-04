import 'package:flutter/material.dart';

class CustomButtonInk extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final Color iconColor;
  final Color bgColorStart;
  final Color bgColorEnd;

  const CustomButtonInk({
    super.key,
    required this.onTap,
    required this.icon,
    required this.iconColor,
    required this.bgColorStart,
    required this.bgColorEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      // Ink does the styling
      child: Ink(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              bgColorStart,
              bgColorEnd,
            ],
          ),
        ),
        // InkWell does the actions
        child: InkWell(
          onTap: onTap,
          splashColor: bgColorEnd,
          customBorder: const CircleBorder(),
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
              shadows: [Shadow(color: bgColorEnd, offset: const Offset(1, 2))],
            ),
          ),
        ),
      ),
    );
  }
}
