import 'package:flutter/material.dart';

class RowExpandedAndFlexibleExample extends StatelessWidget {
  const RowExpandedAndFlexibleExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Wrap in Flexible the Text elements that may tale too long space
        // and adjust the Text maxLines and overflow as you need.
        // Always created last, so it takes only the space that is left.
        const Flexible(
          // always has flex: 1
          child: Text(
            'This is a very long text wrapped in Flexible. This is a very long text wrapped in Flexible. This is a very long text wrapped in Flexible.',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        // Takes as much space as it could take (max), pushing out the other elements
        const Expanded(
          // flex: 2,
          child: Text(
            'I am in Expanded',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Container(height: 20, width: 20, color: Colors.green),
        const SizedBox(width: 8),
        Container(height: 20, width: 20, color: Colors.yellow),
        const SizedBox(width: 8),
        Container(height: 20, width: 20, color: Colors.red),
      ],
    );
  }
}
