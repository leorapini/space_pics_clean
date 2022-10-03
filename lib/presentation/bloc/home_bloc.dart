import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/usecases/remote_load_space_pics.dart';
import '../../../main/factories/remote_load_space_pics_factory.dart';
import '../../domain/entities/space_pic_entity.dart';
import '../../main/factories/date_factory.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoadingState()) {
    late RemoteLoadSpacePics repo;
    bool isLoading = false;

    on<LoadHomeEvent>((event, emit) async {
      emit(HomeLoadingState());
      final today = DateTime.now();
      repo = makeRemoteLoadSpacePics(today);
      try {
        final List<SpacePicEntitity> spacePicsList = await repo.load();
        final orderedResult = spacePicsList.reversed.toList();
        emit(HomeLoadedState(spacePicsData: orderedResult));
      } catch (e) {
        emit(HomeErrorState(errorMessage: e.toString()));
      }
    });

    on<LoadNextBatch>((event, emit) async {
      if (isLoading == false) {
        final List<SpacePicEntitity> spacePicsList = event.currentBatch;
        final currentlastDate =
            DateFactory(spacePicsList[spacePicsList.length - 1].date);
        final newLastDate = currentlastDate.minusOneDay;
        repo = makeRemoteLoadSpacePics(newLastDate);
        try {
          isLoading = true;
          final newBatch = await repo.load();
          final orderedResult = newBatch.reversed.toList();
          spacePicsList.addAll(orderedResult);
          emit(HomeLoadedState(spacePicsData: spacePicsList));
          isLoading = false;
        } catch (e) {
          emit(HomeErrorState(errorMessage: e.toString()));
        }
      }
    });
  }
}
