import 'package:adviser/0_data/datasources/advice_remote_datasource.dart';
import 'package:adviser/1_domain/failures/failures.dart';
import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:adviser/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDataSource adviceRemoteDataSource = AdviceRemoteDataSourceImpl();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    final result = await adviceRemoteDataSource.getRandomAdviceFromApi();
    return right(result);
  }
}
