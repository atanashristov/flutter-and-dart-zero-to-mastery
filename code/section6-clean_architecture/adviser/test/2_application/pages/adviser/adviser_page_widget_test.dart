import 'package:adviser/2_application/core/services/theme_service.dart';
import 'package:adviser/2_application/pages/adviser/adviser_page.dart';
import 'package:adviser/2_application/pages/adviser/cubit/adviser_cubit.dart';
import 'package:adviser/2_application/pages/adviser/widgets/advice_field.dart';
import 'package:adviser/2_application/pages/adviser/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:provider/provider.dart';

class MockAdviserCubit extends MockCubit<AdviserCubitState> implements AdviserCubit {}

void main() {
  Widget widgetUnderTest({required AdviserCubit cubit}) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ThemeService(),
        child: BlocProvider<AdviserCubit>(
          create: (context) => cubit,
          child: const AdviserPage(),
        ),
      ),
    );
  }

  group(
    'AdviserPage',
    () {
      late AdviserCubit mockAdviserCubit;

      setUp(
        () {
          mockAdviserCubit = MockAdviserCubit();
        },
      );
      group(
        'should be displayed in ViewState',
        () {
          testWidgets(
            'Initial when cubits emits AdviserInitial()',
            (widgetTester) async {
              whenListen(
                mockAdviserCubit,
                Stream.fromIterable(const [AdviserInitial()]),
                initialState: const AdviserInitial(),
              );

              await widgetTester.pumpWidget(widgetUnderTest(cubit: mockAdviserCubit));

              final adviserInitalTextFinder = find.text(kAdviserPageInitialText);

              expect(adviserInitalTextFinder, findsOneWidget);
            },
          );

          testWidgets(
            'Loading when cubits emits AdviserStateLoading()',
            (widgetTester) async {
              whenListen(
                mockAdviserCubit,
                Stream.fromIterable(const [AdviserStateLoading()]),
                initialState: const AdviserInitial(),
              );

              await widgetTester.pumpWidget(widgetUnderTest(cubit: mockAdviserCubit));
              await widgetTester.pump();

              final adviserLoadingFinder = find.byType(CircularProgressIndicator);

              expect(adviserLoadingFinder, findsOneWidget);
            },
          );

          testWidgets(
            'advice text when cubits emits AdviserStateLoaded()',
            (widgetTester) async {
              whenListen(
                mockAdviserCubit,
                Stream.fromIterable(const [AdviserStateLoaded(advice: '42')]),
                initialState: const AdviserInitial(),
              );

              await widgetTester.pumpWidget(widgetUnderTest(cubit: mockAdviserCubit));
              await widgetTester.pump();

              final adviserLoadedStateFinder = find.byType(AdviceField);
              final adviceText = widgetTester.widget<AdviceField>(adviserLoadedStateFinder).advice;

              expect(adviserLoadedStateFinder, findsOneWidget);
              expect(adviceText, '42');
            },
          );

          testWidgets(
            'Error when cubits emits AdviserStateError()',
            (widgetTester) async {
              whenListen(
                mockAdviserCubit,
                Stream.fromIterable(const [AdviserStateError(message: 'error')]),
                initialState: const AdviserInitial(),
              );

              await widgetTester.pumpWidget(widgetUnderTest(cubit: mockAdviserCubit));
              await widgetTester.pump();

              final adviserErrorFinder = find.byType(ErrorMessage);

              expect(adviserErrorFinder, findsOneWidget);
            },
          );
        },
      );
    },
  );
}
