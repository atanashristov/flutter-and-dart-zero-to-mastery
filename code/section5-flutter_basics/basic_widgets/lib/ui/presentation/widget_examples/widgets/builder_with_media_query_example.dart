import 'package:flutter/material.dart';

class BuilderWithMediaQueryExample extends StatelessWidget {
  const BuilderWithMediaQueryExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: const Center(
          child: Text('Builder example'),
        ),
      ),
    );
  }
}
