import 'package:adviser/1_domain/entities/advice_entity.dart';

class AdviceUseCases {
  Future<AdviceEntity> getAdvice() async {
    // call the repository to get data (failure or data)
    // manipulate the data
    // return data back
    await Future.delayed(const Duration(seconds: 3), () {});
    return const AdviceEntity(
        id: 1, advice: 'Please put on warm socks every day in winter (from useCase with entity)!!!');
  }
}
