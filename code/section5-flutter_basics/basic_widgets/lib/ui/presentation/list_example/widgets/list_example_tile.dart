import 'package:flutter/material.dart';

class ListExampleTile extends StatefulWidget {
  final int itemId;
  final String itemData;
  final bool isSelected;

  const ListExampleTile({
    required this.itemId,
    required this.itemData,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<ListExampleTile> createState() => _ListExampleTileState();
}

class _ListExampleTileState extends State<ListExampleTile> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        // tileColor: Colors.grey.shade400,
        // textColor: Colors.black,
        // hoverColor: Colors.yellow,
        title: Text(widget.itemData),
        subtitle: Text(
            '#${widget.itemId} - This is another item for the list and let us add as much as possible text and see what will happen. And as we say so, keep on adding more and more text till end of the world!'),
        leading: Checkbox(
          value: _selected,
          onChanged: (value) {
            setState(() {
              _selected = value ?? false;
            });
          },
        ),
      ),
    );
  }
}
