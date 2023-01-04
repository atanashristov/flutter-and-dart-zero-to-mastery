import 'package:basic_widgets/ui/presentation/widget_examples/widgets/builder_with_media_query_example.dart';
import 'package:basic_widgets/ui/presentation/widget_examples/widgets/buttons_example.dart';
import 'package:basic_widgets/ui/presentation/widget_examples/widgets/first_column_child.dart';
import 'package:basic_widgets/ui/presentation/widget_examples/widgets/layout_builder_example.dart';
import 'package:basic_widgets/ui/presentation/widget_examples/widgets/media_query_example.dart';
import 'package:basic_widgets/ui/presentation/widget_examples/widgets/row_expanded_and_flexible_example.dart';
import 'package:basic_widgets/ui/presentation/widget_examples/widgets/second_column_child.dart';
import 'package:basic_widgets/ui/presentation/widget_examples/widgets/tony_avatar.dart';
import 'package:basic_widgets/ui/presentation/widget_examples/widgets/tony_image.dart';
import 'package:basic_widgets/ui/presentation/widget_examples/widgets/very_tall_container.dart';
import 'package:flutter/material.dart';

class WidgetExamplesScreen extends StatelessWidget {
  const WidgetExamplesScreen({super.key});

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
      body: const WidgetExamplesBody(),
    );
  }
}

class WidgetExamplesBody extends StatelessWidget {
  const WidgetExamplesBody({super.key});

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
            children: const [
              SizedBox(height: 20),
              RowExpandedAndFlexibleExample(),
              FirstColumnChild(),
              SizedBox(height: 20),
              SecondColumnChild(),
              SizedBox(height: 20),
              TonyImage(),
              SizedBox(height: 20),
              TonyAvatar(),
              SizedBox(height: 20),
              ButtonsExample(),
              SizedBox(height: 20),
              MediaQueryExample(),
              SizedBox(height: 20),
              BuilderWithMediaQueryExample(),
              SizedBox(height: 20),
              LayoutBuilderExample(),
              SizedBox(height: 20),
              VeryTallContainer(),
              SizedBox(height: 20),
              // SingleChildScrollView CAN ONLY contain element with fixed size
              // const Expanded(child: Text('Hi')),
            ],
          ),
        ),
      ),
    );
  }
}
