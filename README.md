# flutter-and-dart-zero-to-mastery

Contains code and notes from studying [Dart & Flutter - Zero to Mastery [2023] + Clean Architecture](https://www.udemy.com/course/flutter-made-easy-zero-to-mastery).

[GitHub repo](https://github.com/OpenSphereSoftware/FlutterMadeEasy_ZeroToMastery)

## Section 5: Flutter basics

### MaterialApp and Scaffold

MaterialApp:

- uses the material design / theme
- defines supported languages
- defines different routes for navigation

Scaffold

- defines layout for a screen
- can define AppBar, Drawer, BottomNavigationBar, FloatingActionButton (FAB)
- background color

### Container and Text

Container

- basic widget
- can have `height` and `width`
- `boxDecoration` to change appearance
- when using `boxDecorartion` cannot use `color` anymore and you should remove it

Center

- align it's child to the middle of his parent

Text

- display a string
- has default styling
- styling can be changed via `style` parameter

### Column, Padding, SizedBox

Column

- shows children in a vertical list
- cannot be scrolled
- should only be used when you have _more than one child_

Padding

- creates a _space around_ the child widget

SizedBox

- a box defined only by size
- can be used as a placeholder between elements

### Row, Flexible, Expanded

Row

- shows children horizontally
- can not be scrolled
- to align children use `mainAxisAlignment` and `crossAxisAlignment`

Flexible

- if you use multiple `Flexible` widgets within a `Row` or `Column`, you can tell them how they should relate to each other with the `flex` parameter
- will be created last (fixed size widgets are created first, so they know how much space they take)

Expanded

- special form of `Flexible` widget (`fit: Flexible.tight`)
- uses the _available_ space given by flex

### Image, Stack; Assets

Assets

- add to _pubspec.yaml_ to be able to load
- aun `flutter pub get` after changes to pubspec.yaml

Image

- can load pictures from _assets_ or _network_
- use `fit: BoxFit.cover` most of the cases to fit properly the image
- to make it rounded use `CircularAvatar`
- for all other forms you can use `Container` with `ClipRRect`

Stack

- used to add third dimension to your layout
- to place widgets you can use `Align` and `Positioned`

We have 2 options to align the children of `Stack`:

```dart
    child: Stack(
      // (*) We can align all the elements like that
      // alignment: Alignment.bottomCenter,
      children: [
        // (*) or we can specify for single element how to be aligned like so:
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
```

### SingleChildScrollView

SingleChildScrollView

- gives his child a `ScrollPhysics`
- only active if space is not enough
- Android and iOS use different physics
- do **not use Expanded** in a `ScrollViewWidget` on the scroll axis

### MediaQuery

MediaQuery

- uses the _information from context_ to get the screen size
- information comes _from MaterialApp widget_
- helps us to _build_ widgets _depending on screen size_

When you provide data to child widget but it cannot use it and throw an error, wrap the child widget into a widget class and use it instead.

### LayoutBuilder

LayoutBuilder

- has its own context and constraints in the builder function
- uses the constraints from parent widget
- we can create Layouts depending on size of the parent widget
- if parent size changes, the `LayoutBuilder` will build the children depending on the new constraints

### OrientationBuilder

TODO

### Placeholder, ListView, ListView.builder, ListView.separated, ListTile

Placeholder

- Takes all the available space
- Put it somewhere temporarily until you come back and develop the widget.

Example:

```dart
    return Scaffold(
      appBar: AppBar(title: const Text('Listview Example')),
      body: const Placeholder(),
    );
```

ListView

- Basic `ListView` can be implemented with `SingleChildScrollView` and a `Column` child

ListView.builder

- `ListView.builder` is the _advanced version_ of `ListView`
- You don't know upfront how long it is, but you want to display it all

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listview Example')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blue,
              height: 100,
              child: Center(child: Text(index.toString())),
            ),
          );
        },
      ),
    );
  }
```

ListView.separated

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listview Example')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: _kStub.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blue,
              height: 100,
              child: Center(child: Text(_kStub[index])),
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
```

ListTile

- normally we use `Container` for items because these are so customizable
- but, `ListTile` can be handy
- it implements what normally we want from a list view items

```dart
return ListTile(
    tileColor: Colors.grey.shade400,
    textColor: Colors.black,
    hoverColor: Colors.yellow,
    title: Text(
    _kStub[index],
    ),
    subtitle: Text('Item number $index'),
    leading: Checkbox(
    value: false,
    onChanged: (value) {},
),
```

**Important**: `ListView.builder` gives **performance benefits** compared to `SingleChildScrollView` with `Column`.

It does not necessarily render all the child elements before we scroll and make these visible on the screen.

## BottomNavigationBar, IndexedStack

IndexedStack

- `Stack` was where we can add element on top of other element
- `IndexedStack` is same, but the widgets in the stack have index that controls which one is on top

### Theme

Create custom theme file:

```dart
// code\section5-flutter_basics\basic_widgets\lib\ui\theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const _kPrimaryColorLight = Colors.lightBlueAccent;

  static const _kPrimaryColorDark = Colors.lightGreenAccent;

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _kPrimaryColorLight,
      brightness: Brightness.light,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _kPrimaryColorDark,
      brightness: Brightness.dark,
    ),
  );
}
```

Apply the theme to the `MaterialApp`:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Widgets',
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: <String, WidgetBuilder>{
        // It is hanging if I specify just '/', thereof use '/root'
        '/root': (context) => const RootBottomNavigation(),
        '/screenOne': (context) => const ScreenOne(),
        '/screenTwo': (context) => const ScreenTwo(),
      },
      home: const RootBottomNavigation(),
    );
  }
}
```

Do not use hardcoded colors, use the theme colors instead.

This is an example with `Container` that wraps the whole screen:

```dart
child: Container(
  decoration: BoxDecoration(
    // This would be the default background color
    // color: Theme.of(context).colorScheme.background,
...
```

This is an example with `Container` that wraps the shows a card:

```dart
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: themeData.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
```

Links:

- [Material V3](https://m3.material.io/)
- [Material Theme Builder](https://m3.material.io/theme-builder#/custom)
- [App Painter Code](https://github.com/zeshuaro/appainter)
- [App Painter online](https://appainter.dev/#/)

### State Management with Provider

Provider

Create under service that holds data and can notify by extending `ChangeNotifier`.

Call `notifyListeners()` when changing the state.

```dart
// ui\application\theme_service.dart

import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode != isDarkMode;
    notifyListeners();
  }
}
```

Wrap the app in `runApp()` with `ChangeNotifierProvider`:

```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const MyApp(),
    ),
  );
}
```

Then when we need to consume the service data, we wrap that component into a `Consumer<T>` widget and specify the provided provider type:

```dart
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          title: 'Basic Widgets',
          themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
```

Now wqe react on the state. We want to be able to trigger changes by calling the `ThemeService.toggleTheme()`.

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Widgets')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeService>(context, listen: false).toggleTheme();
```

It goes up the three and finds the nearest provider of the specified type.

If we are not going tp listen for changes here, we have to specify `listen: false`, otherwise if it is `true`, changes in the state will trigger rebuild of this widget.

### Animations

Fluter gives "Animated" versions of widgets. For example `Pading` has corresponding `AnimatedPadding`, `Opacity` has `AnimatedOpacity` etc.

## Section 7: Testing

See: [Flutter testing page](https://docs.flutter.dev/cookbook/testing)

### Integration tests

Integration tests:

- Run on emulator
- Low amount of tests
- Test a complete process of your app
- Hard to write and long execution time
- Examples:
  - Make a deposit
  - Create account

Helpful links:

- [Integration testing cookbook](https://docs.flutter.dev/cookbook/testing/integration/introduction)

### Golden tests

Golden tests:

- Medium amount of tests
- Make sure design guidelines are fulfilled
- Compares the current UI with predefined image
- Not so hard to write and medium execution time
- Examples:
  - Are all button states as expected

Helpful links:

- [How to use Alchemist for Flutter](https://verygood.ventures/blog/alchemist-golden-tests-tutorial)
- [Golden tests — compare Widgets with Snapshots](https://medium.com/flutter-community/flutter-golden-tests-compare-widgets-with-snapshots-27f83f266cea)

### Widget tests

Widget tests:

- Run on emulator or headless
- Medium amount of tests
- Test UI component in different states w/o business logic
- Not hard to write and medium execution time
- Examples:
  - Shows reloading spinner after pull to refresh
  - No overflow exceptions
  - Can click on button, can disable it, etc.

Helpful links:

- [Intro to widget testing](https://docs.flutter.dev/cookbook/testing/widget/introduction)

### Unit tests

Unit tests:

- High amount of tests
- Test only one specific case of the app
- Easy to write and fast to execute
- Examples:
  - Bloc/Cubit tests (business logic)
  - Utility functions

Helpful links:

- [Intro to unit testing](https://docs.flutter.dev/cookbook/testing/unit/introduction)
- [Bloc test, built to work with bloc and mocktail](https://pub.dev/packages/bloc_test)
- Also plenty of info here - [Bloc library](https://bloclibrary.dev/#/)

### Using `mockito`

Run: `flutter pub run build_runner build -d` to generate mock classes.

See: `test\0_data\datasources\advice_remote_datasource_test.dart` for example

### Unit tests - What we learned

Unit tests:

- Structure of unit test AAA (arrange, act, assert)
- UseCases, Repositories, DataSources should be tested
- use `verifyNever` when you want to make sure a method eas not called

Mockito:

- `@GenerateNiceMocks([MockSpec<T>()])` to get mocks for this class
- `flutter pub run build_runner build -d` to generate mocks
