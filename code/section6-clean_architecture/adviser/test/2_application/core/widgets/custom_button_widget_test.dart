import 'package:adviser/2_application/core/widgets/custom_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

abstract class OnCustomButtonTap {
  void call();
}

class MockOnCustomButtonTap extends Mock implements OnCustomButtonTap {}

void main() {
  Widget widgetUnderTest({required String caption, required Function() onTap}) {
    return MaterialApp(
      home: Scaffold(
        body: CustomButton(caption: caption, onTap: onTap),
      ),
    );
  }

  group('CustomButton', () {
    group('is Button rendered correctly', () {
      testWidgets('and has all the parts needed', (widgetTester) async {
        const kCaptionText = 'Test caption';
        await widgetTester.pumpWidget(widgetUnderTest(caption: kCaptionText, onTap: () {}));
        await widgetTester.pumpAndSettle();

        final buttonLabelFinder = find.text(kCaptionText);

        expect(buttonLabelFinder, findsOneWidget);
        // test for other elements here
      });
    });

    group('should handle onTap', () {
      testWidgets('when the button is pressed', (widgetTester) async {
        const kCaptionText = '';
        final mockOnCustomButtonTap = MockOnCustomButtonTap();
        await widgetTester.pumpWidget(widgetUnderTest(caption: kCaptionText, onTap: mockOnCustomButtonTap));
        await widgetTester.pumpAndSettle();

        final customButtonFinder = find.byType(CustomButton);

        await widgetTester.tap(customButtonFinder);

        verify(mockOnCustomButtonTap()).called(1);
      });
    });
  });
}
