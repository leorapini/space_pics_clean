import 'package:equatable/equatable.dart';

import '../../../domain/entities/space_pic_entity.dart';

abstract class SpacePicsListState extends Equatable {
  const SpacePicsListState();

  @override
  List<Object?> get props => [];
}

class SpacePicsListLoadingState extends SpacePicsListState {}

class SpacePicsListLoadedState extends SpacePicsListState {
  final List<SpacePicEntitity> spacePicsData;

  const SpacePicsListLoadedState({required this.spacePicsData});
}

class SpacePicsListErrorState extends SpacePicsListState {
  final String errorMessage;
  const SpacePicsListErrorState(
      {this.errorMessage = "Whoops! Something wnet wrong"});

  @override
  List<Object?> get props => [errorMessage];
}
