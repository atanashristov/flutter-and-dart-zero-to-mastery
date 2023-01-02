// Streams
// - Futures represent a value that they deliver asynchronously
// - Streams are similar, but instead of a single value they can return zero
// or more values or errors over time.
// - Streams can give back null, multiple values or errors over time
// - To manipulate a stream, you need a controller
//  - Call `controller.sink.add()` to add values to the stream
// - To listen to a stream, you need to create a subscription
//  - Call `subscription.listen()` to listen to the stream and execute code for each event
//
// Sync:          int              List<int>
// Async:         Future<int>      Stream<int>
//
// Example:
// - File openRead method
// - Returns a stream with the records read one by one
// - You can listen to the stream elsewhere in the program and execute
// code for each record read.
//

import 'dart:async';

void main() {
  final numberStream = NumberGenerator().stream;

  StreamSubscription sub1 = numberStream.listen(
    (event) {
      print(event);
    },
    onDone: () {
      // will be executed when the stream is finished
      print('Subscription received stream done');
    },
    onError: (error) {
      // what should happen when an error occurs
      print('Subscription received error: $error');
    },
    cancelOnError: true, // shall it cancel the subscription when error occurs
  );
}

class NumberGenerator {
  int _counter = 0;
  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  NumberGenerator() {
    final timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _controller.sink.add(_counter++);
    });

    Future.delayed(Duration(seconds: 10), () => timer.cancel());
  }
}
