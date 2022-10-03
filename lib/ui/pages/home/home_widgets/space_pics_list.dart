import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../presentation/bloc/home_state.dart';
import '../../../../presentation/bloc/home_bloc.dart';
import '../../../shared_widgets/loading_widget.dart';
import '../../../shared_widgets/state_error_widget.dart';
import 'space_pics_listview.dart';

class SpacePicsList extends StatelessWidget {
  const SpacePicsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return _getWidgetFromState(state);
    });
  }

  Widget _getWidgetFromState(HomeState state) {
    if (state is HomeLoadingState) {
      return const LoadingWidget();
    } else if (state is HomeLoadedState) {
      return SpacePicsListView(spacePicsList: state.spacePicsData);
    } else if (state is HomeErrorState) {
      return StateErrorWidget(errorMessage: state.errorMessage);
    } else {
      return const SizedBox();
    }
  }
}
