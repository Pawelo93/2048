import 'package:equatable/equatable.dart';

abstract class BoardEvent extends Equatable {
  BoardEvent([List props = const []]);
}

class SetupBoard extends BoardEvent {

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SetupBoard';
}