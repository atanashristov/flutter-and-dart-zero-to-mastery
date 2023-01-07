import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String caption;
  final Function() onTap;

  static final _borderRadius = BorderRadius.circular(15);

  const CustomButton({
    super.key,
    required this.caption,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: onTap,
      child: Material(
        elevation: 20,
        borderRadius: _borderRadius,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: themeData.colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              caption,
              style: themeData.textTheme.headline1,
            ),
          ),
        ),
      ),
    );
  }
}
