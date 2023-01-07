part of 'adviser_bloc.dart';

abstract class AdviserState extends Equatable {
  const AdviserState();

  @override
  List<Object> get props => [];
}

class AdviserInitial extends AdviserState {}

class AdviserStateLoading extends AdviserState {}

class AdviserStateLoaded extends AdviserState {
  final String advice;

  const AdviserStateLoaded({required this.advice});

  @override
  List<Object> get props => [advice];
}

class AdviserStateError extends AdviserState {
  final String message;

  const AdviserStateError({required this.message});

  @override
  List<Object> get props => [message];
}
