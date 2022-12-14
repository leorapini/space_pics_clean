import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/space_pic_entity.dart';
import '../../../../presentation/bloc/home_bloc.dart';
import '../../../../presentation/bloc/home_event.dart';
import '../../../../presentation/bloc/home_state.dart';
import '../../../shared_widgets/state_error_widget.dart';
import 'space_pics_list_item.dart';

class SpacePicsListView extends StatefulWidget {
  final List<SpacePicEntitity> spacePicsList;

  const SpacePicsListView({super.key, required this.spacePicsList});

  @override
  State<SpacePicsListView> createState() => _SpacePicsListViewState();
}

class _SpacePicsListViewState extends State<SpacePicsListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        context.read<HomeBloc>().add(LoadNextBatch(widget.spacePicsList));
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Expanded(
        child: ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          itemCount: widget.spacePicsList.length,
          itemBuilder: ((context, i) {
            if (widget.spacePicsList.isEmpty) {
              return const StateErrorWidget(errorMessage: 'List is Empty');
            } else {
              return SpacePicListItem(spacePic: widget.spacePicsList[i]);
            }
          }),
        ),
      ),
    );
  }
}
