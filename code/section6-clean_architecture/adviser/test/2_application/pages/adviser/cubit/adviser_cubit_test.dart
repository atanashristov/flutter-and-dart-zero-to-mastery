import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:adviser/1_domain/failures/failures.dart';
import 'package:adviser/1_domain/usecases/advice_usecases.dart';
import 'package:adviser/2_application/pages/adviser/cubit/adviser_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockAdviceUseCases extends Mock implements AdviceUseCases {}

void main() {
  group('AdviserCubit', () {
    group('should emit', () {
      final mockAdviceUseCases = MockAdviceUseCases();
      blocTest(
        'nothing when no method is added',
        build: () => AdviserCubit(adviceUseCases: mockAdviceUseCases),
        expect: () => const <AdviserCubitState>[],
      );

      blocTest(
        '[AdviserStateLoading,AdviserStateLoaded] when adviceRequested() is called',
        setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
          (invocation) => Future.value(
            right(const AdviceEntity(id: 1, advice: 'test advice')),
          ),
        ),
        build: () => AdviserCubit(adviceUseCases: mockAdviceUseCases),
        act: (cubit) => cubit.adviceRequested(),
        expect: () => <AdviserCubitState>[
          const AdviserStateLoading(),
          const AdviserStateLoaded(advice: 'test advice'),
        ],
      );

      group('[AdviserStateLoading,AdviserStateError] when adviceRequested() is called', () {
        blocTest(
          'and a ServerFailure occurs',
          setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              left(ServerFailure()),
            ),
          ),
          build: () => AdviserCubit(adviceUseCases: mockAdviceUseCases),
          act: (cubit) => cubit.adviceRequested(),
          expect: () => <AdviserCubitState>[
            const AdviserStateLoading(),
            const AdviserStateError(message: 'Oops. Server error, please try again'),
          ],
        );

        blocTest(
          'and a CacheFailure occurs',
          setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              left(CacheFailure()),
            ),
          ),
          build: () => AdviserCubit(adviceUseCases: mockAdviceUseCases),
          act: (cubit) => cubit.adviceRequested(),
          expect: () => <AdviserCubitState>[
            const AdviserStateLoading(),
            const AdviserStateError(message: 'Oops. Cache error. Try again'),
          ],
        );

        blocTest(
          'and a GeneralFailure occurs',
          setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              left(GeneralFailure()),
            ),
          ),
          build: () => AdviserCubit(adviceUseCases: mockAdviceUseCases),
          act: (cubit) => cubit.adviceRequested(),
          expect: () => <AdviserCubitState>[
            const AdviserStateLoading(),
            const AdviserStateError(message: 'Oops. Something went wrong. Try again'),
          ],
        );
      });
    });
  });
}
