import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/usecases/remote_load_space_pics.dart';
import '../../../domain/entities/space_pic_entity.dart';
import '../../../main/factories/remote_load_space_pics_factory.dart';
import 'space_pics_list_event.dart';
import 'space_pics_list_state.dart';

class SpacePicsListBloc extends Bloc<SpacePicsListEvent, SpacePicsListState> {
  SpacePicsListBloc() : super(SpacePicsListLoadingState()) {
    on<LoadSpacePicsListEvent>((event, emit) async {
      emit(SpacePicsListLoadingState());
      try {
        final RemoteLoadSpacePics repo =
            makeRemoteLoadSpacePics(DateTime.now());
        final List<SpacePicEntitity> spacePicsList = await repo.load();
        emit(SpacePicsListLoadedState(spacePicsData: spacePicsList));
      } catch (e) {
        emit(SpacePicsListErrorState(errorMessage: e.toString()));
      }
    });
  }
}
