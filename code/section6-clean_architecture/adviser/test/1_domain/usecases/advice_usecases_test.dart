import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:dartz/dartz.dart';
import 'package:adviser/1_domain/repositories/advice_repo.dart';
import 'package:adviser/1_domain/usecases/advice_usecases.dart';
import 'package:adviser/1_domain/failures/failures.dart';
import 'package:adviser/1_domain/entities/advice_entity.dart';

import 'advice_usecases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepo>()])
void main() {
  group('AdviceUseCases', () {
    group('should return AdviceEntity', () {
      test('when AdviceRepo returns AdviceModel', () async {
        final mockAdviceRepo = MockAdviceRepo();
        final sut = AdviceUseCases(adviceRepo: mockAdviceRepo);
        when(mockAdviceRepo.getAdviceFromDatasource()).thenAnswer(
          (realInvocation) => Future.value(
            right(const AdviceEntity(id: 1, advice: 'test advice')),
          ),
        );

        final result = await sut.getAdvice();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right<Failure, AdviceEntity>(AdviceEntity(id: 1, advice: 'test advice')));
        verify(mockAdviceRepo.getAdviceFromDatasource())
            .called(1); // Call .never() instead if .called(1) to verify was never called
        verifyNoMoreInteractions(mockAdviceRepo);
      });
    });
    group('should return left with', () {
      test('a ServerFailure', () async {
        final mockAdviceRepo = MockAdviceRepo();
        final sut = AdviceUseCases(adviceRepo: mockAdviceRepo);
        when(mockAdviceRepo.getAdviceFromDatasource()).thenAnswer(
          (realInvocation) => Future.value(
            left(ServerFailure()),
          ),
        );
        final result = await sut.getAdvice();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
        verify(mockAdviceRepo.getAdviceFromDatasource())
            .called(1); // Call .never() instead if .called(1) to verify was never called
        verifyNoMoreInteractions(mockAdviceRepo);
      });
      test('a GeneralFailure', () async {
        final mockAdviceRepo = MockAdviceRepo();
        final sut = AdviceUseCases(adviceRepo: mockAdviceRepo);
        when(mockAdviceRepo.getAdviceFromDatasource()).thenAnswer(
          (realInvocation) => Future.value(
            left(GeneralFailure()),
          ),
        );
        final result = await sut.getAdvice();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(GeneralFailure()));
        verify(mockAdviceRepo.getAdviceFromDatasource())
            .called(1); // Call .never() instead if .called(1) to verify was never called
        verifyNoMoreInteractions(mockAdviceRepo);
      });
    });
  });
}
