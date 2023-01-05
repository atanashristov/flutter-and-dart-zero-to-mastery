import 'package:basic_widgets/ui/presentation/components/custom_button_ink.dart';
import 'package:basic_widgets/ui/presentation/components/custom_button_gesture.dart';
import 'package:basic_widgets/ui/presentation/components/person_card.dart';
import 'package:basic_widgets/ui/presentation/navigation_example_screens/screen_one.dart';
import 'package:basic_widgets/ui/presentation/navigation_example_screens/screen_two.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 3),
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
              const SizedBox(height: 20),
              const RowExpandedAndFlexibleExample(),
              const FirstColumnChild(),
              const SizedBox(height: 20),
              const SecondColumnChild(),
              const SizedBox(height: 20),
              const TonyImage(),
              const SizedBox(height: 20),
              const PersonCard(
                  pictureUrl:
                      'https://media.licdn.com/dms/image/C4E03AQHEQ0sQMrLttg/profile-displayphoto-shrink_800_800/0/1638335024784?e=1678320000&v=beta&t=YMJCF_nLLLWFknM75ByaE7S2tTEX5kRMiuPaGjaFhR4',
                  name: 'Tony',
                  age: '53',
                  country: 'USA',
                  job: 'Senior Software Engineer II at Alkami.com'),
              const SizedBox(height: 20),
              const PersonCard(
                  pictureUrl: 'http://clipart-library.com/images/ATbjGRjT4.png',
                  name: 'Alexander Hristov',
                  age: '19',
                  country: 'USA',
                  job: 'A very goosd student'),
              const SizedBox(height: 20),
              const TonyAvatar(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Next 2 buttons demo navigation yay!'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonInk(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => const ScreenOne())));
                    },
                    icon: Icons.home,
                    iconColor: Colors.white,
                    bgColorStart: Colors.yellow,
                    bgColorEnd: Colors.blue,
                  ),
                  const SizedBox(width: 32.0),
                  CustomButtonGesture(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => const ScreenTwo())));
                    },
                    text: "CustomButtonGesture example",
                    textColor: Colors.white,
                    bgColorStart: Colors.yellow,
                    bgColorEnd: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const ButtonsExample(),
              const SizedBox(height: 20),
              const MediaQueryExample(),
              const SizedBox(height: 20),
              const BuilderWithMediaQueryExample(),
              const SizedBox(height: 20),
              const LayoutBuilderExample(),
              const SizedBox(height: 20),
              const VeryTallContainer(),
              const SizedBox(height: 20),
              // SingleChildScrollView CAN ONLY contain element with fixed size
              // const Expanded(child: Text('Hi')),
            ],
          ),
        ),
      ),
    );
  }
}
