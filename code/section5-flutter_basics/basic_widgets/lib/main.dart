import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Basic Widgets',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.amber,
          ),
        ),
        home: const HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Widgets')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const snackBar = SnackBar(content: Text('TODO'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Icon(Icons.add),
      ),
      body: const ColumnsExample(),
    );
  }
}

class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Hello World!',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class ColumnsExample extends StatelessWidget {
  const ColumnsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 200,
        // width: 200,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
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
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'First column child',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Second column child',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Stack(
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
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 140,
                width: 140,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/tony.jpg'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 500,
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Third column child',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              // SingleChildScrollView CAN ONLY contain element with fixed size
              // const Expanded(child: Text('Hi')),
            ],
          ),
        ),
      ),
    );
  }
}
