import 'dart:io';

import 'package:adviser/0_data/datasources/advice_remote_datasource.dart';
import 'package:adviser/0_data/exceptions/exceptions.dart';
import 'package:adviser/0_data/models/advice_model.dart';
import 'package:adviser/0_data/repositories/advice_repo_impl.dart';
import 'package:adviser/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'advice_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDataSource>()])
void main() {
  group('AdviceRepoImpl', () {
    group('should return AdviceEntity', () {
      test('when AdviceRemoteDataSource returns an AdviceModel', () async {
        final mockAdviceRemoteDataSource = MockAdviceRemoteDataSource();
        final sut = AdviceRepoImpl(adviceRemoteDataSource: mockAdviceRemoteDataSource);
        when(mockAdviceRemoteDataSource.getRandomAdviceFromApi()).thenAnswer(
          (realInvocation) => Future.value(
            AdviceModel(id: 1, advice: 'test advice'),
          ),
        );

        final result = await sut.getAdviceFromDatasource();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, AdviceModel>(AdviceModel(id: 1, advice: 'test advice')));
        verify(mockAdviceRemoteDataSource.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockAdviceRemoteDataSource);
      });
    });
    group('should return left with', () {
      test('a ServerFailure when AdviceRemoteDataSource throws a ServerException', () async {
        final mockAdviceRemoteDataSource = MockAdviceRemoteDataSource();
        final sut = AdviceRepoImpl(adviceRemoteDataSource: mockAdviceRemoteDataSource);
        when(mockAdviceRemoteDataSource.getRandomAdviceFromApi()).thenThrow(ServerException());
        final result = await sut.getAdviceFromDatasource();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceModel>(ServerFailure()));
        verify(mockAdviceRemoteDataSource.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockAdviceRemoteDataSource);
      });
      test('a GeneralFailure on all other Exceptions', () async {
        final mockAdviceRemoteDataSource = MockAdviceRemoteDataSource();
        final sut = AdviceRepoImpl(adviceRemoteDataSource: mockAdviceRemoteDataSource);
        when(mockAdviceRemoteDataSource.getRandomAdviceFromApi()).thenThrow(const SocketException('test'));
        final result = await sut.getAdviceFromDatasource();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceModel>(GeneralFailure()));
        verify(mockAdviceRemoteDataSource.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockAdviceRemoteDataSource);
      });
    });
  });
}
