part of 'adviser_cubit.dart';

abstract class AdviserCubitState extends Equatable {
  const AdviserCubitState();

  @override
  List<Object> get props => [];
}

class AdviserInitial extends AdviserCubitState {
  const AdviserInitial();
}

class AdviserStateLoading extends AdviserCubitState {
  const AdviserStateLoading();
}

class AdviserStateLoaded extends AdviserCubitState {
  final String advice;

  const AdviserStateLoaded({required this.advice});

  @override
  List<Object> get props => [advice];
}

class AdviserStateError extends AdviserCubitState {
  final String message;

  const AdviserStateError({required this.message});

  @override
  List<Object> get props => [message];
}
