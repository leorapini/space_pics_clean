import 'package:flutter/material.dart';

import '../../../../domain/entities/space_pic_entity.dart';

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
          if (spacePicsList.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Text(spacePicsList[i].title),
            );
          } else {
            return const Text('Empty');
          }
        }),
      ),
    );
  }
}
