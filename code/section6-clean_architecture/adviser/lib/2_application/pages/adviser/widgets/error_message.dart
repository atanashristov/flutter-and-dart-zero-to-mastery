// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Wrap(
      // mainAxisAlignment: MainAxisAlignment.center,
      direction: Axis.horizontal,
      children: [
        const Center(child: Icon(Icons.error, size: 40, color: Colors.redAccent)),
        const SizedBox(height: 20),
        Center(
          child: Text(
            message,
            style: themeData.textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
