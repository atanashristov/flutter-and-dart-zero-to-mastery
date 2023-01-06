import 'package:basic_widgets/ui/presentation/theme_animation/widgets/sunshine.dart';
import 'package:flutter/material.dart';

class Sun extends StatelessWidget {
  const Sun({super.key});

  @override
  Widget build(BuildContext context) {
    return Sunshine(
      radius: 160,
      child: Sunshine(
        radius: 120,
        child: Sunshine(
          radius: 80,
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xDDFC554F),
                  Color(0xDDFFF79E),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
