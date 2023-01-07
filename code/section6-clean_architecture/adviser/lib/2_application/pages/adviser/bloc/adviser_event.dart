part of 'adviser_bloc.dart';

abstract class AdviserEvent extends Equatable {
  const AdviserEvent();

  @override
  List<Object> get props => [];
}

class AdviceRequestedEvent extends AdviserEvent {}

// This is just an example with data:
class UserInputExampleEvent extends AdviserEvent {
  final String input;
  const UserInputExampleEvent({required this.input});
}
