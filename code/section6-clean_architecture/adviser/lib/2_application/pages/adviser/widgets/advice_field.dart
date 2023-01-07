import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
  static final _borderRadius = BorderRadius.circular(15);

  final String advice;

  const AdviceField({super.key, required this.advice});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Material(
      elevation: 20,
      borderRadius: _borderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: themeData.colorScheme.onPrimary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text(
            '''"$advice"''',
            style: themeData.textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
