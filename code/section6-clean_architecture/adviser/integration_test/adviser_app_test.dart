import 'package:adviser/2_application/pages/adviser/widgets/advice_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:adviser/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'end-to-end test',
    () {
      testWidgets('tap on custom button, verify advice will be loaded', (widgetTester) async {
        app.main();
        await widgetTester.pumpAndSettle();

        // Verify that no advice is loaded yet
        expect(find.text('Your advice is waiting for you...'), findsOneWidget);

        // Find custom button
        final customButtonFinder = find.text('Get Advice');

        // Emulate a tap on the custom button
        await widgetTester.tap(customButtonFinder);

        // Trigger a frame and wait until settled
        await widgetTester.pumpAndSettle();

        // Verify that an advice was loaded
        expect(find.byType(AdviceField), findsOneWidget);
        expect(find.textContaining('"'), findsOneWidget);
      });
    },
  );
}
