import 'package:flutter/material.dart';

class CustomButtonGesture extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final Color textColor;
  final Color bgColorStart;
  final Color bgColorEnd;

  const CustomButtonGesture({
    super.key,
    required this.onTap,
    required this.text,
    required this.textColor,
    required this.bgColorStart,
    required this.bgColorEnd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              bgColorStart,
              bgColorEnd,
            ],
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
