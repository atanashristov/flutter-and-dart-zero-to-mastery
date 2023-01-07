import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  AdviserBloc() : super(AdviserInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviserStateLoading());
      // execute business logic
      // for example get advice
      debugPrint('fake get advice triggered from bloc');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('fake get advice triggered from bloc');
      emit(const AdviserStateLoaded(advice: 'Please put on warm socks every day in winter!!!'));
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('fake an error from bloc');
      emit(const AdviserStateError(message: 'Oops, not good my man!'));
    });

    // This is just an example with data
    on<UserInputExampleEvent>((event, emit) {
      // Get the input with event.input
    });
  }
}
