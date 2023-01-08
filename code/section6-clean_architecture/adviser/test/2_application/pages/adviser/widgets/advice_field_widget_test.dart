import 'package:adviser/2_application/pages/adviser/widgets/advice_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  Widget widgetUnderTest({required String adviceText}) {
    return MaterialApp(
      home: Scaffold(
        body: AdviceField(advice: adviceText),
      ),
    );
  }

  group('AdviceField', () {
    group('should be displayed correctly', () {
      testWidgets('when a short text is given', (widgetTester) async {
        const kText = 'advice';
        await widgetTester.pumpWidget(widgetUnderTest(adviceText: kText));
        // Method `pumpAndSettle()` you can only use when there are no animations
        // It waits until the UI is builded and no changes are detected anymore.
        //
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.textContaining(kText);
        final adviceText = widgetTester.widget<AdviceField>(find.byType(AdviceField)).advice;

        expect(adviceFieldFinder, findsOneWidget);
        expect(adviceText, kText);
      });

      testWidgets('when a very long text is given', (widgetTester) async {
        const kText = '''
Commodo dolor quis proident sunt mollit fugiat do est.
Pariatur est sit laboris incididunt elit.
Cillum ea ipsum nulla nisi proident in adipisicing excepteur reprehenderit velit tempor.
Tempor pariatur pariatur incididunt adipisicing esse velit elit occaecat et. Quis commodo commodo do mollit commodo sint ex sit magna.

Esse aliqua nulla aliqua pariatur sint. Minim laborum eiusmod deserunt labore laboris eu exercitation ea sit deserunt veniam et dolore.
Nulla est ea esse duis aliquip enim nostrud esse ut esse duis. Nostrud irure sit labore nulla quis id. Mollit reprehenderit
in cillum officia nisi enim incididunt. Ullamco ullamco in proident eiusmod nostrud id aliqua culpa non duis. Magna qui occaecat
deserunt Lorem culpa cillum labore pariatur tempor ex adipisicing ex.
''';
        await widgetTester.pumpWidget(widgetUnderTest(adviceText: kText));
        // Method `pumpAndSettle()` you can only use when there are no animations
        // It waits until the UI is builded and no changes are detected anymore.
        //
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.byType(AdviceField);
        final adviceText = widgetTester.widget<AdviceField>(find.byType(AdviceField)).advice;

        expect(adviceFieldFinder, findsOneWidget);
        expect(adviceText, kText);
      });

      testWidgets('when no text is given', (widgetTester) async {
        const kText = '';
        await widgetTester.pumpWidget(widgetUnderTest(adviceText: kText));
        // Method `pumpAndSettle()` you can only use when there are no animations
        // It waits until the UI is builded and no changes are detected anymore.
        //
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.textContaining(AdviceField.kEmptyAdvice);
        final adviceText = widgetTester.widget<AdviceField>(find.byType(AdviceField)).advice;

        expect(adviceFieldFinder, findsOneWidget);
        expect(adviceText, '');
      });
    });
  });
}
