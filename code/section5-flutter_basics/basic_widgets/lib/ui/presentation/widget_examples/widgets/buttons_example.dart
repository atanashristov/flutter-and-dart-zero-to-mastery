import 'dart:developer';

import 'package:basic_widgets/ui/presentation/components/switch_button.dart';
import 'package:flutter/material.dart';

class ButtonsExample extends StatelessWidget {
  const ButtonsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            log('TextButton (1) Pressed');
          },
          child: const Text('TextButton (1) example'),
        ),
        const SizedBox(height: 20),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
            foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
          ),
          onPressed: () {
            log('TextButton (2) Pressed');
          },
          child: const Text('TextButton (2) example'),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            log('TextButton (3) Pressed');
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                'TextButton (3) example',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // See https://codewithandrea.com/tips/elevated-button-style-flutter/ for styling
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // background (button) color
            foregroundColor: Colors.blue.shade50, // foreground (text) color
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            log('ElevatedButton pressed');
          },
          child: const Text('ElevatedButton example'),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            log('OutlinedButton pressed');
          },
          child: const Text('OutlinedButton example'),
        ),
        const SizedBox(height: 20),
        IconButton(
          onPressed: () {
            log('IconButton pressed');
          },
          icon: const Icon(Icons.save),
        ),
        const SizedBox(height: 20),
        SwitchButton(
          initialState: true,
          onChanged: (value) {
            log('SwitchButton is ${value ? "on" : "off"}');
          },
        )
      ],
    );
  }
}
