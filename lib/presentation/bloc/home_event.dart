import 'package:equatable/equatable.dart';

import '../../domain/entities/space_pic_entity.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeEvent extends HomeEvent {}

class LoadNextBatch extends HomeEvent {
  final List<SpacePicEntitity> currentBatch;

  const LoadNextBatch(this.currentBatch);

  @override
  List<Object?> get props => [currentBatch];
}
