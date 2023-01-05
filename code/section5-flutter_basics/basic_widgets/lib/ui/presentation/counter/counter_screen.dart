import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Page')),
      body: Center(
        child: Text(
          _counter.toString(),
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: _counter < 0 ? Colors.red : Colors.green,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            backgroundColor: Colors.red,
            onPressed: () {
              setState(() {
                _counter--;
              });
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            backgroundColor: Colors.green,
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
