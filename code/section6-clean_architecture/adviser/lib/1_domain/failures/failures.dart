import 'package:equatable/equatable.dart';

abstract class Failure with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class GeneralFailure extends Failure {}
