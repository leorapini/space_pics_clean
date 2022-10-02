import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/usecases/remote_load_space_pics.dart';
import '../../../domain/entities/space_pic_entity.dart';
import '../../../main/factories/remote_load_space_pics_factory.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoadingState()) {
    on<LoadHomeEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final RemoteLoadSpacePics repo =
            makeRemoteLoadSpacePics(DateTime.now());
        final List<SpacePicEntitity> spacePicsList = await repo.load();
        emit(HomeLoadedState(spacePicsData: spacePicsList));
      } catch (e) {
        emit(HomeErrorState(errorMessage: e.toString()));
      }
    });
  }
}
