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
- Do **not use Expanded** in a `ScrollViewWidget` on the scroll axis
