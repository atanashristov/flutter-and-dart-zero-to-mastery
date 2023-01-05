# flutter-and-dart-zero-to-mastery

Contains code and notes from studying [Dart & Flutter - Zero to Mastery [2023] + Clean Architecture](https://www.udemy.com/course/flutter-made-easy-zero-to-mastery).

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
