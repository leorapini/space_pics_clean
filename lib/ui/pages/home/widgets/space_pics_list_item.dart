import 'package:flutter/material.dart';
import 'package:space_pics/domain/entities/space_pic_entity.dart';

class SpacePicListItem extends StatelessWidget {
  final SpacePicEntitity spacePic;

  const SpacePicListItem({super.key, required this.spacePic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(spacePic.title),
    );
  }
}
