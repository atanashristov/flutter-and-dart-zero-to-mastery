import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'adviser_state.dart';

class AdviserCubit extends Cubit<AdviserCubitState> {
  AdviserCubit() : super(AdviserInitial());

  void adviceRequested() async {
    emit(AdviserStateLoading());
    // execute business logic
    // for example get advice
    debugPrint('fake get advice triggered from cubit');
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('fake get advice triggered from cubit');
    emit(const AdviserStateLoaded(advice: 'Please put on warm socks every day in winter!!!'));
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('fake an error from cubit');
    emit(const AdviserStateError(message: 'Oops, not good my man!'));
  }
}
