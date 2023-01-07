import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:adviser/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    // call the repository to get data (failure or data)
    // manipulate the data
    // return data back
    await Future.delayed(const Duration(seconds: 3), () {});

    // Call to repo went good
    return right(const AdviceEntity(
        id: 1, advice: 'Please put on warm socks every day in winter (from useCase with entity)!!!'));

    // Call to repo server error
    // return left(ServerFailure());
  }
}
