// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:adviser/1_domain/failures/failures.dart';
import 'package:adviser/1_domain/usecases/advice_usecases.dart';

part 'adviser_state.dart';

// This messaging should not be cubit dependent.
// TODO: Refactor to localized strings.
const _kGeneralErrorMessage = 'Oops. Something went wrong. Try again';
const _kServerErrorMessage = 'Oops. Server error, please try again';
const _kCacheErrorMessage = 'Oops. Cache error. Try again';

class AdviserCubit extends Cubit<AdviserCubitState> {
  AdviserCubit({
    required this.adviceUseCases,
  }) : super(const AdviserInitial());

  final AdviceUseCases adviceUseCases;
  // could use more use cases..

  void adviceRequested() async {
    emit(const AdviserStateLoading());
    // execute business logic
    // for example get advice

    final failureOrAdvice = await adviceUseCases.getAdvice();
    failureOrAdvice.fold(
      (error) => emit(AdviserStateError(message: _mapFailureToMessage(error))),
      (advice) => emit(AdviserStateLoaded(advice: advice.advice)),
    );

    // await Future.delayed(const Duration(seconds: 3), () {});
    // emit(const AdviserStateError(message: 'Oops, not good my man!'));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return _kServerErrorMessage;
      case CacheFailure:
        return _kCacheErrorMessage;
      default:
        return _kGeneralErrorMessage;
    }
  }
}
