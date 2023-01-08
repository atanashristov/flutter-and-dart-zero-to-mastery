import 'package:adviser/2_application/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const kButtonCaptionText = 'Caption';

  Widget widgetUnderTest({required String caption, Function()? onTap}) {
    return MaterialApp(
      home: Scaffold(
        body: CustomButton(caption: caption, onTap: onTap),
      ),
    );
  }

  group('CustomButton', () {
    group('Golden Test', () {
      testWidgets('is enabled', (widgetTester) async {
        await widgetTester.pumpWidget(widgetUnderTest(caption: kButtonCaptionText, onTap: () {}));
        await widgetTester.pumpAndSettle();

        await expectLater(find.byType(CustomButton), matchesGoldenFile('goldens/custom_button_enabled.png'));
      });

      testWidgets('is disabled', (widgetTester) async {
        await widgetTester.pumpWidget(widgetUnderTest(caption: kButtonCaptionText));
        await widgetTester.pumpAndSettle();

        await expectLater(find.byType(CustomButton), matchesGoldenFile('goldens/custom_button_disabled.png'));
      });
    });
  });
}
