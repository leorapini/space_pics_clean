import 'package:equatable/equatable.dart';

abstract class SpacePicsListEvent extends Equatable {
  const SpacePicsListEvent();

  @override
  List<Object?> get props => [];
}

class LoadSpacePicsListEvent extends SpacePicsListEvent {}
