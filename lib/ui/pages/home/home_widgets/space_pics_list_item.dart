import 'package:flutter/material.dart';

import '../../../../domain/entities/space_pic_entity.dart';
import 'space_pics_list_item/thumbnail_description.dart';
import 'space_pics_list_item/thumbnail_image.dart';

class SpacePicListItem extends StatelessWidget {
  final SpacePicEntitity spacePic;

  const SpacePicListItem({super.key, required this.spacePic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ThumbnailImage(imgUrl: spacePic.imgUrl),
                ThumbnailDescription(
                    title: spacePic.title, date: spacePic.date),
              ]),
        ),
      ),
    );
  }
}
