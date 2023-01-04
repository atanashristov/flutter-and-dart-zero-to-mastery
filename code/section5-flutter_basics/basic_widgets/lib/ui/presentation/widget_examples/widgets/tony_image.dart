import 'package:flutter/material.dart';

class TonyImage extends StatelessWidget {
  const TonyImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 140,
          width: 140,
          child: Image.asset(
            'assets/images/tony.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          bottom: 10,
          left: 10,
          child: Text(
            'Tony',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
