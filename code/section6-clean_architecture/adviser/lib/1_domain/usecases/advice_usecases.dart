import 'package:adviser/0_data/repositories/advice_repo_impl.dart';
import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:adviser/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final adviceRepo = AdviceRepoImpl();
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    // call the repository to get data (failure or data)
    // manipulate the data
    // return data back

    return adviceRepo.getAdviceFromDatasource();
    // space for data logic
  }
}
