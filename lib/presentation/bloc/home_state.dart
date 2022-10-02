import 'package:equatable/equatable.dart';

import '../../../domain/entities/space_pic_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<SpacePicEntitity> spacePicsData;

  const HomeLoadedState({required this.spacePicsData});
}

class HomeErrorState extends HomeState {
  final String errorMessage;
  const HomeErrorState({this.errorMessage = "Whoops! Something wnet wrong"});

  @override
  List<Object?> get props => [errorMessage];
}
