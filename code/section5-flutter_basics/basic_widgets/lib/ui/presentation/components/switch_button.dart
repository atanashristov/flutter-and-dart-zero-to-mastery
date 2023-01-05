import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final Function(bool) onChanged;
  final bool initialState;
  const SwitchButton({
    required this.onChanged,
    this.initialState = false,
    super.key,
  });

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  late bool switchState;

  @override
  void initState() {
    super.initState();
    switchState = widget.initialState;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: switchState, // Needs a stateful widget in order to dynamically set the value
      onChanged: (value) {
        setState(() {
          switchState = value;
        });
        widget.onChanged(value);
      },
    );
  }
}
