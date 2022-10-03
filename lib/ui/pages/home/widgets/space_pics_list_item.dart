import 'package:flutter/material.dart';
import 'package:space_pics/domain/entities/space_pic_entity.dart';

class SpacePicListItem extends StatelessWidget {
  final SpacePicEntitity spacePic;

  const SpacePicListItem({super.key, required this.spacePic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(spacePic.title),
        Text(spacePic.date.toString()),
        Text(spacePic.imgUrl),
      ]),
    );
  }
}
