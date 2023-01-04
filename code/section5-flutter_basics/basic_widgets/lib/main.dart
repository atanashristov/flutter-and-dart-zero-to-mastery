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
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                color: Colors.teal,
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: const Center(
                  child: Text('MediaQuery example'),
                ),
              ),
              const SizedBox(height: 20),
              const MediaQueryExample(),
              const SizedBox(height: 20),
              Builder(
                builder: (context) => Container(
                  color: Colors.green,
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: const Center(
                    child: Text('Builder example'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Container within Container fills the whole space of the parent,
                    // so, wrap the child Container in a Center
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: constraints.maxWidth - 30,
                        height: constraints.maxHeight - 30,
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              'LayoutBuilder example, so I depend on my parent constraints',
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 1000,
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'I am too long to fit, so I need a scrollable content, so SingleChildScrollView is just fine.',
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

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.green,
      width: size.width / 2,
      height: size.height / 5,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text('MediaQuery extracted to component example'),
        ),
      ),
    );
  }
}
