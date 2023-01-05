import 'package:basic_widgets/ui/presentation/list_example/widgets/list_example_tile.dart';
import 'package:flutter/material.dart';

const _kStub = ['this', 'is', 'an', 'example', 'list', 'end', 'this', 'is', 'cool'];

class ListExampleScreen extends StatelessWidget {
  const ListExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listview Example')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
        child: ListView.separated(
          itemCount: _kStub.length,
          itemBuilder: (context, index) {
            // return Container(
            //   color: Colors.blue,
            //   height: 100,
            //   child: Center(child: Text(_kStub[index])),
            // );
            return ListExampleTile(
              itemId: index + 1,
              itemData: _kStub[index],
              isSelected: index % 2 > 0,
            );
          },
          separatorBuilder: (context, index) {
            // return const Divider();
            return const SizedBox(height: 10);
          },
        ),
      ),
    );
  }
}
