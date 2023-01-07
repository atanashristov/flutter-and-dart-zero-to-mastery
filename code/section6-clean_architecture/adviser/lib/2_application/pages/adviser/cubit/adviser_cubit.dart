import 'package:adviser/1_domain/usecases/advice_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'adviser_state.dart';

class AdviserCubit extends Cubit<AdviserCubitState> {
  AdviserCubit() : super(AdviserInitial());

  final AdviceUseCases adviceUseCases = AdviceUseCases();
  // could use more use cases..

  void adviceRequested() async {
    emit(AdviserStateLoading());
    // execute business logic
    // for example get advice

    final advice = await adviceUseCases.getAdvice();
    emit(AdviserStateLoaded(advice: advice.advice));
    // await Future.delayed(const Duration(seconds: 3), () {});
    // emit(const AdviserStateError(message: 'Oops, not good my man!'));
  }
}
