import 'package:flutter/material.dart';

import '../../../../domain/entities/space_pic_entity.dart';
import '../../../widgets/state_error_widget.dart';
import 'space_pics_list_item.dart';

class SpacePicsListView extends StatelessWidget {
  final List<SpacePicEntitity> spacePicsList;

  const SpacePicsListView({super.key, required this.spacePicsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        itemCount: spacePicsList.length,
        itemBuilder: ((context, i) {
          if (spacePicsList.isEmpty) {
            return const StateErrorWidget(errorMessage: 'List is Empty');
          } else {
            return SpacePicListItem(spacePic: spacePicsList[i]);
          }
        }),
      ),
    );
  }
}
